create database if not exists operators_aggregate_practice_db;
use operators_aggregate_practice_db;

CREATE TABLE orders (
    order_id INT PRIMARY KEY AUTO_INCREMENT,
    customer_name VARCHAR(50),
    city VARCHAR(50),
    product VARCHAR(50),
    category VARCHAR(30),
    quantity INT,
    price DECIMAL(10,2),
    discount DECIMAL(5,2),
    order_date DATE
);
INSERT INTO orders (customer_name, city, product, category, quantity, price, discount, order_date) VALUES
('Amit', 'Delhi', 'Laptop', 'Electronics', 1, 60000, 500, '2025-01-10'),
('Neha', 'Mumbai', 'Phone', 'Electronics', 2, 25000, NULL, '2025-01-12'),
('Rahul', 'Delhi', 'Shoes', 'Fashion', 3, 3000, 500, '2025-01-15'),
('Pooja', 'Pune', 'Watch', 'Fashion', 1, 8000, 0, '2025-01-18'),
('Rohit', 'Mumbai', 'Laptop', 'Electronics', 1, 62000, 400, '2025-01-20'),
('Anita', 'Delhi', 'Headphones', 'Electronics', 2, 4000, NULL, '2025-01-22'),
('Suresh', 'Chennai', 'Shoes', 'Fashion', 2, 3200, 200, '2025-01-25'),
('Kiran', 'Pune', 'Tablet', 'Electronics', 1, 20000, 150, '2025-01-27');
select * from orders;

-- Sectaion A
-- 1 find the total no of orders
select count(*) as total_orders from orders;

-- revenue
select * ,quantity * price  as total_revenue from orders;
select sum(quantity * price) as total_revenue from orders;

-- avg of product
select round(avg(price),2) as average_price from orders; 

-- 4 maximum and min price
select  max(price) as maximum_price from orders;
select  min(price) as minimum_price from orders;

select * from orders where price = (select max(price) as max_price from orders);

-- 5. discount -- COALESCE
select sum(discount) from orders;
select avg(discount) from orders;-- without countigt the null values
 -- use coaleses
 select  round(avg(COALESCE(discount,0)),2)  as avg_discount from orders;

-- Section B
-- 1.  show the totla revenue per city

select city, 
sum(quantity * (price - COALESCE(discount,0))) as total_revenu from orders
group by city
order by total_revenu desc;

-- 2 .show the total quantity sold per category
select category, sum(quantity) as total_quantity
from orders group by category;

-- 3. show categorys having average price > 10000
select category, round(avg(price),2) as avg_price
from orders group by category
having  round(avg(price > 10000),2);

-- 4  show cities more two orders
select city, count(*) as total_orders from orders
group by city
having  count(*) > 2;

-- 5. show categories where total discount > 3000

select category, 
 sum(quantity * COALESCE(discount, 0)) as total_discount from orders
group by category
having SUM(quantity * COALESCE(discount, 0)) > 1000;


--  Sectioin C
-- 1. city = delhi or mumbai  and price between 5000 AND 50000
select * from orders where (city = 'delhi' OR 'mumbai') AND price between 5000 AND 50000; 
-- where city in('delhi','mumbai') 
-- 2. product name start with 'L' 
select * from orders  where product like 'l%';

-- 3. cutomer names contains exactly 5 letter 
select * from orders where customer_name REGEXP '^[a-zA-Z]{5}$';
select * from orders where cusotmer_name like '-----';
-- 4. order where discount is null (handle using regexp)
select * from orders where discount is null;

select * from orders where coalesce(discount,0) = 0 and discount is null;

-- 5. show a column final_price :
select * ,(quantity * price) - COALESCE(discount, 0) as final_price 
from orders;


select * from orders;

-- Section D
-- 1. show top 3 most expensive orders
select * , (price * quantity)as order_price from orders 
order by (price * quantity) desc limit 3;


-- 2. show 2nd  and 3rd highest priced orders using limit and offset
select *, (price * quantity)as order_priee from orders 
order by (price * quantity) desc 
limit 1,2;