-- regular classs start form today -- 23/20/2026/monday
-- session 1
-- practice set 1 
create database session1 ;
use session1;

create table Employees (
emp_id int ,
emp_name varchar(255),
emp_salary decimal(9,2),
emp_attendence float , 
emp_cgpa float);

-- modify the column emp_cgpa datatype to double
alter  table Employees modify column  emp_cgpa double;

-- change  column emp_attendence to emp_attd
alter table Employees rename column emp_attendence to  emp_attd ;

select * from Emp_demo;

-- rename table employess to employees_demo
alter table Employees rename  Emp_demo;

-- insert 5 record in the table
/*
emp_id int ,
emp_name varchar(255),
emp_salary decimal(9,2),
emp_attendence float , 
emp_cgpa float */
insert into Emp_demo  values (101, 'somnath',   45000.00, 75.50, 8.00),
							 (102, 'Rahul',     50000.00, 80.00, 9.10),
                             (103, 'Sham',      90000.00, 88.00, 9.25),
                             (104, 'ram',       98779.00, 99.00, 10.03),
                             (105, 'Jorgee,',   100000.00, 87.00, 8.40);
       -- update the salrary       
set sql_safe_updates = off;
set sql_safe_updates = 0;

update emp_demo 
 set emp_salary = 90000.00
 where emp_id = 104; 
 
 -- delet the o1st emp from database table
 select * from Emp_demo ;

delete from Emp_demo where emp_id = 101;

                             