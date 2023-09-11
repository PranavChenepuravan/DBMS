create database Whatsapp;
use Whatsapp;
create table Book(
		isbn int primary key,
        title varchar(30),
        auther varchar(30),
        stock_qty int,
        price decimal,
        pub_year date
);

create table Customer(
        cust_id varchar(6) primary key,
        cust_name varchar(30),
        address varchar(30)
);

create table Orders(
	order_no int primary key,
    cust_id varchar(6),
    order_date date,
    foreign key(cust_id) references Customer(cust_id)
);

create table Order_list(
	order_no int,
    isbn int,
    qty int,
    ship_date date,
    foreign key(order_no) references Orders(order_no),
    foreign key(isbn) references Book(isbn)
);

drop table Order_list;

INSERT INTO Book (isbn, title, auther, stock_qty, price, pub_year)
VALUES
(1, 'The Great Gatsby', 'F. Scott Fitzgerald', 50, 12.99, '1925-04-10'),
(2, 'To Kill a Mockingbird', 'Harper Lee', 75, 14.99, '1960-07-11'),
(3, '1984', 'George Orwell', 60, 10.99, '1949-06-08'),
(4, 'Pride and Prejudice', 'Jane Austen', 40, 9.99, '1813-01-28'),
(5, 'The Catcher in the Rye', 'J.D. Salinger', 55, 11.99, '1951-07-16');

select * from book;

alter table Customer add constraint check (cust_id like "C%");

INSERT INTO Customer (cust_id, cust_name, address)
VALUES
('CUT01', 'Alice Johnson', '123 Main St');

INSERT INTO Customer (cust_id, cust_name, address)
VALUES
('CUT02', 'Bob Smith', '456 Elm St'),
('CUT03', 'Charlie Brown', '789 Oak St'),
('CUT04', 'David Davis', '101 Pine St');

INSERT INTO Customer (cust_id, cust_name, address)
VALUES
('HUT05', 'Eva Wilson', '222 Maple St');

INSERT INTO Customer (cust_id, cust_name, address)
VALUES
('CUT05', 'Eva Wilson', '222 Maple St');

select * from Customer;

INSERT INTO Orders (order_no, cust_id, order_date)
VALUES
(1, 'CUT01', '2023-09-09'),
(2, 'CUT02', '2023-09-08'),
(3, 'CUT03', '2023-09-07'),
(4, 'CUT04', '2023-09-06'),
(5, 'CUT05', '2023-09-05');


INSERT INTO Order_list (order_no, isbn, qty, ship_date)
VALUES
(1, 1, 2, '2023-09-10'),
(2, 3, 1, '2023-09-11'),
(3, 2, 3, '2023-09-12'),
(4, 4, 2, '2023-09-13'),
(5, 5, 4, '2023-09-14');

select cust_id,cust_name
from Customer 
 join Orders 
 on Customer.cust_id = Orders.cust_id
 join Order_list 
 on Order_list.order_no = Orders.order_no
 join  Book 
 on Book.isbn = Order_list.isbn;
 
SELECT 
		b.isbn,
        b.title ,
        b.auther,
        b.stock_qty,
		b.price,
        b.pub_year,
        cu.cust_id,
        cu.cust_name,
        cu.address,
        o.order_no,
		o.order_date,
        ol.qty,
        ol.ship_date
FROM Customer cu
JOIN Orders o ON cu.cust_id = o.cust_id
JOIN Order_list ol ON ol.order_no = o.order_no
JOIN Book b ON b.isbn = ol.isbn;


-- Inserting books for the orders
INSERT INTO Order_list (order_no, isbn, qty, ship_date)
VALUES
(1, 1, 2, '2023-09-10'),
(1, 2, 1, '2023-09-10'),
(1, 3, 1, '2023-09-10'),
(5, 3, 1, '2023-09-14');


SELECT 
        C.cust_id,
        C.cust_name
FROM Customer C
JOIN Orders O ON C.cust_id = O.cust_id
JOIN Order_list OL ON O.order_no = OL.order_no
GROUP BY O.order_date, C.cust_id, C.cust_name
HAVING COUNT(OL.isbn) < 3;

SELECT 
		b.isbn,
        b.title ,
        b.auther,
        b.stock_qty,
		b.price,
        b.pub_year,
        cu.cust_id,
        cu.cust_name,
        cu.address,
        o.order_no,
		o.order_date,
        ol.qty,
        ol.ship_date
FROM Customer cu
JOIN Orders o ON cu.cust_id = o.cust_id
JOIN Order_list ol ON ol.order_no = o.order_no
JOIN Book b ON b.isbn = ol.isbn having b.auther ="George Orwell";

SELECT 
        C.cust_id,
        C.cust_name,
        O.order_no
FROM Customer C
JOIN Orders O ON C.cust_id = O.cust_id
JOIN Order_list OL ON O.order_no = OL.order_no
GROUP BY O.order_no, C.cust_id, C.cust_name
HAVING min(O.order_no);