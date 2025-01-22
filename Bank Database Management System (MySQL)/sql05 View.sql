
-- VIEWS, Subqueries and transactions

CREATE DATABASE IF NOT EXISTS sql_ssbtj_subq_views;
USE sql_ssbtj_subq_views;

DROP TABLE IF EXISTS Sales;
DROP TABLE IF EXISTS Customers;
DROP TABLE IF EXISTS Products;

-- Create the Customers table
CREATE TABLE Customers (
  customer_id INT PRIMARY KEY,
  customer_name VARCHAR(100),
  email VARCHAR(100),
  phone VARCHAR(20)
);

-- Insert records into the Customers table
INSERT INTO Customers (customer_id, customer_name, email, phone)
VALUES
  (101, 'John Smith', 'john@example.com', '123-456-7890'),
  (102, 'Mary Johnson', 'mary@example.com', '987-654-3210'),
  (103, 'Robert Davis', 'robert@example.com', '555-555-5555'),
  (104, 'Emily Johnson', 'emily@example.com', '555-123-4567'),
  (105, 'Michael Brown', 'michael@example.com', '987-654-9876');

-- Create the Products table
CREATE TABLE Products (
  product_id INT,
  product_name VARCHAR(50),
  unit_price DECIMAL(8, 2),
  description VARCHAR(100)
);

-- Insert records into the Products table
INSERT INTO Products (product_id, product_name, unit_price, description)
VALUES
  (201, 'Product A', 9.99, 'Description of Product A'),
  (202, 'Product B', 14.99, 'Description of Product B'),
  (203, 'Product C', 19.99, 'Description of Product C'),
  (204, 'Product D', 12.99, 'Description of Product D'),
  (205, 'Product E', 7.99, 'Description of Product E'),
  (206, 'Product F', 24.99, 'Description of Product F'),
  (207, 'Product G', 11.99, 'Description of Product G'),
  (208, 'Product H', 16.99, 'Description of Product H'),
  (209, 'Product I', 13.99, 'Description of Product I'),
  (210, 'Product J', 8.99, 'Description of Product J'),
  (211, 'Product K', 17.99, 'Description of Product K'),
  (212, 'Product L', 22.99, 'Description of Product L'),
  (213, 'Product M', 10.99, 'Description of Product M');


-- Create the Sales table
CREATE TABLE Sales (
  order_id INT,
  customer_id INT,
  product_id INT,
  order_date DATE,
  quantity INT,
  unit_price DECIMAL(8, 2),
  discount DECIMAL(5, 2),
  total_price DECIMAL(10, 2),
  payment_status VARCHAR(20),
  shipping_address VARCHAR(100)
);

