-- joins 
create database Joins;
use Joins;

create table students(s_id int primary key auto_increment,
s_name varchar(255),
a_age int) auto_increment = 101;

create table courses(c_id int primary key auto_increment,
c_name varchar(255)) auto_increment = 1001;

create table enrollments (s_id int , 
c_id int, marks decimal(5,2),
constraint Fk_students_enrollments foreign key (s_id)
references students(s_id) on delete cascade on update cascade,
constraint Fk_course_enrollments foreign key(c_id)
references courses(c_id) on delete cascade on update cascade);

desc enrollments;

insert into students (s_name, a_age) values
('somesh Thombare',21),
('somnath Thombare',22),
('Rahul sharma', 23),
('Shaym Singha Roy', 35),
('Virajy gourav', 20),
('Mega Sutar', 43),
('Rohit vrma',22),
('Virat sharma', 21),
('sanket Patil',22),
('Jetalaal ghada', 32);

select * from students;

insert into  courses (c_name) values
('Java Programming'),
('DBMS'),
('DSA'),
('OS');

insert into enrollments (s_id, c_id, marks) values
(101, 1001, 89.98),
(101, 1002, 78.50),

(102, 1001, 99.90),
(102, 1003, 91.49),

(103, 1002, 72.80),
(103, 1004, 90.80),

(104, 1003, 89.89),
(104, 1004, 58.65),

(105, 1001, 45.65),
(105, 1004, 54.58),

(106, 1002, 89.87),
(106, 1003, 43.55),

(107, 1004, 88.35),
(107, 1005, 98.55),

(108, 1001, 55.66),
(108, 1002, 87.22),  

(109, 1003, 68.22),
(109, 1003, 95.55),

(110, 1002, 97.56),
(110, 1004, 97.00);


insert into enrollments (s_id, c_id, marks) values
(101, 1001, 89.98),
(101, 1002, 78.50),
(102, 1001, 99.90),
(102, 1003, 91.49),
(103, 1002, 72.80),
(103, 1004, 90.80),
(104, 1003, 89.89),
(104, 1004, 58.65),
(105, 1001, 45.65),
(105, 1004, 54.58),
(106, 1002, 89.87),
(106, 1003, 43.55),
(107, 1004, 88.35),  -- corrected
(108, 1001, 55.66),
(108, 1002, 87.22),  
(109, 1003, 68.22),
(110, 1002, 97.56),
(110, 1004, 97.00);


-- 1 inner join
select * from students
inner join enrollments
on students.s_id = enrollments.e_id;


select * from students as s
inner join enrollments as e
on s.s_id = e.s_id;

select e.s_id, s.s_name, e.c_id, e.marks, c.c_name
from students s 
inner join enrollments e 
on s.s_id = e.s_id
join courses c
on c.c_id = e.c_id;

-- 2 left join
select * from students  s 
left join enrollments e 
on s.s_id = e.s_id left join courses c
on c.c_id = e.c_id;

select* from  courses c
left join  enrollments e  
on c.c_id = e.c_id
left join students s 
on s.s_id = e.s_id;

-- 3. left null join
select * from students s
left join enrollments e 
on s.s_id = e.s_id
left join courses c 
on c.c_id = e.c_id;
-- where e.s_id is null;

-- 4. right join (right outer join) -- rerely used

select * from students s 
right join enrollments e 
on s.s_id = e.s_id
right join courses c 
on c.c_id = e.c_id; 

-- 5. right null  join (right outer join) -- rerely used

select * from students s 
right join enrollments e 
on s.s_id = e.s_id
right join courses c 
on c.c_id = e.c_id; 
-- where s.s_id  is null;
 
 -- 6. cross join
 select s.s_name, c.c_name 
 from courses c
cross join students s;

select s.s_name, c.c_id , c.c_name , s.s_id
from courses c 
cross join students s;

-- 7 self join -- not a seprate keyword  
create table employees (e_id int primary key auto_increment,
e_name varchar(255) not null,
m_id int,
constraint fk_employee_manager foreign key (m_id) references employees(e_id)
on delete cascade on update cascade);

insert into employees (e_name, m_id) values
-- top level manager
('Raj malhotra', NULL), -- 1
('Neha sharma',NULL), -- 2
('Amit Verma',NULL), -- 3

-- employee unser raj (1)
--   4                 5                 6
('karan mehta',1),('simran kaur',1),('Deepak yadav',1), -- 4, 5, 6

-- employe under neha (2)
--      7                8                   9
('Ritika sen',2),('Mohit Bansaal',2),('Anjali raw',2), -- 7, 8 ,9

-- employee under amit (3)
--      10                11
('Saurabh Jain',3),('Pooja Nair',3), -- 10, 11

-- lowear level (reportign to mid - level manager)
('Harsh patel', 4),
('Nidhi kapoor',5),
('Aditya singh',7),
('Megha Gupta',10);
desc employees;
select * from employees;

select e1.e_id as manager_id,
e1.e_name as manager_name,
e2.e_id as employee_id,
e2.e_name as employee_name
from employees e1 
join employees e2
on e1.e_id = e2.m_id; 

-- 8 full outer join (set operators;)
select * from students
natural join enrollments;


