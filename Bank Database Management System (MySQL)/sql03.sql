select now();

-- extracting the date 
select day(now()), month(now()), year(now()),
hour(now()), minute(now()), second(now());

select date(now()),time(now());

-- formating the date 
select date_format("2025-01-16","%d/%m/%y") as formatted_date;

-- comparison between dates
select date("2025-01-15")< date("2025-01-01");
select date("2025-01-15")> date("2025-01-01");


-- Dates operations

use sql_ssbtj;
CREATE TABLE SalesOrders (
	ID INTEGER,
	CustomerID Integer,
	OrderDate Date,
	FinancialCode Char( 2 ),
	Region Char( 7 ),
	SalesRepresentative Integer);
    
INSERT INTO SalesOrders VALUES
(2001, 101, '2000-03-16', 'r1', 'Eastern', 299),
(2002, 102, '2000-03-17', 'r2', 'Western', 399),
(2003, 103, '2000-03-18', 'r3', 'Western', 499),
(2004, 104, '2001-01-02', 'y1', 'Eastern', 599),
(2005, 105, '2001-01-03', 'y2', 'Western', 699),
(2006, 106, '2001-01-04', 'y3', 'Eastern', 799);

select * from SalesOrders;


# get all the orders from 2000 year 
select * from SalesOrders Where
year(OrderDate)=2000;
-- alternate method
select * from SalesOrders Where
OrderDate like "2000%";

select * from SalesOrders;

-- get all the order details from the march month:
select * from SalesOrders where
month(OrderDate)=3;

select * from SalesOrders Where
OrderDate like "%-03-%";

-- get all the order details between 18th march 2000 and 3rd jan 2001:
select * from SalesOrders where
OrderDate between date('2000-03-18') and date('2001-01-03');

select * from SalesOrders where
date("2000-03-18") <= OrderDate and OrderDate <= date("2001-01-03");












