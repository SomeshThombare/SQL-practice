-- 14/03/2026/Sat
 use procedureDB;
-- q2. createa procedue that accepts dept-id and : 
--  if the dept has more the 3 emps print 'large dept' otherwise 'small dept';
delimiter $$
create procedure dept_details(in d_id int)
begin 
declare e_emp int;
select count(emp_id) into e_emp
from employees 
where dept_id = d_id
group by dept_id;

if e_emp > 2 then 
	select 'Large departmenet' as dept;
elseif e_emp < 2  then
	select 'small departments ' as dept;
else 
	select 'Invalid dept id' as dept;
end if;
end $$
delimiter ;

call dept_details(2);
drop procedure dept_details;

select * from employees;


-- q7 create a procdeure that takes accepts  'salary' and assigns 'bonus catgory'
/*salary > 90000 --> A*
salary 60000- 90000 --> B
salary < 60000 --> C
use switch case/ */

delimiter $$
create procedure sal_category(in e_id int)
begin
declare e_sal decimal(9,2);
select salary into e_sal
from employees 
where emp_id = e_id;
	case e_id
		when (e_sal) > 90000 then select 'A' as Bonus_Cateegory;
        when (e_sal between 60000 and 90000) then select 'B' as Bonus_Cateegory;
        when (e_sal < 60000) then select 'C' as Bonus_Cateegory;
        else select 'Invalid emp_id';
	end case;
end $$
delimiter ;

call sal_category(5);
drop procedure sal_category;
select * from employees;

-- q.8 create a procedure that takes 'projectOf' input and prints
-- 1 --< not stareed
-- 2--> in progress
-- 3. completed
-- else --> unknown status


alter table projects add column project_status enum('1','2','3');
select *from projects;
alter table projects drop column project_status;


delimiter $$
create procedure p_status(in p_id int)
begin
	case 
		when 1 then select 'not started' as status;
		when 2 then select 'Inprogress' as status;
		when 3 then select 'Completed' as status;
		else 
			select 'unknown status' as status
            from projects
			where project_id = p_id;
	end case;
end $$
delimiter ;

drop procedure p_status;
call p_status(3);


-- q.9 create a procedure taht checks 'no of projects assigned assigned to an employee ' and prints
-- 0 --> no projects
-- 1 --> light workload
-- 2--> meium workload
-- 3- --> heavy workload
-- use case

delimiter ##
create procedure p_workload(in e_id int)
begin 
declare total_projects int;
select count(project_id) into total_projects
from employee_projects
where emp_id = e_id
group by emp_id;
case total_projects
		when 0 then select  'no projects';
        when 1 then select  'light workload';
        when 2 then select   'Medium workload';
        else
			select  'Heavy workload';
		end case;
end  ##
delimiter ;

call p_workload(7);
drop procedure p_workload;
select * from employee_projects;

-- usin lops question practice

-- q10 ceate a precoderue that 
-- loops through 'emps table'
-- prints 'emps name and salary' one by one

delimiter ##
create procedure emp_details()
begin
declare e_id int default 1;
declare count_emp int;

select count(*) into count_emp
 from employees;
	myLoop : loop
	if e_id > count_emp then 
	leave myLoop;
end if;
select emp_name , salary
from employees
where emp_id = e_id;
set e_id = e_id + 1;
end loop;

end ## 
delimiter ;

call  emp_details();
drop procedure emp_details;

/*
## Q11 — Salary Processing Loop
Create a procedure that
* Loops through all employees
* If salary > 70000 print:
Employee <name> is high paid
*/
delimiter $$
create procedure salary_process()
begin 
declare e_id int default 1;
declare total_emp int;
select max(emp_id) into total_emp
from employees ;
myLoop : loop
if e_id > total_emp then
leave myLoop;
end if;
 select concat('Employee ', emp_name, ' is high paid') as 'Result'
	from employees
where emp_id = e_id and salary > 70000;
set e_id = e_id + 1;
end loop;
end $$
delimiter ;

call salary_process();
select * from employees;
drop procedure salary_process;

/*
## Q12 — WHILE Loop
Create a procedure that:
* Loops through the **first 5 employees**
* Prints their **employee_id and name**
Use **WHILE loop**.
*/
delimiter $$
create procedure first_five_emp()
begin
declare counter int default 1;

while counter <= 5 do
	select emp_id, emp_name
    from employees
    order by emp_id asc;
    
    set counter = counter + 1;
end while;
end $$
delimiter ;


drop procedure first_five_emp;
call first_five_emp();
select * from employees;

/*
## Q13 — REPEAT Loop
Create a procedure that:
* Prints **project names** one by one
* Stops when all projects are printed.
Use **REPEAT loop**.
*/
delimiter $$
create procedure project_names()
begin 
declare p_id int default 1;
declare total_projects int;

select count(*) into total_projects 
from projects;
repeat
select project_name 
from projects 
where project_id = p_id;
set p_id = p_id + 1;
until p_id >=  total_projects
end repeat;
end $$
delimiter ;

drop procedure project_names;
call project_names;

/*
## Q14 — Bonus Calculation Loop
Create a procedure that:
* Loops through all employees
* Calculates **10% bonus**
* Prints:
Employee Name | Salary | Bonus
*/
delimiter $$
create procedure bonus_calculator()
begin
	declare b_id int default 1;
    declare total_emp int;
    
    select count(emp_id) into total_emp
    from employees;
    
    myLoop : loop
    if b_id > total_emp then
    leave myLoop;
    end if;
    
    select 
		emp_name as 'Employee Name',
        salary as 'Salary',
        (salary * 0.10) as 'Bonus'
        from employees
        limit b_id, 1;
        
        set b_id = b_id + 1;
    end loop myLoop;
end $$
delimiter ;
call bonus_calculator();
drop procedure bonus_calculator;

-- 4Slightly More Realistic Loop Questions
/*
 Q15 — Employee Project Count
Create a procedure that:
* Loops through all employees
* Counts how many projects each employee has
* Prints:
Employee Name | Number of Projects
*/
delimiter $$
create procedure project_details()
begin
declare p_id int default 0;
declare total_emp int ;

select count(emp_id) into total_emp
    from employees;

myLoop : loop
    if p_id >= total_emp then
    leave myLoop;
    end if;
    
    select emp_name as 'Employee Name',
    (select count(*) from employee_projects 
    where emp_id = e.emp_id) as 'Number of projects'
   from employees e
   order by emp_id asc
   limit p_id, 1;
   
   set p_id = p_id + 1;
   
end loop myLoop;
end $$
delimiter ;

drop procedure project_details;
call project_details();

/*
 Q16 — Department Employee Listing
Create a procedure that:
* Takes **department_id**
* Loops through employees in that department
* Prints their names.
*/

/*
 Q17 — Find First High Salary Employee
Create a procedure that:
* Loops through employees
* Stops when it finds the **first employee with salary > 90000**
* Prints the employee name.
Use **LEAVE**.
*/


/* Q18 — Count Employees Using Loop
Create a procedure that
* Loops through employees one by one
* Counts total employees manually
* Prints the total.
*/


# 5Mixed Logic (Loop + IF)
/*q.19
Create a procedure that
* Loops through employees
* If salary > 80000 print:

Senior Employee
Else print:
Regular Employee
*/



 /* Q20 : Create a procedure that:
* Loops through employees
* If an employee has **no project assigned**, print:
<Employee Name> is currently free
*/

