create database practice_set_4;

use practice_set_4;
 -- Table 1: customers
CREATE TABLE customers (
    customer_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(50),
    email VARCHAR(100),
    city VARCHAR(50),
    join_date DATE
); 
INSERT INTO customers (name, email, city, join_date) VALUES
('Amit Sharma', 'amit@gmail.com', 'Delhi', '2023-01-15'),
('Neha Verma', 'neha@gmail.com', 'Mumbai', '2022-11-20'),
('Rahul Mehta', 'rahul@gmail.com', 'Pune', '2023-03-05'),
('Priya Singh', 'priya@gmail.com', 'Delhi', '2024-02-10'),
('Karan Patel', 'karan@gmail.com', 'Ahmedabad', '2023-07-25');

--  Table 2: products
CREATE TABLE products (
    product_id INT PRIMARY KEY AUTO_INCREMENT,
    product_name VARCHAR(50),
    category VARCHAR(30),
    price DECIMAL(10,2),
    stock INT
);
INSERT INTO products (product_name, category, price, stock) VALUES
('Laptop', 'Electronics', 55000, 10),
('Headphones', 'Electronics', 2500, 50),
('Office Chair', 'Furniture', 7500, 15),
('Coffee Mug', 'Kitchen', 350, 100),
('Desk Lamp', 'Furniture', 1800, 30);

 -- Table 3: orders
CREATE TABLE orderss (
    order_id INT PRIMARY KEY AUTO_INCREMENT,
    customer_id INT,
    product_id INT,
    quantity INT,
    order_date DATETIME,
    discount DECIMAL(5,2),
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id),
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);
 ALTER TABLE orderss
MODIFY discount DECIMAL(10,2);

INSERT INTO orderss (customer_id, product_id, quantity, order_date, discount) VALUES
(1, 1, 1, '2024-01-10 10:30:00', 2000),
(2, 2, 2, '2024-01-12 15:45:00', NULL),
(3, 3, 1, '2024-02-01 12:00:00', 500),
(4, 4, 5, '2024-02-15 09:20:00', 100),
(5, 5, 2, '2024-03-01 18:10:00', NULL),
(1, 2, 3, '2024-03-05 20:00:00', 300);

-- task 1 display each orders 's total pricre (price * quantity) round to 2 decimal places

-- task 2 - numeric function (ceil / floor)alter
-- show prodcut prices and theri ceil and floor values


-- task 3- string function (upper/length)
-- disply cusotomer names in uppercase alomg with thera name
select *, upper(name) AS customer_name_upper
from  customers;

-- task 4 -- substiring and cocate
-- create a column called 'short_email' showing first 5 char of email + '...'
select *,
    concat(substring(email, 1, 5), '...') as short_email
from customers;

-- task 5 - date adn time (year and months)
-- disply all orders with order year and order year
select * from orderss;

select * ,
year(order_date) as order_year,
month(order_date) as order_month from orderss;

-- task 6
-- show how many days ago each order placed was today
select *,
datediff(now(), order_date) as days_ago
from orderss;

-- task 7 if() 
-- disply produt name and: (stock statue)
 -- low stock if stock  < 20
 -- suffficient stock otheer wise
 
 select product_name ,
  if(stock > 20, 'low stock' , 'sufficient stock') as stock_status
  from products;
  
  -- task 8 - if()  wiTH NULL handling
  -- disply order_id  
  select order_id , if (discount is null, 0, discount) as discount from orderss;
  
 -- if null()
 select order_id, ifnull (discount, 0) as discount from orderss;

-- task 9 case statemen
-- create a column 'ordertype'
-- bulk order if quantity >= 3
 -- medium order if quantity =2
 -- single order if quantityu =1 
 
 SELECT *,
    case
        when quantity >= 3 then 'bulk order'
        when quantity = 2 then 'medium order'
        when quantity = 1 then 'single order' 
        end  as order_categery
from orderss;
 
 -- task 10 combin funcion (realistic)
 /* custoemr name 
 produt name
 order name (formated as DD-MM-YYYY)
 order time category usign case
 tiem range           label
 06:00 -11-59         morning
 12:00 - 17:59        afternoon
 18:00 - 23:59       evening 
 elase     	        night
                     
*/
select * from products;

select 
    date_format(date(order_date), '%D-%M-%Y') as order_date,
    time(order_date)as order_time,
    case
        when time(order_date) between '06:00:00' and '11:59:59' then 'morning'
        when time(order_date) between '12:00:00' and '17:59:59' then 'afternoon'
        when time(order_date) between '18:00:00' and '23:59:59' then 'evening'
        else 'night'
    end as order_time_category
from orderss;