-- Insert the records into the Sales table
INSERT INTO Sales (order_id, customer_id, product_id, order_date, quantity, unit_price, discount, total_price, payment_status, shipping_address)
VALUES
  (1, 101, 201, '2023-01-01', 2, 10.99, 0.10, 19.78, 'Paid', '123 Main St, Mumbai'),
  (2, 102, 202, '2023-01-01', 1, 15.99, 0.20, 12.79, 'Paid', '456 Elm St, Delhi'),
  (3, 103, 203, '2023-01-01', 4, 5.99, 0.05, 22.75, 'Paid', '789 Oak St, Bangalore'),
  (4, 102, 204, '2023-01-02', 3, 8.99, 0.15, 25.61, 'Pending', '456 Elm St, Delhi'),
  (5, 101, 205, '2023-01-02', 2, 12.99, 0.10, 23.38, 'Paid', '123 Main St, Mumbai'),
  (6, 103, 206, '2023-01-03', 1, 9.99, 0.05, 9.49, 'Paid', '789 Oak St, Bangalore'),
  (7, 101, 207, '2023-01-04', 5, 7.99, 0.10, 35.96, 'Paid', '123 Main St, Mumbai'),
  (8, 102, 208, '2023-01-06', 2, 14.99, 0.15, 25.48, 'Paid', '456 Elm St, Delhi'),
  (9, 103, 209, '2023-01-06', 3, 11.99, 0.10, 32.37, 'Pending', '789 Oak St, Bangalore'),
  (10, 101, 210, '2023-01-07', 1, 6.99, 0.05, 6.64, 'Paid', '123 Main St, Mumbai'),
  (11, 102, 201, '2023-01-07', 2, 13.99, 0.10, 27.98, 'Paid', '456 Elm St, Delhi'),
  (12, 103, 202, '2023-01-07', 3, 9.99, 0.15, 26.97, 'Paid', '789 Oak St, Bangalore'),
  (13, 101, 203, '2023-01-07', 1, 8.99, 0.05, 8.54, 'Paid', '123 Main St, Mumbai'),
  (14, 102, 204, '2023-01-09', 4, 7.99, 0.10, 31.96, 'Paid', '456 Elm St, Delhi'),
  (15, 103, 205, '2023-01-09', 2, 11.99, 0.15, 21.58, 'Paid', '789 Oak St, Bangalore'),
  (16, 101, 206, '2023-01-09', 3, 6.99, 0.15, 18.86, 'Paid', '123 Main St, Mumbai'),
  (17, 102, 207, '2023-01-12', 1, 12.99, 0.05, 12.34, 'Paid', '456 Elm St, Delhi'),
  (18, 103, 208, '2023-01-12', 2, 10.99, 0.10, 19.78, 'Paid', '789 Oak St, Bangalore'),
  (19, 101, 209, '2023-01-12', 4, 9.99, 0.20, 39.96, 'Paid', '123 Main St, Mumbai'),
  (20, 102, 210, '2023-01-15', 1, 5.99, 0.05, 5.69, 'Pending', '456 Elm St, Delhi'),
  (21, 103, 201, '2023-01-15', 3, 7.99, 0.15, 22.75, 'Paid', '789 Oak St, Bangalore'),
  (22, 101, 202, '2023-01-15', 2, 14.99, 0.10, 27.98, 'Paid', '123 Main St, Mumbai'),
  (23, 102, 203, '2023-01-16', 1, 9.99, 0.05, 9.49, 'Paid', '456 Elm St, Delhi'),
  (24, 103, 204, '2023-01-16', 5, 11.99, 0.10, 53.96, 'Paid', '789 Oak St, Bangalore'),
  (25, 101, 201, '2023-01-20', 3, 8.99, 0.15, 25.61, 'Pending', '123 Main St, Mumbai'),
  (26, 102, 202, '2023-01-20', 2, 12.99, 0.10, 23.38, 'Paid', '456 Elm St, Delhi'),
  (27, 103, 203, '2023-01-21', 1, 9.99, 0.05, 9.49, 'Paid', '789 Oak St, Bangalore'),
  (28, 101, 204, '2023-01-21', 4, 7.99, 0.10, 31.96, 'Paid', '123 Main St, Mumbai'),
  (29, 102, 209, '2023-01-21', 2, 13.99, 0.15, 27.98, 'Paid', '456 Elm St, Delhi'),
  (30, 103, 210, '2023-01-21', 3, 9.99, 0.15, 26.97, 'Paid', '789 Oak St, Bangalore'),
  (31, 101, 203, '2023-01-22', 1, 8.99, 0.05, 8.54, 'Paid', '123 Main St, Mumbai'),
  (32, 102, 205, '2023-01-25', 2, 7.99, 0.10, 15.18, 'Paid', '456 Elm St, Delhi'),
  (33, 103, 202, '2023-01-26', 4, 12.99, 0.15, 55.86, 'Paid', '789 Oak St, Bangalore'),
  (34, 101, 204, '2023-01-26', 3, 10.99, 0.15, 29.68, 'Paid', '123 Main St, Mumbai'),
  (35, 102, 205, '2023-01-26', 2, 8.99, 0.05, 17.08, 'Paid', '456 Elm St, Delhi'),
  (36, 103, 206, '2023-01-28', 1, 15.99, 0.10, 14.39, 'Paid', '789 Oak St, Bangalore'),
  (37, 101, 207, '2023-01-28', 4, 9.99, 0.20, 39.96, 'Paid', '123 Main St, Mumbai'),
  (38, 102, 208, '2023-01-29', 2, 6.99, 0.05, 13.28, 'Paid', '456 Elm St, Delhi'),
  (39, 103, 209, '2023-01-30', 3, 10.99, 0.15, 29.68, 'Paid', '789 Oak St, Bangalore'),
  (40, 101, 210, '2023-01-30', 1, 7.99, 0.10, 7.19, 'Pending', '123 Main St, Mumbai'),
  (41, 102, 201, '2023-01-30', 2, 14.99, 0.15, 25.48, 'Paid', '456 Elm St, Delhi'),
  (42, 103, 202, '2023-01-30', 3, 11.99, 0.10, 32.37, 'Pending', '789 Oak St, Bangalore'),
  (43, 101, 203, '2023-02-01', 1, 6.99, 0.05, 6.64, 'Paid', '123 Main St, Mumbai'),
  (44, 102, 204, '2023-02-01', 2, 13.99, 0.10, 27.98, 'Paid', '456 Elm St, Delhi'),
  (45, 103, 205, '2023-02-02', 3, 9.99, 0.15, 26.97, 'Paid', '789 Oak St, Bangalore'),
  (46, 101, 206, '2023-02-02', 1, 8.99, 0.05, 8.54, 'Paid', '123 Main St, Mumbai'),
  (47, 102, 207, '2023-02-02', 4, 7.99, 0.10, 31.96, 'Paid', '456 Elm St, Delhi'),
  (48, 103, 208, '2023-02-03', 2, 14.99, 0.15, 27.98, 'Paid', '789 Oak St, Bangalore'),
  (49, 101, 209, '2023-02-03', 1, 9.99, 0.05, 9.49, 'Paid', '123 Main St, Mumbai'),
  (50, 102, 210, '2023-02-03', 5, 11.99, 0.10, 53.96, 'Paid', '456 Elm St, Delhi');
  
  
  
  
  
  
  -- get the product_-wise total sale(sum of total_price) with product name
  
  select p.product_id, p.product_name,  sum(s.total_price)
