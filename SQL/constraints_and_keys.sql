-- constarints keys
-- 1] unique 
create database con_keys;
use con_keys;
create table employee(
e_id int,
e_name varchar(23),
e_email varchar(255) unique
);
desc employee;

insert into employee () values(101,'sam','sam1@gmail.com');
select * from employee;

insert into employee (e_id, e_email) values(1002,'rohit@gmail.com')

-- 2] not null
CREATE table employee1(
e_id int,
e_name varchar(23) not null,
e_email varchar(255) unique
);
select * from employee1;
desc employee1;

insert into employee1 (e_id,e_email)values (101,'sam@gmail.com');-- this queryis not run
insert into employee1 (e_id,e_name,e_email)values (101,'sam','sam@gmail.com');

-- 3] check 
create table emp (
e_id int ,
e_name varchar(255) not null,
e_email varchar(255) unique,
e_age int check (e_age >= 18)); 

insert into emp () values (101, 'sam', 'sam@gmail.com', 18);
select * from emp;

alter table emp add column gender varchar(1);  
select * from emp;

alter table emp modify column gender varchar(1) check( gender in ('m','f','t')) ;
insert into emp (e_id,e_name, e_email, e_age,gender) values(101,'sam','sam11@gmail.com',20,'m');

-- 4] DEFAULT
create table student (
s_id int ,
s_name varchar(255) not null ,
 s_email varchar (255) unique,
 s_gender varchar(1) check (s_gender in ('m','f','t')), 
 s_countary varchar(255) default ('india'));
 
 select * from student;
 INSERT INTO student (s_id, s_name, s_email, s_gender, s_countary)
VALUES (101, 'sam', 'sam@gmail.com', 'm', 'india');

INSERT INTO student (s_id, s_name, s_email, s_gender)
VALUES (102, 'somnath', 'somnath@gmail.com', 'm');

-- 5] primary key
create table student1(
s_id int primary key,
s_name varchar(255) not null,
s_email varchar (255) unique
);


