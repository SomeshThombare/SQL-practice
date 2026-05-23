-- 09/03/2026/Mon subqueries practice

create database if not exists Sub_set_joinsDB;
use sub_set_joinsDB;

CREATE TABLE departments(
    dept_id INT PRIMARY KEY AUTO_INCREMENT,
    dept_name VARCHAR(50)
);
CREATE TABLE employees(
    emp_id INT PRIMARY KEY AUTO_INCREMENT,
    emp_name VARCHAR(50),
    salary INT,
    dept_id INT,
    hire_date DATE,
    FOREIGN KEY(dept_id) REFERENCES departments(dept_id)
);
CREATE TABLE projects(
    project_id INT PRIMARY KEY AUTO_INCREMENT,
    project_name VARCHAR(50),
    dept_id INT,
    budget INT,
    FOREIGN KEY(dept_id) REFERENCES departments(dept_id)
);

CREATE TABLE employee_projects(
    emp_id INT,
    project_id INT,
    PRIMARY KEY(emp_id, project_id),
    FOREIGN KEY(emp_id) REFERENCES employees(emp_id),
    FOREIGN KEY(project_id) REFERENCES projects(project_id)
);

INSERT INTO departments(dept_name) VALUES
('IT'),
('HR'),
('Finance'),
('Marketing'),
('Sales'),
('Operations'),
('Research'),
('Support');


INSERT INTO employees(emp_name, salary, dept_id, hire_date) VALUES
('Amit',60000,1,'2021-01-10'),
('Neha',45000,2,'2022-02-12'),
('Rahul',70000,1,'2020-03-14'),
('Priya',52000,3,'2021-05-19'),
('Karan',48000,4,'2022-06-20'),
('Sneha',51000,5,'2021-07-21'),
('Rohit',65000,1,'2019-08-11'),
('Anjali',47000,2,'2023-01-15'),
('Vikas',55000,3,'2022-03-12'),
('Simran',53000,4,'2021-04-18'),
('Aditya',72000,1,'2018-06-05'),
('Pooja',49000,2,'2020-07-10'),
('Manish',61000,5,'2021-09-14'),
('Riya',50000,3,'2022-10-12'),
('Deepak',64000,4,'2019-11-11'),
('Tanya',56000,5,'2023-01-01'),
('Arjun',58000,1,'2020-02-02'),
('Meera',52000,3,'2021-03-03'),
('Nisha',47000,2,'2022-04-04'),
('Siddharth',68000,5,'2019-05-05'),
('Varun',54000,6,'2021-06-06'),
('Kavita',51000,7,'2022-07-07'),
('Tarun',59000,6,'2020-08-08'),
('Isha',45000,8,'2023-09-09'),
('Nikhil',62000,7,'2019-10-10'),
('Rohan',57000,NULL,'2021-11-11'),
('Ayesha',48000,NULL,'2022-12-12'),
('Dev',53000,8,'2020-04-04'),
('Sana',46000,7,'2021-02-02'),
('Kabir',61000,6,'2019-03-03');

INSERT INTO projects(project_name, dept_id, budget) VALUES
('Website',1,200000),
('Mobile App',1,250000),
('Recruitment System',2,100000),
('Payroll System',3,150000),
('Marketing Campaign',4,120000),
('Sales Portal',5,180000),
('Operations Dashboard',6,130000),
('AI Research',7,300000),
('Customer Support Tool',8,NULL),
('Internal Tool',NULL,90000);

INSERT INTO employee_projects VALUES
(1,1),(1,2),
(2,3),
(3,1),(3,2),
(4,4),
(5,5),
(6,6),
(7,1),(7,2),
(8,3),
(9,4),
(10,5),
(11,1),(11,2),
(12,3),
(13,6),
(14,4),
(15,5),
(16,6),
(17,1),
(18,4),
(19,3),
(20,6),
(21,7),
(22,8),
(23,7),
(24,9),
(25,8),
(26,10),
(27,10),
(28,9),
(29,8),
(30,7),
(1,6),
(2,5),
(3,4),
(4,3),
(5,2),
(6,1),
(7,4),
(8,6),
(9,5),
(10,3),
(11,7),
(12,8),
(13,7),
(14,2),
(15,9),
(16,8),
(17,5),
(18,3);

select * from employee_projects;

-- 1. find the names of employees who work in the same dept as 'Amit'.
select *
from employees 
where dept_id = 
			(select dept_id 
            from employees 
            where emp_id = 1);

-- 2. Find the employees whose salary is greater then the average salary of all employees
select emp_name, salary from employees 
where salary >
			(select avg(salary) 
			from employees);



-- 3. find the employee who work on the same projecrrs as 'Rahul'
select * from employees as e
join employee_projects as ep
on e.emp_id = ep.emp_id
join projects as p
on p.project_id = ep.project_id
where ep.project_id in (
				select ep2.project_id 
				from  employee_projects ep2
				join employees e2 
                on ep2.emp_id = e2.emp_id
				where e2.emp_name = 'Rahul')
and  e.emp_name != 'Rahul';


-- 2nd way
select * from employees e
join employee_projects as ep
on e.emp_id = ep.emp_id
where ep.project_id in (
						select project_id
                        from employee_projects
                        where emp_id = 3);
                        

-- 4. find employee who do not work on any proect.
select emp_name,e.emp_id from employees as e
left join employee_projects as ep
on e.emp_id = ep.emp_id
left join projects as p
on ep.project_id = p.project_id
where ep.project_id is null;

 -- 2nd way 
select emp_name,e.emp_id from employees as e
join employee_projects as ep
on e.emp_id = ep.emp_id
join projects as p
on ep.project_id = p.project_id
where e.emp_id = (select project_id 
					from projects 
                    where e.emp_id is null);
          
-- 3rd way
	select emp_id , emp_name
    from employees 
    where emp_id not in (select distinct emp_id from employee_projects);
    
-- 5. find the names of employes who work in departments that have projects 
-- with  budget greater than 150000
select emp_name,d.dept_name,d.dept_id,budget from employees as e
join departments as d
on d.dept_id = e.dept_id
join employee_projects as ep
on e.emp_id = ep.emp_id
join projects as p
on p.project_id = ep.project_id
where d.dept_id in (
					select dept_id 
                    from projects 
                    where budget > 150000
				);
                
select e.emp_name
from employees  e
where e.dept_id in (select p.dept_id 
					from projects p
                    where p.budget > 15000);

    
-- 6. find the employees who are working on more than one project.
select e.emp_id, e.emp_name, count(ep.project_id) as total_project
from employees e
join employee_projects as ep
on e.emp_id = ep.emp_id
join projects p
on p.project_id = ep.project_id
group by e.emp_id
having total_project >  1;

-- 7. find the employees whose salary is greater than the average salary of theri department
select *
from employees e1
where salary > (select avg(salary) 
				from employees e2
                where e2.dept_id = e1.dept_id
                ); 
                
-- 8. find the employees who work in departments that have more than 2 employes.
select * from employees 
where dept_id = (select count(emp_id) as total_emp
				from employees 
                having total_emp > 1;

-- 9. fins thee employees who work on project belongs to the it dept.