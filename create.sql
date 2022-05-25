/*
Data type	      Range                                                                   	Storage
bigint	     -2^63 (-9,223,372,036,854,775,808) to 2^63-1 (9,223,372,036,854,775,807)    	8 Bytes
int	         -2^31 (-2,147,483,648) to 2^31-1 (2,147,483,647)                           	4 Bytes
smallint	   -2^15 (-32,768) to 2^15-1 (32,767)	                                          2 Bytes
tinyint	      0 to 255	                                                                  1 Byte
*/

SET FOREIGN_KEY_CHECKS=0;
/* Do not check foreign key constraints */

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
)ENGINE=InnoDB AUTO_INCREMENT=78001 DEFAULT CHARSET=utf8;

INSERT INTO institution (ins_id, abbreviation, name, street_name, street_number, zip, city) VALUES (78001, "NTUA", "National Technical University of Athens", "Patision", 682, 10682, "Athens");
INSERT INTO institution (ins_id, abbreviation, name, street_name, street_number, zip, city) VALUES (78002, "NKUA", "National and Kapodistrian University of Athens", "Imitou", 784, 15784, "Athens");
INSERT INTO institution (ins_id, abbreviation, name, street_name, street_number, zip, city) VALUES (78003, "UOP", "University of Patras", "Ippokratous", 504, 26504, "Patras");
INSERT INTO institution (ins_id, abbreviation, name, street_name, street_number, zip, city) VALUES (78004, "UTH", "University of Thessaly", "Argonafton", 221, 38221, "Volos");
INSERT INTO institution (ins_id, abbreviation, name, street_name, street_number, zip, city) VALUES (78005, "UNIWA", "University of West Attica", "Spiridonos", 243, 12243, "Athens");
INSERT INTO institution (ins_id, abbreviation, name, street_name, street_number, zip, city) VALUES (78006, "TUC", "Technical University of Crete", "Akrotiri", 100, 73100, "Chania");
INSERT INTO institution (ins_id, abbreviation, name, street_name, street_number, zip, city) VALUES (78007, "DUTH", "Democritus University of Thrace", "Campus", 100, 69100, "Komotini");
INSERT INTO institution (ins_id, abbreviation, name, street_name, street_number, zip, city) VALUES (78008, "AUTH", "Aristotle University of Thessaloniki", "Miller", 124, 54124, "Thessaloniki");
INSERT INTO institution (ins_id, abbreviation, name, street_name, street_number, zip, city) VALUES (78009, "AUEB", "Athens University of Economics and Business", "Patision", 34, 10434, "Athens");
INSERT INTO institution (ins_id, abbreviation, name, street_name, street_number, zip, city) VALUES (78010, "UNIPI", "University of Piraeus", "Karaoli", 534, 18534, "Piraeus");
INSERT INTO institution (ins_id, abbreviation, name, street_name, street_number, zip, city) VALUES (78011, "NOA", "National Oservatory of Athens", "Nimfon", 10, 11810, "Athens");
INSERT INTO institution (ins_id, abbreviation, name, street_name, street_number, zip, city) VALUES (78012, "NCSR", "National Center for Scientific Research Demokritos", "Neapoleos", 341, 15341, "Athens");
INSERT INTO institution (ins_id, abbreviation, name, street_name, street_number, zip, city) VALUES (78013, "GRNET", "S.A. National Infrastructures for Research and Technology", "Kifisias", 3, 11523, "Athens");
INSERT INTO institution (ins_id, abbreviation, name, street_name, street_number, zip, city) VALUES (78014, "NHRF", "National Hellenic Research Foundation", "Konstantinou", 635, 11635, "Athens");
INSERT INTO institution (ins_id, abbreviation, name, street_name, street_number, zip, city) VALUES (78015, "CERTH", "Centre for Research & Technology Hellas", "Egialias", 25, 15125, "Athens");
INSERT INTO institution (ins_id, abbreviation, name, street_name, street_number, zip, city) VALUES (78016, "GAEC", "Greek Atomic Energy Commissions", "Neapoleos", 41, 15341, "Athens");
INSERT INTO institution (ins_id, abbreviation, name, street_name, street_number, zip, city) VALUES (78017, "HCMR", "Hellenic Centre for Marine Research", "Vouliagmenis", 452, 16452, "Athens");
INSERT INTO institution (ins_id, abbreviation, name, street_name, street_number, zip, city) VALUES (78018, "FORTH", "Foundation for Research and Technology - Hellas", "Plastira", 13, 70013, "Heraklion");
INSERT INTO institution (ins_id, abbreviation, name, street_name, street_number, zip, city) VALUES (78019, "CRES", "Centre for Renewable Energy Sources and Saving", "Marathonos", 9, 19009, "Athens");
INSERT INTO institution (ins_id, abbreviation, name, street_name, street_number, zip, city) VALUES (78020, "BSRC", "Fleming Biomedical Sciences Research Center Alexander Fleming", "Fleming", 672, 16672, "Athens");
INSERT INTO institution (ins_id, abbreviation, name, street_name, street_number, zip, city) VALUES (78021, "RF", "Research Focus", "Emeral", 102, 8102, "Athens");
INSERT INTO institution (ins_id, abbreviation, name, street_name, street_number, zip, city) VALUES (78022, "SP", "Scipark", "Cambridge", 502, 86502, "Patras");
INSERT INTO institution (ins_id, abbreviation, name, street_name, street_number, zip, city) VALUES (78023, "SC", "Scolax", "Scheuvront", 66, 94566, "Piraeus");
INSERT INTO institution (ins_id, abbreviation, name, street_name, street_number, zip, city) VALUES (78024, "ELY", "Experiment.ly", "Hinkle", 38, 2038, "Thessaloniki");
INSERT INTO institution (ins_id, abbreviation, name, street_name, street_number, zip, city) VALUES (78025, "IC", "Intercomp", "Essex", 93, 27893, "Chania");
INSERT INTO institution (ins_id, abbreviation, name, street_name, street_number, zip, city) VALUES (78026, "LL", "Linkage Labs", "Hog", 466, 60466, "Athens");
INSERT INTO institution (ins_id, abbreviation, name, street_name, street_number, zip, city) VALUES (78027, "LM", "LabMouse", "Hedge", 701, 7701, "Athens");
INSERT INTO institution (ins_id, abbreviation, name, street_name, street_number, zip, city) VALUES (78028, "OCL", "Occulab", "Freshour", 205, 78205, "Tripoli");
INSERT INTO institution (ins_id, abbreviation, name, street_name, street_number, zip, city) VALUES (78029, "CL", "Config Lab", "Nicholas", 427, 66427, "Lamia");
INSERT INTO institution (ins_id, abbreviation, name, street_name, street_number, zip, city) VALUES (78030, "FL", "Faculty Labs", "Johnstown", 148, 60148, "Sparta");


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
    REFERENCES institution (ins_id) ON DELETE RESTRICT ON UPDATE CASCADE
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

INSERT INTO ins_phone (ins_id, phone_number) VALUES (78001, "5906501292");
INSERT INTO ins_phone (ins_id, phone_number) VALUES (78001, "8435744534");
INSERT INTO ins_phone (ins_id, phone_number) VALUES (78001, "2694249785");
INSERT INTO ins_phone (ins_id, phone_number) VALUES (78001, "4465658879");
INSERT INTO ins_phone (ins_id, phone_number) VALUES (78002, "2610317963");
INSERT INTO ins_phone (ins_id, phone_number) VALUES (78002, "7429967161");
INSERT INTO ins_phone (ins_id, phone_number) VALUES (78002, "6436667913");
INSERT INTO ins_phone (ins_id, phone_number) VALUES (78002, "1764236932");
INSERT INTO ins_phone (ins_id, phone_number) VALUES (78002, "2552714863");
INSERT INTO ins_phone (ins_id, phone_number) VALUES (78002, "1762664245");
INSERT INTO ins_phone (ins_id, phone_number) VALUES (78003, "9230406502");
INSERT INTO ins_phone (ins_id, phone_number) VALUES (78003, "7808149487");
INSERT INTO ins_phone (ins_id, phone_number) VALUES (78003, "9002646267");
INSERT INTO ins_phone (ins_id, phone_number) VALUES (78003, "9476451602");
INSERT INTO ins_phone (ins_id, phone_number) VALUES (78003, "9642838030");
INSERT INTO ins_phone (ins_id, phone_number) VALUES (78004, "1740424849");
INSERT INTO ins_phone (ins_id, phone_number) VALUES (78004, "8095649381");
INSERT INTO ins_phone (ins_id, phone_number) VALUES (78004, "3661266463");
INSERT INTO ins_phone (ins_id, phone_number) VALUES (78004, "1866964473");
INSERT INTO ins_phone (ins_id, phone_number) VALUES (78005, "462218113");
INSERT INTO ins_phone (ins_id, phone_number) VALUES (78005, "5406540672");
INSERT INTO ins_phone (ins_id, phone_number) VALUES (78005, "7009422589");
INSERT INTO ins_phone (ins_id, phone_number) VALUES (78006, "6844016106");
INSERT INTO ins_phone (ins_id, phone_number) VALUES (78006, "2165854605");
INSERT INTO ins_phone (ins_id, phone_number) VALUES (78006, "14151556");
INSERT INTO ins_phone (ins_id, phone_number) VALUES (78006, "7368138666");
INSERT INTO ins_phone (ins_id, phone_number) VALUES (78006, "7843950663");
INSERT INTO ins_phone (ins_id, phone_number) VALUES (78007, "5165873701");
INSERT INTO ins_phone (ins_id, phone_number) VALUES (78007, "2280692385");
INSERT INTO ins_phone (ins_id, phone_number) VALUES (78007, "7606059652");
INSERT INTO ins_phone (ins_id, phone_number) VALUES (78007, "923706705");
INSERT INTO ins_phone (ins_id, phone_number) VALUES (78008, "8257132081");
INSERT INTO ins_phone (ins_id, phone_number) VALUES (78008, "8062692712");
INSERT INTO ins_phone (ins_id, phone_number) VALUES (78008, "7903061179");
INSERT INTO ins_phone (ins_id, phone_number) VALUES (78009, "7041836768");
INSERT INTO ins_phone (ins_id, phone_number) VALUES (78009, "9389879341");
INSERT INTO ins_phone (ins_id, phone_number) VALUES (78009, "6365910164");
INSERT INTO ins_phone (ins_id, phone_number) VALUES (78009, "9291220029");
INSERT INTO ins_phone (ins_id, phone_number) VALUES (78010, "9601247511");
INSERT INTO ins_phone (ins_id, phone_number) VALUES (78010, "7437920160");
INSERT INTO ins_phone (ins_id, phone_number) VALUES (78011, "5505816795");
INSERT INTO ins_phone (ins_id, phone_number) VALUES (78011, "6414555430");
INSERT INTO ins_phone (ins_id, phone_number) VALUES (78011, "4009326896");
INSERT INTO ins_phone (ins_id, phone_number) VALUES (78012, "3657393243");
INSERT INTO ins_phone (ins_id, phone_number) VALUES (78012, "3556986582");
INSERT INTO ins_phone (ins_id, phone_number) VALUES (78013, "6867995739");
INSERT INTO ins_phone (ins_id, phone_number) VALUES (78013, "4180902010");
INSERT INTO ins_phone (ins_id, phone_number) VALUES (78013, "5990859395");
INSERT INTO ins_phone (ins_id, phone_number) VALUES (78014, "9885302485");
INSERT INTO ins_phone (ins_id, phone_number) VALUES (78015, "4540947932");
INSERT INTO ins_phone (ins_id, phone_number) VALUES (78015, "5655966898");
INSERT INTO ins_phone (ins_id, phone_number) VALUES (78015, "8785449604");
INSERT INTO ins_phone (ins_id, phone_number) VALUES (78015, "7813143926");
INSERT INTO ins_phone (ins_id, phone_number) VALUES (78016, "9782813469");
INSERT INTO ins_phone (ins_id, phone_number) VALUES (78016, "4197873371");
INSERT INTO ins_phone (ins_id, phone_number) VALUES (78016, "51638300");
INSERT INTO ins_phone (ins_id, phone_number) VALUES (78016, "5116342197");
INSERT INTO ins_phone (ins_id, phone_number) VALUES (78016, "5706236085");
INSERT INTO ins_phone (ins_id, phone_number) VALUES (78017, "710753183");
INSERT INTO ins_phone (ins_id, phone_number) VALUES (78017, "876411987");
INSERT INTO ins_phone (ins_id, phone_number) VALUES (78018, "6065426646");
INSERT INTO ins_phone (ins_id, phone_number) VALUES (78018, "3292504326");
INSERT INTO ins_phone (ins_id, phone_number) VALUES (78018, "5137889882");
INSERT INTO ins_phone (ins_id, phone_number) VALUES (78019, "7796999091");
INSERT INTO ins_phone (ins_id, phone_number) VALUES (78019, "792115421");
INSERT INTO ins_phone (ins_id, phone_number) VALUES (78020, "9801668666");
INSERT INTO ins_phone (ins_id, phone_number) VALUES (78020, "5762262874");
INSERT INTO ins_phone (ins_id, phone_number) VALUES (78020, "4349575696");
INSERT INTO ins_phone (ins_id, phone_number) VALUES (78020, "2843760643");
INSERT INTO ins_phone (ins_id, phone_number) VALUES (78021, "4113528907");
INSERT INTO ins_phone (ins_id, phone_number) VALUES (78021, "2451460034");
INSERT INTO ins_phone (ins_id, phone_number) VALUES (78021, "7622825884");
INSERT INTO ins_phone (ins_id, phone_number) VALUES (78022, "9660134600");
INSERT INTO ins_phone (ins_id, phone_number) VALUES (78022, "5314559825");
INSERT INTO ins_phone (ins_id, phone_number) VALUES (78023, "5567407319");
INSERT INTO ins_phone (ins_id, phone_number) VALUES (78024, "1634398301");
INSERT INTO ins_phone (ins_id, phone_number) VALUES (78024, "937589094");
INSERT INTO ins_phone (ins_id, phone_number) VALUES (78024, "2435950658");
INSERT INTO ins_phone (ins_id, phone_number) VALUES (78024, "9250023820");
INSERT INTO ins_phone (ins_id, phone_number) VALUES (78025, "6050020117");
INSERT INTO ins_phone (ins_id, phone_number) VALUES (78025, "5193307675");
INSERT INTO ins_phone (ins_id, phone_number) VALUES (78025, "1798355762");
INSERT INTO ins_phone (ins_id, phone_number) VALUES (78025, "6635380572");
INSERT INTO ins_phone (ins_id, phone_number) VALUES (78026, "3823083750");
INSERT INTO ins_phone (ins_id, phone_number) VALUES (78026, "8741798590");
INSERT INTO ins_phone (ins_id, phone_number) VALUES (78027, "7485379007");
INSERT INTO ins_phone (ins_id, phone_number) VALUES (78027, "7381470333");
INSERT INTO ins_phone (ins_id, phone_number) VALUES (78027, "4921674362");
INSERT INTO ins_phone (ins_id, phone_number) VALUES (78027, "9433586591");
INSERT INTO ins_phone (ins_id, phone_number) VALUES (78027, "6469918997");
INSERT INTO ins_phone (ins_id, phone_number) VALUES (78028, "5681717824");
INSERT INTO ins_phone (ins_id, phone_number) VALUES (78028, "5861212297");
INSERT INTO ins_phone (ins_id, phone_number) VALUES (78029, "9756915028");
INSERT INTO ins_phone (ins_id, phone_number) VALUES (78029, "2028696153");
INSERT INTO ins_phone (ins_id, phone_number) VALUES (78029, "9845271887");
INSERT INTO ins_phone (ins_id, phone_number) VALUES (78030, "7921964286");
INSERT INTO ins_phone (ins_id, phone_number) VALUES (78030, "2988844167");
INSERT INTO ins_phone (ins_id, phone_number) VALUES (78030, "7813038932");
INSERT INTO ins_phone (ins_id, phone_number) VALUES (78030, "2299027185");
INSERT INTO ins_phone (ins_id, phone_number) VALUES (78030, "3509525573");

