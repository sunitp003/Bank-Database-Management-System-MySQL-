create database if not exists sql_ssbtj;

USE sql_ssbtj;

CREATE TABLE IF NOT EXISTS information(
	Cust_Id int Not Null,
	Name varchar(20) Not Null,
	Country varchar(20),
	City varchar(20)
);


-- DESCRIBE information;

CREATE TABLE IF NOT EXISTS customer(
	Cust_Id int PRIMARY KEY,
	Name varchar(20) Not Null,
	Country varchar(20),
	City varchar(20)
);

DESCRIBE customer;

CREATE TABLE IF NOT EXISTS  order_info (
	Order_id int NOT NULL,
	Order_num int NOT NULL,
	Customer_id int,
	PRIMARY KEY (Order_id),
	FOREIGN KEY (Customer_id) REFERENCES customer(Cust_id)
);



INSERT INTO customer (Cust_id, Name, Country, City)
VALUES (101, 'Allex', 'USA', 'New York'),
(102, 'Mia', 'Australia', 'Sydney'),
(103, 'Joy', 'India', 'Delhi');

-- Get all the columns
SELECT * FROM customer;

-- Get selected columns
SELECT Cust_Id, Name FROM customer;

-- Get filtered rows (records) using WHERE clause
SELECT * FROM customer WHERE Country='USA';

-- Add more records
INSERT INTO customer (Cust_id, Name, Country, City)
VALUES (104, 'Allex1', 'USA', 'New York'),
(105, 'Mia1', 'Australia', 'Sydney'),
(106, 'Joy1', 'India', 'Delhi');



select * from customer ;
select * from information;
select * from order_info;

-- get all customers from Delhi
select * from customer where city = 'Delhi';
-- get all customers from Delhi City
select * from customer where city != 'Delhi';
select * from customer where city <> 'Delhi';

-- update name of customer 104 to alexander 
update customer set name = 'Alexander' where cust_id=104;

select * from customer;


# Always be careful during the UPDATE command
# update command should not be written without any condition

select * from customer where city='delhi';  

update customer set city ='delhi' where cust_id = 103;
select * from customer ;

select * from bank_inventory ;

select * from customer where city = binary 'Delhi';
select * from customer where city = binary 'delhi';


select * from bank_inventory ;


-- get all the inventory with products ending with card 
-- wildcard query

select * from Bank_inventory 
where product like '%card';


-- get all the inventory with products containing the string 'sav' and not 'save'

select * from Bank_inventory 
where product like '%sav';

-- get all the inventory with products containing 'ma' at 2nd position 

select * from Bank_inventory 
where product like '_ma%';

-- ordering the data with increasing price
select * from bank_inventory Order by price asc;

-- ordering the data with increasing price and decreasing month
select * from bank_inventory Order by price asc, month desc;

-- Get the min sale_price for each month
select month, min(estimated_sale_price), count(product)
from bank_inventory
Group by month;

