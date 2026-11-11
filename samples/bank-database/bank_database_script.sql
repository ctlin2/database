CREATE DATABASE BANK;
USE BANK;

CREATE TABLE branch (
    branch_name VARCHAR(50) PRIMARY KEY,
    branch_city VARCHAR(50) NOT NULL,
    assets DECIMAL(15,2) NOT NULL
);
CREATE TABLE customer (
    ID INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    customer_name VARCHAR(100) NOT NULL,
    customer_street VARCHAR(100),
    customer_city VARCHAR(50)
);
CREATE TABLE loan (
    loan_number VARCHAR(20) PRIMARY KEY,
    branch_name VARCHAR(50) NOT NULL,
    amount DECIMAL(15,2) NOT NULL,
    FOREIGN KEY (branch_name)
        REFERENCES branch(branch_name)
);
CREATE TABLE account (
    account_number VARCHAR(20) PRIMARY KEY,
    branch_name VARCHAR(50) NOT NULL,
    balance DECIMAL(15,2) NOT NULL,
    FOREIGN KEY (branch_name)
        REFERENCES branch(branch_name)
);
CREATE TABLE depositor (
    ID INTEGER,
    account_number VARCHAR(20),
    PRIMARY KEY (ID, account_number),
    FOREIGN KEY (ID)
        REFERENCES customer(ID),
    FOREIGN KEY (account_number)
        REFERENCES account(account_number)
);
CREATE TABLE borrower (
    ID INTEGER,
    loan_number VARCHAR(20),
    PRIMARY KEY (ID, loan_number),
    FOREIGN KEY (ID)
        REFERENCES customer(ID),
    FOREIGN KEY (loan_number)
        REFERENCES loan(loan_number)
);

INSERT INTO branch VALUES
('Brighton','Brooklyn',7100000),
('Downtown','Brooklyn',9000000),
('Mianus','Horseneck',400000),
('North Town','Rye',3700000),
('Perryridge','Horseneck',1700000),
('Pownal','Bennington',300000),
('Redwood','Palo Alto',2100000),
('Round Hill','Horseneck',8000000);

-- Assume customer ID begins from 1.
INSERT INTO customer (customer_name,customer_street,customer_city) VALUES
('Adams','Spring','Pittsfield'),
('Brooks','Senator','Brooklyn'),
('Curry','North','Rye'),
('Glenn','Sand Hill','Woodside'),
('Green','Walnut','Stamford'),
('Hayes','Main','Harrison'),
('Johnson','Alma','Palo Alto'),
('Jones','Main','Harrison'),
('Lindsay','Park','Pittsfield'),
('Smith','North','Rye'),
('Turner','Putnam','Stamford'),
('Williams','Nassau','Princeton');

INSERT INTO account VALUES
('A-101','Downtown',500),
('A-102','Perryridge',400),
('A-201','Brighton',900),
('A-215','Mianus',700),
('A-217','Brighton',750),
('A-222','Redwood',700),
('A-305','Round Hill',350);

INSERT INTO loan VALUES
('L-11','Round Hill',900),
('L-14','Downtown',1500),
('L-15','Perryridge',1500),
('L-16','Perryridge',1300),
('L-17','Downtown',1000),
('L-23','Redwood',2000),
('L-93','Mianus',500);

INSERT INTO depositor VALUES
(6,'A-102'),
(7,'A-101'),
(7,'A-201'),
(8,'A-217'),
(9,'A-222'),
(10,'A-215'),
(11,'A-305');

INSERT INTO borrower VALUES
(1,'L-16'),
(3,'L-93'),
(6,'L-15'),
(8,'L-17'),
(10,'L-11'),
(10,'L-23'),
(12,'L-17');