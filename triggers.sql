DELIMITER $$
/* delete assessment when you delete a project */
CREATE TRIGGER delete_proj_assessment
after delete
ON project FOR EACH ROW
BEGIN
DELETE FROM assessment where ass_id = old.ass_id;
END $$


DELIMITER $$
/* delete deliverables when you delete a project, is this needed? maybe we dont want to do this as we might not want to delete the deliverables*/
/* I belive that : on delete restrict does the job already */
/* Also, if we just put : on delete cascade on the deliverable table, it does this trigger's job much easier */
/* If we really want to add this trigger then we should also add a trigger that deletes all the works tuples with this particular project */
/* And also another trigger that deletes all the proj_field tuples with this particular project */
/* Or just use on delete cascade on all 3 tables but in my opinion that is wrong */
CREATE TRIGGER delete_proj_deliverables
before delete
ON project FOR EACH ROW
BEGIN
DELETE FROM deliverable where proj_id = old.proj_id;
END $$

DELIMITER $$
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
/* after creating the project, automatically add the supervisor as a worker on that project*/
CREATE TRIGGER proj_works_sup
after insert
ON project FOR EACH ROW
BEGIN
INSERT INTO works (res_id, proj_id) VALUES (new.sup_res_id, new.proj_id);
END $$

DELIMITER $$
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
/* check if the researcher you are adding as a worker to a project works at the same institution as the project*/
CREATE TRIGGER does_the_researcher_work_for_the_institution_update
before update
ON works FOR EACH ROW
BEGIN
IF ((select p.ins_id from project p where p.proj_id = new.proj_id) <> (select r.ins_id from researcher r where r.res_id = new.res_id))  THEN
SIGNAL SQLSTATE '50006' SET MESSAGE_TEXT = 'This researcher cannot work in this project as he is not at the same institution as the project';
END IF;
END $$


DELIMITER ;

