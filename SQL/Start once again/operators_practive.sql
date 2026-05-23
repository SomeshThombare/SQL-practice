-- practice operators
create database operators_practiceDB;
use operators_practiceDB;
CREATE TABLE employees (
    emp_id INT PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    email VARCHAR(100),
    department VARCHAR(50),
    salary DECIMAL(10,2),
    bonus DECIMAL(10,2),
    experience_years INT,
    city VARCHAR(50),
    joining_date DATE,
    performance_score INT
);

INSERT INTO employees 
(first_name, last_name, email, department, salary, bonus, experience_years, city, joining_date, performance_score)
VALUES
('Amit','Sharma','amit.sharma@gmail.com','IT',75000,5000,5,'Pune','2020-06-15',85),
('Neha','Verma','neha.verma@yahoo.com','HR',50000,3000,3,'Mumbai','2021-03-10',78),
('Rahul','Mehta','rahul.mehta@gmail.com','Finance',82000,7000,7,'Delhi','2018-01-20',90),
('Priya','Singh','priya.singh@hotmail.com','IT',67000,4000,4,'Pune','2019-11-05',88),
('Karan','Malhotra','karan.m@gmail.com','Sales',60000,10000,6,'Chennai','2017-07-12',92),
('Anjali','Kapoor','anjali.k@gmail.com','HR',48000,2000,2,'Pune','2022-09-18',70),
('Rohit','Bansal','rohit.bansal@yahoo.com','IT',91000,8000,8,'Bangalore','2016-04-25',95),
('Sneha','Iyer','sneha.iyer@gmail.com','Marketing',55000,6000,4,'Mumbai','2020-02-14',80),
('Vikas','Yadav','vikas.yadav@gmail.com','Sales',72000,9000,5,'Delhi','2019-08-30',89),
('Meera','Nair','meera.nair@gmail.com','Finance',64000,3500,3,'Chennai','2021-05-22',76),
('Arjun','Reddy','arjun.reddy@gmail.com','IT',88000,7500,6,'Hyderabad','2018-12-11',91),
('Pooja','Joshi','pooja.joshi@gmail.com','Marketing',53000,4000,3,'Pune','2022-01-19',74),
('Manish','Gupta','manish.gupta@gmail.com','IT',95000,9000,9,'Noida','2015-03-03',97),
('Divya','Patel','divya.patel@gmail.com','HR',52000,2500,4,'Ahmedabad','2020-07-27',82),
('Suresh','Kumar','suresh.kumar@yahoo.com','Finance',78000,6500,6,'Delhi','2017-10-09',86),
('Nikita','Arora','nikita.arora@gmail.com','IT',69000,5000,5,'Mumbai','2019-06-21',84),
('Ajay','Thakur','ajay.thakur@gmail.com','Sales',73000,8500,7,'Pune','2016-09-14',90),
('Riya','Chopra','riya.chopra@gmail.com','Marketing',56000,4500,4,'Chennai','2021-11-02',79),
('Tarun','Saxena','tarun.saxena@gmail.com','IT',87000,7000,6,'Bangalore','2018-05-18',88),
('Kavita','Mishra','kavita.mishra@gmail.com','HR',49000,3000,3,'Delhi','2022-04-07',73),
('Deepak','Jain','deepak.jain@gmail.com','Finance',81000,6000,7,'Mumbai','2017-02-28',93),
('Simran','Gill','simran.gill@gmail.com','Marketing',54000,3500,3,'Pune','2020-08-16',81),
('Harsh','Agarwal','harsh.agarwal@gmail.com','Sales',76000,9500,6,'Noida','2018-03-12',87),
('Komal','Shah','komal.shah@gmail.com','IT',92000,8500,8,'Ahmedabad','2016-12-01',96),
('Yash','Chauhan','yash.chauhan@gmail.com','IT',68000,4000,4,'Hyderabad','2021-07-29',83);

-- 1) find the emp whos fisrt nane start with 'a'
select * from employees 
where first_name like 'a%';

-- 2) ends wirh a 
select * from employees 
where last_name like '%a';

-- 3) find the emp whose emil conatgin yahoo 
select * from employees 
where email like '%yahoo%';

-- arithmaeric opratior
-- 4) show salary  + bonus as total_income
select salary , bonus,  salary + bonus from employees as total_income;

-- 5) shwo emo whos salary + bonus > 90000
select salary , bonus, ( salary + bonus ) as total_income
from employees 
where (salary + bonus) > 90000;

-- 6) show employees whose bonus is more then 10% of salary
select first_name, salary, bonus
from employees
where bonus > (salary * 0.10);

