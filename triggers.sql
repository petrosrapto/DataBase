DELIMITER $$

CREATE TRIGGER make_the_assessment_first
before insert
ON project FOR EACH ROW
BEGIN
INSERT INTO assessment (ass_id,grade, date) VALUES (NEW.ass_id,40, NEW.start);
END $$