/* READ THIS SUPER IMPORTANT */
/* ΔΕΝ ΜΠΟΡΟΥΜΕ ΝΑ ΒΑΛΟΥΜΕ TRIGGERS ΠΟΥ ΝΑ ΕΛΕΓΧΟΥΝ ΕΑΝ ΚΑΘΕ ΦΟΡΑ ΠΟΥ ΠΑΩ ΝΑ ΣΒΗΣΩ ΕΝΑ TUPLE ΤΟΥ WORKS, ΣΒΗΝΩ ΤΟΝ ΥΠΕΥΘΥΝΟ ΤΟΥ ΕΡΓΟΥ ΚΑΙ
   ΑΝ ΝΑΙ ΤΟΤΕ ΝΑ ΜΗΝ ΜΕ ΑΦΗΝΕΙ ΚΑΘΩΣ
  ΤΟΤΕ ΔΕΝ ΘΑ ΜΠΟΡΟΥΣΑΜΕ ΠΟΤΕ ΝΑ ΣΒΗΣΟΥΜΕ ΤΟ ΕΡΓΟ. ΓΙΑΤΙ ΓΙΑ ΝΑ ΣΒΗΣΟΥΜΕ ΤΟ ΕΡΓΟ ΘΑ ΠΡΕΠΕΙ ΝΑ ΣΒΗΣΟΥΜΕ ΟΛΕΣ ΤΙΣ TUPLES ΤΗΣ ΣΧΕΣΗΣ
  WORKS(REMEMBER ON DELETE RESTRICT) ΓΙΑ ΑΥΤΟ ΤΟ ΕΡΓΟ
  ΟΜΩΣ ΤΟ TRIGGER ΔΕΝ ΘΑ ΜΑΣ ΑΦΗΝΕΙ ΝΑ ΣΒΗΣΟΥΜΕ ΤΟΝ ΥΠΕΥΘΥΝΟ. ΣΥΝΕΠΩΣ ΔΕΝ ΘΑ ΜΠΟΡΕΙ ΠΟΤΕ ΝΑ ΣΒΗΣΤΕΙ ΤΟ ΕΡΓΟ ΑΠΟ ΤΗ ΒΑΣΗ.
  ΤΟ ΙΔΙΟ ΙΣΧΥΕΙ ΚΑΙ ΑΝ ΘΕΛΟΥΜΕ ΝΑ ΜΗΝ ΑΦΗΝΟΥΜΕ ΤΟΝ ΧΡΗΣΤΗ ΝΑ ΣΒΗΣΕΙ ΟΛΑ ΤΑ ΕΠΙΣΤΗΜΟΝΙΚΑ ΠΕΔΙΑ ΕΝΟΣ ΕΡΓΟΥ.
  ΤΟΤΕ ΓΙΑ ΝΑ ΣΒΗΣΤΕΙ ΤΟ ΕΡΓΟ, ΘΑ ΠΡΕΠΕΙ ΝΑ ΣΒΗΣΟΥΜΕ ΟΛΑ ΤΑ TUPLES ΤΗΣ ΣΧΕΣΗΣ PROJ_FIELD ΟΜΩΣ ΤΟ TRIGGER ΔΕΝ ΘΑ ΜΑΣ ΑΦΗΣΕΙ ΚΑΙ ΤΟ ΕΡΓΟ ΘΑ ΠΡΕΠΕΙ
  ΝΑ ΜΕΙΝΕΙ ΓΙΑ ΠΑΝΤΑ ΣΤΗ ΒΑΣΗ.
  ΑΥΤΟ ΠΟΥ ΜΠΟΡΟΥΜΕ ΝΑ ΚΑΝΟΥΜΕ ΕΙΝΑΙ ΕΑΝ Ο ΧΡΗΣΤΗΣ ΠΑΕΙ ΝΑ ΣΒΗΣΕΙ ΑΠΟ ΤΗ ΣΧΕΣΗ WORKS ΤΟΝ ΥΠΕΥΘΥΝΟ ΤΟΥ ΕΡΓΟΥ ΝΑ ΤΟΥ ΒΓΑΖΟΥΜΕ ΕΝΑ ΜΗΝΥΜΑ ΠΟΥ ΝΑ ΛΕΕΙ:
  ΠΡΟΣΟΧΗ : ΜΟΛΙΣ ΕΣΒΗΣΕΣ ΤΟΝ ΥΠΕΥΘΥΝΟ ΤΟΥ ΕΡΓΟΥ.
  ΑΝΤΙΣΤΟΙΧΑ ΑΜΑ ΠΑΕΙ ΝΑ ΣΒΗΣΕΙ ΟΛΑ ΤΑ ΕΠΙΣΤΗΜΟΝΙΚΑ ΠΕΔΙΑ ΕΝΟΣ ΕΡΓΟΥ(ΤΟΤΕ ΘΑ ΕΧΟΥΜΕ ΕΡΓΟ ΧΩΡΙΣ ΕΠΙΣΤΗΜΟΝΙΚΟ ΠΕΔΙΟ , ΠΟΥ ΦΥΣΙΚΑ ΔΕΝ ΒΓΑΖΕΙ ΝΟΗΜΑ)
  ΝΑ ΤΟΥ ΒΓΑΖΟΥΜΕ ΕΝΑ ΜΗΝΥΜΑ ΠΟΥ ΝΑ ΛΕΕΙ : ΠΡΟΣΟΧΗ : ΜΟΛΙΣ ΕΣΒΗΣΕΣ ΟΛΑ ΤΑ ΕΠΙΣΤΗΜΟΝΙΚΑ ΠΕΔΙΑ ΤΟΥ ΕΡΓΟΥ ΚΑΙ ΕΧΕΙΣ ΕΝΑ ΕΡΓΟ ΧΩΡΙΣ ΕΠΙΣΤΗΜΟΝΙΚΟ ΠΕΔΙΟ
  ΑΜΑ ΘΕΛΕΤΕ ΝΑ ΦΤΙΑΞΩ ΑΥΤΑ ΤΑ 2 TRIGGERS ΜΕ ΤΑ WARNING_MESSAGES ΠΕΙΤΕ ΜΟΥ ΝΑ ΤΑ ΒΑΛΩ ΚΑΙ ΑΥΤΑ

  ΕΠΙΣΗΣ ΤΟ CREATE.SQL ΠΟΥ ΑΝΕΒΑΣΑ ΣΤΟ GITHUB ΕΧΕΙ ΤΑ ΠΑΛΙΑ VERSION ΤΩΝ VIEWS ΚΑΙ INDEXES. ΣΤΕΙΛΤΕ ΜΟΥ ΤΑ ΚΑΙΝΟΥΡΓΙΑ ΓΙΑ ΝΑ ΑΝΑΝΕΩΘΟΥΝ

  ΕΓΙΝΑΝ ΚΑΙ ΑΛΛΑΓΕΣ ΣΤΟ ΑΡΧΕΙΟ INSERT.sql, ΣΥΓΚΕΚΡΙΜΕΝΑ ΣΒΗΣΤΗΚΑΝ ΟΙ TUPLES ΤΗΣ ΣΧΕΣΗΣ WORKS ΠΟΥ ΒΑΖΟΥΝ ΤΟΝ ΥΠΕΥΘΥΝΟ ΤΟΥ ΕΡΓΟΥ ΝΑ ΔΟΥΛΕΥΕΙ ΓΙΑ ΤΟ ΕΡΓΟ
  ΑΦΟΥ ΠΛΕΟΝ ΤΟ TRIGGER ΤΟ ΚΑΝΕΙ ΑΥΤΟΜΑΤΑ. ΕΠΙΣΗΣ ΣΒΗΣΤΗΚΕ ΚΑΙ ΜΙΑ ΑΛΛΗ TUPLE ΑΠΟ ΤΗ ΣΧΕΣΗ WORKS ΠΟΥ ΕΝΑΣ ΕΡΕΥΝΗΤΗΣ
  ΔΟΥΛΕΥΕ ΓΙΑ PROJECT ΑΛΛΟΥ ΟΡΓΑΝΙΣΜΟΥ.

  ΤΑ TRIGGERS ΠΟΥ ΕΧΩ ΓΡΑΨΕΙ ΔΟΥΛΕΥΟΥΝ ΣΩΣΤΑ ΓΙΑΤΙ ΤΣΕΚΑΡΙΣΤΗΚΑΝ ΑΛΛΑ ΣΕ ΠΕΡΙΠΤΩΣΗ ΠΟΥ ΔΕΙΤΕ ΚΑΤΙ ΥΠΟΠΤΟ ΠΕΙΤΕ ΜΟΥ
  ΓΙΑ ΝΑ ΞΑΝΑΤΣΕΚΑΡΙΣΤΕΙ. ΔΕΝ ΕΧΟΥΝ ΜΠΕΙ ΤΑ DROP TRIGGER IF EXISTS ΟΠΟΤΕ ΚΑΘΕ ΦΟΡΑ ΠΟΥ ΘΕΛΕΤΕ ΝΑ ΞΑΝΑΦΟΡΤΩΣΕΤΕ ΤΑ TRIGGERS
  ΠΡΕΠΕΙ ΝΑ ΞΑΝΑΤΡΕΞΕΤΕ ΤΟ ΑΡΧΕΙΟ CREATE.sql
  ΤΑ ΑΡΧΕΙΑ ΦΟΡΤΩΝΟΝΤΑΙ ΜΕ ΤΗΝ ΕΞΗΣ ΣΕΙΡΑ : CREATE -> triggers -> INSERT
  ΑΛΛΙΩΣ ΔΕΝ ΘΑ ΔΗΜΙΟΥΡΓΗΘΟΥΝ ΤΑ TUPLES ΜΕ ΤΟΥΣ ΥΠΕΥΘΥΝΟΥΣ ΕΡΓΩΝ ΣΤΗ ΣΧΕΣΗ WORKS   */
