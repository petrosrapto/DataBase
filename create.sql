/*
Data type	      Range                                                                   	Storage
bigint	     -2^63 (-9,223,372,036,854,775,808) to 2^63-1 (9,223,372,036,854,775,807)    	8 Bytes
int	         -2^31 (-2,147,483,648) to 2^31-1 (2,147,483,647)                           	4 Bytes
smallint	   -2^15 (-32,768) to 2^15-1 (32,767)	                                          2 Bytes
tinyint	      0 to 255	                                                                  1 Byte
*/

SET FOREIGN_KEY_CHECKS=0;
/* Do not check foreign key constraints */


/*********************************************************************************/

/*
  START OF TABLES
*/

/* ΕΛΙΔΕΚ translated to English -> HFRI*/
DROP SCHEMA IF EXISTS HFRI;
CREATE SCHEMA HFRI;
USE HFRI;

DROP TABLE IF EXISTS institution;
CREATE TABLE institution (
  ins_id INT UNSIGNED NOT NULL AUTO_INCREMENT,
  abbreviation VARCHAR(10) NOT NULL,
  name VARCHAR(100) NOT NULL,
  street_name VARCHAR(45) NOT NULL,
  street_number SMALLINT UNSIGNED NOT NULL,
  zip INT UNSIGNED NOT NULL,
  city VARCHAR(45) NOT NULL,
  PRIMARY KEY (ins_id)
)ENGINE=InnoDB AUTO_INCREMENT=78001 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*
character set UTF-8 [Universal Character Set Transformation Format 8-bit]
Just like ASCII, UTF-8 is a standard code used to transform alphabets and
characters into bits which computers understand. UTF-8 has already mapped
almost all the characters we use to a 8-bit size value. This is the most
popular character set used recently.
ENGINE=InnoDB
InnoDB is a database storage engine. database storage engine is by which
tables are stored, retrieved and handled. InnoDB is the fastest storage
engine in MySQL
*/

