-- set operation -- 19/02/20026
create database set_operations;
use   set_operations;
create table demo1 (d1 int, d2 varchar(255));
create table demo2 (d2 varchar(255), d1 int);

insert into demo1 values(1,'a'),(2,'b'),(3,'c');
insert into demo2 values('d',1),('a',4),('c',3);

select * from demo1 
union
select * from demo2;

-- 07/03/2026/sat
-- set Operator:
 create table employees(
 emp_id int primary key auto_increment,
 emp_name varchar(225) not null ,
 emil varchar(225),
 emp_ph_no varchar(25), auto_increment = 1001
 );
 
 create table manager(
 manager_id int primary key auto_increment,
 email varchar(225),
 manager_ph_no varchar(225)
 );
 -- 1 uiion
 select * from employees
 union
 select * from manager;
 
 select emp_id , emp_name as all_emps from employees
 union
 select manager_id , manaher_name as all_mnagers from manager;
 -- 2
  select * from employees
 union all
 select * from manager
 order by emp_name;
 
 -- Hw 
 -- 1. Student who play both spots asn are in suddent table
 -- 2.  players in teams bit not in start
 -- 3.stdetn who play Exactely one sport
 
 