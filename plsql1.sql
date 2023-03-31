create database db;
use db;
create table customers(customer_id int,first_name varchar(20),country varchar(20));
DELIMITER //
CREATE PROCEDURE us1_customers()
BEGIN
SELECT customer_id,first_name
FROM customers
WHERE first_name='Instagam';
END //


insert into customers values(1,"adil","India");
insert into customers values(2,"sreerag","USA");
insert into customers values(3,"adil","UK");
call us1_customers();



