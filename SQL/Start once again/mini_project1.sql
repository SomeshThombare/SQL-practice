-- 13/03/2026/Fri
-- mini project -1

create database sales_analysis;
use sales_analysis;

create table customers (
    customer_id int primary key auto_increment,
    customer_name varchar(255),
    city varchar(255),
    c_date date
);

create table products (
    product_id int primary key auto_increment,
    product_name varchar(255),
    category varchar(255),
    price decimal(10,2)
) auto_increment = 101;

create table orders (
    order_id int auto_increment,
    customer_id int,
    product_id int,
    ordersdate date,
    quantity int,
    primary key (order_id, customer_id, product_id),
    constraint fk_customer_order foreign key(customer_id) references customers(customer_id) on delete cascade on update cascade,
    constraint fk_product_orders foreign key(product_id) references products(product_id) on delete cascade on update cascade
) auto_increment = 1001;

-- which products geneate the most revenve?
select p.product_name, sum(p.price *  o.quantity) as revenue
from products p 
join orders o
on p.product_id = o.product_id
group by p.product_name
order by revenue desc;  

-- who are the top customrs?
select c.customer_name,sum(p.price * o.quantity) as top_customers
from customers c
join orders o
on c.customer_id = o.customer_id 
join products p
on o.product_id = p.product_id
group by c.customer_name
order by top_customers desc;


-- what are the monthly salses trends?
select date_format(ordersdate, '%Y-%M')as month,
sum(p.price * o.quantity) as sales_trend
from orders o
join products p
on p.product_id = o.product_id
group by month
order by month desc;

-- 4. which category performs best?
select p.category, sum(p.price * o.quantity) as total_revenue
from products p
join orders o on p.product_id = o.product_id
group by p.category
order by total_revenue desc;






