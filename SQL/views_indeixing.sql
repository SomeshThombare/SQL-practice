-- views
-- 09/03/2026/Mon
-- create a database viewsIndexingDB
-- employee attributes: emp_id, emp_name, emp_salary, emp+_dob
-- department attributees: dept_id, dept_name

create database viewsIndexingDB;
use viewsIndexingDB;

create table employee (emp_id int primary key auto_increment,
emp_name varchar(255),
emp_salary decimal(9,2),
emp_dob date);

create table department (dept_id int primary key auto_increment,
dept_name varchar(255));

INSERT INTO employee (emp_name, emp_salary, emp_dob, dept_id) VALUES
('Amit', 25000, '1995-05-10', 1),
('Neha', 45000, '1998-02-12', 2),
('Rahul', 28000, '1992-03-14', 1),
('Priya', 52000, '1994-07-19', 3);

INSERT INTO department (dept_name) VALUES 
('IT'), ('HR'), ('Finance');

-- 1st task
-- crete a simple view, employee_salary table with emp_name adn emp_salary
ALTER TABLE employee ADD COLUMN dept_id INT;

create view emoloyees_salary  as
select emp_name , emp_salary
from employees; 


-- from this view give a hike of 20 percent to all employee earnig less then 30000rs
update employee_salary
set emp_salary = emp_salary + (emp_salary * 0.2)
where emp_salary > 30000;

SET SQL_SAFE_UPDATES = off;


-- 2 task
-- create new complex view , name it employee_deparmetns
-- with attributeL emp_id , name , birth_year, emp_dept_name
create or replace view employee_departments as
select e.emp_id, e.emp_name, 
    year(e.emp_dob) as birth_year, 
    d.dept_name as emp_dept_name
from employee 
left join department d 
on  e.dept_id = d.dept_id;

-- 3 task
-- ceck your profiling variale if it's on or off
-- set it on if is off
-- check profiles
-- create yo  a index on emp_name column
-- check yor query executon time from your profies table after creating a index on emp_name

select * from employee 
where emp_name  = 'amit';

show variables like 'profiling';

set profiling = 1;

show profiles;

create index emp_name_index on employee(emp_name);



