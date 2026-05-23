-- 06/03/2026/Fri
create database joinPractice;
use joinPractice;
CREATE TABLE departments (
    dept_id INT PRIMARY KEY AUTO_INCREMENT,
    dept_name VARCHAR(50)
);

CREATE TABLE employees (
    emp_id INT PRIMARY KEY AUTO_INCREMENT,
    emp_name VARCHAR(50),
    salary INT,
    dept_id INT,
    FOREIGN KEY (dept_id) REFERENCES departments(dept_id)
);

CREATE TABLE projects (
    project_id INT PRIMARY KEY AUTO_INCREMENT,
    project_name VARCHAR(100),
    budget INT
);

CREATE TABLE employee_projects (
    emp_id INT,
    project_id INT,
    role VARCHAR(50),
    PRIMARY KEY (emp_id, project_id),
    FOREIGN KEY (emp_id) REFERENCES employees(emp_id),
    FOREIGN KEY (project_id) REFERENCES projects(project_id)
);


INSERT INTO departments (dept_name) VALUES
('IT'),
('HR'),
('Finance'),
('Marketing');

INSERT INTO employees (emp_name, salary, dept_id) VALUES
('Amit',60000,1),
('Neha',75000,1),
('Rohit',50000,2),
('Sneha',65000,3),
('Rahul',80000,1),
('Priya',55000,4),
('Karan',70000,3),
('Meena',48000,2);


INSERT INTO projects (project_name, budget) VALUES
('Website Development',200000),
('Mobile App',150000),
('HR System',100000),
('Marketing Campaign',120000);



INSERT INTO employee_projects VALUES
(1,1,'Developer'),
(2,1,'Tester'),
(3,3,'HR Analyst'),
(4,3,'Finance Analyst'),
(5,2,'Team Lead'),
(6,4,'Marketing Specialist'),
(7,2,'Developer'),
(1,2,'Developer'),
(2,2,'Tester'),
(8,3,'Assistant');


-- practice questions
-- 1)  show all emp with their dept namees
select emp_id , d.dept_name, d.dept_id as department_id , emp_name
from employees  as e
inner join departments as d
on e.dept_id = d. dept_id;

-- 2) disply emp name and salary along with depart name
select emp_id, emp_name, dept_name, salary
from employees  as e
inner join departments as d
on e.dept_id = d. dept_id;

-- 3) show all project with emp workign on them.
select emp_id ,emp_name, project_id,project_name
from employees as e
left join projects as p
on e.emp_id = p.project_id;

select p.project_id, project_name, role, emp_name 
from projects p
left join employee_projects ep
on ep.project_id = p.project_id
 join employees e
on e.emp_id = ep.emp_id;

-- 2nd way
select *
from employees e
join departments d
on d.dept_id = e.dept_id
join employee_projects ep
on ep.emp_id = e.emp_id
join projects p
on ep.project_id = p.project_id;

-- 4) show employees and there role in project
select  e.emp_id , e.emp_name, ep.role
from employees as e
inner join employee_projects as ep
on e.emp_id = ep.emp_id;


-- 5) disply emp name and project name
select  emp_name , p.project_id,project_name
from employees as e
 join employee_projects as ep
on e.emp_id = ep.emp_id
join projects p
on p.project_id = ep.project_id;

-- easy mid level

-- 6) show employees and their departments names only for IT dept
-- emp --> depts
select  e.emp_name, d.dept_name
from employees as e
join departments as d
on  e.dept_id = d.dept_id
where d.dept_name = 'IT';

-- 7) show emp name, departmetn name, and project name
-- emp --> dept-> emp_projects--> project
select e.emp_name, d.dept_name, p.project_name
from employees as e
inner join departments as d
on e.dept_id = d.dept_id
inner join employee_projects as ep
on e.emp_id = ep.emp_id
inner join projects as p
on ep.project_id = p.project_id;

-- 8) list all emoployes whoo are workign on Mobile appprojects
-- emp-->emp_project-->project
select e.emp_id, e.emp_name, project_name
from employees as e
inner join employee_projects as ep
on e.emp_id = ep.emp_id
inner join projects as p
on ep.project_id = p.project_id 
where project_name = 'Mobile App';

-- 9_ show dept name and number of employees in each department.
-- emp--> dept
select d.dept_id, d.dept_name, count(emp_id) as total_employees
from departments as d
join employees as e
on d.dept_id = e.dept_id
group by e.dept_id, dept_name;


