-- DROP DATABASE testdb;
-- CREATE DATABASE testdb;
USE testdb;



CREATE TABLE PERSON(
ID INT NOT NULL,
FIRST_NAME VARCHAR(40) NOT NULL,
LAST_NAME VARCHAR(50) NOT NULL,
BIRTH_DATE DATE NOT NULL,
IS_ACTIVE TINYINT DEFAULT false
);

-- ALTER TABLE
ALTER TABLE PERSON ADD REGISTRATION_DATE DATETIME;
ALTER TABLE PERSON MODIFY FIRST_NAME VARCHAR(400);
ALTER TABLE PERSON DROP REGISTRATION_DATE;
ALTER TABLE PERSON ADD REGISTRATION_DATE DATETIME DEFAULT now();

-- DROP TABLE
DROP TABLE PERSON;

CREATE TABLE PERSON(
ID INT NOT NULL,
FIRST_NAME VARCHAR(40) NOT NULL,
LAST_NAME VARCHAR(50) NOT NULL,
BIRTH_DATE DATE NOT NULL,
REGISTRATION_DATE DATETIME DEFAULT now(),
CITY VARCHAR(80),
IS_ACTIVE TINYINT DEFAULT false
);

-- DROP TABLE
DROP TABLE PERSON;

CREATE TABLE PERSON(
ID INT NOT NULL PRIMARY KEY,
FIRST_NAME VARCHAR(40) NOT NULL,
LAST_NAME VARCHAR(50) NOT NULL,
BIRTH_DATE DATE NOT NULL,
REGISTRATION_DATE DATETIME DEFAULT now(),
CITY VARCHAR(80),
IS_ACTIVE TINYINT DEFAULT false
);

-- DROP TABLE
DROP TABLE PERSON;

CREATE TABLE PERSON(
ID INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
FIRST_NAME VARCHAR(40) NOT NULL,
LAST_NAME VARCHAR(50) NOT NULL,
BIRTH_DATE DATE NOT NULL,
REGISTRATION_DATE DATETIME DEFAULT now(),
CITY VARCHAR(80),
IS_ACTIVE TINYINT DEFAULT false
);

-- DROP TABLE
DROP TABLE PERSON;

CREATE TABLE PERSON(
ID INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
FIRST_NAME VARCHAR(40) NOT NULL,
LAST_NAME VARCHAR(50) NOT NULL,
EMAIL VARCHAR(60) NOT NULL UNIQUE,
BIRTH_DATE DATE NOT NULL DEFAULT "1960-01-01",
REGISTRATION_DATE DATETIME DEFAULT now(),
CITY VARCHAR(80),
IS_ACTIVE TINYINT DEFAULT false
);

INSERT INTO PERSON (FIRST_NAME, LAST_NAME, EMAIL, BIRTH_DATE, REGISTRATION_DATE,CITY,IS_ACTIVE)
VALUES ("Simon", "Elbrink", "simon@lexicon.se", "1997-03-18", now(), "VÄXJÖ", true);

INSERT INTO PERSON (FIRST_NAME, LAST_NAME, EMAIL, BIRTH_DATE, CITY, IS_ACTIVE)
VALUES ("test1", "test1", "test1@lexicon.se", "1960-01-01", "VÄXJÖ", true);

INSERT INTO PERSON (ID, FIRST_NAME, LAST_NAME, EMAIL, CITY, IS_ACTIVE)
VALUES (900 ,"test2", "test2", "test2@lexicon.se", "VÄXJÖ", true);

INSERT INTO PERSON
VALUES (0,"Erik", "Svensson", "erik@lexicon.se", "1967-09-11", now(), "VÄXJÖ", true);


CREATE TABLE TASK(
id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
TITLE VARCHAR(255) NOT NULL,
DESCRIPTION VARCHAR(400),
person_id int,

FOREIGN KEY (person_id) REFERENCES PERSON(ID)
);

SELECT * FROM TASK;

INSERT INTO TASK VALUES (0, "Clean Room", "", 1);

SELECT * FROM TASK;


-- ManyToMany Relationship

CREATE TABLE GROUP_(
ID INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
GROUP_NAME VARCHAR(255) NOT NULL

-- JAVA - List<Person> personlist 
);

-- Creating an assiosiation Table

CREATE TABLE PERSON_GROUP(
ID INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
PERSON_ID INT NOT NULL,
GROUP_ID INT NOT NULL,

FOREIGN KEY (PERSON_ID) REFERENCES PERSON(ID),
FOREIGN KEY (GROUP_ID) REFERENCES GROUP_(ID)
);


insert into group_ values(0,"Java");
insert into group_ values(0,"C#");


INSERT person_group VALUES (0, 1, 1);
INSERT person_group VALUES (0, 1, 2);
INSERT person_group VALUES (0, 901, 1);

SELECT * FROM testdb.person_group;



SELECT * FROM person;

SELECT FIRST_NAME, LAST_NAME FROM person;
SELECT ID, FIRST_NAME, LAST_NAME FROM person WHERE ID = 1;

SELECT ID, FIRST_NAME, LAST_NAME FROM person WHERE ID = 1 AND FIRST_NAME = "Simon";


SELECT LAST_NAME FROM PERSON;

SELECT DISTINCT LAST_NAME FROM PERSON;

SELECT * FROM PERSON ORDER BY LAST_NAME;
SELECT * FROM PERSON ORDER BY LAST_NAME ASC; -- DEFAULT
SELECT * FROM PERSON ORDER BY LAST_NAME DESC;


SELECT * FROM person LIMIT 2;


SELECT COUNT(*) FROM PERSON;