from Products p
inner join Sales s
on p.product_id=s.product_id
group by product_id, product_name;


-- verify the sum for id 203 
select * from sales where product_id=203;


-- Q. get all the customer details who have purchased product A using subquery

-- step 1: get the product id of product alter
select product_id from Products where product_name='Product A';   #result 201

-- step 2 : get all the unique cust_id who have purchased product A
select distinct customer_id from Sales
where product_id = 201;   # 101, 102, 103

-- step 3 : get all the custmer details for above cust_id
select * from Customers where customer_id in (101,102,103);


-- combine above queries using subquery



-- Q. Get all the customer dettails with pending payment_status

# step1: get all cust_id with pending payment_status
select distinct customer_id from sales where Payment_status='Pending';

# step2: get the customer details for above cust_id 
select *from customers  where customer_id  in (101,102,103);

WITH customer_ids_table AS (
    SELECT DISTINCT customer_id 
    FROM sales 
    WHERE Payment_status = 'Pending'
)
SELECT * 
FROM sales
WHERE customer_id IN (SELECT customer_id FROM customer_ids_table);



-- get customer name corresponding to the maximum total sale (sum total_prize)
#step 1: get the total sale for each customer from sales table(aggregation)
select customer_id, sum(total_price)
from Sales
group by customer_id;

# step 2: get the cust_id corresponding to the max total sale
with total_sales_table as (select customer_id, sum(total_price) as total_sale
from Sales group by customer_id)
select * from customers where customer_id= (select customer_id from total_sales_table
where total_sale = (select max(total_sale) from total_sales_table));
# step 3: get the customer details for above cust_id


select*,(select sum(total_price) from sales) as total_sale from sales;

select*, sum(total_price) over (partition by customer_id) as cust_total_sale from sales;


select*, sum(total_price) over (partition by customer_id) as cust_total_sale,
max(total_price) over (partition by customer_id) as cust_max_sale, 
min(total_price) over (partition by customer_id) as cust_min_sale
from sales; 




-- window functions 
DROP TABLE IF EXISTS orders;
CREATE TABLE orders (
	o_id INT,
    o_date DATE,
    pr_id INT,
    price FLOAT
);
INSERT INTO orders (o_id, o_date, pr_id, price) VALUES
(1,'2025-01-01',2,3),
(2,'2025-01-03',3,4),
(3,'2025-01-05',2,5),
(4,'2025-01-06',3,6),
(5,'2025-01-10',2,3);

select*, max(price) over(partition by pr_id) as max_pr_price 
from orders;

select*, max(price) over(partition by pr_id order by price ) as max_pr_price 
from orders;

select*, max(price) over(partition by pr_id order by price asc ) as max_pr_price    #desc give differnet (window )
from orders;
select*, max(price) over(partition by pr_id order by price desc ) as max_pr_price    #desc give differnet (window )
from orders;

-- get the next order date for each product
select *, Lead(o_date,1) over (partition by pr_id order by o_date asc) as next_order_date
from orders;                                                        
# for next order and 1 for next , 2 for two orders next.....
select *, lag (o_date,1) over (partition by pr_id order by o_date asc) as next_order_date
from orders;                                                        

select *, row_number() over (partition by pr_id order by o_date asc) as next_order_date
from orders;                                                        

 /*
 ==> along with window functions wecan mention the partition size using any of the following options 
     unbounded preceding
     unbounded following
     n preceding
     n following
 */
 
 
 
 