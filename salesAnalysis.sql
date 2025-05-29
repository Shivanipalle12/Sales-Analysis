create database company;
use company;
select * from sales;
ALTER TABLE sales RENAME COLUMN ï»¿Order_ID To Order_ID;

-- q1: find all orders shipped via 'Economy' mode with a total amount greater than 25000

select * from sales
where ship_mode='Economy' and total_amount>25000;
-- q2: Retrieve all sales data for 'Technology' category in 'Ireland' made after 2020-01-01
select * from sales
where category='Technology' and country='Ireland' and Order_Date >'2020-1-01';
-- q3: list the top 10 most profitable sales transactions in descending order
select * from sales
order by Unit_profit desc limit 10;

-- q3: find all customers whose name starts with 'J' and ends with'n;
select order_id, Customer_Name from sales
 where  Customer_Name like "J%n";
 
 -- q4: Retrieve all product names that contain 'Acco' anywhere in the name
 select order_id, product_name from sales
 where  Product_name like "%Acco%";
  -- q4 Get the top 5 cities with the highest toatl sales amount (order_id,totalamount,city)
select sum(total_amount) As Total_sales ,City,order_id from sales
Group by City
order by Total_sales desc limit 5;
-- q5: Display the second set of 10 records for Customer_Name and Total_Amount in decresing order
select Customer_name,Total_amount  from sales
order by Total_amount desc limit 10,10; 

-- q6: Find the total revenue ,average unit cost, and total number of orders 
select sum(total_amount) as total_revenue ,avg(unit_cost) as average_unit_cost, count(order_id) as 'total number of orders' from sales;

-- q9: count unique number of regions
select count( distinct  Region)  as 'no of unique regions' from sales;
-- q10: FIND THE NUMBER OF ORDERS PLACED BY EACH CUSTOMER 

select count(order_id) as no_of_orders,customer_name from sales 
group by customer_name 
order by no_of_orders desc;

-- Q12: rank 5 products based on total sales using Rank().
select  product_name,sum(total_amount) as total_sales,
rank() over (order by sum(total_amount) desc) as sales_rank
from sales
group by product_name
 limit 5;

