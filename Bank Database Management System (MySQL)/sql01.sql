show databases;

-- create database if not exists database_name -- it will give warning

create database superstore;

use superstore ;

-- create 3 tables: product , customer , order 


create table product(
	id int auto_increment primary key,
    name varchar(20) ,
    price float
);

describe product ;

insert into product (name,price) values
('pen',15),('notebook',40),('pencil',5);

select * from product;


create table customer(
	id int ,
    name varchar(30) not null ,
    age int,
    salary int,
    mobile varchar(15),
	address varchar(30)
);

insert into customer(id,name ,age , salary, mobile, address)values
(1,'Raju',25,1200000,9876543210,'Jalgaon'),
(2,'Kunal',30,10000,1234567890,'Buldhana');
-- (,'',,,,''),
-- (,'',,,,''),


select * from customer ;

-- inset limited detail 
insert into customer(name ,age , mobile)values
('Bhavesh',22,672364890);

-- update id of detail  

UPDATE customer 
SET id = 3 
WHERE name = 'Bhavesh';


select * from customer;


-- create table orders (id , date, product_idd, quantity, customer_id)

-- create table ordes(
-- 	id int auto_increment ,
-- 	date datetime,	
-- 	product_id int ,
-- 	quantity int,
--     customer_id int,
--     primary key(id),
--     foreign key (product_id ) references product(id),
--     foreign key (customer_id) references customer(id)
-- ); 
-- this will give error so do

-- set id in customer as primary key

alter table customer 
modify id int primary key;

describe customer;

-- now do  


create table orders(
	id int auto_increment ,
	date datetime,	
	product_id int ,
	quantity int,
    customer_id int,
    primary key(id),
    foreign key (product_id ) references product(id),
    foreign key (customer_id) references customer(id)
); 


insert into orders(date,product_id,quantity, customer_id)values
('2025-01-01 00:00:00',2,4,1);    -- for today's date use now() instead 'yyyy-mm-dd'

select * from orders;

insert into orders(date,product_id,quantity, customer_id)values
('2025-01-05 00:00:00',3,2,2);  

select * from customer ;
select * from orders;
select * from product;

