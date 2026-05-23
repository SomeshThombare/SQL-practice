-- 19/03/2026/Thu
-- window function practice

create database windowFun;
use windowFUn;

CREATE TABLE departments (
    department_id INT PRIMARY KEY AUTO_INCREMENT,
    department_name VARCHAR(100)
);
INSERT INTO departments (department_name) VALUES
('Engineering'),
('Sales'),
('HR'),
('Marketing');

CREATE TABLE employees (
    employee_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100),
    department_id INT,
    salary INT,
    joining_date DATE,
    FOREIGN KEY (department_id) REFERENCES departments(department_id)
);
INSERT INTO employees (name, department_id, salary, joining_date) VALUES
('Amit', 1, 70000, '2022-01-15'),
('Priya', 2, 65000, '2021-03-10'),
('Rahul', 1, 80000, '2020-07-20'),
('Sneha', 3, 50000, '2022-09-12'),
('Vikas', 2, 72000, '2021-11-01'),
('Neha', 4, 60000, '2023-02-14'),
('Arjun', 1, 90000, '2019-05-25'),
('Pooja', 3, 52000, '2020-08-18'),
('Rohan', 4, 58000, '2022-06-30'),
('Kavya', 2, 75000, '2021-12-05'),
('Manish', 1, 85000, '2020-03-17'),
('Anjali', 4, 62000, '2023-01-10'),
('Deepak', 2, 67000, '2019-09-22'),
('Meena', 3, 54000, '2021-04-11'),
('Suresh', 1, 88000, '2018-07-07'),
('Nikita', 4, 61000, '2022-10-19'),
('Tarun', 2, 70000, '2020-02-28'),
('Isha', 3, 56000, '2023-03-01'),
('Karan', 1, 92000, '2019-12-12'),
('Simran', 4, 64000, '2021-06-15');

select * from employees;

-- q1. assign row number to employee basaed on salary (highest first)
-- use row_number()
select *, 
row_number() over(order by salary desc) as salary_ranking
from employees;

-- q.2 rank empoyees based on salary (handle ties)
-- use rank()
select *, 
rank() over(order by salary desc) as salary_ranking
from employees;

-- q3. dense rank emmployeees based on salary
-- use dense_rank()
select *,
dense_rank() over(order by salary desc) as emp_based_salary
from employees;

-- q.4  show each employees salary along with the highest salary in the company
-- use max() over()
select *,
max(salary) over(order by salary desc) as highest_salary
from employees;

-- q.5 show each employees salary along with average salary of company
select *,
avg(salary) over(order by salary desc) as average_salary
from employees;

-- q.6 show total salary of all employees using  window function
-- use sum() over()
select*,
sum(salary) over(order by salary asc) as total_salary
from employees;

-- e.7 assign row numbers withinn each department
-- use partition by dept_id
select *,
row_number() over( partition by  department_id order by  department_id)  as dept_wise_no_of_emps
from employees;

-- q.8 rank emp within each dept by salary
-- rank() over(partition by dept_if order by salary desc)
select *,
rank() over(partition by  department_id order by salary desc) as emp_ranks
from employees;

-- q.9 find the highest paid emp in each dept
-- hint dense_rank()= 1;
select * from 
(select *,
rank() over(partition by  department_id order by salary desc ) as dept_emp_rank
from employees)as temp_emp
join departments d
on d.department_id = temp_emp.department_id
where dept_emp_rank = 1;

-- q.10 find the top 2 highsest paid emps in each dept
select * from 
(select *, 
dense_rank() over(partition by department_id order by salary desc) as highest_paid_emp
from employees) as temp_emp
where highest_paid_emp < 3;

-- 11. show each emps salary and previous emps salary 
-- use lag()

select *,
lag(salary) over(partition by department_id order by salary asc) as emp_salary
from employees;

select *,
lag(salary) over(order by salary asc) as previous_emp_salary
from employees;


-- q.12 show each employeess salary and next emps salary
-- use lead()
select *,
lead(salary) over(order by salary asc) as next_emp_salary
from employees;

-- q .13 find the salary difference between current emp and previous emp
select *,
salary - lag(salary) over (order by salary asc) as diff_salary
from employees;

-- q.14 show cumulative salary (running total) orderd by salary
-- sum(salary) order by saalry;
select *,
sum(salary) over(order by salary) as total_sal
from employees;


-- q.15 show cumulative salary within each dept
-- add partition by dpet_id
select *,
sum(salary) over(partition by department_id order by salary) as dept_sal
from employees;

-- q.16 find the emps whose salary is greater then previous emps
select * from 
(select *,
lag(salary) over(partition by department_id order by salary) as previous_sal ,
lag(name) over (partition by department_id order by salary) as pre_emp,
salary - lag(salary) over(partition by department_id order by salary)
 from employees) as temp_emp
 where salary > previous_sal;
 

-- q.17 find emps who joined earliest in each dept
-- use row_number() with order by joining_date
select * from 
(select *,
row_number() over(partition by department_id order by joining_date asc) as earliest_joined_emps
from employees)as temp_table
where earliest_joined_emps =  1;

-- q.18 find second highest salary in each depat
-- use dense_rank() = 2
select * from
(select *,
dense_rank() over(partition by department_id order by salary asc) as dept_sal_emp
from employees) as temp_emp
where dept_sal_emp = 2;

-- q.19 show salary difference form highest salary in thier dept
-- use max() over(partition by dept_id)
select *,
max(salary) over(partition by department_id order by salary desc) as dept_highest_salary,
salary - max(salary) over(partition by department_id order by salary desc) as salary_difference
from employees;


-- q.10 find the emps earning above dept_average
-- compare with avg()ovet(partition by dept_id)
select * from
(select *,
avg(salary) over(partition by department_id ) as avg_salary
from employees) as temp_salary
where salary > avg_salary;