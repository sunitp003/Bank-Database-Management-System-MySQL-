-- SQL TABLE JOINS
use sql_ssbtj;
drop table order_info;
drop table if exists customer;


CREATE TABLE Customer (cust_id INT ,
	cust_name VARCHAR(20),
	contact_name VARCHAR(20),
	city VARCHAR(10),
	telephone VARCHAR(10));

INSERT INTO Customer VALUES (101, "Oliver", "Joy", "New York", 2016776708),
(102,"George", "George", "Chicago" , "209761700"),
(103,"Harry", "Harry", "Texas" , "2097617866"),
(104,"Jack", "Noah", "California", "2097627999");

drop table orders;
CREATE TABLE Orders ( cust_id INT ,
	order_id INT,
	order_date varchar(20),
	shipper_id varchar(20));

INSERT INTO Orders VALUES (101, 4501, '12/03/1997', 'A111' ),
(102, 4502, '13/03/1997', 'A112'),
(103, 4503, '14/03/1997', 'A113'),
(105, 4505, '16/03/1997', 'A115'),
(106, 4506, '17/03/1997', 'A116');

SELECT * FROM Customer;
SELECT * FROM Orders;

/*
 get (cust_id, cust_name) from customer and (cust_id, order_id )
 from orders and show  them side-by-same in single result 
*/
select c.cust_id, c.cust_name , o.cust_id, o.order_id
from customer c, Orders o;  # this will return  cross join

select c.cust_id, c.cust_name , o.cust_id, o.order_id
from customer c, Orders o
where c.Cust_Id=o.cust_id;  # gives result of common cust_id only


/*
 get (cust_id, cust_name) from customer and (cust_id, order_id )
 from orders and show  them one below another in single resuly
*/

SELECT c.cust_id, c.cust_name FROM customer c
UNION 
SELECT o.order_id, o.cust_id FROM orders o;

/* error due to different number of columns
SELECT c.cust_id, c.cust_name, c.city FROM customer c
UNION 
SELECT o.order_id, o.cust_id FROM orders o;   # ERROR
*/


/* Get Cust_id, city, order_id and order_date with inner join */

select c.cust_id ,c.city , o.order_id , o.order_date
from customer c
inner join Orders o
on c.Cust_Id=o.Cust_Id;



SELECT * FROM Customer;
SELECT * FROM Orders;

-- change city California to Texas for cust_id 104
update customer set city='Texas' where cust_id=104;

/* Get all the orders from Texas city */

select c.cust_id ,c.city , o.*/*o.order_id , o.order_date */
from customer c
inner join Orders o      #Note: Result will be same in INNER join and Right Join
on c.Cust_Id=o.Cust_Id
where c.city='Texas';






-- SELF JOIN
USE sql_ssbtj;

drop table employee;

CREATE TABLE employee (
	Id int,
	Name VARCHAR(20),
	Age int,
	City VARCHAR(20),
	Salary int,
    Manager int);

INSERT INTO employee (Id, Name, Age, City, Salary, Manager)
Values (1, 'Allex', 34, 'New York', 50000, 3),
(2, 'Mia', 25, 'Texas', 30000, 3),
(3, 'Sara', 30, 'California', 67000, 5),
(4, 'Allen', 29, 'New York', 45000, 2),
(5, 'John',45, 'Texas', 55000, Null);

SELECT * FROM employee;

-- Display All employess (id,name) with their managers names.
-- columns: emp_id , emp_name , manager_name 

select e.ID as emp_id,
       e.name as emp_name,
       m.name as manager_name
from employee e, employee m
where e.manager=m.id
;


-- for all emplyees even with no manager
select e.ID as emp_id,
       e.name as emp_name,
       m.name as manager_name
from employee e left join employee m 
on e.manager=m.id
;