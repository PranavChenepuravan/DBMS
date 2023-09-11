create database bookstall;
use bookstall;
create table Books(isbn int,title varchar(20),author varchar(20),stock_qty int,price int,pub_year year);
create table Orders(order_no int,cust_id int,order_date date);
create table Customers(cust_id int,cust_name varchar(20),address varchar(20));
create table Order_list(order_no int,isbn int,qty int,ship_date date); 
drop table Books;
drop table Orders;
drop table Customers;
drop table Order_list;
CREATE TABLE Books (isbn int8 PRIMARY KEY,title VARCHAR(20),author VARCHAR(20),stock_qty int,price int,pub_year year);

INSERT INTO Books VALUES (1234567890, 'The Alchemist', 'Paulo Coelho', 100, 20, 2010);
INSERT INTO Books VALUES (9876543210, 'Harry Potter ', 'J.K. Rowling', 50, 15, 1997);
INSERT INTO Books VALUES (0987654321, 'The Lord of Rings', 'J.R.R. Tolkien', 20, 30, 1954);

CREATE TABLE Customers (cust_id int PRIMARY KEY,cust_name VARCHAR(20),address VARCHAR(20));

INSERT INTO Customers VALUES (1, 'John Doe', '123 Main Street');
INSERT INTO Customers VALUES (2, 'Jane Doe', '456 Elm Street');
INSERT INTO Customers VALUES (3, 'Peter Smith', '789 Oak Street');

CREATE TABLE Orders (order_no int PRIMARY KEY,cust_id int REFERENCES Customers(cust_id),order_date DATE);

INSERT INTO Orders VALUES (1, 1, '2023-09-09');
INSERT INTO Orders VALUES (2, 2, '2023-09-10');
INSERT INTO Orders VALUES (3, 3, '2023-09-11');

CREATE TABLE Order_list (order_no int REFERENCES Orders(order_no),isbn int8 REFERENCES Books(isbn),qty int,ship_date DATE);
drop table  Order_list;
INSERT INTO Order_list VALUES (1, 1234567890, 2, '2023-09-10');
INSERT INTO Order_list VALUES (1, 9876543210, 1, '2023-09-10');
INSERT INTO Order_list VALUES (2, 0987654321, 3, '2023-09-11');

SELECT cust_id
FROM Orders
WHERE cust_id IN (
  SELECT cust_id
  FROM Orders
  GROUP BY cust_id
  HAVING COUNT(*) > 3
);

