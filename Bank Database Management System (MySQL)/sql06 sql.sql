DROP DATABASE IF EXISTS sql_ssbtj_tcl;
CREATE DATABASE sql_ssbtj_tcl;
USE sql_ssbtj_tcl;

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

select @@autocommit ; #1
set @@autocommit=0;
select @@autocommit ;#0

/* TODO : do some update in the table and check table
=> restart the server 
=> Check if the changes persists 
*/
delete from customer where cust_id=103;
select * from customer;
 
 
 /*
 TODO : Now make the changes again and do commit
 restart the server and check again
 */
 
 select @@autocommit ; #1
 set @@autocommit=0;
select @@autocommit ; #0

delete from customer where cust_id=103;
select * from customer;
commit;
# => restart and check
select * from customer;




delete from customer where cust_id=102;
select * from customer;
savepoint a;

delete from customer where cust_id=104;
select * from customer;
savepoint b;

delete from customer where cust_id=101;
select * from customer;
rollback to a;

rollback; # this will rollback to last commited data

select * from customer










