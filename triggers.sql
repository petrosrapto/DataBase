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
update works set res_id = new.sup_res_id, proj_id =  new.proj_id where res_id = old.sup_res_id and proj_id = old.proj_id;
END $$


DELIMITER $$
CREATE TRIGGER manager_last_to_be_deleted
before delete
ON works FOR EACH ROW
BEGIN
IF (old.res_id = (select sup_res_id from project where proj_id = old.proj_id)) THEN
IF (select count(*) from works where proj_id = old.proj_id) > 1 THEN
SIGNAL SQLSTATE '50007' SET MESSAGE_TEXT = 'Project supervisor must be the last researcher to be deleted';
END IF;
END IF;
END $$


DELIMITER ;
