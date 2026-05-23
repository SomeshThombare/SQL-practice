-- relationship 
-- 3) task 
-- 1)  one to one (1:1) relationship
-- q. employesss --> aadher tabel 
create database RelationDB;
use RelationDB;

create table employess (
emp_id int primary key auto_increment,
emp_name varchar(225)
);
alter table employess modify emp_name varchar(225) unique;

create table aadher (
aadher_no int primary key ,
a_name varchar(225) unique,
emp_id int unique,
constraint Fk_emp_aadher foreign key (emp_id) references employess (emp_id) on delete cascade on update cascade,
constraint Fk_employee_aadher foreign key (a_name) references employess(emp_name) on delete cascade on update cascade
);

insert into  employess(emp_name) values ('sam'),('Ram'),('Manu'),('Ramu'); 
insert into  aadher(aadher_no,a_name,emp_id) values(123,'sam',1),(345,'ram',2),(678,'Manu',3),(852,'Ramu',4);
select * from employess;
select * from aadher;

-- q.2  schools --> students table (1:m)
create table school(
s_id int primary key auto_increment,
s_name varchar(225)unique
);
alter table school auto_increment  = 101;

create table student(
stud_id int primary key auto_increment,
stud_name varchar(225),
s_id int , -- fk
constraint fk_school_stud foreign key (s_id) references school(s_id) on delete cascade on update cascade
);
insert into school (s_name) values('skills IT'),('Sanyu infotech'),('JCEP');
insert into student (stud_name, s_id) values ('sam',102),('ram',102),('Somanth',101),('Sanjana',103),('shyam',101);

select * from school;
select * from student;

-- q3. custoemr tables table --> products (M:N)
create table customer(
c_id int primary key auto_increment,
c_name varchar(255))  auto_increment = 101;



create table product (
p_id int primary key auto_increment ,
p_name varchar(225));

create table customr_product (
c_id int,
p_id int,
primary key (c_id, p_id),
constraint fk_customer_product foreign key (c_id) references customer (c_id) on delete cascade on update cascade,
constraint fk_custoemr_prodct foreign key (p_id) references product (p_id) on delete cascade on update cascade
);


insert into customer (c_name) values ('sam'), ('ram'),('SITA'),('shamu');

insert into product (p_name) values ('Laptop'), ('Mouse'),('Monile'),('birds');

insert into customr_product (c_id , p_id) values  (101, 1), (101, 2), (102, 1), (103, 4),(104,4);
select * from customr_product;
select * from customer;
select * from product;