-- comparison iperators
-- 7) fisd the emp with salary > 80000
select first_name, salary 
from employees
where salary > 80000;

-- 8) fidn the emp with experience_years > = 5
select * from employees
where experience_years >= 5;


-- 9). find the employees not form pune.
select * from employees
where not city = 'pune';

-- logical opertors
-- 10 emp from it dept and salary > 80000
select * from employees
where department = 'IT' AND salary > 80000;

-- 11. emp from hr OR marketing
select * from employees
where department = 'HR' or  department = 'marketing';

-- 12. emp is not in sales dept
select * from employees
where not department = 'sales';

-- REGEXP
-- 13. first name starign with 'a' or 'r'
select * from employees
where first_name regexp '[ar]';

-- 14 last anme containign exactly 5 char
select * from employees
-- where last_name like '_____';
where last_name regexp '^[a-z]{5}$';


-- 15. Email ending with "gmail.com".
select * from employees
where email like '%gmail.com%';

###  Date + Arithmetic

-- 16. Employees who joined after 2020.
select * from employees
where year (joining_date) = '2020';

-- 17. Employees with experience between 4 and 7 years.
select * from employees
where experience_years between 4 and 7;

-- 18. Employees whose salary is between 60000 and 90000.
select * from employees
where salary between 60000 and 90000;


#  MEDIUM LEVEL

###  IF() Function

-- 19. Show performance_status:
-- * IF performance_score >= 90 → 'Excellent'
-- * Else → 'Average'

select * ,
if(performance_score >=90,  'Excellent','average')
from employees;

select *,
-- if (performance_score) >= 90
case 
	 when performance_score >= 90 then 'excellent'
     else 'Averaage'
end as performance_status
from employees;

-- 20. Show tax:
-- IF salary > 80000 → 20% tax
-- Else → 10% tax
select *,
case 
	when salary > 80000 then salary * 0.20  
    else salary * 0.10
end as tax_status
from employees;
---

### 🔹 CASE Statement
/*
-- 21. Grade employees based on performance_score:
* 90+ → 'A'
* 80-89 → 'B'
* 70-79 → 'C'
* Below 70 → 'D'
*/
select *,
case
	when performance_score >= 90 then 'A'
    when performance_score between 90 and 89 then 'B'
    when performance_score between 70 and 79 then 'C'
    else 'D'
end as grade
from employees;

-- 22. Categorize salary:
/*
* < 60000 → 'Low'
* 60000–80000 → 'Medium'
* > 80000 → 'High' */
select *,
case
	when salary > 80000 then 'High'
    when salary between 60000 and 80000 then 'Medium'
    else 'High'
end as categorize_salary
from employees;

-- 23. Show loyalty_bonus:
/*
* Experience >= 8 → 10000
* Experience >= 5 → 7000
* Else → 3000 */
select *,
case
	when experience_years >= 8 then '10000'
    when experience_years >= 5 then '70000'
    else '3000'
end as loyalty_bonus
from employees;

### 🔹 Combined Logic

-- 24. Employees from IT with salary > 85000 and performance_score > 90.
select * from employees
where department = 'IT' and salary > 85000 and performance_score > 90 ;

-- 25. Employees whose name starts with 'S' and city is Pune.
select * from employees
where first_name like 's%' and city = 'pune';

-- 26. Employees with gmail AND performance_score > 85.
select * from employees
where email like '%gmail%' and performance_score > 85;

-- 27. Employees whose last name starts with consonant (REGEXP).
 select * from employees
 where last_name regexp  '^[^a e i o u]';

-- 28. Show total_income and categorize:
--  > 100000 → 'Platinum'
-- 80000–100000 → 'Gold'
-- Else → 'Silver'

select *, 
salary + bonus  as total_income, 
case
	when salary > 100000 then 'Platinum'
    when salary between 80000 and 100000 then 'Gold'
    else 'silver'
end as 'categorize'
from employees;

select * from employees;

-- final question
select concat(first_name, ' ', last_name) as full_name, city, department, 
(salary + bonus) as total_income,
 case
     when salary + bonus >= 90000  then
		 case
			when performance_score >= 90 then 'star perofrmance'
			else 'highpaid'
		end
	when (salary + bonus) between 60000 and 89999 then 'mid leve'
	else 'Entry Level'
end as compensation_category
from employees
where (city like 'p%' or city = 'm%') and 
	 year (joining_date) < '2021'     and
	 not department =  'HR'
order by joining_date asc;
	

/*if(performance_score >= 90 ,'star peformaner', 'High paid'),
	if(salary + bonus >= 90000) between 60000 and 89999 'mid level',
	else 'Entry Level'	
end as compensation_category, */