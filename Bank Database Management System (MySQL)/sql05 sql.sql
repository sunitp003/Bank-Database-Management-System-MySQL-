DROP DATABASE IF EXISTS sql_ssbtj_tcl;
CREATE DATABASE sql_ssbtj_tcl;
USE sql_ssbtj_tcl;

CREATE TABLE Customer (cust_id INT ,
	cust_name VARCHAR(20),
	contact_name VARCHAR(20),
	city VARCHAR(10),
	telephone VARCHAR(10));

INSERT INTO Customer VALUES (101, "Oliver", "Joy", "New York", 2016776708),
(102,"George", "George", "Chicago" , "209761700"),
(103,"Harry", "Harry", "Texas" , "2097617866"),
(104,"Jack", "Noah", "California", "2097627999");

