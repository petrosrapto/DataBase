/*
Data type	      Range                                                                   	Storage
bigint	     -2^63 (-9,223,372,036,854,775,808) to 2^63-1 (9,223,372,036,854,775,807)    	8 Bytes
int	         -2^31 (-2,147,483,648) to 2^31-1 (2,147,483,647)                           	4 Bytes
smallint	   -2^15 (-32,768) to 2^15-1 (32,767)	                                          2 Bytes
tinyint	      0 to 255	                                                                  1 Byte
*/

/* ΕΛΙΔΕΚ translated to English -> HFRI*/

DROP SCHEMA IF EXISTS HFRI;
CREATE SCHEMA HFRI;
USE HFRI;

CREATE TABLE institution (
  ins_id INT UNSIGNED NOT NULL AUTO_INCREMENT,
  abbreviation VARCHAR(10) NOT NULL,
  name VARCHAR(45) NOT NULL,
  street_name VARCHAR(45) NOT NULL,
  street_number SMALLINT UNSIGNED NOT NULL,
  zip SMALLINT UNSIGNED NOT NULL,
  city VARCHAR(45) NOT NULL,
  PRIMARY KEY (ins_id)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

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

CREATE TABLE ins_phone (
  ins_id INT UNSIGNED NOT NULL,
  phone VARCHAR(20) NOT NULL,     /* not null cause its primary key */
  PRIMARY KEY (ins_id, phone),
  CONSTRAINT fk_phone_ins FOREIGN KEY (ins_id)
    REFERENCES institution (ins_id) ON DELETE RESTRICT ON UPDATE CASCADE
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE university (
  ins_id INT UNSIGNED NOT NULL,
  Public_funds INT UNSIGNED NULL,
  PRIMARY KEY (ins_id),
  CONSTRAINT fk_uni_ins FOREIGN KEY (ins_id)
    REFERENCES institution (ins_id) ON DELETE RESTRICT ON UPDATE CASCADE
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE research_center (
  ins_id INT UNSIGNED NOT NULL,
  Public_funds INT UNSIGNED NULL,
  Private_funds INT UNSIGNED NULL,
  PRIMARY KEY (ins_id),
  CONSTRAINT fk_resCenter_ins FOREIGN KEY (ins_id)
    REFERENCES institution (ins_id) ON DELETE RESTRICT ON UPDATE CASCADE
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE company (
  ins_id INT UNSIGNED NOT NULL,
  Equity INT UNSIGNED NULL,
  PRIMARY KEY (ins_id),
  CONSTRAINT fk_comp_ins FOREIGN KEY (ins_id)
    REFERENCES institution (ins_id) ON DELETE RESTRICT ON UPDATE CASCADE
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE program (
  prog_id INT UNSIGNED NOT NULL AUTO_INCREMENT,
  name VARCHAR(45) NOT NULL,
  department VARCHAR(100) NOT NULL,
  PRIMARY KEY (prog_id)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE executive (
  ex_id INT UNSIGNED NOT NULL AUTO_INCREMENT,
  name VARCHAR(45) NOT NULL,
  PRIMARY KEY (ex_id)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE assessment (
  ass_id INT UNSIGNED NOT NULL AUTO_INCREMENT,
  grade TINYINT NOT NULL,
  date DATE NOT NULL,
  PRIMARY KEY (ass_id)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE researcher (
  res_id INT UNSIGNED NOT NULL AUTO_INCREMENT,
  ins_id INT UNSIGNED NOT NULL,
  first_name VARCHAR(45) NOT NULL,
  last_name VARCHAR(45) NOT NULL,
  sex ENUM('M','F','O') NULL, /* 'O' stands for other */
  date_of_birth DATE NULL,
  res_ins DATE NOT NULL,
  PRIMARY KEY (res_id),
  CONSTRAINT fk_res_ins FOREIGN KEY (ins_id)
    REFERENCES institution (ins_id) ON DELETE RESTRICT ON UPDATE CASCADE
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE project (
  proj_id INT UNSIGNED NOT NULL AUTO_INCREMENT,
  ins_id INT UNSIGNED NOT NULL,
  prog_id INT UNSIGNED NOT NULL,
  ex_id INT UNSIGNED NOT NULL,
  ass_id INT UNSIGNED NOT NULL,
  ass_res_id INT UNSIGNED NOT NULL,
  sup_res_id INT UNSIGNED NOT NULL,
  title VARCHAR(45) NOT NULL,
  description VARCHAR(450) NULL,
  start DATE NULL,
  end DATE NULL,
  fund INT UNSIGNED NULL,
  PRIMARY KEY (proj_id),
  CONSTRAINT fk_proj_ins FOREIGN KEY (ins_id)
    REFERENCES institution (ins_id) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT fk_proj_prog FOREIGN KEY (prog_id)
    REFERENCES program (prog_id) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT fk_proj_ex FOREIGN KEY (ex_id)
    REFERENCES executive (ex_id) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT fk_proj_ass FOREIGN KEY (ass_id)
    REFERENCES assessment (ass_id) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT fk_proj_ass_res FOREIGN KEY (ass_res_id)
    REFERENCES researcher (res_id) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT fk_proj_sup_res FOREIGN KEY (sup_res_id)
    REFERENCES researcher (res_id) ON DELETE RESTRICT ON UPDATE CASCADE
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE works (
  res_id INT UNSIGNED NOT NULL,
  proj_id INT UNSIGNED NOT NULL,
  PRIMARY KEY (res_id, proj_id),
  CONSTRAINT fk_works_res FOREIGN KEY (res_id)
    REFERENCES researcher (res_id) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT fk_works_proj FOREIGN KEY (proj_id)
    REFERENCES project (proj_id) ON DELETE RESTRICT ON UPDATE CASCADE
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE deliverable (
  proj_id INT UNSIGNED NOT NULL,
  title VARCHAR(45) NOT NULL,
  description VARCHAR(450) NOT NULL,
  date DATE NOT NULL,
  PRIMARY KEY (proj_id, title, description),
  CONSTRAINT fk_del_proj FOREIGN KEY (proj_id)
    REFERENCES project (proj_id) ON DELETE RESTRICT ON UPDATE CASCADE
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE research_field (
  field_id INT UNSIGNED NOT NULL AUTO_INCREMENT,
  field_name VARCHAR(45) NOT NULL,
  description VARCHAR(450) NULL,
  PRIMARY KEY (field_id)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE proj_field (
  proj_id INT UNSIGNED NOT NULL,
  field_id INT UNSIGNED NOT NULL,
  PRIMARY KEY (proj_id, field_id),
  CONSTRAINT fk_field_proj FOREIGN KEY (proj_id)
    REFERENCES project (proj_id) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT fk_proj_field FOREIGN KEY (field_id)
    REFERENCES research_field (field_id) ON DELETE RESTRICT ON UPDATE CASCADE
)ENGINE=InnoDB DEFAULT CHARSET=utf8;