DROP TABLE IF EXISTS ins_phone;
CREATE TABLE ins_phone (
  ins_id INT UNSIGNED NOT NULL,
  phone_number VARCHAR(20) NOT NULL,     /* not null cause its primary key */
  PRIMARY KEY (ins_id, phone_number),
  CONSTRAINT fk_phone_ins FOREIGN KEY (ins_id)
    REFERENCES institution (ins_id) ON DELETE CASCADE ON UPDATE CASCADE
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


DROP TABLE IF EXISTS university;
CREATE TABLE university (
  ins_id INT UNSIGNED NOT NULL,
  Public_funds INT UNSIGNED NULL,
  PRIMARY KEY (ins_id),
  CONSTRAINT fk_uni_ins FOREIGN KEY (ins_id)
    REFERENCES institution (ins_id) ON DELETE CASCADE ON UPDATE CASCADE
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

DROP TABLE IF EXISTS research_center;
CREATE TABLE research_center (
  ins_id INT UNSIGNED NOT NULL,
  Public_funds INT UNSIGNED NULL,
  Private_funds INT UNSIGNED NULL,
  PRIMARY KEY (ins_id),
  CONSTRAINT fk_resCenter_ins FOREIGN KEY (ins_id)
    REFERENCES institution (ins_id) ON DELETE CASCADE ON UPDATE CASCADE
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

DROP TABLE IF EXISTS company;
CREATE TABLE company (
  ins_id INT UNSIGNED NOT NULL,
  Equity INT UNSIGNED NULL,
  PRIMARY KEY (ins_id),
  CONSTRAINT fk_comp_ins FOREIGN KEY (ins_id)
    REFERENCES institution (ins_id) ON DELETE CASCADE ON UPDATE CASCADE
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

DROP TABLE IF EXISTS program;
CREATE TABLE program (
  prog_id INT UNSIGNED NOT NULL AUTO_INCREMENT,
  name VARCHAR(45) NOT NULL,
  department VARCHAR(100) NOT NULL,
  PRIMARY KEY (prog_id)
)ENGINE=InnoDB AUTO_INCREMENT=23001 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

DROP TABLE IF EXISTS executive;
CREATE TABLE executive (
  ex_id INT UNSIGNED NOT NULL AUTO_INCREMENT,
  name VARCHAR(45) NOT NULL,
  PRIMARY KEY (ex_id)
)ENGINE=InnoDB AUTO_INCREMENT=11001 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

DROP TABLE IF EXISTS assessment;
CREATE TABLE assessment (
  ass_id INT UNSIGNED NOT NULL AUTO_INCREMENT,
  grade TINYINT NOT NULL,
  date DATE NOT NULL,
  CONSTRAINT con_grade CHECK (grade between 40 AND 100),
  PRIMARY KEY (ass_id)
)ENGINE=InnoDB AUTO_INCREMENT=13001 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

DROP TABLE IF EXISTS researcher;
CREATE TABLE researcher (
  res_id INT UNSIGNED NOT NULL AUTO_INCREMENT,
  ins_id INT UNSIGNED NOT NULL,
  first_name VARCHAR(45) NOT NULL,
  last_name VARCHAR(45) NOT NULL,
  sex ENUM('M','F','O') NULL, /* 'O' stands for other */
  date_of_birth DATE NULL,
  res_ins_date DATE NOT NULL,
  PRIMARY KEY (res_id),
  CONSTRAINT fk_res_ins FOREIGN KEY (ins_id)
    REFERENCES institution (ins_id) ON DELETE CASCADE ON UPDATE CASCADE
)ENGINE=InnoDB AUTO_INCREMENT=310001 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;



DELIMITER $$

DROP FUNCTION IF EXISTS duration$$
CREATE FUNCTION duration(start date, end date)
  RETURNS INT
  DETERMINISTIC
  BEGIN
    RETURN round(datediff(end, start)/365.0);
  END$$

DELIMITER ;


DROP TABLE IF EXISTS project;
CREATE TABLE project (
  proj_id INT UNSIGNED NOT NULL AUTO_INCREMENT,
  ins_id INT UNSIGNED NOT NULL,
  prog_id INT UNSIGNED NOT NULL,
  ex_id INT UNSIGNED NOT NULL,
  ass_id INT UNSIGNED NOT NULL,
  ass_res_id INT UNSIGNED NOT NULL,
  sup_res_id INT UNSIGNED NOT NULL,
  title VARCHAR(90) NOT NULL,
  description VARCHAR(450) NULL,
  start DATE NULL,
  end DATE NULL,
  fund numeric(9,2) NULL
    CONSTRAINT con_funding CHECK (fund between 100000 AND 1000000),
    CONSTRAINT con_duration CHECK ((datediff(end, start)/365.25) between 0.99 AND 4.0),
  PRIMARY KEY (proj_id),
  CONSTRAINT fk_proj_ins FOREIGN KEY (ins_id)
    REFERENCES institution (ins_id) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT fk_proj_prog FOREIGN KEY (prog_id)
    REFERENCES program (prog_id) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT fk_proj_ex FOREIGN KEY (ex_id)
    REFERENCES executive (ex_id) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT fk_proj_ass FOREIGN KEY (ass_id)
    REFERENCES assessment (ass_id) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT fk_proj_ass_res FOREIGN KEY (ass_res_id)
    REFERENCES researcher (res_id) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT fk_proj_sup_res FOREIGN KEY (sup_res_id)
    REFERENCES researcher (res_id) ON DELETE RESTRICT ON UPDATE CASCADE
)ENGINE=InnoDB AUTO_INCREMENT=45001 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


DROP TABLE IF EXISTS works;
CREATE TABLE works (
  res_id INT UNSIGNED NOT NULL,
  proj_id INT UNSIGNED NOT NULL,
  PRIMARY KEY (res_id, proj_id),
  CONSTRAINT fk_works_res FOREIGN KEY (res_id)
    REFERENCES researcher (res_id) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT fk_works_proj FOREIGN KEY (proj_id)
    REFERENCES project (proj_id) ON DELETE CASCADE ON UPDATE CASCADE
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


DROP TABLE IF EXISTS deliverable;
CREATE TABLE deliverable (
  proj_id INT UNSIGNED NOT NULL,
  title VARCHAR(45) NOT NULL,
  description VARCHAR(450) NOT NULL,
  date DATE NOT NULL,
  PRIMARY KEY (proj_id, title, description),
  CONSTRAINT fk_del_proj FOREIGN KEY (proj_id)
    REFERENCES project (proj_id) ON DELETE CASCADE ON UPDATE CASCADE
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


DROP TABLE IF EXISTS research_field;
CREATE TABLE research_field (
  field_id INT UNSIGNED NOT NULL AUTO_INCREMENT,
  field_name VARCHAR(45) NOT NULL,
  description VARCHAR(450) NULL,
  PRIMARY KEY (field_id)
)ENGINE=InnoDB AUTO_INCREMENT=99001 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


DROP TABLE IF EXISTS proj_field;
CREATE TABLE proj_field (
  proj_id INT UNSIGNED NOT NULL,
  field_id INT UNSIGNED NOT NULL,
  PRIMARY KEY (proj_id, field_id),
  CONSTRAINT fk_field_proj FOREIGN KEY (proj_id)
    REFERENCES project (proj_id) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT fk_proj_field FOREIGN KEY (field_id)
    REFERENCES research_field (field_id) ON DELETE RESTRICT ON UPDATE CASCADE
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

SET FOREIGN_KEY_CHECKS = 1;
/* Check foreign key constraints (default)*/


/*
  END OF TABLES
*/

/***********************************************************************************/

/*
  START OF INDEXES
*/



CREATE INDEX idx_res_ins_id ON researcher(ins_id);
CREATE INDEX idx_proj_ins_id ON project(ins_id);
CREATE INDEX idx_prog_id ON project(prog_id);
CREATE INDEX idx_ex_id ON project(ex_id);
CREATE UNIQUE INDEX idx_ass_id ON project(ass_id);
CREATE INDEX idx_ass_res_id ON project(ass_res_id);
CREATE INDEX idx_sup_res_id ON project(sup_res_id);

CREATE INDEX idx_start_date ON project(start);
CREATE INDEX idx_end_date ON project(end);
CREATE INDEX idx_date_of_birth ON researcher(date_of_birth);

/*
  END OF INDEXES
*/

/*********************************************************************************/

/*
  START OF VIEWS
*/

DROP VIEW IF EXISTS projects_per_researcher;
CREATE VIEW projects_per_researcher
(res_id, first_name, last_name, num_of_projects)
 AS
 SELECT r.res_id, r.first_name, r.last_name, count(*) FROM researcher r
 INNER JOIN works w
 ON r.res_id = w.res_id
 GROUP BY r.res_id
 UNION
 SELECT r.res_id, r.first_name, r.last_name, 0 FROM researcher r
 LEFT OUTER JOIN works w
 ON r.res_id = w.res_id
 WHERE w.proj_id IS NULL;

DROP VIEW IF EXISTS projects_per_institution_per_year;
CREATE VIEW projects_per_institution_per_year
(ins_id, abbreviation, name, projects, year)
 AS
 SELECT i.ins_id, i.abbreviation, i.name, count(*), YEAR(p.start) as year FROM institution i
 INNER JOIN project p
 ON i.ins_id = p.ins_id
 GROUP BY i.ins_id, year;


/*
  END OF VIEWS
*/

/**************************************************************************************/

/*
  START OF USERS
*/

/*********************************************************************************/

DROP USER IF EXISTS 'User_1'@'localhost';

DROP USER IF EXISTS 'User_2'@'localhost';

CREATE USER 'User_1'@'localhost' IDENTIFIED BY 'DBdb11@@';

CREATE USER 'User_2'@'localhost' IDENTIFIED BY 'DBdb22@@';

GRANT ALL ON HFRI.* TO 'User_1'@'localhost';

GRANT SELECT ON HFRI.* TO 'User_2'@'localhost';

FLUSH PRIVILEGES;

/*
  END OF USERS
*/

/**********************************************************************************/

/*
  START OF TRIGGERS
*/

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
/* this trigger procs the first trigger which also deletes the assessment of a project after deleting that particular project */
CREATE TRIGGER delete_projects_when_you_delete_programs
before delete
ON program FOR EACH ROW
BEGIN
delete from project where prog_id = old.prog_id;
END $$



DELIMITER $$
DROP TRIGGER IF EXISTS delete_projects_when_you_delete_executive$$
/* this trigger procs the first trigger which also deletes the assessment of a project after deleting that particular project */
CREATE TRIGGER delete_projects_when_you_delete_executive
before delete
ON executive FOR EACH ROW
BEGIN
delete from project where ex_id = old.ex_id;
END $$

/*
  END OF TRIGGERS
*/

/*********************************************************************************/




DELIMITER ;