-- 10) showproject name and number of employes working on each project
select p.project_id, project_name, count(emp_id) as total_employess
from projects as p
join employee_projects as ep
on ep.project_id = p.project_id
group by project_id; 

-- fro all projects
select p.project_id, project_name, count(emp_id) as total_employess
from projects as p
left join employee_projects as ep
on ep.project_id = p.project_id
group by p.project_id; 

-- medium level
-- 11) show projecct name who are not assignend to any project
select * from employees e
left join employee_projects as ep
on ep.emp_id = e.emp_id
where ep.project_id is null;


-- 12 shwp dept that so not have any employees
select dept_name 
from departments as d
left join employees as e
on e.dept_id = d.dept_id
where e.emp_id is  null;


-- 13) show employees working on more than one projects
-- having --> aggreagate funciton
select e.emp_name, count(project_id)as projcet_count
from employees as e
join employee_projects as ep
on e.emp_id = ep.emp_id 
group by e.emp_id 
having projcet_count > 1;

-- 14) show the total salary paid per departmetns
-- group by dept_id, sum(salary) --> employes --> depat--> empoyess
select d.dept_id , sum(salary) as total_salary
from departments as d
left join employees as e
on d.dept_id = e.dept_id
group by d.dept_id;


-- 15) show the project with teh highest number of employees
select project_name, p.project_id , count(emp_id)as total_employees
from projects as p
inner join employee_projects as ep
on p.project_id = ep.project_id
group by project_id
order by total_employees desc
limit 1;


-- 16 show emplooyee names workign in the same departmeents as'Amit'
select * from departments;
select * from departments where dept_id = 
(select dept_id from employees where emp_id = 1);

select * from employees as e
join departments as d
on e.dept_id = d.dept_id
where d.dept_id = (select dept_id from employees where emp_id = 1);

-- 17 show employees whose salarys is greater then the average salary of their department
select * FROM  employees e2 
where salary > (
select salry );-- uncompletd



-- medium hard 
-- 18 find the emplyee who is working on the highest budget projects
select * from projects;

select emp_name, project_name, budget 
from employees as e
join employee_projects as ep
on e.emp_id =  ep.emp_id
join projects as p
on ep.project_id = p.project_id
where p.budget = (select max(budget)from projects);

-- 19 display departments name and the averaage salary of employees in each department,
-- but only show departments where the average salary is greater than 60,000.
select dept_name , avg(salary) as avg_salary 
from departments as d
join employees as e
on e.emp_id = d.dept_id 
group by d.dept_id
having avg_salary > 60000; 

-- 20 find the project name adn total avg salary of employees in each department,
select p.project_name, d.dept_name, avg(emp_id) as avg_salary
from projects as p
join employee_projects as ep
on p.project_id = ep.project_id
join departments as d
on e.dept_id = d.dept_id
group by p.project_name; -- unexucted


-- 21 find the employees who are working evry project that amit works on 
select e.emp_id, emp_name, p.project_id, p.project_name
from employees as e
join employee_projects as ep1 
on ep1.emp_id = e1.emp_id

join eployee_projects as ep2
on ep2.emp_id = ep2.emp_id;
-- 
select emp_name as emp_name, count(ep.project_id) as total_projects
from employees e1
join employee_projects ep
on ep.emp_id = e1.emp_id
where ep.project_id in ( select project_id
							from employee_projects ep2
							join employees e2
                            on ep2.emp_id = ep2.emp_id
                            where e2.emp_id =1
						)
group by e1.emp_id
having count(ep.project_id) = (
	select count(*)
	from employee_projects ep3
    join employees e3
    on e3.emp_id  = e3.emp_id
    where e3.emp_id = 1);


-- find all the custoemr who have bought all the products in our most expensive bundle

SELECT 
    e.emp_name, 
    p.project_name, 
    e.salary
FROM employees AS e
JOIN employee_projects AS ep ON e.emp_id = ep.emp_id
JOIN projects AS p ON ep.project_id = p.project_id
WHERE e.salary > (
    SELECT AVG(e2.salary)
    FROM employees AS e2
    JOIN employee_projects AS ep2 ON e2.emp_id = ep2.emp_id
    WHERE ep2.project_id = ep.project_id
);


