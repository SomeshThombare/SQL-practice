-- practical set 2 || 19/01/2025
create database college_db;
use college_db;

create table departments (
dept_id int primary key auto_increment,
dept_name varchar(255) unique not null,
location varchar(255) default 'india'
);
alter table departments auto_increment = 1001;


create table students (
student_id int primary key auto_increment,
name varchar(255) not null,
email varchar(255) unique,
age int check (age >= 18),
dept_id int,
admission_date datetime default now(),
constraint fk_students_dept foreign key (dept_id) references departments(dept_id)
);

alter table students auto_increment = 1001;

insert into departments (dept_name, location) values
('computer', 'india'),
('mechanical', 'india'),
('electrical', 'india');

insert into students (name, email, age, dept_id) values
('sam', 'sam@gmail.com', 20, 1001),
('rohan', 'rohan@gmail.com', 21, 1001),
('ram', 'ram@gmail.com', 22, 1002),
('sita', 'sita@gmail.com', 19, 1003),
('gita', 'gita@gmail.com', 23, 1002);


select * from departments;
select * from students;
 -- task 4
insert into students (name, email, age, dept_id)
values ('ajay', 'ajay@gmail.com', 15, 1001);

insert into students (name, email, age, dept_id)
values ('sam', 'sam@gmail.com', 20, 1001);

insert into students (name, email, age, dept_id)
values ('amit', 'amit@gmail.com', 20, 1005);


