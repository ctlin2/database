/* 
Name:         Roger Silva Santos Aguiar 
Function:     Script implementation of the COMPANY database of the book Database Systems Sixth Edition. 
              Ramez Elmasri and Shamkant B. Navathe
Initial date: May 2, 2020 
Last update:  May 10, 2020 
*/

CREATE DATABASE COMPANY;-- It creates a new database
USE COMPANY;            -- It selects the database

-- It creates a table named EMPLOYEE
CREATE TABLE EMPLOYEE
(
    Fname     VARCHAR(15) NOT NULL,
    Minit     CHAR, 
    Lname     VARCHAR(15) NOT NULL,
    Ssn       CHAR(9)     NOT NULL,
    Bdate     DATE,
    Address   VARCHAR(30),
    Sex       CHAR,
    Salary    DECIMAL(10,2),
    Super_ssn CHAR(9),
    Dno       INT         NOT NULL,
    PRIMARY KEY (Ssn)
);

-- The following script creates a new table named DEPARTMENT
CREATE TABLE DEPARTMENT
(
    Dname          VARCHAR(15) NOT NULL,
    Dnumber        INT         NOT NULL,
    Mgr_ssn        CHAR(9)     NOT NULL,
    Mgr_start_date DATE,
    PRIMARY KEY (Dnumber),
    UNIQUE (Dname),
    FOREIGN KEY (Mgr_ssn) REFERENCES EMPLOYEE(Ssn)
);

-- The following script creates a new table named DEPT_LOCATIONS
CREATE TABLE DEPT_LOCATIONS
(
    Dnumber   INT         NOT NULL,
    Dlocation VARCHAR(15) NOT NULL,
    PRIMARY KEY (Dnumber, Dlocation),
    FOREIGN key (Dnumber) REFERENCES DEPARTMENT (Dnumber)
);

-- The following script creates a new table named PROJECT
CREATE TABLE PROJECT
(
    Pname     VARCHAR(15) NOT NULL,
    Pnumber   INT         NOT NULL,
    Plocation VARCHAR(15),
    Dnum      INT         NOT NULL,
    PRIMARY KEY(Pnumber),
    UNIQUE(Pname),
    FOREIGN KEY(Dnum) REFERENCES DEPARTMENT(Dnumber)
);

-- The following script creates a new table named WORKS_ON
CREATE TABLE WORKS_ON
(
    Essn  CHAR(9)      NOT NULL,
    Pno   INT          NOT NULL,
    Hours DECIMAL(3,1) NOT NULL,
    PRIMARY KEY(Essn, Pno),
    FOREIGN KEY(Essn) REFERENCES EMPLOYEE(Ssn),
    FOREIGN KEY(Pno)  REFERENCES PROJECT(Pnumber)
);

-- The following script creates a new table named DEPENDENT
CREATE TABLE DEPENDENT
(
    Essn           CHAR(9)     NOT NULL,
    Dependent_name VARCHAR(15) NOT NULL,
    Sex            CHAR,
    Bdate          DATE,
    Relationship   VARCHAR(8),
    PRIMARY KEY(Essn, Dependent_name),
    FOREIGN KEY(Essn) REFERENCES EMPLOYEE(Ssn)
);

-- **********************************************************************************************
-- INSERT operations

-- The following script adds a new tuple to the EMPLOYEE relation
INSERT INTO EMPLOYEE (Fname, Minit, Lname, Ssn, Bdate, Address, Sex, Salary, Super_ssn, Dno)
VALUES ('Richard', 'K', 'Marini', '653298653', '1962-12-30', '98 Oak Forest, Katy, TX', 'M', 37000, '653298653', 4),
       ('John', 'B', 'Smith', '123456789', '1965-01-09', '731 Fondren, Houston, TX', 'M', 30000, '333445555', 5),
       ('Franklin', 'T', 'Wong', '333445555', '1965-12-08', '638 Voss, Houston, TX', 'M', 40000, '888665555', 5),
       ('Alicia', 'J', 'Zelaya', '999887777', '1968-01-19', '3321 Castle, Spring, TX', 'F', 25000, '987654321', 4),
       ('Jennifer', 'S', 'Wallace', '987654321', '1941-06-20', '291 Berry, Bellaire, TX', 'F', 43000, '888665555', 4),
       ('Ramesh', 'K', 'Narayan', '666884444', '1962-09-15', '975 Fire Oak, Humble, TX', 'M', 38000, '333445555', 5),
       ('Joyce', 'A', 'English', '453453453', '1972-07-31', '5631 Rice, Houston, TX', 'F', 25000, '333445555', 5),
       ('Ahmad', 'V', 'Jabbar', '987987987', '1969-03-29', '980 Dallas, Houston, TX', 'M', 25000, '987654321', 4),
       ('James', 'E', 'Borg', '888665555', '1937-11-10', '450 Stone, Houston, TX', 'M', 55000, NULL, 4),
	   ('Robert', 'F', 'Scott','921921921','1942-06-21', '365 Newcastle, Bellaire, TX', 'M', '45000', '888665555', 1);

-- The following script adds a new tuple to the DEPARTMENT relation
INSERT INTO DEPARTMENT
VALUES ('Research', 5, '333445555', '1988-05-22'),
       ('Administration', 4, '987654321', '1995-01-01'),
	   ('Marketing', 3, '921921921', '1996-08-01'),
       ('Headquarters', 1, '888665555', '1981-06-19');

-- The following script adds a new tuple to the DEPT_LOCATIONS relation
INSERT INTO DEPT_LOCATIONS
VALUES (1, 'Houston'),
       (4, 'Stafford'),
       (5, 'Bellaire'),
       (5, 'Sugarland'),
       (5, 'Houston');

-- The following script adds a new tuple to the PROJECT relation
INSERT INTO PROJECT
VALUES ('ProductX', 1,' Bellaire', 5),
       ('ProductY', 2, 'Sugarland', 5),
       ('ProductZ', 3, 'Houston', 5),
       ('Computerization', 10, 'Stafford', 4),
       ('Reorganization', 20, 'Houston', 1),
       ('Newbenefits', 30, 'Starfford', 4);

-- The following script adds a new tuple to the WORKS_ON relation
INSERT INTO WORKS_ON 
VALUES ('123456789', 1, 32.5),
       ('123456789', 2, 7.5),
       ('666884444', 3, 40.0),
       ('453453453', 1, 20.0),
       ('453453453', 2, 20.0),
       ('333445555', 2, 10.0),
       ('333445555', 3, 10.0),
       ('333445555', 10, 10.0),
       ('333445555', 20, 10.0),
       ('999887777', 30, 30.0),
       ('999887777', 10, 10.0),
       ('987987987', 10, 35.0),
       ('987987987', 30, 5.0),
       ('987654321', 30, 20.0),
       ('987654321', 20, 15.0),
       ('888665555', 20, 0);

-- The following script adds a new tuple to the DEPENDENT relation
INSERT INTO DEPENDENT
VALUES ('333445555', 'Alice', 'F', '1986-04-05', 'Daughter'),
       ('333445555', 'Theodore', 'M', '1983-10-25', 'Son'),
       ('333445555', 'Joy', 'F', '1958-05-03', 'Spouse'),
       ('987654321', 'Abner', 'M', '1942-02-28', 'Spouse'),
       ('123456789', 'Michael', 'M', '1988-01-04', 'Son'),
       ('123456789', 'Alice', 'F', '1988-12-30', 'Daughter'),
       ('123456789', 'Elizabeth', 'F', '1967-05-05', 'Spouse');
