DELIMITER $$
DROP TRIGGER IF EXISTS delete_proj_assessment$$
/* delete assessment when you delete a project */
CREATE TRIGGER delete_proj_assessment
after delete
ON project FOR EACH ROW
BEGIN
DELETE FROM assessment where ass_id = old.ass_id;
END $$

DELIMITER $$
DROP TRIGGER IF EXISTS assessor_trigger_on_project_insert$$
/* check if project assessor works at the same institution as the project */
CREATE TRIGGER assessor_trigger_on_project_insert
before insert
ON project FOR EACH ROW
BEGIN
IF new.ass_res_id in (select r.res_id from researcher r where r.ins_id = new.ins_id) THEN
SIGNAL SQLSTATE '50001' SET MESSAGE_TEXT = 'Assessor cannot work for institution';
END IF;
END $$

DELIMITER $$
DROP TRIGGER IF EXISTS sup_trigger_on_project_insert$$
/* check if supervisor works at the same institution as the project*/
CREATE TRIGGER sup_trigger_on_project_insert
before insert
ON project FOR EACH ROW
BEGIN
IF new.sup_res_id not in (select r.res_id from researcher r where r.ins_id = new.ins_id) THEN
SIGNAL SQLSTATE '50002' SET MESSAGE_TEXT = 'Supervisor must work for institution';
END IF;
END $$

DELIMITER $$
DROP TRIGGER IF EXISTS proj_works_sup$$
/* after creating the project, automatically add the supervisor as a worker on that project*/
CREATE TRIGGER proj_works_sup
after insert
ON project FOR EACH ROW
BEGIN
INSERT INTO works (res_id, proj_id) VALUES (new.sup_res_id, new.proj_id);
END $$

DELIMITER $$
DROP TRIGGER IF EXISTS does_the_researcher_work_for_the_institution$$
/* check if the researcher you are adding as a worker to a project works at the same institution as the project*/
CREATE TRIGGER does_the_researcher_work_for_the_institution
before insert
ON works FOR EACH ROW
BEGIN
IF ((select p.ins_id from project p where p.proj_id = new.proj_id) <> (select r.ins_id from researcher r where r.res_id = new.res_id))  THEN
SIGNAL SQLSTATE '50003' SET MESSAGE_TEXT = 'This researcher cannot work in this project as he is not at the same institution as the project';
END IF;
END $$

DELIMITER $$
DROP TRIGGER IF EXISTS assessor_trigger_on_project_update$$
/* check if the new assessor works at the same institution as the project */
CREATE TRIGGER assessor_trigger_on_project_update
before update
ON project FOR EACH ROW
BEGIN
IF new.ass_res_id in (select r.res_id from researcher r where r.ins_id = new.ins_id) THEN
SIGNAL SQLSTATE '50004' SET MESSAGE_TEXT = 'New assessor cannot work for institution';
END IF;
END $$

DELIMITER $$
DROP TRIGGER IF EXISTS sup_trigger_on_project_update$$
/* check if the new supervisor works at the same institution as the project*/
CREATE TRIGGER sup_trigger_on_project_update
before update
ON project FOR EACH ROW
BEGIN
IF new.sup_res_id not in (select r.res_id from researcher r where r.ins_id = new.ins_id) THEN
SIGNAL SQLSTATE '50005' SET MESSAGE_TEXT = 'New supervisor must work for institution';
END IF;
END $$

DELIMITER $$
DROP TRIGGER IF EXISTS does_the_researcher_work_for_the_institution_update$$
/* check if the researcher you are adding as a worker to a project works at the same institution as the project*/
CREATE TRIGGER does_the_researcher_work_for_the_institution_update
before update
ON works FOR EACH ROW
BEGIN
IF ((select p.ins_id from project p where p.proj_id = new.proj_id) <> (select r.ins_id from researcher r where r.res_id = new.res_id))  THEN
SIGNAL SQLSTATE '50006' SET MESSAGE_TEXT = 'This researcher cannot work in this project as he is not at the same institution as the project';
END IF;
END $$

DELIMITER $$
DROP TRIGGER IF EXISTS proj_works_sup_update$$
/* after creating the project, automatically add the new supervisor as a worker on that project and delete the old one*/
CREATE TRIGGER proj_works_sup_update
after update
ON project FOR EACH ROW
BEGIN
delete from works where res_id = old.sup_res_id and proj_id = old.proj_id;
delete from works where res_id = new.sup_res_id and proj_id = old.proj_id;  -- do not create duplicates. Duplicates will mess up the process and not let the update go through.
insert into works (res_id,proj_id) values (new.sup_res_id,new.proj_id);
END $$


DELIMITER $$
DROP TRIGGER IF EXISTS supervisor_cannot_be_updated_this_way$$
/* If the user tries to update the supervisor of a project from the works table then do not allow it.
  Instead the user must update it by updating the project table.*/
CREATE TRIGGER supervisor_cannot_be_updated_this_way
before update
ON works FOR EACH ROW
BEGIN
IF old.res_id = (select sup_res_id from project where proj_id = old.proj_id)  THEN
SIGNAL SQLSTATE '50007' SET MESSAGE_TEXT = 'Supervisor cannot be updated this way';
END IF;
END $$

DELIMITER $$
DROP TRIGGER IF EXISTS cannot_delete_supervisor$$
/* Do not allow deletion of supervisor from works table
   This trigger works ONLY if you try to delete tuples from works one by one
   Otherwise no changes will go through*/
CREATE TRIGGER cannot_delete_supervisor
before delete
ON works FOR EACH ROW
BEGIN
IF old.res_id = (select sup_res_id from project where proj_id = old.proj_id)  THEN
SIGNAL SQLSTATE '50008' SET MESSAGE_TEXT = 'Supervisor cannot de deleted.';
END IF;
END $$

DELIMITER $$
DROP TRIGGER IF EXISTS cannot_delete_all_project_fields$$
/* Do not allow deletion of supervisor from works table
   This trigger works ONLY if you try to delete tuples from proj_field one by one*/
CREATE TRIGGER cannot_delete_all_project_fields
before delete
ON proj_field FOR EACH ROW
BEGIN
IF ((select count(*) from proj_field where proj_id = old.proj_id) = 1) THEN
SIGNAL SQLSTATE '50009' SET MESSAGE_TEXT = 'Cannot have a project with no research fields';
END IF;
END $$

DELIMITER $$
DROP TRIGGER IF EXISTS delete_projects_when_you_delete_programs$$
CREATE TRIGGER delete_projects_when_you_delete_programs
before delete
ON program FOR EACH ROW
BEGIN
delete from project where prog_id = old.prog_id;
END $$



DELIMITER $$
DROP TRIGGER IF EXISTS delete_projects_when_you_delete_executive$$
CREATE TRIGGER delete_projects_when_you_delete_executive
before delete
ON executive FOR EACH ROW
BEGIN
delete from project where ex_id = old.ex_id;
END $$





DELIMITER ;
