-- 12/03/2026/ thu
-- # 1]Control Flow Statements in stored procedures:
 
--  SYNTAX
/*
IF CONDITION THEN 
	STATEMENTS;
ELSE FI CINDITION THEN
	STATEMENTS;
ELSE
	STATEMENTS;
END IF;

*/

-- Example
delimiter $$
create procedure salary_category(in salary decimal (9,2))
begin
if salary > 90000 then
	select 'high earnar' as salary_category;
elseif salary between 60000 and 89999 then
	select 'low earer' as salary_category;
else 
	select 'low earnar' as salary_category;
end if;
end $$
delimiter ;

call salary_category(43000);

-- 2] CASE STATEMENTS
delimiter $$
create procedure check_day(in day_number int)
begin
	case  day_number
		when 1 then select 'monday' as Day;
        when 2 then select 'tuesday' as Day;
        when 3 then select 'wensday' as Day;
        when 4 then select 'thursdaY' as Day;
        WHEN 5 then select 'Firday' as Day;
        when 6 then select 'saturday'as Day;
        when 7 then select 'sunday'as Day;
        else select 'invalid day'as Day;
	end case;
end $$
delimiter ;

call check_day(1);
drop procedure  check_day;


-- ex 2
delimiter $$
create procedure salary_category_case(in salary decimal (9,2))
begin
case
	when salary > 90000 then
		select 'high earnar' as salary_category;
	when salary between 60000 and 89999 then
		select 'mid earner' as salary_category;
	else
		select 'low earnar' as salary_category;
end case;
end $$
delimiter ;

call salary_category_case(50000);
drop procedure salary_category_case;


-- 3} While Loop

-- syntax
/*
while condition do
	statements;
end while;
*/

delimiter $$
create procedure print_nms()
begin 
	declare i int default 1; -- rdeclration of variable
    
    while i <= 5 do   -- condition
    select i ;   -- statetements
    set i = i + 1; -- increment
	end while;
end $$
delimiter ;

call print_nms();

-- 4] loop / generic loop
-- syntax
/*  
loopname : loop
	statements;
if condition then
		leave loopname;
end if
end loop;
*/
-- example
delimiter $$
create procedure loop_example()
begin
	declare i int default 1;
    
    myLoop : loop
    select i;
    set i = i + 1;
    if i >= 10 then
    leave myLoop;
    end if;
    end loop;
end $$
delimiter ;

call loop_example();


-- 4] repat loop: runs at least once like (do while loop)
/*SYNTAX
repet 
statemetns;
unitl condition
end repeat;
*/
delimiter $$
create procedure repeat_example()
begin
declare i int default 1;
repeat 
select i;
set i = i + 1;
until i > 1
end repeat;
end $$
delimiter ;

call repeat_example();
drop procedure repeat_example;

-- -----------------------------------------------------------------
-- practice sessions on loops

use procedureDB;
select * from employees;

-- using loop 
delimiter $$
create procedure find_highsalary(in target_salary decimal(9,2))
begin 
	declare e_id int default  1;
    declare total_employees int;
    declare emp_salary decimal(9,2);
    declare found_employees boolean default false;
    
    select count(*) into total_employees
    from employees;
    
    myLoop  : loop
    if emp_id > total_employees then
    leave myLoop;
	end if;
    
		select salary into emp_salary
		from employees 
		where emp_id = e_id;
	
    if emp_salary > target_salary then
    select 'high salaru employee found';
    set found_employees = true;
    leave myLoop;
    end if;
    
    set e_id = e_id + 1;
    end loop;
if found_employees = false then
select 'no high salared employees found';
end if; 
end $$
delimiter ;

call find_highsalary(50000);

drop procedure find_highsalary;

-- using while loop
delimiter $$
create procedure find_high_salary(in target_salary decimal(9,2))
begin
	declare e_id int default 1;
    declare total_employess int;
    declare emp_salary decimal(9,2);
    declare found_employees boolean default false;
    
    select count(*) into total_employees 
    from employees;
    
    while_loop : while e_id <= total_employees do
    
		select salary into emp_salary
        from employess
        where emp_id = e_id;
        
	if salary > target_salary then
    select 'high salaru employee found';
    set found_employees = true;
    leave while_loop;
    end if;
    
    set e_id = e_id + 1;
		end while;
end $$
delimiter ;

call find_high_salary(55000);

-- ex 2
-- update employee
-- give a hike of 20% for emp earning less than 40000 
-- give a hike of 10% for emp earning more than 40000
-- and less then 80000
-- give a hike of 5% for mep earining more than 80K
delimiter $$
create procedure hike_salary()
begin
	declare e_id int default 1;
    declare e_salary decimal(9,2);
    declare total_employees int;
    declare new_salary decimal(9,2);
    
    select count(*) into total_employees
    from employees;
    
    while_loop : while e_id <= total_employees do
    select salary into e_salary
    from employees
    where emp_id = e_id;
    
   if e_salary  >= 80000 then
	set new_salary = e_salary +  (e_salary * 0.05);
   
    
   elseif e_salary  between 40000 and 79999 then
	set new_salary =  e_salary + (e_salary * 0.01);
  
    
   else  set new_salary =  e_salary +(e_salary * 0.02);
  
   end if;
   update employees 
   set salary = new_salary
   where emp_id = e_id;
   
   set e_id = e_id + 1;
   end while;
    
end $$
Delimiter ;

call hike_salary();

drop procedure hike_salary;

select * from employees;
 