DROP TABLE IF EXISTS university;
CREATE TABLE university (
  ins_id INT UNSIGNED NOT NULL,
  Public_funds INT UNSIGNED NULL,
  PRIMARY KEY (ins_id),
  CONSTRAINT fk_uni_ins FOREIGN KEY (ins_id)
    REFERENCES institution (ins_id) ON DELETE RESTRICT ON UPDATE CASCADE
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

INSERT INTO university (ins_id, Public_funds) VALUES (78001, 15000000);
INSERT INTO university (ins_id, Public_funds) VALUES (78002, 40000000);
INSERT INTO university (ins_id, Public_funds) VALUES (78003, 20000000);
INSERT INTO university (ins_id, Public_funds) VALUES (78004, 10000000);
INSERT INTO university (ins_id, Public_funds) VALUES (78005, 13000000);
INSERT INTO university (ins_id, Public_funds) VALUES (78006, 11000000);
INSERT INTO university (ins_id, Public_funds) VALUES (78007, 9000000);
INSERT INTO university (ins_id, Public_funds) VALUES (78008, 2500000);
INSERT INTO university (ins_id, Public_funds) VALUES (78009, 7000000);
INSERT INTO university (ins_id, Public_funds) VALUES (78010, 7000000);

DROP TABLE IF EXISTS research_center;
CREATE TABLE research_center (
  ins_id INT UNSIGNED NOT NULL,
  Public_funds INT UNSIGNED NULL,
  Private_funds INT UNSIGNED NULL,
  PRIMARY KEY (ins_id),
  CONSTRAINT fk_resCenter_ins FOREIGN KEY (ins_id)
    REFERENCES institution (ins_id) ON DELETE RESTRICT ON UPDATE CASCADE
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

INSERT INTO research_center (ins_id, Public_funds, Private_funds) VALUES (78011, 5000000, 3000000);
INSERT INTO research_center (ins_id, Public_funds, Private_funds) VALUES (78012, 2000000, 1500000);
INSERT INTO research_center (ins_id, Public_funds, Private_funds) VALUES (78013, 4000000, 1000000);
INSERT INTO research_center (ins_id, Public_funds, Private_funds) VALUES (78014, 2500000, 2000000);
INSERT INTO research_center (ins_id, Public_funds, Private_funds) VALUES (78015, 1900000, 1300000);
INSERT INTO research_center (ins_id, Public_funds, Private_funds) VALUES (78016, 1000000, 900000);
INSERT INTO research_center (ins_id, Public_funds, Private_funds) VALUES (78017, 5000000, 3000000);
INSERT INTO research_center (ins_id, Public_funds, Private_funds) VALUES (78018, 2400000, 1000000);
INSERT INTO research_center (ins_id, Public_funds, Private_funds) VALUES (78019, 2000000, 1700000);
INSERT INTO research_center (ins_id, Public_funds, Private_funds) VALUES (78020, 500000, 300000);

DROP TABLE IF EXISTS company;
CREATE TABLE company (
  ins_id INT UNSIGNED NOT NULL,
  Equity INT UNSIGNED NULL,
  PRIMARY KEY (ins_id),
  CONSTRAINT fk_comp_ins FOREIGN KEY (ins_id)
    REFERENCES institution (ins_id) ON DELETE RESTRICT ON UPDATE CASCADE
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

INSERT INTO company (ins_id, Equity) VALUES (78021, 1000000);
INSERT INTO company (ins_id, Equity) VALUES (78022, 1500000);
INSERT INTO company (ins_id, Equity) VALUES (78023, 2000000);
INSERT INTO company (ins_id, Equity) VALUES (78024, 1400000);
INSERT INTO company (ins_id, Equity) VALUES (78025, 900000);
INSERT INTO company (ins_id, Equity) VALUES (78026, 850000);
INSERT INTO company (ins_id, Equity) VALUES (78027, 1100000);
INSERT INTO company (ins_id, Equity) VALUES (78028, 700000);
INSERT INTO company (ins_id, Equity) VALUES (78029, 1500000);
INSERT INTO company (ins_id, Equity) VALUES (78030, 1300000);

DROP TABLE IF EXISTS program;
CREATE TABLE program (
  prog_id INT UNSIGNED NOT NULL AUTO_INCREMENT,
  name VARCHAR(45) NOT NULL,
  department VARCHAR(100) NOT NULL,
  PRIMARY KEY (prog_id)
)ENGINE=InnoDB AUTO_INCREMENT=23001 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

INSERT INTO program (prog_id, name, department) VALUES (23001, "Thales", "Program Management and Monitoring");
INSERT INTO program (prog_id, name, department) VALUES (23002, "Anaximander", "Enviromental Research and Sustainable Development");
INSERT INTO program (prog_id, name, department) VALUES (23003, "Pythagoras", "Design and Scheduling");
INSERT INTO program (prog_id, name, department) VALUES (23004, "Anaxagoras", "Innovative Actions Planning");
INSERT INTO program (prog_id, name, department) VALUES (23005, "Hippocrates", "Program Management and Monitoring");
INSERT INTO program (prog_id, name, department) VALUES (23006, "Eudoxus", "Design and Scheduling");
INSERT INTO program (prog_id, name, department) VALUES (23007, "Aristotle", "Agriculture and Food Processing");
INSERT INTO program (prog_id, name, department) VALUES (23008, "Theophrastus", "Enviromental Research and Sustainable Development");
INSERT INTO program (prog_id, name, department) VALUES (23009, "Aristarchus", "Design and Scheduling");
INSERT INTO program (prog_id, name, department) VALUES (23010, "Euclid", "Innovative Actions Planning");
INSERT INTO program (prog_id, name, department) VALUES (23011, "Archimedes", "Program Management and Monitoring");
INSERT INTO program (prog_id, name, department) VALUES (23012, "Eratosthenes", "Agriculture and Food Processing");
INSERT INTO program (prog_id, name, department) VALUES (23013, "Hipparchus", "Agriculture and Food Processing");
INSERT INTO program (prog_id, name, department) VALUES (23014, "Ptolemy", "Design and Scheduling");
INSERT INTO program (prog_id, name, department) VALUES (23015, "Diophantus", "Enviromental Research and Sustainable Development");
INSERT INTO program (prog_id, name, department) VALUES (23016, "Hero", "Design and Scheduling");
INSERT INTO program (prog_id, name, department) VALUES (23017, "Xenocrates", "Enviromental Research and Sustainable Development");
INSERT INTO program (prog_id, name, department) VALUES (23018, "Xenagoras", "Design and Scheduling");
INSERT INTO program (prog_id, name, department) VALUES (23019, "Cleomedes", "Innovative Actions Planning");
INSERT INTO program (prog_id, name, department) VALUES (23020, "Pytheas", "Enviromental Research and Sustainable Development");
INSERT INTO program (prog_id, name, department) VALUES (23021, "Theodosius", "Innovative Actions Planning");
INSERT INTO program (prog_id, name, department) VALUES (23022, "Epicurus", "Design and Scheduling");
INSERT INTO program (prog_id, name, department) VALUES (23023, "Heraclitus", "Design and Scheduling");
INSERT INTO program (prog_id, name, department) VALUES (23024, "Plato", "Innovative Actions Planning");
INSERT INTO program (prog_id, name, department) VALUES (23025, "Eupalinos", "Program Management and Monitoring");
INSERT INTO program (prog_id, name, department) VALUES (23026, "Leophanes", "Agriculture and Food Processing");
INSERT INTO program (prog_id, name, department) VALUES (23027, "Pythias", "Innovative Actions Planning");
INSERT INTO program (prog_id, name, department) VALUES (23028, "Callistatus", "Agriculture and Food Processing");
INSERT INTO program (prog_id, name, department) VALUES (23029, "Dionysiades", "Design and Scheduling");
INSERT INTO program (prog_id, name, department) VALUES (23030, "Xenarchus", "Design and Scheduling");

DROP TABLE IF EXISTS executive;
CREATE TABLE executive (
  ex_id INT UNSIGNED NOT NULL AUTO_INCREMENT,
  name VARCHAR(45) NOT NULL,
  PRIMARY KEY (ex_id)
)ENGINE=InnoDB AUTO_INCREMENT=11001 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

INSERT INTO executive (ex_id, name) VALUES (11001, "Sweet");
INSERT INTO executive (ex_id, name) VALUES (11002, "Vang");
INSERT INTO executive (ex_id, name) VALUES (11003, "lowers");
INSERT INTO executive (ex_id, name) VALUES (11004, "Brookes");
INSERT INTO executive (ex_id, name) VALUES (11005, "Brewer");
INSERT INTO executive (ex_id, name) VALUES (11006, "Coates");
INSERT INTO executive (ex_id, name) VALUES (11007, "Duffy");
INSERT INTO executive (ex_id, name) VALUES (11008, "Byrd");
INSERT INTO executive (ex_id, name) VALUES (11009, "Riddle");
INSERT INTO executive (ex_id, name) VALUES (11010, "Horner");
INSERT INTO executive (ex_id, name) VALUES (11011, "Garza");
INSERT INTO executive (ex_id, name) VALUES (11012, "Guest");
INSERT INTO executive (ex_id, name) VALUES (11013, "Cobb");
INSERT INTO executive (ex_id, name) VALUES (11014, "Brookes");
INSERT INTO executive (ex_id, name) VALUES (11015, "Ramos");
INSERT INTO executive (ex_id, name) VALUES (11016, "Lancaster");
INSERT INTO executive (ex_id, name) VALUES (11017, "Kirk");
INSERT INTO executive (ex_id, name) VALUES (11018, "Pearce");
INSERT INTO executive (ex_id, name) VALUES (11019, "Daugherty");
INSERT INTO executive (ex_id, name) VALUES (11020, "Brett");

DROP TABLE IF EXISTS assessment;
CREATE TABLE assessment (
  ass_id INT UNSIGNED NOT NULL AUTO_INCREMENT,
  grade TINYINT NOT NULL,
  date DATE NOT NULL,
  PRIMARY KEY (ass_id)
)ENGINE=InnoDB AUTO_INCREMENT=13001 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

INSERT INTO assessment (ass_id, grade, date) VALUES (13001, 71, STR_TO_DATE("4/2/2019",'%d/%m/%Y'));
INSERT INTO assessment (ass_id, grade, date) VALUES (13002, 69, STR_TO_DATE("20/02/2019",'%d/%m/%Y'));
INSERT INTO assessment (ass_id, grade, date) VALUES (13003, 60, STR_TO_DATE("13/03/2019",'%d/%m/%Y'));
INSERT INTO assessment (ass_id, grade, date) VALUES (13004, 74, STR_TO_DATE("30/05/2019",'%d/%m/%Y'));
INSERT INTO assessment (ass_id, grade, date) VALUES (13005, 98, STR_TO_DATE("28/08/2019",'%d/%m/%Y'));
INSERT INTO assessment (ass_id, grade, date) VALUES (13006, 92, STR_TO_DATE("1/2/2020",'%d/%m/%Y'));
INSERT INTO assessment (ass_id, grade, date) VALUES (13007, 47, STR_TO_DATE("30/06/2020",'%d/%m/%Y'));
INSERT INTO assessment (ass_id, grade, date) VALUES (13008, 90, STR_TO_DATE("23/08/2020",'%d/%m/%Y'));
INSERT INTO assessment (ass_id, grade, date) VALUES (13009, 79, STR_TO_DATE("22/09/2020",'%d/%m/%Y'));
INSERT INTO assessment (ass_id, grade, date) VALUES (13010, 41, STR_TO_DATE("6/10/2020",'%d/%m/%Y'));
INSERT INTO assessment (ass_id, grade, date) VALUES (13011, 60, STR_TO_DATE("15/06/2021",'%d/%m/%Y'));
INSERT INTO assessment (ass_id, grade, date) VALUES (13012, 49, STR_TO_DATE("6/7/2021",'%d/%m/%Y'));
INSERT INTO assessment (ass_id, grade, date) VALUES (13013, 58, STR_TO_DATE("9/7/2021",'%d/%m/%Y'));
INSERT INTO assessment (ass_id, grade, date) VALUES (13014, 54, STR_TO_DATE("21/07/2021",'%d/%m/%Y'));
INSERT INTO assessment (ass_id, grade, date) VALUES (13015, 89, STR_TO_DATE("4/8/2021",'%d/%m/%Y'));
INSERT INTO assessment (ass_id, grade, date) VALUES (13016, 42, STR_TO_DATE("29/08/2021",'%d/%m/%Y'));
INSERT INTO assessment (ass_id, grade, date) VALUES (13017, 95, STR_TO_DATE("10/10/2021",'%d/%m/%Y'));
INSERT INTO assessment (ass_id, grade, date) VALUES (13018, 92, STR_TO_DATE("23/01/2022",'%d/%m/%Y'));
INSERT INTO assessment (ass_id, grade, date) VALUES (13019, 88, STR_TO_DATE("11/4/2022",'%d/%m/%Y'));
INSERT INTO assessment (ass_id, grade, date) VALUES (13020, 78, STR_TO_DATE("6/5/2022",'%d/%m/%Y'));
INSERT INTO assessment (ass_id, grade, date) VALUES (13021, 98, STR_TO_DATE("19/05/2022",'%d/%m/%Y'));
INSERT INTO assessment (ass_id, grade, date) VALUES (13022, 77, STR_TO_DATE("6/6/2022",'%d/%m/%Y'));
INSERT INTO assessment (ass_id, grade, date) VALUES (13023, 71, STR_TO_DATE("18/08/2022",'%d/%m/%Y'));
INSERT INTO assessment (ass_id, grade, date) VALUES (13024, 87, STR_TO_DATE("27/08/2022",'%d/%m/%Y'));
INSERT INTO assessment (ass_id, grade, date) VALUES (13025, 53, STR_TO_DATE("1/10/2022",'%d/%m/%Y'));
INSERT INTO assessment (ass_id, grade, date) VALUES (13026, 65, STR_TO_DATE("5/8/2018",'%d/%m/%Y'));
INSERT INTO assessment (ass_id, grade, date) VALUES (13027, 75, STR_TO_DATE("20/09/2018",'%d/%m/%Y'));
INSERT INTO assessment (ass_id, grade, date) VALUES (13028, 69, STR_TO_DATE("16/11/2018",'%d/%m/%Y'));
INSERT INTO assessment (ass_id, grade, date) VALUES (13029, 59, STR_TO_DATE("16/12/2018",'%d/%m/%Y'));
INSERT INTO assessment (ass_id, grade, date) VALUES (13030, 51, STR_TO_DATE("30/12/2018",'%d/%m/%Y'));
INSERT INTO assessment (ass_id, grade, date) VALUES (13031, 51, STR_TO_DATE("10/3/2019",'%d/%m/%Y'));
INSERT INTO assessment (ass_id, grade, date) VALUES (13032, 50, STR_TO_DATE("19/05/2019",'%d/%m/%Y'));
INSERT INTO assessment (ass_id, grade, date) VALUES (13033, 69, STR_TO_DATE("4/8/2019",'%d/%m/%Y'));
INSERT INTO assessment (ass_id, grade, date) VALUES (13034, 92, STR_TO_DATE("12/1/2020",'%d/%m/%Y'));
INSERT INTO assessment (ass_id, grade, date) VALUES (13035, 91, STR_TO_DATE("11/3/2020",'%d/%m/%Y'));
INSERT INTO assessment (ass_id, grade, date) VALUES (13036, 41, STR_TO_DATE("2/8/2020",'%d/%m/%Y'));
INSERT INTO assessment (ass_id, grade, date) VALUES (13037, 48, STR_TO_DATE("18/06/2021",'%d/%m/%Y'));
INSERT INTO assessment (ass_id, grade, date) VALUES (13038, 73, STR_TO_DATE("11/7/2021",'%d/%m/%Y'));
INSERT INTO assessment (ass_id, grade, date) VALUES (13039, 94, STR_TO_DATE("13/01/2022",'%d/%m/%Y'));
INSERT INTO assessment (ass_id, grade, date) VALUES (13040, 79, STR_TO_DATE("19/02/2022",'%d/%m/%Y'));
INSERT INTO assessment (ass_id, grade, date) VALUES (13041, 52, STR_TO_DATE("18/03/2022",'%d/%m/%Y'));
INSERT INTO assessment (ass_id, grade, date) VALUES (13042, 96, STR_TO_DATE("19/04/2022",'%d/%m/%Y'));
INSERT INTO assessment (ass_id, grade, date) VALUES (13043, 78, STR_TO_DATE("22/04/2022",'%d/%m/%Y'));
INSERT INTO assessment (ass_id, grade, date) VALUES (13044, 93, STR_TO_DATE("18/06/2022",'%d/%m/%Y'));
INSERT INTO assessment (ass_id, grade, date) VALUES (13045, 87, STR_TO_DATE("23/06/2022",'%d/%m/%Y'));
INSERT INTO assessment (ass_id, grade, date) VALUES (13046, 94, STR_TO_DATE("5/7/2022",'%d/%m/%Y'));
INSERT INTO assessment (ass_id, grade, date) VALUES (13047, 71, STR_TO_DATE("11/7/2022",'%d/%m/%Y'));
INSERT INTO assessment (ass_id, grade, date) VALUES (13048, 73, STR_TO_DATE("12/8/2022",'%d/%m/%Y'));
INSERT INTO assessment (ass_id, grade, date) VALUES (13049, 40, STR_TO_DATE("26/08/2022",'%d/%m/%Y'));
INSERT INTO assessment (ass_id, grade, date) VALUES (13050, 91, STR_TO_DATE("26/09/2022",'%d/%m/%Y'));

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
    REFERENCES institution (ins_id) ON DELETE RESTRICT ON UPDATE CASCADE
)ENGINE=InnoDB AUTO_INCREMENT=310001 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

INSERT INTO researcher (res_id, ins_id, first_name, last_name, sex, date_of_birth, res_ins_date) VALUES (310001, 78001, "Ann-Marie", "Ruiz", "F", STR_TO_DATE("19/04/1965",'%d/%m/%Y'), STR_TO_DATE("30/07/2000",'%d/%m/%Y'));
INSERT INTO researcher (res_id, ins_id, first_name, last_name, sex, date_of_birth, res_ins_date) VALUES (310002, 78002, "Jane", "Wheatley", "F", STR_TO_DATE("9/11/1968",'%d/%m/%Y'), STR_TO_DATE("12/1/1996",'%d/%m/%Y'));
INSERT INTO researcher (res_id, ins_id, first_name, last_name, sex, date_of_birth, res_ins_date) VALUES (310003, 78003, "Marjorie", "Browne", "F", STR_TO_DATE("27/07/1972",'%d/%m/%Y'), STR_TO_DATE("10/12/2004",'%d/%m/%Y'));
INSERT INTO researcher (res_id, ins_id, first_name, last_name, sex, date_of_birth, res_ins_date) VALUES (310004, 78004, "Sheena", "Hamer", "F", STR_TO_DATE("17/08/1983",'%d/%m/%Y'), STR_TO_DATE("15/03/2008",'%d/%m/%Y'));
INSERT INTO researcher (res_id, ins_id, first_name, last_name, sex, date_of_birth, res_ins_date) VALUES (310005, 78005, "Bradley", "Blevins", "M", STR_TO_DATE("28/07/1991",'%d/%m/%Y'), STR_TO_DATE("14/07/2013",'%d/%m/%Y'));
INSERT INTO researcher (res_id, ins_id, first_name, last_name, sex, date_of_birth, res_ins_date) VALUES (310006, 78006, "Kier", "Mueller", "M", STR_TO_DATE("29/06/1955",'%d/%m/%Y'), STR_TO_DATE("4/9/1987",'%d/%m/%Y'));
INSERT INTO researcher (res_id, ins_id, first_name, last_name, sex, date_of_birth, res_ins_date) VALUES (310007, 78007, "Maisy", "Andrews", "F", STR_TO_DATE("25/07/1959",'%d/%m/%Y'), STR_TO_DATE("9/12/1992",'%d/%m/%Y'));
INSERT INTO researcher (res_id, ins_id, first_name, last_name, sex, date_of_birth, res_ins_date) VALUES (310008, 78008, "Ida", "Lister", "F", STR_TO_DATE("14/02/1966",'%d/%m/%Y'), STR_TO_DATE("18/06/1985",'%d/%m/%Y'));
INSERT INTO researcher (res_id, ins_id, first_name, last_name, sex, date_of_birth, res_ins_date) VALUES (310009, 78009, "Ingrid", "Holding", "F", STR_TO_DATE("19/08/1970",'%d/%m/%Y'), STR_TO_DATE("29/01/2003",'%d/%m/%Y'));
INSERT INTO researcher (res_id, ins_id, first_name, last_name, sex, date_of_birth, res_ins_date) VALUES (310010, 78010, "Pierre", "Valenzuela", "M", STR_TO_DATE("10/2/1989",'%d/%m/%Y'), STR_TO_DATE("5/6/2014",'%d/%m/%Y'));
INSERT INTO researcher (res_id, ins_id, first_name, last_name, sex, date_of_birth, res_ins_date) VALUES (310011, 78011, "Charles", "Blackwell", "M", STR_TO_DATE("27/10/1968",'%d/%m/%Y'), STR_TO_DATE("9/11/1983",'%d/%m/%Y'));
INSERT INTO researcher (res_id, ins_id, first_name, last_name, sex, date_of_birth, res_ins_date) VALUES (310012, 78012, "Arham", "Thompson", "M", STR_TO_DATE("29/06/1969",'%d/%m/%Y'), STR_TO_DATE("14/08/1998",'%d/%m/%Y'));
INSERT INTO researcher (res_id, ins_id, first_name, last_name, sex, date_of_birth, res_ins_date) VALUES (310013, 78013, "Eddie", "Cresswell", "M", STR_TO_DATE("18/02/1973",'%d/%m/%Y'), STR_TO_DATE("19/11/1997",'%d/%m/%Y'));
INSERT INTO researcher (res_id, ins_id, first_name, last_name, sex, date_of_birth, res_ins_date) VALUES (310014, 78014, "Tayyib", "Clifford", "M", STR_TO_DATE("25/12/1977",'%d/%m/%Y'), STR_TO_DATE("15/09/2003",'%d/%m/%Y'));
INSERT INTO researcher (res_id, ins_id, first_name, last_name, sex, date_of_birth, res_ins_date) VALUES (310015, 78015, "Spike", "Ellison", "M", STR_TO_DATE("11/2/1980",'%d/%m/%Y'), STR_TO_DATE("28/01/2007",'%d/%m/%Y'));
INSERT INTO researcher (res_id, ins_id, first_name, last_name, sex, date_of_birth, res_ins_date) VALUES (310016, 78016, "Leja", "Decker", "F", STR_TO_DATE("21/07/1960",'%d/%m/%Y'), STR_TO_DATE("31/07/1994",'%d/%m/%Y'));
INSERT INTO researcher (res_id, ins_id, first_name, last_name, sex, date_of_birth, res_ins_date) VALUES (310017, 78017, "Keiron", "Gardner", "M", STR_TO_DATE("27/02/1967",'%d/%m/%Y'), STR_TO_DATE("21/05/2001",'%d/%m/%Y'));
INSERT INTO researcher (res_id, ins_id, first_name, last_name, sex, date_of_birth, res_ins_date) VALUES (310018, 78018, "Hadassah", "Maxwell", "F", STR_TO_DATE("31/10/1967",'%d/%m/%Y'), STR_TO_DATE("8/12/2003",'%d/%m/%Y'));
INSERT INTO researcher (res_id, ins_id, first_name, last_name, sex, date_of_birth, res_ins_date) VALUES (310019, 78019, "Ritchie", "Hatfield", "M", STR_TO_DATE("28/04/1975",'%d/%m/%Y'), STR_TO_DATE("16/09/2009",'%d/%m/%Y'));
INSERT INTO researcher (res_id, ins_id, first_name, last_name, sex, date_of_birth, res_ins_date) VALUES (310020, 78020, "Manraj", "Farrell", "M", STR_TO_DATE("27/08/1978",'%d/%m/%Y'), STR_TO_DATE("25/09/2007",'%d/%m/%Y'));
INSERT INTO researcher (res_id, ins_id, first_name, last_name, sex, date_of_birth, res_ins_date) VALUES (310021, 78021, "Bree", "Blackmore", "F", STR_TO_DATE("6/6/1964",'%d/%m/%Y'), STR_TO_DATE("16/03/1995",'%d/%m/%Y'));
INSERT INTO researcher (res_id, ins_id, first_name, last_name, sex, date_of_birth, res_ins_date) VALUES (310022, 78022, "Zavier", "Maynard", "M", STR_TO_DATE("21/07/1965",'%d/%m/%Y'), STR_TO_DATE("29/02/1996",'%d/%m/%Y'));
INSERT INTO researcher (res_id, ins_id, first_name, last_name, sex, date_of_birth, res_ins_date) VALUES (310023, 78023, "Libbi", "Forster", "F", STR_TO_DATE("8/9/1965",'%d/%m/%Y'), STR_TO_DATE("19/09/1998",'%d/%m/%Y'));
INSERT INTO researcher (res_id, ins_id, first_name, last_name, sex, date_of_birth, res_ins_date) VALUES (310024, 78024, "Emile", "Charlton", "M", STR_TO_DATE("5/5/1976",'%d/%m/%Y'), STR_TO_DATE("9/12/2005",'%d/%m/%Y'));
INSERT INTO researcher (res_id, ins_id, first_name, last_name, sex, date_of_birth, res_ins_date) VALUES (310025, 78025, "Susannah", "Daugherty", "F", STR_TO_DATE("6/5/1987",'%d/%m/%Y'), STR_TO_DATE("17/06/2011",'%d/%m/%Y'));
INSERT INTO researcher (res_id, ins_id, first_name, last_name, sex, date_of_birth, res_ins_date) VALUES (310026, 78026, "Keane", "Beaumont", "M", STR_TO_DATE("21/08/1978",'%d/%m/%Y'), STR_TO_DATE("26/04/2009",'%d/%m/%Y'));
INSERT INTO researcher (res_id, ins_id, first_name, last_name, sex, date_of_birth, res_ins_date) VALUES (310027, 78027, "Brennan", "Wheeler", "M", STR_TO_DATE("4/3/1980",'%d/%m/%Y'), STR_TO_DATE("9/6/2006",'%d/%m/%Y'));
INSERT INTO researcher (res_id, ins_id, first_name, last_name, sex, date_of_birth, res_ins_date) VALUES (310028, 78028, "Georgia", "Alford", "F", STR_TO_DATE("13/11/1981",'%d/%m/%Y'), STR_TO_DATE("1/9/2008",'%d/%m/%Y'));
INSERT INTO researcher (res_id, ins_id, first_name, last_name, sex, date_of_birth, res_ins_date) VALUES (310029, 78029, "Rikki", "Allen", "M", STR_TO_DATE("29/08/1990",'%d/%m/%Y'), STR_TO_DATE("9/6/2009",'%d/%m/%Y'));
INSERT INTO researcher (res_id, ins_id, first_name, last_name, sex, date_of_birth, res_ins_date) VALUES (310030, 78030, "Simrah", "Hewitt", "F", STR_TO_DATE("8/11/1978",'%d/%m/%Y'), STR_TO_DATE("18/07/2007",'%d/%m/%Y'));
INSERT INTO researcher (res_id, ins_id, first_name, last_name, sex, date_of_birth, res_ins_date) VALUES (310031, 78001, "Maira", "Vaughn", "F", STR_TO_DATE("29/03/1979",'%d/%m/%Y'), STR_TO_DATE("21/09/2011",'%d/%m/%Y'));
INSERT INTO researcher (res_id, ins_id, first_name, last_name, sex, date_of_birth, res_ins_date) VALUES (310032, 78002, "Joseph", "Yang", "M", STR_TO_DATE("9/8/1980",'%d/%m/%Y'), STR_TO_DATE("11/9/2013",'%d/%m/%Y'));
INSERT INTO researcher (res_id, ins_id, first_name, last_name, sex, date_of_birth, res_ins_date) VALUES (310033, 78003, "Tyler-James", "Zhang", "M", STR_TO_DATE("21/11/1961",'%d/%m/%Y'), STR_TO_DATE("16/08/1995",'%d/%m/%Y'));
INSERT INTO researcher (res_id, ins_id, first_name, last_name, sex, date_of_birth, res_ins_date) VALUES (310034, 78004, "Chad", "Watson", "M", STR_TO_DATE("7/9/1988",'%d/%m/%Y'), STR_TO_DATE("26/01/2018",'%d/%m/%Y'));
INSERT INTO researcher (res_id, ins_id, first_name, last_name, sex, date_of_birth, res_ins_date) VALUES (310035, 78005, "Harriett", "Whitley", "F", STR_TO_DATE("13/09/1984",'%d/%m/%Y'), STR_TO_DATE("20/11/2016",'%d/%m/%Y'));
INSERT INTO researcher (res_id, ins_id, first_name, last_name, sex, date_of_birth, res_ins_date) VALUES (310036, 78006, "Euan", "Figueroa", "M", STR_TO_DATE("4/4/1961",'%d/%m/%Y'), STR_TO_DATE("27/02/1989",'%d/%m/%Y'));
INSERT INTO researcher (res_id, ins_id, first_name, last_name, sex, date_of_birth, res_ins_date) VALUES (310037, 78007, "Yannis", "Walker", "M", STR_TO_DATE("20/01/1972",'%d/%m/%Y'), STR_TO_DATE("16/05/2000",'%d/%m/%Y'));
INSERT INTO researcher (res_id, ins_id, first_name, last_name, sex, date_of_birth, res_ins_date) VALUES (310038, 78008, "Cosmo", "Edge", "M", STR_TO_DATE("11/9/1972",'%d/%m/%Y'), STR_TO_DATE("21/09/2000",'%d/%m/%Y'));
INSERT INTO researcher (res_id, ins_id, first_name, last_name, sex, date_of_birth, res_ins_date) VALUES (310039, 78009, "Karishma", "Berger", "F", STR_TO_DATE("31/07/1979",'%d/%m/%Y'), STR_TO_DATE("16/09/2009",'%d/%m/%Y'));
INSERT INTO researcher (res_id, ins_id, first_name, last_name, sex, date_of_birth, res_ins_date) VALUES (310040, 78010, "Taybah", "Bishop", "F", STR_TO_DATE("8/9/1986",'%d/%m/%Y'), STR_TO_DATE("24/01/2014",'%d/%m/%Y'));
INSERT INTO researcher (res_id, ins_id, first_name, last_name, sex, date_of_birth, res_ins_date) VALUES (310041, 78011, "Skylar", "Hume", "F", STR_TO_DATE("15/06/1961",'%d/%m/%Y'), STR_TO_DATE("17/09/1990",'%d/%m/%Y'));
INSERT INTO researcher (res_id, ins_id, first_name, last_name, sex, date_of_birth, res_ins_date) VALUES (310042, 78012, "Donna", "Higgins", "F", STR_TO_DATE("30/03/1966",'%d/%m/%Y'), STR_TO_DATE("26/03/1995",'%d/%m/%Y'));
INSERT INTO researcher (res_id, ins_id, first_name, last_name, sex, date_of_birth, res_ins_date) VALUES (310043, 78013, "Fiza", "Oliver", "F", STR_TO_DATE("27/10/1975",'%d/%m/%Y'), STR_TO_DATE("25/04/2002",'%d/%m/%Y'));
INSERT INTO researcher (res_id, ins_id, first_name, last_name, sex, date_of_birth, res_ins_date) VALUES (310044, 78014, "Joy", "Craft", "M", STR_TO_DATE("23/08/1976",'%d/%m/%Y'), STR_TO_DATE("8/8/2004",'%d/%m/%Y'));
INSERT INTO researcher (res_id, ins_id, first_name, last_name, sex, date_of_birth, res_ins_date) VALUES (310045, 78015, "Kay", "Andrew", "M", STR_TO_DATE("7/1/1979",'%d/%m/%Y'), STR_TO_DATE("1/6/2007",'%d/%m/%Y'));
INSERT INTO researcher (res_id, ins_id, first_name, last_name, sex, date_of_birth, res_ins_date) VALUES (310046, 78016, "Akash", "Mckinney", "M", STR_TO_DATE("21/07/1959",'%d/%m/%Y'), STR_TO_DATE("6/9/1987",'%d/%m/%Y'));
INSERT INTO researcher (res_id, ins_id, first_name, last_name, sex, date_of_birth, res_ins_date) VALUES (310047, 78017, "Daphne", "Rosario", "F", STR_TO_DATE("24/03/1961",'%d/%m/%Y'), STR_TO_DATE("16/07/1991",'%d/%m/%Y'));
INSERT INTO researcher (res_id, ins_id, first_name, last_name, sex, date_of_birth, res_ins_date) VALUES (310048, 78018, "Rida", "Maddox", "F", STR_TO_DATE("29/05/1980",'%d/%m/%Y'), STR_TO_DATE("25/07/2006",'%d/%m/%Y'));
INSERT INTO researcher (res_id, ins_id, first_name, last_name, sex, date_of_birth, res_ins_date) VALUES (310049, 78019, "Pixie", "Hayes", "F", STR_TO_DATE("11/7/1982",'%d/%m/%Y'), STR_TO_DATE("29/06/2009",'%d/%m/%Y'));
INSERT INTO researcher (res_id, ins_id, first_name, last_name, sex, date_of_birth, res_ins_date) VALUES (310050, 78020, "Firat", "Cantrell", "M", STR_TO_DATE("26/03/1983",'%d/%m/%Y'), STR_TO_DATE("14/05/2010",'%d/%m/%Y'));
INSERT INTO researcher (res_id, ins_id, first_name, last_name, sex, date_of_birth, res_ins_date) VALUES (310051, 78021, "Lewis", "Patel", "M", STR_TO_DATE("2/1/1957",'%d/%m/%Y'), STR_TO_DATE("13/01/1980",'%d/%m/%Y'));
INSERT INTO researcher (res_id, ins_id, first_name, last_name, sex, date_of_birth, res_ins_date) VALUES (310052, 78022, "Phillippa", "Owen", "F", STR_TO_DATE("11/9/1970",'%d/%m/%Y'), STR_TO_DATE("26/02/1998",'%d/%m/%Y'));
INSERT INTO researcher (res_id, ins_id, first_name, last_name, sex, date_of_birth, res_ins_date) VALUES (310053, 78023, "Ryan", "Alaw", "M", STR_TO_DATE("28/01/1972",'%d/%m/%Y'), STR_TO_DATE("5/12/2000",'%d/%m/%Y'));
INSERT INTO researcher (res_id, ins_id, first_name, last_name, sex, date_of_birth, res_ins_date) VALUES (310054, 78024, "Osman", "Bowler", "M", STR_TO_DATE("21/12/1979",'%d/%m/%Y'), STR_TO_DATE("12/12/2009",'%d/%m/%Y'));
INSERT INTO researcher (res_id, ins_id, first_name, last_name, sex, date_of_birth, res_ins_date) VALUES (310055, 78025, "Derek", "Cousins", "M", STR_TO_DATE("8/4/1990",'%d/%m/%Y'), STR_TO_DATE("9/7/2006",'%d/%m/%Y'));
INSERT INTO researcher (res_id, ins_id, first_name, last_name, sex, date_of_birth, res_ins_date) VALUES (310056, 78026, "Addison", "Lane", "F", STR_TO_DATE("5/2/1957",'%d/%m/%Y'), STR_TO_DATE("6/12/1981",'%d/%m/%Y'));
INSERT INTO researcher (res_id, ins_id, first_name, last_name, sex, date_of_birth, res_ins_date) VALUES (310057, 78027, "Fateh", "Krause", "M", STR_TO_DATE("7/12/1957",'%d/%m/%Y'), STR_TO_DATE("8/10/1985",'%d/%m/%Y'));
INSERT INTO researcher (res_id, ins_id, first_name, last_name, sex, date_of_birth, res_ins_date) VALUES (310058, 78028, "Emanuel", "Long", "M", STR_TO_DATE("17/04/1959",'%d/%m/%Y'), STR_TO_DATE("18/11/1985",'%d/%m/%Y'));
INSERT INTO researcher (res_id, ins_id, first_name, last_name, sex, date_of_birth, res_ins_date) VALUES (310059, 78029, "Tyrone", "Hudson", "M", STR_TO_DATE("13/08/1960",'%d/%m/%Y'), STR_TO_DATE("12/4/1991",'%d/%m/%Y'));
INSERT INTO researcher (res_id, ins_id, first_name, last_name, sex, date_of_birth, res_ins_date) VALUES (310060, 78030, "Kade", "Finney", "F", STR_TO_DATE("20/12/1961",'%d/%m/%Y'), STR_TO_DATE("5/5/1987",'%d/%m/%Y'));
INSERT INTO researcher (res_id, ins_id, first_name, last_name, sex, date_of_birth, res_ins_date) VALUES (310061, 78001, "Ziva", "Hanson", "F", STR_TO_DATE("30/05/1967",'%d/%m/%Y'), STR_TO_DATE("1/10/2000",'%d/%m/%Y'));
INSERT INTO researcher (res_id, ins_id, first_name, last_name, sex, date_of_birth, res_ins_date) VALUES (310062, 78002, "Emily-Rose", "Mendez", "F", STR_TO_DATE("5/10/1968",'%d/%m/%Y'), STR_TO_DATE("15/09/2003",'%d/%m/%Y'));
INSERT INTO researcher (res_id, ins_id, first_name, last_name, sex, date_of_birth, res_ins_date) VALUES (310063, 78003, "Elsa", "Hagan", "F", STR_TO_DATE("2/5/1972",'%d/%m/%Y'), STR_TO_DATE("14/01/2000",'%d/%m/%Y'));
INSERT INTO researcher (res_id, ins_id, first_name, last_name, sex, date_of_birth, res_ins_date) VALUES (310064, 78004, "Lexi", "Hobbs", "F", STR_TO_DATE("1/7/1972",'%d/%m/%Y'), STR_TO_DATE("14/01/2000",'%d/%m/%Y'));
INSERT INTO researcher (res_id, ins_id, first_name, last_name, sex, date_of_birth, res_ins_date) VALUES (310065, 78005, "Haiden", "Stubbs", "M", STR_TO_DATE("15/04/1973",'%d/%m/%Y'), STR_TO_DATE("17/08/1998",'%d/%m/%Y'));
INSERT INTO researcher (res_id, ins_id, first_name, last_name, sex, date_of_birth, res_ins_date) VALUES (310066, 78006, "Wyatt", "Lucas", "M", STR_TO_DATE("23/04/1976",'%d/%m/%Y'), STR_TO_DATE("26/01/2003",'%d/%m/%Y'));
INSERT INTO researcher (res_id, ins_id, first_name, last_name, sex, date_of_birth, res_ins_date) VALUES (310067, 78007, "Kole", "Holman", "M", STR_TO_DATE("24/06/1979",'%d/%m/%Y'), STR_TO_DATE("28/02/2004",'%d/%m/%Y'));
INSERT INTO researcher (res_id, ins_id, first_name, last_name, sex, date_of_birth, res_ins_date) VALUES (310068, 78008, "Leonard", "O'Doherty", "M", STR_TO_DATE("27/10/1979",'%d/%m/%Y'), STR_TO_DATE("26/03/2011",'%d/%m/%Y'));
INSERT INTO researcher (res_id, ins_id, first_name, last_name, sex, date_of_birth, res_ins_date) VALUES (310069, 78009, "Dilan", "Puckett", "M", STR_TO_DATE("16/03/1980",'%d/%m/%Y'), STR_TO_DATE("31/03/2007",'%d/%m/%Y'));
INSERT INTO researcher (res_id, ins_id, first_name, last_name, sex, date_of_birth, res_ins_date) VALUES (310070, 78010, "Frederic", "Brown", "M", STR_TO_DATE("6/8/1982",'%d/%m/%Y'), STR_TO_DATE("19/07/2010",'%d/%m/%Y'));
INSERT INTO researcher (res_id, ins_id, first_name, last_name, sex, date_of_birth, res_ins_date) VALUES (310071, 78011, "Nathanael", "Christie", "M", STR_TO_DATE("31/07/1959",'%d/%m/%Y'), STR_TO_DATE("14/05/1987",'%d/%m/%Y'));
INSERT INTO researcher (res_id, ins_id, first_name, last_name, sex, date_of_birth, res_ins_date) VALUES (310072, 78012, "Louie", "Wallis", "M", STR_TO_DATE("1/9/1962",'%d/%m/%Y'), STR_TO_DATE("31/05/1989",'%d/%m/%Y'));
INSERT INTO researcher (res_id, ins_id, first_name, last_name, sex, date_of_birth, res_ins_date) VALUES (310073, 78013, "Angus", "Prince", "M", STR_TO_DATE("28/09/1963",'%d/%m/%Y'), STR_TO_DATE("14/06/1992",'%d/%m/%Y'));
INSERT INTO researcher (res_id, ins_id, first_name, last_name, sex, date_of_birth, res_ins_date) VALUES (310074, 78014, "Lyra", "Cohen", "F", STR_TO_DATE("10/12/1963",'%d/%m/%Y'), STR_TO_DATE("27/09/1992",'%d/%m/%Y'));
INSERT INTO researcher (res_id, ins_id, first_name, last_name, sex, date_of_birth, res_ins_date) VALUES (310075, 78015, "Ihsan", "Mullins", "M", STR_TO_DATE("11/3/1974",'%d/%m/%Y'), STR_TO_DATE("25/08/2000",'%d/%m/%Y'));
INSERT INTO researcher (res_id, ins_id, first_name, last_name, sex, date_of_birth, res_ins_date) VALUES (310076, 78016, "Walter", "White", "M", STR_TO_DATE("29/12/1978",'%d/%m/%Y'), STR_TO_DATE("29/11/2006",'%d/%m/%Y'));
INSERT INTO researcher (res_id, ins_id, first_name, last_name, sex, date_of_birth, res_ins_date) VALUES (310077, 78017, "Alix", "Gilbert", "M", STR_TO_DATE("7/7/1981",'%d/%m/%Y'), STR_TO_DATE("18/07/2010",'%d/%m/%Y'));
INSERT INTO researcher (res_id, ins_id, first_name, last_name, sex, date_of_birth, res_ins_date) VALUES (310078, 78018, "Alice", "Rivera", "F", STR_TO_DATE("30/05/1983",'%d/%m/%Y'), STR_TO_DATE("9/12/2017",'%d/%m/%Y'));
INSERT INTO researcher (res_id, ins_id, first_name, last_name, sex, date_of_birth, res_ins_date) VALUES (310079, 78019, "Kristian", "Lyon", "M", STR_TO_DATE("24/02/1985",'%d/%m/%Y'), STR_TO_DATE("26/07/2005",'%d/%m/%Y'));
INSERT INTO researcher (res_id, ins_id, first_name, last_name, sex, date_of_birth, res_ins_date) VALUES (310080, 78020, "Jesse", "Pinkman", "M", STR_TO_DATE("26/04/1985",'%d/%m/%Y'), STR_TO_DATE("14/03/2006",'%d/%m/%Y'));
INSERT INTO researcher (res_id, ins_id, first_name, last_name, sex, date_of_birth, res_ins_date) VALUES (310081, 78021, "Saul", "Goodman", "M", STR_TO_DATE("2/8/1986",'%d/%m/%Y'), STR_TO_DATE("18/09/2008",'%d/%m/%Y'));
INSERT INTO researcher (res_id, ins_id, first_name, last_name, sex, date_of_birth, res_ins_date) VALUES (310082, 78022, "Maximilian", "Broadhurst", "M", STR_TO_DATE("20/01/1988",'%d/%m/%Y'), STR_TO_DATE("13/09/2015",'%d/%m/%Y'));
INSERT INTO researcher (res_id, ins_id, first_name, last_name, sex, date_of_birth, res_ins_date) VALUES (310083, 78023, "Damon", "Thorpe", "M", STR_TO_DATE("9/9/1989",'%d/%m/%Y'), STR_TO_DATE("11/11/2016",'%d/%m/%Y'));
INSERT INTO researcher (res_id, ins_id, first_name, last_name, sex, date_of_birth, res_ins_date) VALUES (310084, 78024, "Stefanie", "Mayo", "F", STR_TO_DATE("21/05/1990",'%d/%m/%Y'), STR_TO_DATE("18/04/2019",'%d/%m/%Y'));
INSERT INTO researcher (res_id, ins_id, first_name, last_name, sex, date_of_birth, res_ins_date) VALUES (310085, 78025, "Natasha", "Potts", "F", STR_TO_DATE("13/08/1990",'%d/%m/%Y'), STR_TO_DATE("19/04/2019",'%d/%m/%Y'));
INSERT INTO researcher (res_id, ins_id, first_name, last_name, sex, date_of_birth, res_ins_date) VALUES (310086, 78026, "Darcy", "Cooley", "F", STR_TO_DATE("30/12/1956",'%d/%m/%Y'), STR_TO_DATE("13/06/1982",'%d/%m/%Y'));
INSERT INTO researcher (res_id, ins_id, first_name, last_name, sex, date_of_birth, res_ins_date) VALUES (310087, 78027, "Imaani", "Patterson", "F", STR_TO_DATE("17/02/1960",'%d/%m/%Y'), STR_TO_DATE("14/07/1997",'%d/%m/%Y'));
INSERT INTO researcher (res_id, ins_id, first_name, last_name, sex, date_of_birth, res_ins_date) VALUES (310088, 78028, "Bernice", "Haines", "F", STR_TO_DATE("28/02/1960",'%d/%m/%Y'), STR_TO_DATE("24/01/1986",'%d/%m/%Y'));
INSERT INTO researcher (res_id, ins_id, first_name, last_name, sex, date_of_birth, res_ins_date) VALUES (310089, 78029, "Tomasz", "Wong", "M", STR_TO_DATE("16/04/1962",'%d/%m/%Y'), STR_TO_DATE("12/11/1989",'%d/%m/%Y'));
INSERT INTO researcher (res_id, ins_id, first_name, last_name, sex, date_of_birth, res_ins_date) VALUES (310090, 78030, "Nabila", "Hutton", "F", STR_TO_DATE("21/06/1962",'%d/%m/%Y'), STR_TO_DATE("5/5/1989",'%d/%m/%Y'));
INSERT INTO researcher (res_id, ins_id, first_name, last_name, sex, date_of_birth, res_ins_date) VALUES (310091, 78001, "Gianluca", "Clegg", "M", STR_TO_DATE("21/02/1967",'%d/%m/%Y'), STR_TO_DATE("24/07/1985",'%d/%m/%Y'));
INSERT INTO researcher (res_id, ins_id, first_name, last_name, sex, date_of_birth, res_ins_date) VALUES (310092, 78002, "Bhavik", "Carrillo", "M", STR_TO_DATE("11/6/1967",'%d/%m/%Y'), STR_TO_DATE("19/03/1985",'%d/%m/%Y'));
INSERT INTO researcher (res_id, ins_id, first_name, last_name, sex, date_of_birth, res_ins_date) VALUES (310093, 78003, "Abida", "Joyce", "F", STR_TO_DATE("6/4/1969",'%d/%m/%Y'), STR_TO_DATE("16/01/1993",'%d/%m/%Y'));
INSERT INTO researcher (res_id, ins_id, first_name, last_name, sex, date_of_birth, res_ins_date) VALUES (310094, 78004, "Barney", "Frazier", "M", STR_TO_DATE("14/07/1970",'%d/%m/%Y'), STR_TO_DATE("12/4/2000",'%d/%m/%Y'));
INSERT INTO researcher (res_id, ins_id, first_name, last_name, sex, date_of_birth, res_ins_date) VALUES (310095, 78005, "Laibah", "Dale", "F", STR_TO_DATE("8/3/1979",'%d/%m/%Y'), STR_TO_DATE("25/10/2009",'%d/%m/%Y'));
INSERT INTO researcher (res_id, ins_id, first_name, last_name, sex, date_of_birth, res_ins_date) VALUES (310096, 78006, "Eve", "Shah", "F", STR_TO_DATE("24/04/1979",'%d/%m/%Y'), STR_TO_DATE("15/06/2010",'%d/%m/%Y'));
INSERT INTO researcher (res_id, ins_id, first_name, last_name, sex, date_of_birth, res_ins_date) VALUES (310097, 78007, "Vivian", "Conner", "F", STR_TO_DATE("1/7/1982",'%d/%m/%Y'), STR_TO_DATE("18/03/2005",'%d/%m/%Y'));
INSERT INTO researcher (res_id, ins_id, first_name, last_name, sex, date_of_birth, res_ins_date) VALUES (310098, 78008, "Jeanne", "Dennis", "F", STR_TO_DATE("4/8/1983",'%d/%m/%Y'), STR_TO_DATE("14/12/2007",'%d/%m/%Y'));
INSERT INTO researcher (res_id, ins_id, first_name, last_name, sex, date_of_birth, res_ins_date) VALUES (310099, 78009, "Dillon", "Merritt", "M", STR_TO_DATE("21/08/1990",'%d/%m/%Y'), STR_TO_DATE("9/4/2014",'%d/%m/%Y'));
INSERT INTO researcher (res_id, ins_id, first_name, last_name, sex, date_of_birth, res_ins_date) VALUES (310100, 78010, "Andre", "Briggs", "M", STR_TO_DATE("21/07/1991",'%d/%m/%Y'), STR_TO_DATE("31/08/2012",'%d/%m/%Y'));

DROP TABLE IF EXISTS project;
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
)ENGINE=InnoDB AUTO_INCREMENT=45001 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

INSERT INTO project (proj_id, ins_id, prog_id, ex_id, ass_id, ass_res_id, sup_res_id, title, description, start, end, fund) VALUES (45001, 78001, 23001, 11001, 13001, 310002, 310001, "Proj1", "Proj1", STR_TO_DATE("4/2/2019",'%d/%m/%Y'), STR_TO_DATE("4/2/2022",'%d/%m/%Y'), "100000");
INSERT INTO project (proj_id, ins_id, prog_id, ex_id, ass_id, ass_res_id, sup_res_id, title, description, start, end, fund) VALUES (45002, 78002, 23002, 11002, 13002, 310003, 310002, "Proj2", "Proj2", STR_TO_DATE("20/02/2019",'%d/%m/%Y'), STR_TO_DATE("20/2/2021",'%d/%m/%Y'), "150000");
INSERT INTO project (proj_id, ins_id, prog_id, ex_id, ass_id, ass_res_id, sup_res_id, title, description, start, end, fund) VALUES (45003, 78003, 23003, 11003, 13003, 310004, 310003, "Proj3", "Proj3", STR_TO_DATE("13/03/2019",'%d/%m/%Y'), STR_TO_DATE("13/3/2023",'%d/%m/%Y'), "130000");
INSERT INTO project (proj_id, ins_id, prog_id, ex_id, ass_id, ass_res_id, sup_res_id, title, description, start, end, fund) VALUES (45004, 78004, 23004, 11004, 13004, 310005, 310004, "Proj4", "Proj4", STR_TO_DATE("30/05/2019",'%d/%m/%Y'), STR_TO_DATE("30/05/2022",'%d/%m/%Y'), "200000");
INSERT INTO project (proj_id, ins_id, prog_id, ex_id, ass_id, ass_res_id, sup_res_id, title, description, start, end, fund) VALUES (45005, 78005, 23005, 11005, 13005, 310006, 310005, "Proj5", "Proj5", STR_TO_DATE("28/08/2019",'%d/%m/%Y'), STR_TO_DATE("28/08/2021",'%d/%m/%Y'), "80000");
INSERT INTO project (proj_id, ins_id, prog_id, ex_id, ass_id, ass_res_id, sup_res_id, title, description, start, end, fund) VALUES (45006, 78006, 23006, 11006, 13006, 310007, 310006, "Proj6", "Proj6", STR_TO_DATE("1/2/2020",'%d/%m/%Y'), STR_TO_DATE("1/2/2021",'%d/%m/%Y'), "100000");
INSERT INTO project (proj_id, ins_id, prog_id, ex_id, ass_id, ass_res_id, sup_res_id, title, description, start, end, fund) VALUES (45007, 78007, 23007, 11007, 13007, 310008, 310007, "Proj7", "Proj7", STR_TO_DATE("30/06/2020",'%d/%m/%Y'), STR_TO_DATE("30/06/2023",'%d/%m/%Y'), "110000");
INSERT INTO project (proj_id, ins_id, prog_id, ex_id, ass_id, ass_res_id, sup_res_id, title, description, start, end, fund) VALUES (45008, 78008, 23008, 11008, 13008, 310009, 310008, "Proj8", "Proj8", STR_TO_DATE("23/08/2020",'%d/%m/%Y'), STR_TO_DATE("23/08/2024",'%d/%m/%Y'), "115000");
INSERT INTO project (proj_id, ins_id, prog_id, ex_id, ass_id, ass_res_id, sup_res_id, title, description, start, end, fund) VALUES (45009, 78009, 23009, 11009, 13009, 310010, 310009, "Proj9", "Proj9", STR_TO_DATE("22/09/2020",'%d/%m/%Y'), STR_TO_DATE("22/09/2023",'%d/%m/%Y'), "140000");
INSERT INTO project (proj_id, ins_id, prog_id, ex_id, ass_id, ass_res_id, sup_res_id, title, description, start, end, fund) VALUES (45010, 78010, 23010, 11010, 13010, 310011, 310010, "Proj10", "Proj10", STR_TO_DATE("6/10/2020",'%d/%m/%Y'), STR_TO_DATE("6/10/2022",'%d/%m/%Y'), "230000");
INSERT INTO project (proj_id, ins_id, prog_id, ex_id, ass_id, ass_res_id, sup_res_id, title, description, start, end, fund) VALUES (45011, 78011, 23011, 11011, 13011, 310012, 310011, "Proj11", "Proj11", STR_TO_DATE("15/06/2021",'%d/%m/%Y'), STR_TO_DATE("15/06/2022",'%d/%m/%Y'), "300000");
INSERT INTO project (proj_id, ins_id, prog_id, ex_id, ass_id, ass_res_id, sup_res_id, title, description, start, end, fund) VALUES (45012, 78012, 23012, 11012, 13012, 310013, 310012, "Proj12", "Proj12", STR_TO_DATE("6/7/2021",'%d/%m/%Y'), STR_TO_DATE("6/7/2023",'%d/%m/%Y'), "10000");
INSERT INTO project (proj_id, ins_id, prog_id, ex_id, ass_id, ass_res_id, sup_res_id, title, description, start, end, fund) VALUES (45013, 78013, 23013, 11013, 13013, 310014, 310013, "Proj13", "Proj13", STR_TO_DATE("9/7/2021",'%d/%m/%Y'), STR_TO_DATE("9/7/2024",'%d/%m/%Y'), "60000");
INSERT INTO project (proj_id, ins_id, prog_id, ex_id, ass_id, ass_res_id, sup_res_id, title, description, start, end, fund) VALUES (45014, 78014, 23014, 11014, 13014, 310015, 310014, "Proj14", "Proj14", STR_TO_DATE("21/07/2021",'%d/%m/%Y'), STR_TO_DATE("21/07/2025",'%d/%m/%Y'), "65000");
INSERT INTO project (proj_id, ins_id, prog_id, ex_id, ass_id, ass_res_id, sup_res_id, title, description, start, end, fund) VALUES (45015, 78015, 23015, 11015, 13015, 310016, 310015, "Proj15", "Proj15", STR_TO_DATE("4/8/2021",'%d/%m/%Y'), STR_TO_DATE("4/8/2022",'%d/%m/%Y'), "72000");
INSERT INTO project (proj_id, ins_id, prog_id, ex_id, ass_id, ass_res_id, sup_res_id, title, description, start, end, fund) VALUES (45016, 78016, 23016, 11016, 13016, 310017, 310016, "Proj16", "Proj16", STR_TO_DATE("29/08/2021",'%d/%m/%Y'), STR_TO_DATE("29/08/2023",'%d/%m/%Y'), "87000");
INSERT INTO project (proj_id, ins_id, prog_id, ex_id, ass_id, ass_res_id, sup_res_id, title, description, start, end, fund) VALUES (45017, 78017, 23017, 11017, 13017, 310018, 310017, "Proj17", "Proj17", STR_TO_DATE("10/10/2021",'%d/%m/%Y'), STR_TO_DATE("10/10/2024",'%d/%m/%Y'), "91000");
INSERT INTO project (proj_id, ins_id, prog_id, ex_id, ass_id, ass_res_id, sup_res_id, title, description, start, end, fund) VALUES (45018, 78018, 23018, 11018, 13018, 310019, 310018, "Proj18", "Proj18", STR_TO_DATE("23/01/2022",'%d/%m/%Y'), STR_TO_DATE("23/01/2026",'%d/%m/%Y'), "93000");
INSERT INTO project (proj_id, ins_id, prog_id, ex_id, ass_id, ass_res_id, sup_res_id, title, description, start, end, fund) VALUES (45019, 78019, 23019, 11019, 13019, 310020, 310019, "Proj19", "Proj19", STR_TO_DATE("11/4/2022",'%d/%m/%Y'), STR_TO_DATE("11/4/2023",'%d/%m/%Y'), "98000");
INSERT INTO project (proj_id, ins_id, prog_id, ex_id, ass_id, ass_res_id, sup_res_id, title, description, start, end, fund) VALUES (45020, 78020, 23020, 11020, 13020, 310021, 310020, "Proj20", "Proj20", STR_TO_DATE("6/5/2022",'%d/%m/%Y'), STR_TO_DATE("6/5/2024",'%d/%m/%Y'), "100000");
INSERT INTO project (proj_id, ins_id, prog_id, ex_id, ass_id, ass_res_id, sup_res_id, title, description, start, end, fund) VALUES (45021, 78021, 23021, 11001, 13021, 310022, 310021, "Proj21", "Proj21", STR_TO_DATE("19/05/2022",'%d/%m/%Y'), STR_TO_DATE("19/05/2025",'%d/%m/%Y'), "120000");
INSERT INTO project (proj_id, ins_id, prog_id, ex_id, ass_id, ass_res_id, sup_res_id, title, description, start, end, fund) VALUES (45022, 78022, 23022, 11002, 13022, 310023, 310022, "Proj22", "Proj22", STR_TO_DATE("6/6/2022",'%d/%m/%Y'), STR_TO_DATE("6/6/2026",'%d/%m/%Y'), "67000");
INSERT INTO project (proj_id, ins_id, prog_id, ex_id, ass_id, ass_res_id, sup_res_id, title, description, start, end, fund) VALUES (45023, 78023, 23023, 11003, 13023, 310024, 310023, "Proj23", "Proj23", STR_TO_DATE("18/08/2022",'%d/%m/%Y'), STR_TO_DATE("18/08/2023",'%d/%m/%Y'), "170000");
INSERT INTO project (proj_id, ins_id, prog_id, ex_id, ass_id, ass_res_id, sup_res_id, title, description, start, end, fund) VALUES (45024, 78024, 23024, 11004, 13024, 310025, 310024, "Proj24", "Proj24", STR_TO_DATE("27/08/2022",'%d/%m/%Y'), STR_TO_DATE("27/08/2024",'%d/%m/%Y'), "40000");
INSERT INTO project (proj_id, ins_id, prog_id, ex_id, ass_id, ass_res_id, sup_res_id, title, description, start, end, fund) VALUES (45025, 78025, 23025, 11005, 13025, 310026, 310025, "Proj25", "Proj25", STR_TO_DATE("1/10/2022",'%d/%m/%Y'), STR_TO_DATE("1/10/2025",'%d/%m/%Y'), "23000");
INSERT INTO project (proj_id, ins_id, prog_id, ex_id, ass_id, ass_res_id, sup_res_id, title, description, start, end, fund) VALUES (45026, 78026, 23026, 11006, 13026, 310027, 310026, "Proj26", "Proj26", STR_TO_DATE("5/8/2018",'%d/%m/%Y'), STR_TO_DATE("5/8/2022",'%d/%m/%Y'), "41000");
INSERT INTO project (proj_id, ins_id, prog_id, ex_id, ass_id, ass_res_id, sup_res_id, title, description, start, end, fund) VALUES (45027, 78027, 23027, 11007, 13027, 310028, 310027, "Proj27", "Proj27", STR_TO_DATE("20/09/2018",'%d/%m/%Y'), STR_TO_DATE("20/09/2019",'%d/%m/%Y'), "75000");
INSERT INTO project (proj_id, ins_id, prog_id, ex_id, ass_id, ass_res_id, sup_res_id, title, description, start, end, fund) VALUES (45028, 78028, 23028, 11008, 13028, 310029, 310028, "Proj28", "Proj28", STR_TO_DATE("16/11/2018",'%d/%m/%Y'), STR_TO_DATE("16/11/2020",'%d/%m/%Y'), "28000");
INSERT INTO project (proj_id, ins_id, prog_id, ex_id, ass_id, ass_res_id, sup_res_id, title, description, start, end, fund) VALUES (45029, 78029, 23029, 11009, 13029, 310030, 310029, "Proj29", "Proj29", STR_TO_DATE("16/12/2018",'%d/%m/%Y'), STR_TO_DATE("16/12/2021",'%d/%m/%Y'), "45000");
INSERT INTO project (proj_id, ins_id, prog_id, ex_id, ass_id, ass_res_id, sup_res_id, title, description, start, end, fund) VALUES (45030, 78030, 23030, 11010, 13030, 310031, 310030, "Proj30", "Proj30", STR_TO_DATE("30/12/2018",'%d/%m/%Y'), STR_TO_DATE("30/12/2022",'%d/%m/%Y'), "54000");
INSERT INTO project (proj_id, ins_id, prog_id, ex_id, ass_id, ass_res_id, sup_res_id, title, description, start, end, fund) VALUES (45031, 78001, 23001, 11011, 13031, 310032, 310031, "Proj31", "Proj31", STR_TO_DATE("10/3/2019",'%d/%m/%Y'), STR_TO_DATE("10/3/2020",'%d/%m/%Y'), "110000");
INSERT INTO project (proj_id, ins_id, prog_id, ex_id, ass_id, ass_res_id, sup_res_id, title, description, start, end, fund) VALUES (45032, 78002, 23002, 11012, 13032, 310033, 310032, "Proj32", "Proj32", STR_TO_DATE("19/05/2019",'%d/%m/%Y'), STR_TO_DATE("19/05/2021",'%d/%m/%Y'), "61000");
INSERT INTO project (proj_id, ins_id, prog_id, ex_id, ass_id, ass_res_id, sup_res_id, title, description, start, end, fund) VALUES (45033, 78003, 23003, 11013, 13033, 310034, 310033, "Proj33", "Proj33", STR_TO_DATE("4/8/2019",'%d/%m/%Y'), STR_TO_DATE("4/8/2022",'%d/%m/%Y'), "90000");
INSERT INTO project (proj_id, ins_id, prog_id, ex_id, ass_id, ass_res_id, sup_res_id, title, description, start, end, fund) VALUES (45034, 78004, 23004, 11014, 13034, 310035, 310034, "Proj34", "Proj34", STR_TO_DATE("12/1/2020",'%d/%m/%Y'), STR_TO_DATE("12/1/2024",'%d/%m/%Y'), "130000");
INSERT INTO project (proj_id, ins_id, prog_id, ex_id, ass_id, ass_res_id, sup_res_id, title, description, start, end, fund) VALUES (45035, 78005, 23005, 11015, 13035, 310036, 310035, "Proj35", "Proj35", STR_TO_DATE("11/3/2020",'%d/%m/%Y'), STR_TO_DATE("11/3/2021",'%d/%m/%Y'), "72000");
INSERT INTO project (proj_id, ins_id, prog_id, ex_id, ass_id, ass_res_id, sup_res_id, title, description, start, end, fund) VALUES (45036, 78006, 23006, 11016, 13036, 310037, 310036, "Proj36", "Proj36", STR_TO_DATE("2/8/2020",'%d/%m/%Y'), STR_TO_DATE("2/8/2022",'%d/%m/%Y'), "96000");
INSERT INTO project (proj_id, ins_id, prog_id, ex_id, ass_id, ass_res_id, sup_res_id, title, description, start, end, fund) VALUES (45037, 78007, 23007, 11017, 13037, 310038, 310037, "Proj37", "Proj37", STR_TO_DATE("18/06/2021",'%d/%m/%Y'), STR_TO_DATE("18/06/2024",'%d/%m/%Y'), "60000");
INSERT INTO project (proj_id, ins_id, prog_id, ex_id, ass_id, ass_res_id, sup_res_id, title, description, start, end, fund) VALUES (45038, 78008, 23008, 11018, 13038, 310039, 310038, "Proj38", "Proj38", STR_TO_DATE("11/7/2021",'%d/%m/%Y'), STR_TO_DATE("11/7/2025",'%d/%m/%Y'), "14000");
INSERT INTO project (proj_id, ins_id, prog_id, ex_id, ass_id, ass_res_id, sup_res_id, title, description, start, end, fund) VALUES (45039, 78009, 23009, 11019, 13039, 310040, 310039, "Proj39", "Proj39", STR_TO_DATE("13/01/2022",'%d/%m/%Y'), STR_TO_DATE("13/01/2023",'%d/%m/%Y'), "17000");
INSERT INTO project (proj_id, ins_id, prog_id, ex_id, ass_id, ass_res_id, sup_res_id, title, description, start, end, fund) VALUES (45040, 78010, 23010, 11020, 13040, 310041, 310040, "Proj40", "Proj40", STR_TO_DATE("19/02/2022",'%d/%m/%Y'), STR_TO_DATE("19/02/2024",'%d/%m/%Y'), "51000");
INSERT INTO project (proj_id, ins_id, prog_id, ex_id, ass_id, ass_res_id, sup_res_id, title, description, start, end, fund) VALUES (45041, 78011, 23011, 11001, 13041, 310042, 310041, "Proj41", "Proj41", STR_TO_DATE("18/03/2022",'%d/%m/%Y'), STR_TO_DATE("18/03/2025",'%d/%m/%Y'), "60000");
INSERT INTO project (proj_id, ins_id, prog_id, ex_id, ass_id, ass_res_id, sup_res_id, title, description, start, end, fund) VALUES (45042, 78012, 23012, 11002, 13042, 310043, 310042, "Proj42", "Proj42", STR_TO_DATE("19/04/2022",'%d/%m/%Y'), STR_TO_DATE("19/04/2026",'%d/%m/%Y'), "30000");
INSERT INTO project (proj_id, ins_id, prog_id, ex_id, ass_id, ass_res_id, sup_res_id, title, description, start, end, fund) VALUES (45043, 78013, 23013, 11003, 13043, 310044, 310043, "Proj43", "Proj43", STR_TO_DATE("22/04/2022",'%d/%m/%Y'), STR_TO_DATE("22/04/2023",'%d/%m/%Y'), "25000");
INSERT INTO project (proj_id, ins_id, prog_id, ex_id, ass_id, ass_res_id, sup_res_id, title, description, start, end, fund) VALUES (45044, 78014, 23014, 11004, 13044, 310045, 310044, "Proj44", "Proj44", STR_TO_DATE("18/06/2022",'%d/%m/%Y'), STR_TO_DATE("18/06/2024",'%d/%m/%Y'), "10000");
INSERT INTO project (proj_id, ins_id, prog_id, ex_id, ass_id, ass_res_id, sup_res_id, title, description, start, end, fund) VALUES (45045, 78015, 23015, 11005, 13045, 310046, 310045, "Proj45", "Proj45", STR_TO_DATE("23/06/2022",'%d/%m/%Y'), STR_TO_DATE("23/06/2025",'%d/%m/%Y'), "78000");
INSERT INTO project (proj_id, ins_id, prog_id, ex_id, ass_id, ass_res_id, sup_res_id, title, description, start, end, fund) VALUES (45046, 78016, 23016, 11006, 13046, 310047, 310046, "Proj46", "Proj46", STR_TO_DATE("5/7/2022",'%d/%m/%Y'), STR_TO_DATE("5/7/2026",'%d/%m/%Y'), "80000");
INSERT INTO project (proj_id, ins_id, prog_id, ex_id, ass_id, ass_res_id, sup_res_id, title, description, start, end, fund) VALUES (45047, 78017, 23017, 11007, 13047, 310048, 310047, "Proj47", "Proj47", STR_TO_DATE("11/7/2022",'%d/%m/%Y'), STR_TO_DATE("11/7/2023",'%d/%m/%Y'), "85000");
INSERT INTO project (proj_id, ins_id, prog_id, ex_id, ass_id, ass_res_id, sup_res_id, title, description, start, end, fund) VALUES (45048, 78018, 23018, 11008, 13048, 310049, 310048, "Proj48", "Proj48", STR_TO_DATE("12/8/2022",'%d/%m/%Y'), STR_TO_DATE("12/8/2024",'%d/%m/%Y'), "76000");
INSERT INTO project (proj_id, ins_id, prog_id, ex_id, ass_id, ass_res_id, sup_res_id, title, description, start, end, fund) VALUES (45049, 78019, 23019, 11009, 13049, 310050, 310049, "Proj48", "Proj48", STR_TO_DATE("26/08/2022",'%d/%m/%Y'), STR_TO_DATE("26/08/2025",'%d/%m/%Y'), "37000");
INSERT INTO project (proj_id, ins_id, prog_id, ex_id, ass_id, ass_res_id, sup_res_id, title, description, start, end, fund) VALUES (45050, 78020, 23020, 11010, 13050, 310001, 310050, "Proj50", "Proj50", STR_TO_DATE("26/09/2022",'%d/%m/%Y'), STR_TO_DATE("26/09/2026",'%d/%m/%Y'), "48000");

DROP TABLE IF EXISTS works;
CREATE TABLE works (
  res_id INT UNSIGNED NOT NULL,
  proj_id INT UNSIGNED NOT NULL,
  PRIMARY KEY (res_id, proj_id),
  CONSTRAINT fk_works_res FOREIGN KEY (res_id)
    REFERENCES researcher (res_id) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT fk_works_proj FOREIGN KEY (proj_id)
    REFERENCES project (proj_id) ON DELETE RESTRICT ON UPDATE CASCADE
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

INSERT INTO works (res_id, proj_id) VALUES (310001, 45001);
INSERT INTO works (res_id, proj_id) VALUES (310031, 45001);
INSERT INTO works (res_id, proj_id) VALUES (310061, 45001);
INSERT INTO works (res_id, proj_id) VALUES (310002, 45002);
INSERT INTO works (res_id, proj_id) VALUES (310092, 45002);
INSERT INTO works (res_id, proj_id) VALUES (310003, 45003);
INSERT INTO works (res_id, proj_id) VALUES (310093, 45003);
INSERT INTO works (res_id, proj_id) VALUES (310063, 45003);
INSERT INTO works (res_id, proj_id) VALUES (310033, 45003);
INSERT INTO works (res_id, proj_id) VALUES (310004, 45004);
INSERT INTO works (res_id, proj_id) VALUES (310034, 45004);
INSERT INTO works (res_id, proj_id) VALUES (310005, 45005);
INSERT INTO works (res_id, proj_id) VALUES (310035, 45005);
INSERT INTO works (res_id, proj_id) VALUES (310095, 45005);
INSERT INTO works (res_id, proj_id) VALUES (310006, 45006);
INSERT INTO works (res_id, proj_id) VALUES (310096, 45006);
INSERT INTO works (res_id, proj_id) VALUES (310007, 45007);
INSERT INTO works (res_id, proj_id) VALUES (310037, 45007);
INSERT INTO works (res_id, proj_id) VALUES (310067, 45007);
INSERT INTO works (res_id, proj_id) VALUES (310008, 45008);
INSERT INTO works (res_id, proj_id) VALUES (310038, 45008);
INSERT INTO works (res_id, proj_id) VALUES (310068, 45008);
INSERT INTO works (res_id, proj_id) VALUES (310098, 45008);
INSERT INTO works (res_id, proj_id) VALUES (310009, 45009);
INSERT INTO works (res_id, proj_id) VALUES (310039, 45009);
INSERT INTO works (res_id, proj_id) VALUES (310010, 45010);
INSERT INTO works (res_id, proj_id) VALUES (310040, 45010);
INSERT INTO works (res_id, proj_id) VALUES (310070, 45010);
INSERT INTO works (res_id, proj_id) VALUES (310011, 45011);
INSERT INTO works (res_id, proj_id) VALUES (310071, 45011);
INSERT INTO works (res_id, proj_id) VALUES (310012, 45012);
INSERT INTO works (res_id, proj_id) VALUES (310072, 45012);
INSERT INTO works (res_id, proj_id) VALUES (310042, 45012);
INSERT INTO works (res_id, proj_id) VALUES (310013, 45013);
INSERT INTO works (res_id, proj_id) VALUES (310043, 45013);
INSERT INTO works (res_id, proj_id) VALUES (310014, 45014);
INSERT INTO works (res_id, proj_id) VALUES (310044, 45014);
INSERT INTO works (res_id, proj_id) VALUES (310074, 45014);
INSERT INTO works (res_id, proj_id) VALUES (310015, 45015);
INSERT INTO works (res_id, proj_id) VALUES (310045, 45015);
INSERT INTO works (res_id, proj_id) VALUES (310016, 45016);
INSERT INTO works (res_id, proj_id) VALUES (310046, 45016);
INSERT INTO works (res_id, proj_id) VALUES (310076, 45016);
INSERT INTO works (res_id, proj_id) VALUES (310017, 45017);
INSERT INTO works (res_id, proj_id) VALUES (310047, 45017);
INSERT INTO works (res_id, proj_id) VALUES (310018, 45018);
INSERT INTO works (res_id, proj_id) VALUES (310048, 45018);
INSERT INTO works (res_id, proj_id) VALUES (310019, 45019);
INSERT INTO works (res_id, proj_id) VALUES (310049, 45019);
INSERT INTO works (res_id, proj_id) VALUES (310079, 45019);
INSERT INTO works (res_id, proj_id) VALUES (310020, 45020);
INSERT INTO works (res_id, proj_id) VALUES (310080, 45020);
INSERT INTO works (res_id, proj_id) VALUES (310021, 45021);
INSERT INTO works (res_id, proj_id) VALUES (310081, 45021);
INSERT INTO works (res_id, proj_id) VALUES (310051, 45021);
INSERT INTO works (res_id, proj_id) VALUES (310022, 45022);
INSERT INTO works (res_id, proj_id) VALUES (310052, 45022);
INSERT INTO works (res_id, proj_id) VALUES (310023, 45023);
INSERT INTO works (res_id, proj_id) VALUES (310083, 45023);
INSERT INTO works (res_id, proj_id) VALUES (310024, 45024);
INSERT INTO works (res_id, proj_id) VALUES (310084, 45024);
INSERT INTO works (res_id, proj_id) VALUES (310025, 45025);
INSERT INTO works (res_id, proj_id) VALUES (310055, 45025);
INSERT INTO works (res_id, proj_id) VALUES (310085, 45025);
INSERT INTO works (res_id, proj_id) VALUES (310026, 45026);
INSERT INTO works (res_id, proj_id) VALUES (310086, 45026);
INSERT INTO works (res_id, proj_id) VALUES (310027, 45027);
INSERT INTO works (res_id, proj_id) VALUES (310057, 45027);
INSERT INTO works (res_id, proj_id) VALUES (310028, 45028);
INSERT INTO works (res_id, proj_id) VALUES (310058, 45028);
INSERT INTO works (res_id, proj_id) VALUES (310088, 45028);
INSERT INTO works (res_id, proj_id) VALUES (310029, 45029);
INSERT INTO works (res_id, proj_id) VALUES (310089, 45029);
INSERT INTO works (res_id, proj_id) VALUES (310030, 45030);
INSERT INTO works (res_id, proj_id) VALUES (310060, 45030);
INSERT INTO works (res_id, proj_id) VALUES (310031, 45031);
INSERT INTO works (res_id, proj_id) VALUES (310091, 45031);
INSERT INTO works (res_id, proj_id) VALUES (310001, 45031);
INSERT INTO works (res_id, proj_id) VALUES (310032, 45032);
INSERT INTO works (res_id, proj_id) VALUES (310092, 45032);
INSERT INTO works (res_id, proj_id) VALUES (310033, 45033);
INSERT INTO works (res_id, proj_id) VALUES (310093, 45033);
INSERT INTO works (res_id, proj_id) VALUES (310034, 45034);
INSERT INTO works (res_id, proj_id) VALUES (310094, 45034);
INSERT INTO works (res_id, proj_id) VALUES (310034, 45035);
INSERT INTO works (res_id, proj_id) VALUES (310035, 45035);
INSERT INTO works (res_id, proj_id) VALUES (310065, 45035);
INSERT INTO works (res_id, proj_id) VALUES (310036, 45036);
INSERT INTO works (res_id, proj_id) VALUES (310066, 45036);
INSERT INTO works (res_id, proj_id) VALUES (310037, 45037);
INSERT INTO works (res_id, proj_id) VALUES (310007, 45037);
INSERT INTO works (res_id, proj_id) VALUES (310097, 45037);
INSERT INTO works (res_id, proj_id) VALUES (310038, 45038);
INSERT INTO works (res_id, proj_id) VALUES (310098, 45038);
INSERT INTO works (res_id, proj_id) VALUES (310039, 45039);
INSERT INTO works (res_id, proj_id) VALUES (310099, 45039);
INSERT INTO works (res_id, proj_id) VALUES (310040, 45040);
INSERT INTO works (res_id, proj_id) VALUES (310100, 45040);
INSERT INTO works (res_id, proj_id) VALUES (310041, 45041);
INSERT INTO works (res_id, proj_id) VALUES (310071, 45041);
INSERT INTO works (res_id, proj_id) VALUES (310042, 45042);
INSERT INTO works (res_id, proj_id) VALUES (310012, 45042);
INSERT INTO works (res_id, proj_id) VALUES (310072, 45042);
INSERT INTO works (res_id, proj_id) VALUES (310043, 45043);
INSERT INTO works (res_id, proj_id) VALUES (310073, 45043);
INSERT INTO works (res_id, proj_id) VALUES (310044, 45044);
INSERT INTO works (res_id, proj_id) VALUES (310074, 45044);
INSERT INTO works (res_id, proj_id) VALUES (310045, 45045);
INSERT INTO works (res_id, proj_id) VALUES (310075, 45045);
INSERT INTO works (res_id, proj_id) VALUES (310015, 45045);
INSERT INTO works (res_id, proj_id) VALUES (310046, 45046);
INSERT INTO works (res_id, proj_id) VALUES (310016, 45046);
INSERT INTO works (res_id, proj_id) VALUES (310047, 45047);
INSERT INTO works (res_id, proj_id) VALUES (310017, 45047);
INSERT INTO works (res_id, proj_id) VALUES (310048, 45048);
INSERT INTO works (res_id, proj_id) VALUES (310018, 45048);
INSERT INTO works (res_id, proj_id) VALUES (310049, 45049);
INSERT INTO works (res_id, proj_id) VALUES (310019, 45049);
INSERT INTO works (res_id, proj_id) VALUES (310079, 45049);
INSERT INTO works (res_id, proj_id) VALUES (310050, 45050);
INSERT INTO works (res_id, proj_id) VALUES (310080, 45050);

DROP TABLE IF EXISTS deliverable;
CREATE TABLE deliverable (
  proj_id INT UNSIGNED NOT NULL,
  title VARCHAR(45) NOT NULL,
  description VARCHAR(450) NOT NULL,
  date DATE NOT NULL,
  PRIMARY KEY (proj_id, title, description),
  CONSTRAINT fk_del_proj FOREIGN KEY (proj_id)
    REFERENCES project (proj_id) ON DELETE RESTRICT ON UPDATE CASCADE
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

INSERT INTO deliverable (proj_id, title, description, date) VALUES (45001, "del1.1", "del1", STR_TO_DATE("4/2/2020",'%d/%m/%Y'));
INSERT INTO deliverable (proj_id, title, description, date) VALUES (45001, "del1.2", "del1", STR_TO_DATE("4/2/2021",'%d/%m/%Y'));
INSERT INTO deliverable (proj_id, title, description, date) VALUES (45001, "del1", "del1", STR_TO_DATE("4/2/2021",'%d/%m/%Y'));
INSERT INTO deliverable (proj_id, title, description, date) VALUES (45004, "del4", "del4", STR_TO_DATE("30/05/2022",'%d/%m/%Y'));
INSERT INTO deliverable (proj_id, title, description, date) VALUES (45005, "del5.1", "del5", STR_TO_DATE("28/8/2020",'%d/%m/%Y'));
INSERT INTO deliverable (proj_id, title, description, date) VALUES (45005, "del5.2", "del5", STR_TO_DATE("28/8/2021",'%d/%m/%Y'));
INSERT INTO deliverable (proj_id, title, description, date) VALUES (45027, "del27.1", "del27", STR_TO_DATE("20/12/2018",'%d/%m/%Y'));
INSERT INTO deliverable (proj_id, title, description, date) VALUES (45027, "del27.2", "del27", STR_TO_DATE("20/03/2019",'%d/%m/%Y'));
INSERT INTO deliverable (proj_id, title, description, date) VALUES (45027, "del27.3", "del27", STR_TO_DATE("20/09/2019",'%d/%m/%Y'));
INSERT INTO deliverable (proj_id, title, description, date) VALUES (45028, "del28.1", "del28", STR_TO_DATE("16/2/2019",'%d/%m/%Y'));
INSERT INTO deliverable (proj_id, title, description, date) VALUES (45028, "del28.2", "del28", STR_TO_DATE("16/5/2019",'%d/%m/%Y'));
INSERT INTO deliverable (proj_id, title, description, date) VALUES (45028, "del28.3", "del28", STR_TO_DATE("16/11/2020",'%d/%m/%Y'));
INSERT INTO deliverable (proj_id, title, description, date) VALUES (45029, "del29.1", "del29", STR_TO_DATE("16/5/2019",'%d/%m/%Y'));
INSERT INTO deliverable (proj_id, title, description, date) VALUES (45029, "del29.2", "del29", STR_TO_DATE("16/12/2019",'%d/%m/%Y'));
INSERT INTO deliverable (proj_id, title, description, date) VALUES (45029, "del29.3", "del29", STR_TO_DATE("16/12/2020",'%d/%m/%Y'));
INSERT INTO deliverable (proj_id, title, description, date) VALUES (45029, "del29.4", "del29", STR_TO_DATE("16/12/2021",'%d/%m/%Y'));
INSERT INTO deliverable (proj_id, title, description, date) VALUES (45030, "del30.1", "del30", STR_TO_DATE("30/6/2019",'%d/%m/%Y'));
INSERT INTO deliverable (proj_id, title, description, date) VALUES (45030, "del30.2", "del30", STR_TO_DATE("30/6/2020",'%d/%m/%Y'));
INSERT INTO deliverable (proj_id, title, description, date) VALUES (45031, "del31.1", "del31", STR_TO_DATE("10/5/2019",'%d/%m/%Y'));
INSERT INTO deliverable (proj_id, title, description, date) VALUES (45031, "del31.2", "del31", STR_TO_DATE("10/7/2019",'%d/%m/%Y'));
INSERT INTO deliverable (proj_id, title, description, date) VALUES (45031, "del31.3", "del31", STR_TO_DATE("10/3/2020",'%d/%m/%Y'));
INSERT INTO deliverable (proj_id, title, description, date) VALUES (45032, "del32", "del32", STR_TO_DATE("19/05/2021",'%d/%m/%Y'));
INSERT INTO deliverable (proj_id, title, description, date) VALUES (45035, "del35.1", "del35", STR_TO_DATE("11/5/2020",'%d/%m/%Y'));
INSERT INTO deliverable (proj_id, title, description, date) VALUES (45035, "del35.2", "del35", STR_TO_DATE("11/3/2021",'%d/%m/%Y'));

DROP TABLE IF EXISTS research_field;
CREATE TABLE research_field (
  field_id INT UNSIGNED NOT NULL AUTO_INCREMENT,
  field_name VARCHAR(45) NOT NULL,
  description VARCHAR(450) NULL,
  PRIMARY KEY (field_id)
)ENGINE=InnoDB AUTO_INCREMENT=99001 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

INSERT INTO research_field (field_id, field_name, description) VALUES (99001, "Archaeology", "Archaeology is the scientific study of human activity through the recovery and analysis of material culture.");
INSERT INTO research_field (field_id, field_name, description) VALUES (99002, "Economics", "Economics is the social science that studies the production, distribution, and consumption of goods and services.");
INSERT INTO research_field (field_id, field_name, description) VALUES (99003, "Biology", "Biology is the scientific study of life.");
INSERT INTO research_field (field_id, field_name, description) VALUES (99004, "Chemistry", "Chemistry is the scientific study of the properties and behavior of matter.");
INSERT INTO research_field (field_id, field_name, description) VALUES (99005, "Earth sciences", "Earth science or geoscience includes all fields of natural science related to the planet Earth");
INSERT INTO research_field (field_id, field_name, description) VALUES (99006, "Physics", "Physics is the natural science that studies matter, its fundamental constituents, its motion and behavior through space and time, and the related entities of energy and force.");
INSERT INTO research_field (field_id, field_name, description) VALUES (99007, "Astronomy", "Astronomy is a natural science that studies celestial objects and phenomena.");
INSERT INTO research_field (field_id, field_name, description) VALUES (99008, "Pure mathematics", "Pure mathematics is the study of mathematical concepts independently of any application outside mathematics.");
INSERT INTO research_field (field_id, field_name, description) VALUES (99009, "Applied mathematics", "Applied mathematics is the application of mathematical methods by different fields such as physics, engineering, medicine, biology, finance, business, computer science, and industry.");
INSERT INTO research_field (field_id, field_name, description) VALUES (99010, "Business", "Business is the activity of making one's living or making money by producing or buying and selling products (such as goods and services).");
INSERT INTO research_field (field_id, field_name, description) VALUES (99011, "Architecture", "Architecture  is both the process and the product of planning, designing, and constructing buildings or other structures.");
INSERT INTO research_field (field_id, field_name, description) VALUES (99012, "Engineering", "Engineering is the use of scientific principles to design and build machines, structures, and other items, including bridges, tunnels, roads, vehicles, and buildings.");

DROP TABLE IF EXISTS proj_field;
CREATE TABLE proj_field (
  proj_id INT UNSIGNED NOT NULL,
  field_id INT UNSIGNED NOT NULL,
  PRIMARY KEY (proj_id, field_id),
  CONSTRAINT fk_field_proj FOREIGN KEY (proj_id)
    REFERENCES project (proj_id) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT fk_proj_field FOREIGN KEY (field_id)
    REFERENCES research_field (field_id) ON DELETE RESTRICT ON UPDATE CASCADE
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

INSERT INTO proj_field (proj_id, field_id) VALUES (45001, 99001);
INSERT INTO proj_field (proj_id, field_id) VALUES (45001, 99004);
INSERT INTO proj_field (proj_id, field_id) VALUES (45001, 99006);
INSERT INTO proj_field (proj_id, field_id) VALUES (45002, 99003);
INSERT INTO proj_field (proj_id, field_id) VALUES (45003, 99008);
INSERT INTO proj_field (proj_id, field_id) VALUES (45003, 99006);
INSERT INTO proj_field (proj_id, field_id) VALUES (45004, 99001);
INSERT INTO proj_field (proj_id, field_id) VALUES (45004, 99008);
INSERT INTO proj_field (proj_id, field_id) VALUES (45004, 99003);
INSERT INTO proj_field (proj_id, field_id) VALUES (45005, 99004);
INSERT INTO proj_field (proj_id, field_id) VALUES (45005, 99010);
INSERT INTO proj_field (proj_id, field_id) VALUES (45005, 99001);
INSERT INTO proj_field (proj_id, field_id) VALUES (45005, 99011);
INSERT INTO proj_field (proj_id, field_id) VALUES (45006, 99010);
INSERT INTO proj_field (proj_id, field_id) VALUES (45006, 99008);
INSERT INTO proj_field (proj_id, field_id) VALUES (45007, 99012);
INSERT INTO proj_field (proj_id, field_id) VALUES (45007, 99003);
INSERT INTO proj_field (proj_id, field_id) VALUES (45007, 99011);
INSERT INTO proj_field (proj_id, field_id) VALUES (45008, 99012);
INSERT INTO proj_field (proj_id, field_id) VALUES (45008, 99007);
INSERT INTO proj_field (proj_id, field_id) VALUES (45009, 99012);
INSERT INTO proj_field (proj_id, field_id) VALUES (45009, 99011);
INSERT INTO proj_field (proj_id, field_id) VALUES (45009, 99001);
INSERT INTO proj_field (proj_id, field_id) VALUES (45010, 99004);
INSERT INTO proj_field (proj_id, field_id) VALUES (45010, 99003);
INSERT INTO proj_field (proj_id, field_id) VALUES (45011, 99005);
INSERT INTO proj_field (proj_id, field_id) VALUES (45012, 99011);
INSERT INTO proj_field (proj_id, field_id) VALUES (45013, 99007);
INSERT INTO proj_field (proj_id, field_id) VALUES (45014, 99005);
INSERT INTO proj_field (proj_id, field_id) VALUES (45014, 99008);
INSERT INTO proj_field (proj_id, field_id) VALUES (45015, 99002);
INSERT INTO proj_field (proj_id, field_id) VALUES (45015, 99012);
INSERT INTO proj_field (proj_id, field_id) VALUES (45016, 99003);
INSERT INTO proj_field (proj_id, field_id) VALUES (45016, 99010);
INSERT INTO proj_field (proj_id, field_id) VALUES (45017, 99009);
INSERT INTO proj_field (proj_id, field_id) VALUES (45018, 99002);
INSERT INTO proj_field (proj_id, field_id) VALUES (45019, 99005);
INSERT INTO proj_field (proj_id, field_id) VALUES (45020, 99009);
INSERT INTO proj_field (proj_id, field_id) VALUES (45021, 99003);
INSERT INTO proj_field (proj_id, field_id) VALUES (45022, 99010);
INSERT INTO proj_field (proj_id, field_id) VALUES (45023, 99007);
INSERT INTO proj_field (proj_id, field_id) VALUES (45024, 99012);
INSERT INTO proj_field (proj_id, field_id) VALUES (45025, 99001);
INSERT INTO proj_field (proj_id, field_id) VALUES (45026, 99004);
INSERT INTO proj_field (proj_id, field_id) VALUES (45027, 99012);
INSERT INTO proj_field (proj_id, field_id) VALUES (45028, 99004);
INSERT INTO proj_field (proj_id, field_id) VALUES (45029, 99004);
INSERT INTO proj_field (proj_id, field_id) VALUES (45030, 99004);
INSERT INTO proj_field (proj_id, field_id) VALUES (45031, 99008);
INSERT INTO proj_field (proj_id, field_id) VALUES (45032, 99010);
INSERT INTO proj_field (proj_id, field_id) VALUES (45033, 99011);
INSERT INTO proj_field (proj_id, field_id) VALUES (45034, 99002);
INSERT INTO proj_field (proj_id, field_id) VALUES (45035, 99005);
INSERT INTO proj_field (proj_id, field_id) VALUES (45035, 99009);
INSERT INTO proj_field (proj_id, field_id) VALUES (45036, 99009);
INSERT INTO proj_field (proj_id, field_id) VALUES (45036, 99005);
INSERT INTO proj_field (proj_id, field_id) VALUES (45036, 99002);
INSERT INTO proj_field (proj_id, field_id) VALUES (45037, 99005);
INSERT INTO proj_field (proj_id, field_id) VALUES (45038, 99010);
INSERT INTO proj_field (proj_id, field_id) VALUES (45039, 99009);
INSERT INTO proj_field (proj_id, field_id) VALUES (45040, 99007);
INSERT INTO proj_field (proj_id, field_id) VALUES (45041, 99005);
INSERT INTO proj_field (proj_id, field_id) VALUES (45042, 99011);
INSERT INTO proj_field (proj_id, field_id) VALUES (45043, 99006);
INSERT INTO proj_field (proj_id, field_id) VALUES (45044, 99010);
INSERT INTO proj_field (proj_id, field_id) VALUES (45045, 99002);
INSERT INTO proj_field (proj_id, field_id) VALUES (45046, 99002);
INSERT INTO proj_field (proj_id, field_id) VALUES (45047, 99002);
INSERT INTO proj_field (proj_id, field_id) VALUES (45048, 99009);
INSERT INTO proj_field (proj_id, field_id) VALUES (45049, 99002);
INSERT INTO proj_field (proj_id, field_id) VALUES (45050, 99007);

SET FOREIGN_KEY_CHECKS = 1;
/* Check foreign key constraints (default)*/