-- find the employeees whose salary is higher than the average salary of employee working on the same project
select  e.emp_id,emp_name,  project_name , salary
from employees as e
join employee_projects as ep
on e.emp_id = ep.emp_id
join projects as p
on ep.project_id = p.project_id
where e.salary > (
				select avg(salary) as avg_salary
                from employees as e2
                join employee_projects as ep2
                on ep2.emp_id = ep2.emp_id
                where ep2.project_id = ep. project_id
				);




-- joins practice -- 07/032026/sat
-- easy questiosn
-- 1.show employee name and department id for all emloyee
select emp_name, d.dept_name, role
from employees as e
join departments as d
on e.emp_id = d.dept_id
join employee_projects as ep
on ep.emp_id = e.emp_id;


-- 2 disply all projects names , empoyee  name, dept name
select project_name, e.emp_id, e.emp_name, dept_name
from projects as p
left join employees as e
on e.emp_id = e.emp_id
left join employee_projects as ep
on p.project_id = ep.project_id
left join departments as d
on ep.emp_id = d.dept_id;

-- 3.  show employees  name,salary, and project name
select emp_name, salary, project_name
from employees e
join employee_projects ep
on ep.emp_id = e.emp_id
join projects p
on p.project_id = ep.project_id;



-- 4. disply eplyye name and dept name for employee workign on the mobile app project
select emp_name, dept_name, project_name
from employees as e
join departments as d
on e.emp_id = d.dept_id
join employee_projects as ep
on e.emp_id = ep.emp_id
join projects as p
on ep.project_id = p.project_id
where project_name = 'Mobile App' ;

-- 5. disply emp_name and dept_name for employess working on any proect
select emp_name, dept_name 
from employees as e
join departments as d
on e.emp_id = d.dept_id
join employee_projects as ep
on  e.emp_id = ep.emp_id
join projects as p
on p.project_id = ep.project_id;

select emp_name, dept_name 
from employees as e
join departments as d
on e.dept_id = d.dept_id
join employee_projects as ep
on  e.emp_id = ep.emp_id
join projects as p
on p.project_id = ep.project_id;


-- 6. show dept name and projects name for depts whose employees are working on projects.
select dept_name, project_name, emp_name
from employees as e
join departments as d
on e.emp_id = d.dept_id
join employee_projects as ep
on e.emp_id = ep.emp_id
join projects as p
on p.project_id = ep.project_id
where p.project_id is null;


-- easy mid level 
-- 1. show departmetns name and number of projets  employees from that dept are working on.
select dept_name, count(ep.project_id) as total_projects
from departments as d
join employees as e
on e.dept_id = d.dept_id
join employee_projects as ep
on ep.emp_id = e.emp_id
join projects p
on ep.project_id = p.project_id
group by dept_name;


-- 2. display projects name and avg(salary) of employees working on that projects
select project_name, avg(salary) as avg_emp_salary
from employees as e
join employee_projects as ep
on e.emp_id = ep.emp_id 
join projects as p
on ep.project_id = p.project_id
group by project_name;

-- 3. show project_name and  total salalry of emp assigned that project
select p.project_id, sum(salary) as total_salary
from employees as e
join employee_projects as ep
on e.emp_id = ep.emp_id
join projects as p
on p.project_id = ep.project_id
group by p.project_id;

-- 4. disply dept and number of emps working on projects
-- only coun employees assigned to at last one projects
select dept_name,ep.project_id, count(e.emp_id) as total_employees
from employees as e
join departments as d
on e.dept_id = d.dept_id
join employee_projects as ep
on e.emp_id = ep.emp_id
group by d.dept_name, ep.project_id;

-- 5 . show employees name, department name, and number of projects they are working on
select emp_name, d.dept_name, count(p.project_id) as total_projects
from departments as d
join employees as e
on e.dept_id = d.dept_id
join employee_projects as ep
on  e.emp_id = ep.emp_id
join projects as p
on p.project_id = ep.project_id 
group by emp_name, d.dept_name;

-- medium level join questions
-- 1. show departments name and total number of projects handled by employees of that working

-- 2. disply projects where employeess from more than one departments are working
-- join -- group by -- coutnt distinct

select project_name , count(distinct d.dept_id) as total_dept
from employees as e
join departments as d
on e.dept_id = d.dept_id
join employee_projects ep
on e.emp_id = ep.emp_id
join projects as p
on ep.project_id = p.project_id
group by project_name
having total_dept > 1 ;

-- 3

