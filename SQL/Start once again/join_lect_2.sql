-- joins lecture 2
create database joinDB;
use joinDB;
CREATE TABLE departments (
 dept_id INT AUTO_INCREMENT,
 dept_name VARCHAR(100) NOT NULL,
 PRIMARY KEY (dept_id)
) AUTO_INCREMENT = 101;

CREATE TABLE employees (
 emp_id INT AUTO_INCREMENT,
 emp_name VARCHAR(100) NOT NULL,
 salary DECIMAL(10,2),
 dept_id INT,
 PRIMARY KEY (emp_id),
 FOREIGN KEY (dept_id) REFERENCES departments(dept_id)
) AUTO_INCREMENT = 10001;

INSERT INTO departments (dept_name) VALUES
('Human Resources'),
('Finance'),
('IT'),
('Marketing'),
('Sales');
INSERT INTO employees (emp_name, salary, dept_id) VALUES
('Amit Sharma', 55000, 101),
('Neha Verma', 60000, 101),
('Rohit Mehta', 75000, 102),
('Pooja Singh', 72000, 102),
('Karan Patel', 80000, 103),
('Anjali Kapoor', 82000, 103),
('Vikas Gupta', 68000, 104),
('Sneha Reddy', 70000, 104),
('Rahul Nair', 90000, 105),
('Priya Iyer', 88000, 105),
('Arjun Das', 62000, 101),
('Kavita Joshi', 64000, 102),
('Manish Yadav', 76000, 103),
('Ritika Jain', 71000, 104),
('Deepak Choudhary', 83000, 105),
('Simran Kaur', 59000, 101),
('Varun Malhotra', 67000, 102),
('Nikita Bansal', 79000, 103),
('Suresh Pillai', 72000, 104),
('Ayesha Khan', 91000, 105);

select * from employees;
select * from departments;

-- 1) inner join
select * 
from employees as e
inner join departments as d
on e.dept_id = d.dept_id;

-- 2 way
select  employees.dept_id, emp_name, dept_name
from employees 
inner join departments 
on employees.dept_id = departments.dept_id;

-- 3w way
select d.dept_id, emp_name, dept_name
from departments d
 join employees e
on e.dept_id = d.dept_id;

-- 2) left outer join 
select * 
from departments as d
left outer join employees as e
on e.dept_id =  d.dept_id;

-- 2nd wy
select d.dept_id, d.dept_name, e.emp_name
from departments as d
left join employees as e
on e.dept_id = d.dept_id;


-- 3) right outer join
select *
from departments as d
right join employees as e
on d.dept_id = e.dept_id;

select * from employees;
select * from departments;

-- 4) left null join
-- find all the depts where no employee works 
select d.dept_id, dept_name, emp_id
from departments as d
left join employees as e
on e.dept_id = d.dept_id
where e.dept_id is null;

-- find all the employees who doesn't belong to any department
select emp_id, emp_name
from employees as e
left join departments as d
on d.dept_id = e.dept_id
where e.dept_id is null;


-- 5) right null join
-- find all the employees who doesn't belong to any department
select *
from departments as d
right join employees as e
on  d.dept_id = e.dept_id
where e.dept_id is null;

-- 6) cross join
select * 
from employees 
cross join departments;

-- 7) self join
create table employees_manager(emp_id int primary key auto_increment,
emp_name varchar(225), manager_id int,
foreign key(manager_id) references employees_manager(emp_id)
on delete set null on update cascade
);

INSERT INTO employees_manager (emp_name, manager_id) VALUES
('Rohit Sharma', NULL), -- CEO
('Anita Verma', 1), -- Manager
('Vikas Singh', 1),
('Priya Kapoor', 2),
('Rahul Mehta', 2),
('Sneha Joshi', 3),
('Karan Patel', 3),
('Amit Gupta', 4),
('Neha Reddy', 4),
('Pooja Nair', 5),
('Arjun Das', 5),
('Simran Kaur', 6),
('Varun Malhotra', 6),
('Ritika Jain', 7),
('Deepak Sharma', 7),
('Kavita Bansal', 8),
('Manish Yadav', 8),
('Nikita Sinha', 9),
('Suresh Pillai', 9),
('Ayesha Khan', 10);

-- self join
select em1.emp_id as manager_id, em1.emp_name as manager_name,
em2.emp_id as employee_id, em2.emp_name as employee_name
from employees_manager em1
join employees_manager em2
on em1.emp_id = em2.manager_id;


-- 8 natural join
select *
from employees 
natural join departments;

select  * from employees;
select * from departments;

-- create a table secret santa where
-- one employee gives a gift to another employee 
-- and you need to find the name of the santa as well as the reciver name
-- secret_santa_table
-- emp_id emp_name santa_id

create table secret_santa(
emp_id int primary key auto_increment,
santa_id int,
emp_name varchar(225),
constraint fk_secret_santa foreign key(santa_id)  references secret_santa (emp_id) 
on delete cascade on update cascade
);

insert into secret_santa (emp_id, emp_name, santa_id) values
(1, 'Aarav Sharma', null),
(2, 'Aditya Patel', 1),
(3, 'Arjun Singh', 2),
(4, 'Ananya Iyer', 3),
(5, 'Vihaan Reddy', 4),
(6, 'Saanvi Gupta', 5),
(7, 'Ishani Verma', 6),
(8, 'Vivaan Malhotra', 7),
(9, 'Diya Kulkarni', 8),
(10, 'Ayaan Joshi', 9),
(11, 'Kiara Mehta', 10),
(12, 'Rohan Das', 11),
(13, 'Sneha Rao', 12),
(14, 'Kabir Nair', 13),
(15, 'Indira POMAJI', 14);


select 
santas.emp_name as santa_name,
receivers.emp_name as  Receiver_name
from secret_santa as receivers
join secret_santa as santas
on receivers.santa_id = santas.emp_id;
