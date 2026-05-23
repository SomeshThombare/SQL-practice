drop database company_practice;
CREATE DATABASE company_practice;
USE company_practice;
CREATE TABLE employees (
    emp_id INT PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    email VARCHAR(100),
    department VARCHAR(50),
    salary DECIMAL(10,2),
    bonus DECIMAL(10,2),
    joining_date DATE,
    last_login DATETIME
);
drop table employees ;

INSERT INTO employees 
(first_name, last_name, email, department, salary, bonus, joining_date, last_login)
VALUES
('Amit', 'Sharma', 'amit.sharma@gmail.com', 'IT', 60000.00, 5000.00, '2021-03-15', '2026-02-20 10:15:30'),
('Priya', 'Verma', 'priya.verma@gmail.com', 'HR', 45000.00, 3000.00, '2020-07-10', '2026-02-22 09:45:10'),
('Rahul', 'Mehta', 'rahul.mehta@gmail.com', 'Finance', 75000.00, 7000.00, '2019-01-25', '2026-02-24 11:20:45'),
('Sneha', 'Patil', 'sneha.patil@gmail.com', 'IT', 68000.00, 5500.00, '2022-05-18', '2026-02-21 14:05:12'),
('Karan', 'Singh', 'karan.singh@gmail.com', 'Marketing', 52000.00, 4000.00, '2021-09-12', '2026-02-23 16:40:00'),
('Neha', 'Kapoor', 'neha.kapoor@gmail.com', 'Sales', 48000.00, 3500.00, '2023-02-14', '2026-02-19 13:25:30'),
('Rohit', 'Gupta', 'rohit.gupta@gmail.com', 'IT', 82000.00, 9000.00, '2018-11-30', '2026-02-25 08:55:40'),
('Anjali', 'Reddy', 'anjali.reddy@gmail.com', 'Finance', 71000.00, 6500.00, '2020-03-05', '2026-02-18 12:10:22'),
('Vikas', 'Yadav', 'vikas.yadav@gmail.com', 'Operations', 53000.00, 4200.00, '2021-06-22', '2026-02-22 17:35:18'),
('Pooja', 'Nair', 'pooja.nair@gmail.com', 'HR', 47000.00, 3200.00, '2022-08-09', '2026-02-24 10:50:05'),
('Arjun', 'Deshmukh', 'arjun.deshmukh@gmail.com', 'IT', 90000.00, 10000.00, '2017-04-17', '2026-02-26 09:30:15'),
('Meera', 'Joshi', 'meera.joshi@gmail.com', 'Marketing', 56000.00, 4500.00, '2021-12-01', '2026-02-21 15:45:55'),
('Siddharth', 'Malhotra', 'siddharth.m@gmail.com', 'Sales', 62000.00, 5000.00, '2019-09-19', '2026-02-23 11:05:44'),
('Kavita', 'Iyer', 'kavita.iyer@gmail.com', 'Finance', 73000.00, 6000.00, '2018-06-11', '2026-02-20 14:22:36'),
('Manish', 'Chopra', 'manish.chopra@gmail.com', 'Operations', 51000.00, 3800.00, '2023-01-03', '2026-02-25 16:10:50'),
('Ritika', 'Bansal', 'ritika.bansal@gmail.com', 'HR', 44000.00, 2900.00, '2020-10-27', '2026-02-18 09:18:25'),
('Aditya', 'Kulkarni', 'aditya.k@gmail.com', 'IT', 85000.00, 9500.00, '2016-02-29', '2026-02-26 12:40:33'),
('Shreya', 'Agarwal', 'shreya.agarwal@gmail.com', 'Marketing', 59000.00, 4700.00, '2022-04-16', '2026-02-24 13:55:10'),
('Nikhil', 'Pandey', 'nikhil.pandey@gmail.com', 'Finance', 78000.00, 7200.00, '2019-07-07', '2026-02-23 10:05:27'),
('Tanya', 'Saxena', 'tanya.saxena@gmail.com', 'Sales', 50000.00, 3600.00, '2021-11-13', '2026-02-22 15:30:48'),
('Deepak', 'Thakur', 'deepak.thakur@gmail.com', 'Operations', 54000.00, 4100.00, '2020-02-20', '2026-02-19 17:45:59'),
('Isha', 'Mishra', 'isha.mishra@gmail.com', 'HR', 46000.00, 3100.00, '2023-06-25', '2026-02-21 08:35:20'),
('Varun', 'Sethi', 'varun.sethi@gmail.com', 'IT', 88000.00, 9800.00, '2017-08-14', '2026-02-25 11:50:40'),
('Komal', 'Chaudhary', 'komal.c@gmail.com', 'Marketing', 57000.00, 4600.00, '2022-09-30', '2026-02-20 14:15:18'),
('Harsh', 'Arora', 'harsh.arora@gmail.com', 'Sales', 61000.00, 4900.00, '2018-12-12', '2026-02-24 16:25:35');

