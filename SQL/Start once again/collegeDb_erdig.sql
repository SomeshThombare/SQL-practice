create database CollegeDb;
use CollegeDb;

create table department (
d_id int primary key auto_increment,
d_name varchar(255),
d_location varchar(255));

create table student(
s_id int primary key auto_increment,
first_name varchar(255) not null,
last_name varchar(255) not null,
city varchar(255), 
pincode varchar(6),
p_no varchar(12),
email varchar(255),
d_id int,
constraint Fk_studnt_dept foreign key (d_id)
references department(d_id) 
on delete set null 
on update cascade );

create table teacher (
t_id int primary key auto_increment,
first_name varchar(255) not null,
last_name varchar(255) not null,
gender enum('male',"female",'other'),
salary decimal(9,2) check (salary >=0),
street varchar(255),
city varchar(255), 
pincode varchar(6),
d_id int,
constraint Fk_teacher_dept foreign key (d_id)references department(d_id) on delete set null on update cascade );

create table course (
c_id int primary key auto_increment,
course_name varchar(255),
duration int,
price decimal(9,2),
created_at timestamp); 

create table teacher_course (
t_id int, c_id int,
start_at time,
primary key (t_id, c_id),
constraint Fk_teacher_course foreign key (t_id)  references teacher (t_id) on delete cascade on update cascade,
constraint fk_course_teacher foreign key(c_id) references course(c_id) on delete cascade on update cascade);


create table enrollments(
s_id int, c_id int,
grade char(255),
primary key (s_id, c_id),
constraint Fk_enrollments_student foreign key (s_id) references student (s_id) on delete cascade on update cascade,
constraint Fk_enrollmets_course foreign key (c_id) references course (c_id) on update cascade on delete cascade);


