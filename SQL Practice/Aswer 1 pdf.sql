create database primefor;
use primefor;
create table Customer(Custid int primary key, Custname varchar(20), Addr int8, phno int8, pan_no int8);
create table Loan(Loanid int, Ammount int,Interest int,Custid int primary key, foreign key(Custid) references Customer(Custid));
create table Account(Accid int,Accbal int,Custid int,foreign key(Custid) references Customer(Custid));
drop table Loan;
drop table Account;
drop table Customer;
-- Create the Customer table
CREATE TABLE Customer (
    Custid VARCHAR(10) PRIMARY KEY,
    Custname VARCHAR(255),
    Addr VARCHAR(255),
    phno VARCHAR(15),
    pan_no VARCHAR(20) UNIQUE
);

-- Create the Loan table with a foreign key reference to Customer
CREATE TABLE Loan (
    Loanid INT PRIMARY KEY,
    Amount DECIMAL(10, 2),
    Interest DECIMAL(5, 2),
    Custid VARCHAR(10),
    FOREIGN KEY (Custid) REFERENCES Customer(Custid)
);

-- Create the Account table with a foreign key reference to Customer
CREATE TABLE Account (
    Accid INT PRIMARY KEY,
    Accbal DECIMAL(10, 2),
    Custid VARCHAR(10),
    FOREIGN KEY (Custid) REFERENCES Customer(Custid)
);

-- Insert sample data into Customer table
INSERT INTO Customer (Custid, Custname, Addr, phno, pan_no) VALUES
('C01', 'John Doe', '123 Main St', '555-1234', 'ABCDE12345'),
('C02', 'Jane Smith', '456 Elm St', '555-5678', 'FGHIJ67890'),
('C03', 'Bob Johnson', '789 Oak St', '555-9876', 'KLMNO12345');

-- Insert sample data into Loan table
INSERT INTO Loan (Loanid, Amount, Interest, Custid) VALUES
(101, 5000.00, 5.00, 'C01'),
(102, 7500.00, 4.50, 'C02'),
(103, 3000.00, 6.25, 'C03');

-- Insert sample data into Account table
INSERT INTO Account (Accid, Accbal, Custid) VALUES
(201, 10000.00, 'C01'),
(202, 8500.00, 'C02'),
(203, 12000.00, 'C03');
CREATE TABLE Const (
    Custid VARCHAR(10) PRIMARY KEY CHECK (Custid LIKE 'C%'),
    Custname VARCHAR(255),
    Addr VARCHAR(255),
    phno VARCHAR(15),
    pan_no VARCHAR(20) UNIQUE
);

SELECT Customer.Custid, Customer.Custname, Account.Accbal
FROM Customer
LEFT JOIN Account ON Customer.Custid = Account.Custid
WHERE Customer.Custid IN ('C01', 'C02', 'C03');

SELECT Custid
FROM Account
GROUP BY Custid, Accbal
HAVING Accbal = (SELECT MAX(Accbal) FROM Account)
LIMIT 0, 1000;

CREATE VIEW CustomerSummary AS
SELECT C.Custid, C.Custname, L.Amount AS LoanAmount, A.Accbal
FROM Customer C
LEFT JOIN Loan L ON C.Custid = L.Custid
LEFT JOIN Account A ON C.Custid = A.Custid;

DELIMITER //
CREATE PROCEDURE Customer_Loan()
BEGIN
    -- Code to display loan details
    SELECT * FROM Loan;
END;
//
DELIMITER ;