select * from employees;

select 
concat(first_name, "",last_name) as full_name,
 timestampdiff (year,joining_date , currentdate()) as Experience,
 department, round(salary),
 (year,joining_date ) as joining_year from
 employees;
  -- if conditions 
 -- Example 1
 -- emp  who joined n last  2 yr --> nobbies
 -- emp who joined in lastr 4 yr --> intermidate
 -- emp who joined in last 6 yr --> experiend
 -- moree than 6 yr --> pro
 
 select emp_id  first_name , joining_date,
 timestampdiff(year, joining_date, curdate()) as experince_years,
 case
	when timestampdiff( year, joining_date, curdate()) > 6 then "pro"
    when timestampdiff( year, joining_date, curdate()) >= 4 and  
    timestampdiff( year, joining_date, curdate()) < 6 then  "advanced"
	when timestampdiff( year, joining_date, curdate()) >=2  and  
    timestampdiff( year, joining_date, curdate()) < 4 then "Intremidiate"
    else "noob"
    end as "Experience level" from employees;

-- Example 2
 -- emp who logged in before 22 feb 2026 -- logged in  and
 -- emp who logged in afetr 22 feb 2026 -- long time ago
 -- use case dept abbravationd and show theri full name -- eg:- HR = 'Human Resource'

select emp_id , first_name, deprtment, joining_date, last_login,
if  (last_login  < '2026-02-22','Logged In longtime ago',  'Logged in recentely')
     as login_status,
case
	when department = 'HR' then 'Human Resource'
    end  as  department_name
    from  employees;
    
    
-- oprators
-- find the  the emp who either woeks in hr and salry more then 10000
select * from employees 
where department = "HR" or salary > 100000;   

-- xor
-- find the emp who either have a salry of more then 1lak
-- or they work in IT dept , but the one working in IT dept should 
-- not have a salay  of more then 1 lakh
select * from employees 
where department = 'IT' xor salary > 100000;

-- not
select * from employees
where not salary > 100000 or not department = "IT"; 

-- between :- use for range checking
select * from employees
where salary between 50000 and 60000;   
         
-- in operator
select * from employees 
where department in ('IT',"HR");
 
-- find the all the emps with joining year in eithr 2018, 19, 20
select * from employees 
where year (joining_date) in ('2018','2019','2020');


-- like operatorr 
-- fidnthe names start  with 'a'
select * from employees
where first_name like 'a%';

-- end with a 
select * from employees
where first_name like '%a';

-- start with 'ka'
select * from employees
where first_name like 'ka%';
--

-- second char 'a'
select * from employees
where first_name like '_a%';
 
 -- particular valus
 select * from employees
where email like '%@google.com';

 select * from employees
where email like '%gmail%' or email like '%google%';

-- exact name for
select * from employees
where first_name like 'amit';

-- not like
-- find without  '@' emils
 select * from employees
where email not like '%@';

-- update the mutiple column ata time
update employees
set department = null
where emp_id in (4,5,6,7,8);

--
select * from employees
where department is  null;

select * from employees
where department is not null;

-- REGEXP
-- find the partilcay lettr in the whole name column
select * from employees
where first_name regexp 'a';

-- ^ --> to search from the starting of yourr string
-- $ --> to seararch form the end of your string
-- [] --> to search multiple string

-- starting name from 'A'
select * from employees
where first_name regexp '^a';

-- ENDS WITH 'B'
select * from employees
where first_name regexp 'a$';

-- (.) any single char
select * from employees
where first_name regexp 'a.';

-- multiple char  -> passs the char set in square []
select * from employees
where first_name regexp '[dr]';

-- find all the first_names ending with either 'd' or 'r'
select * from employees
where first_name regexp '[la]$';



-- fisn the all emp whoes fisrt_name desent wstart either  'a' or 'k'
select * from employees
where first_name regexp '^[^ak]';


-- 11) | or operator
-- find all the emp whos nane conatins eithehr n or m anywher
select * from employees
where first_name regexp 'n|m';

-- {n} 
-- 11) | or operator
-- find all the emp whos nane conatins eithehr n or m anywher

-- find the all emop with two 'ee' togerher
select * from employees
where first_name regexp 'e{2}';


-- 11) | or operator
-- find all the emp whos nane conatins eithehr n or m anywher

-- {n,m}range
select * from employees
where first_name regexp 'e{2,4}';

-- find the all emplyee who have a number  in therir email
select * from employees
where email regexp '[0-9]';

-- add a column p_no
alter table employees add column p_no varchar(255);
select * from employees;

-- find the emps who have a char in the 
select * from employees
where p_no regexp '[a-z]';

select char_length(p_no) from employees;

-- findthe  all emp with exactley 10 no in therie p_no 
select * from employees
where p_no regexp '[0-9]{10}';

-- it is conain the 10 char + no anything 
select * from employees
where not p_no regexp '[0-9]{10}';



