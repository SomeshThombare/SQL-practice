create database operater_practice;
use  operater_practice;

CREATE TABLE students2 (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(50),
    email VARCHAR(100),
    phone VARCHAR(15)
);

INSERT INTO students2 (name, email, phone) VALUES
('Aman', 'aman@gmail.com', '9876543210'),
('Anita', 'anita@yahoo.com', '9123456789'),
('Rahul', 'rahul123@gmail.com', '9988776655'),
('Sonal', 'sonal@outlook.com', '8899776655'),
('Ravi', 'ravi99@gmail.com', '7766554433'),
('Suresh', 'suresh@gmail.com', '6655443322'),
('Karan', 'karan_dev@gmail.com', '8877665544'),
('Pooja', 'pooja@gmail.com', '9988A76655'),
('Meena', 'meena@yahoo.com', '998877665'),
('Arjun', 'arjun@gmail.com', '1234567890');

-- chart
-- operator   1st condition      2nd cond         result
-- and           true               false            true
-- and           turu               false             f
-- and          f                    f                fasle
-- or            t                   t                  t
-- or           t                    f                  t
-- or           f                    f                  f
-- xor          t                   t                  f
-- xor         t                    f                    t
--  xor        f                    f                    f
-- operators:-
-- arithmetic, logical, relational

-- Arithmetic operators:-
-- +,-,*,/,div, mod or %
create table salaries (s_id int primary key auto_increment, 
salary decimal(9,2),
bonus decimal(9,2));

insert into salaries (salary, bonus) values(20000,300),(40000,500),(90000,600);
select * from salaries;

-- (+)
select salary as employee_salaries,
bonus as employee_bonuses,
salary - bonus as final_salry
from salaries;
-- (-)
select salary as employee_salaries,
bonus as employee_bonuses,
salary - bonus as final_salry
from salaries;

-- aliases  --> as 
-- used to change the columns and table name temporarily.


create table products_sales (p_id int primary key auto_increment,
p_name varchar(225) not null, 
p_total_sales int, 
price decimal(9,2));

INSERT INTO products_sales (p_name, p_total_sales, price) VALUES
('Apple iPhone 14', 120, 69999.00),
('Samsung Galaxy S23', 95, 74999.00),
('OnePlus 11R', 150, 39999.00),
('Dell Inspiron Laptop', 60, 55999.00),
('HP Pavilion Laptop', 55, 57999.00),
('Sony Headphones', 200, 8999.00),
('Boat Rockerz 450', 320, 1499.00),
('Canon DSLR Camera', 40, 45999.00),
('Mi Smart Watch', 180, 2999.00),
('Logitech Wireless Mouse', 500, 799.00);

select * from products_sales;
select *,price / p_total_sales as total_cost from products_sales ;


-- find all the products with odd id's
select * from products_sales where  p_id mod 2 <> 0;

-- Comparison operators(Relational operators):-
-- = , != or <>,  >, <, >=, <=, <=>, between , in, not in, is null, is not null,
-- like, not like, regexp, not regexp

select * from students2;
select * from products_sales;
alter table students2 add column city varchar(225) not null;
update students2 set city = 'Pune' where id = 10;
-- =
select * from products_sales where p_total_sales = 200;
-- <>
select * from products_sales where p_total_sales <> 200;
-- >
select * from products_sales where p_total_sales > 200;
-- >=
select * from products_sales where p_total_sales >= 200; 
-- < , <=
select * from products_sales where p_total_sales <= 200; 
-- between
select * from products_sales where p_total_sales between 50 and 200;
-- in
select * from students2 where city in ("Pune","Banglore");
-- not in 
select * from students2 where city not in ("Pune","Banglore");
-- is null
select * from products_sales where p_total_sales is null;
-- is not null
select * from products_sales where p_total_sales is not null;
-- like 
-- show variables like "%update%";
select * from products_sales where p_name like "Apple iPhone 14";
select * from products_sales where p_name like "%Laptop%";
select * from products_sales where p_name like "A%";
select * from products_sales where p_name like "%P";
select * from products_sales where p_name like "_p%";
select * from students2 where name like "_____";
select * from students2 where email like "%@gmail.com";


-- wildcards :- % Any number of charachters (0 or more)
--  _ exactly one charachter

-- not like
select * from students2 where email not like "%@%";

-- REGEXP/RLIKE (Advance pattren matching):-
-- Used for complex pattren matching searching using regular expressions.
select * from students2;
-- find all the students whos name starts with a vowel:-
-- use [] to check from a list of charachters
select * from students2 where name regexp '[aeiou]';
-- use ^ to check from the start of your string
select * from students2 where name regexp '^[aeiou]';
-- for any char to find...
select * from students2 where name regexp '^[m]';
-- use $ to check from the end of your string
select * from students2 where name regexp '[as]$';

-- find the students whos email contains a numeric value
select * from students2 where email regexp '[0123456789]';
select * from students2 where email regexp '[0-9]';

-- find the phone numbers of the students where there is char in their in phonenumber
select * from students2 where phone regexp '[^a-z]';
-- valid 10 digit phone number
select * from students2 where phone regexp '^[0-9]{10}$';


-- logical operators:-
-- and, or, not, xor

-- AND
-- Returns rows when all conditions are true
-- Find all the gmail users whos name starts with 'A':-
select * from students2 where email like '%@gmail.com' and name like 'A%';

-- OR
-- returns rows when any one condition is true.
select * from students2 where email like '%@gmail.com' or name like 'A%';

-- not operator
-- reverse the condition
select * from students2 where not email like '%gmail.com';

-- and + or(combined)
-- gmail users who names starts with a or s
select * from students2 where email like '%gmail.com'
and (name like 'A%' or name like 'S%');


-- xor operator
-- students whoes name start with a or email as gmail.com
select * from students2 where name like 'A%' 
xor email like "%@gmail.com%";