-- 4. disply department name and the hhighest project budget handled by employes from that department.
select dept_name, max(budget) as highest_budget
from employees as e
join departments as d
on e.dept_id = d.dept_id
join employee_projects as ep
on e.emp_id = ep.emp_id
join projects as p
on ep.project_id = p.project_id
group by d.dept_name;

-- 5 show employees working on the same project  as neha
-- join _ shunquey + but minly join logic

-- 8 display employee name and number of coworker with them on the same project
select e1.emp_name, count(distinct ep2.emp_id) as coworker
from employee_projects ep1
join  employee_projects ep2
on ep1.project_id = e2.project_id
join employees as e
on ep1.emp_id = ep2.emp_id
where ep1.emp_id <> ep2.emp_id
group by  ep1.emp_id;
select * from employees ;
select * from departments; -- uncomplet

-- hard questions
-- 12 Display the project name where employees from more than one department are working.
select project_name, count(e.emp_id) as total_emps
from employees as e
join departments as d
on e.dept_id = d.dept_id
join employee_projects as ep
on e.emp_id = ep.emp_id
join projects as p
on p.project_id = ep.project_id
group by project_name
having total_emps > 1;


SELECT 
    d.dept_name, 
    COUNT(ep.project_id) AS total_projects
FROM departments d
JOIN employees e ON d.dept_id = e.dept_id
JOIN employee_projects ep ON e.emp_id = ep.emp_id
GROUP BY d.dept_id, d.dept_name
ORDER BY total_projects DESC
LIMIT 1;
-- 13 Find the department whose employees are working on the maximum number of projects.
select d.dept_name, count(ep.project_id) as total_projects
from employees as e
join departments as d
on e.dept_id = d.dept_id
join employee_projects as ep
on e.emp_id = ep.emp_id
join projects as p
on p.project_id = ep.project_id
group by d.dept_id, d.dept_name
order by total_projects desc;

-- 14 Show the employee who works on the highest number of projects.
select emp_name, count(p.project_id) as highet_number_of_projects
from employees as e
join departments as d
on e.dept_id = d.dept_id
join employee_projects as ep
on e.emp_id = ep.emp_id
join projects as p
on p.project_id = ep.project_id 
group by e.emp_name; 

-- 15 Find the project that has the highest total salary contribution from employees.
-- (Sum of salary of employees assigned to that project)
select project_name , sum(e.salary) as total_salary_contribute
from employees as e
join employee_projects as ep
on e.emp_id = ep.emp_id
join projects as p
on p.project_id = ep.project_id
group by p.project_name
order by total_salary_contribute desc
limit 1;

-- 16 Display employees who work on projects with budgets greater than the average project budget.
select e.emp_name, p.project_name, budget
from employees e
join employee_projects as ep
on e.emp_id = ep.emp_id
join projects as p
on p.project_id = ep.project_id
where p.budget > (select avg(budget) from projects);



-- 17 Find pairs of employees who work on the same project.
/*
(Self join problem)

Expected result example:

emp1	emp2	project
Amit	Neha	Website Development
*/
select 
	e1.emp_name as emp1,
    e2.emp_name as emp2,
    p.project_name as project
from employee_projects as ep1
join employee_projects as ep2
on ep1.project_id = ep2.project_id 
and ep1.emp_id < ep2.emp_id

join employees as e1 
on e1.emp_id = ep1.emp_id
join employees as e2
on e2.emp_id = ep2.emp_id
join projects as p
on p.project_id = ep1.project_id;
    

-- 18 Find employees who work only on one project and that project has more than 2 employees.
select e.emp_id, e.emp_name
from employees e
join employee_projects ep
on e.emp_id = ep.emp_id
join projects as p
on p.project_id = ep.project_id
where e.emp_id in (
					select emp_id 
                    from employee_projects 
                    group by emp_id
                    having count(project_id) =1 
				)
and p.project_id in (
					select project_id 
                    from employee_projects
                    group by project_id 
                    having count(emp_id > 2)
				);
-- 19 Show departments where all employees are working on at least one project.
select d.dept_name
from departments as d
join employees as e
on e.dept_id = d.dept_id
group by d.dept_id 
having count(e.emp_id) = count(distinct case
											when e.emp_id in
											(select emp_id 
											from employee_projects)
											then e.emp_id
					
end );											


-- 20 Find the employee who works on the project with the lowest budget.
select e.emp_id ,p.project_name,budget
from employees as e
join employee_projects as ep
on e.emp_id = ep.emp_id
join projects as p
on p.project_id = ep.project_id
where p.budget = (select min(budget) from projects);



