-- IF YOU GET PROBLEM WITH DB ALEADY EXISTS REMOVE 
DROP SCHEMA IF EXISTS testdb;
CREATE DATABASE testdb;
USE testdb;


-- CREATE TABLE
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

-- ADDING DATA WITH INSERT
INSERT INTO PERSON (FIRST_NAME, LAST_NAME, EMAIL, BIRTH_DATE, REGISTRATION_DATE,CITY,IS_ACTIVE)
VALUES ("Simon", "Elbrink", "simon@lexicon.se", "1997-03-18", now(), "VÄXJÖ", true);

INSERT INTO PERSON (FIRST_NAME, LAST_NAME, EMAIL, BIRTH_DATE, CITY, IS_ACTIVE)
VALUES ("test1", "test1", "test1@lexicon.se", "1960-01-01", "VÄXJÖ", true);

INSERT INTO PERSON (ID, FIRST_NAME, LAST_NAME, EMAIL, CITY, IS_ACTIVE)
VALUES (900 ,"test2", "test2", "test2@lexicon.se", "VÄXJÖ", true);

INSERT INTO PERSON
VALUES (0,"Erik", "Svensson", "erik@lexicon.se", "1967-09-11", now(), "VÄXJÖ", true);


-- oneToMany RELATIONSHIP

CREATE TABLE TASK(
ID INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
TITLE VARCHAR(255) NOT NULL,
DESCRIPTION VARCHAR(400),
PERSON_ID INT,

FOREIGN KEY (PERSON_ID) REFERENCES PERSON(ID)
);

INSERT INTO TASK VALUES (0, "Clean Room", "", 1);

SELECT * FROM TASK;


-- ManyToMany RELATIONSHIP

CREATE TABLE GROUP_(
ID INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
GROUP_NAME VARCHAR(255) NOT NULL

-- IN JAVA WE WOULD HAVE A COLLECTION Ex."List<Person> personlist" 
);

-- CREATING AN ASSIOSIATION TABLE FOR HANDLING OUR ManyToMany RELATIONSHIP

CREATE TABLE PERSON_GROUP(
ID INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
PERSON_ID INT NOT NULL,
GROUP_ID INT NOT NULL,

FOREIGN KEY (PERSON_ID) REFERENCES PERSON(ID),
FOREIGN KEY (GROUP_ID) REFERENCES GROUP_(ID)
);


insert into GROUP_ values(0,"Java");
insert into GROUP_ values(0,"C#");


INSERT PERSON_GROUP VALUES (0, 1, 1);
INSERT PERSON_GROUP VALUES (0, 1, 2);
INSERT PERSON_GROUP VALUES (0, 901, 1);


-- SELECT = FINDING = READ
-- PRODUCES A RESULT

SELECT * FROM PERSON;

SELECT FIRST_NAME, LAST_NAME FROM PERSON;
SELECT ID, FIRST_NAME, LAST_NAME FROM PERSON WHERE ID = 1;
SELECT ID, FIRST_NAME, LAST_NAME FROM PERSON WHERE ID = 1 AND FIRST_NAME = "Simon";

SELECT LAST_NAME FROM PERSON;
SELECT DISTINCT LAST_NAME FROM PERSON;

SELECT * FROM PERSON ORDER BY LAST_NAME;
SELECT * FROM PERSON ORDER BY LAST_NAME ASC; -- DEFAULT
SELECT * FROM PERSON ORDER BY LAST_NAME DESC;

SELECT * FROM PERSON LIMIT 2;

SELECT COUNT(*) FROM PERSON;

-- STARTS WITH "Task"
SELECT * FROM TASK
WHERE TITLE LIKE 'Task%';

-- ENDS WITH "1"
SELECT * FROM TASK
WHERE TITLE LIKE '%1';

-- CONATINS "2"
SELECT * FROM TASK
WHERE TITLE LIKE '%2%';

-- SKIP FIRST CHARACTER AND REST CONTINUES WITH "ask"
SELECT * FROM TASK
WHERE TITLE LIKE "_ask%";
-- STARTS WITH "Task" AND ENDS WITH "1"
SELECT * FROM TASK
WHERE TITLE LIKE 'Task%1';

-- FIND PERSON WITH EMAIL STARTING WITH "student"
SELECT * FROM PERSON 
WHERE EMAIL LIKE "student%";


-- JOIN

-- FIND TASKS THAT PERSON WITH ID "1000" HAS.
SELECT PERSON.FIRST_NAME, PERSON.LAST_NAME, TASK.TITLE
FROM PERSON
JOIN TASK
ON PERSON.ID = TASK.PERSON_ID
WHERE PERSON.ID = 1000;

SELECT CONCAT(PERSON.FIRST_NAME, ' ', PERSON.LAST_NAME) AS FULL_NAME, TASK.TITLE
FROM PERSON
JOIN TASK
ON PERSON.ID = TASK.PERSON_ID
WHERE PERSON.ID = 1000;

-- FIND PERSONS WHO IS PART OF GROUP WITH ID "40"
SELECT CONCAT(PERSON.FIRST_NAME, ' ', PERSON.LAST_NAME) AS FULL_NAME, PERSON_GROUP.GROUP_ID
FROM PERSON
JOIN PERSON_GROUP
ON PERSON.ID = PERSON_GROUP.PERSON_ID
WHERE PERSON_GROUP.GROUP_ID = "40";

-- FIND PERSONS WHO IS PART OF GROUP WITH NAME "Java Group 40"
SELECT CONCAT(PERSON.FIRST_NAME, ' ', PERSON.LAST_NAME) AS FULL_NAME, GROUP_.GROUP_NAME
FROM PERSON
JOIN PERSON_GROUP
ON PERSON.ID = PERSON_GROUP.PERSON_ID
JOIN GROUP_
ON GROUP_.ID = PERSON_GROUP.GROUP_ID
WHERE GROUP_.GROUP_NAME = "Java Group 40";

-- CREATE, UPDATE, DELETE

INSERT INTO PERSON
VALUES (9000,"","","","1960-01-01",now(),"",false);

-- START WITH SPECIFIING WHAT TO REMOVE.
-- IMPORTANT DON'T MISS THE "WHERE" CLAUSE. 
-- OTHERWISE YOU UPDATE ALL ROWS.
-- WHERE ID = 9000; 
UPDATE PERSON
SET FIRST_NAME = "Test"
WHERE ID = 9000; 

UPDATE PERSON
SET LAST_NAME = "Testsson", EMAIL = "test@mail.com", CITY = "Programming land"
WHERE ID = 9000;

-- AGAIN ALWAYS START WITH SPECIFIING WHAT TO REMOVE.
-- WHERE ID = 9000 
DELETE FROM PERSON
WHERE ID = 9000;

