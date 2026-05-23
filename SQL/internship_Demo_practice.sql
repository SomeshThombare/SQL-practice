create database internship_demo;
use internship_demo;
-- 1 CREATE
CREATE TABLE internship_demo (
    S_rollno INT,
    s_name VARCHAR(20),
    s_address CHAR(20)
);

-- 2. ALTER
-- alter command-alter is used to modify the table structure
alter table internship_demo add column age int;

-- ADD THE TABLE BEWTWEEN TWO TABLE
alter table internship_demo add column mob_no varchar(11) after s_address;

-- 3. MODIFY -- it is used to cahnge the daratypes like int to --> varchar() or varchar() --> int ect...
alter table internship_demo modify column age varchar(10);

-- 4 Drop --Deletes entire table structure + data
-- drop database
create database student_drop;
drop database student_drop; 
-- drop table 
create database student_drop;
use student_drop
CREATE TABLE students(
stud_rollno int,
stud_name varchar(20)
);
select * from students
drop table students;

-- drop column
CREATE TABLE students(
stud_rollno int,
stud_name varchar(20)
);
ALTER TABLE students DROP COLUMN stud_name;
select * from students


-- 5. TRUNCATE --delets all rows but keeps the table structure OR delet the all record but not a table strucure
CREATE TABLE students_truncate(
stud_rollno int,
stud_name varchar(20),
stude_add char(59)
);

insert into students_truncate (stud_rollno,stud_name,stude_add)values(101,'sam','karad'),(102,'Somnah','akt');
insert into students_truncate (stud_rollno, stud_name, stude_add) value (104,'Somesh','solapur');
select * from students_truncate;
truncate table students_truncate;

-- 5. RENAME -
-- command --> viweing the table list {show table}
create table sam(s_name varchar(10),s_city varchar(15));

RENAME TABLE sam TO SOMNATH;
insert into SOMNATH (s_city)values('akt');
select * from SOMNATH;

insert into sam (s_city)values('akt'); -- show error
select * from sam; -- show error

-- DML Commands 
-- 1. INSERT
-- inssert the values 
INSERT INTO internship_demo (S_rollno, s_name, s_address) 
VALUES (101, 'SAM', 'Karad');
insert into internship_demo(S_rollno, s_name, s_address) values (105,'Samarth','Solapur'),(106,'ram','Solapur');

INSERT INTO internship_demo(S_rollno) VALUES(102),(103),(104);
insert into internship_demo(s_name) values ('somnath');
-- 2. SELECT
SELECT * FROM internship_demo;
DESC internship_demo;

-- 3. update

CREATE TABLE internship_demo (
    S_rollno INT,
    s_name VARCHAR(20),
    s_address CHAR(20)
);

SELECT * FROM internship_demo;

insert into internship_demo(S_rollno, s_name, s_address) values (105,'Samarth','Solapur'),(106,'ram','Solapur');

UPDATE internship_demo
SET s_name = 'AKKAlKOT'
WHERE S_rollno = 105
LIMIT 1;

-- tur on the sge update mode
set sql_safe_updates = on;
set sql_safe_updates = 1;


-- DATE AND TIME
create table date_time(
s_name char(15),
dob date,
doj datetime,
attendence time,
current_year year
);

insert into date_time ( s_name,dob,doj, attendence, current_year) values('Sam',curdate(),now(),curtime(),year(now()));
insert into date_time ( s_name,dob,doj, attendence, current_year) values('Sam',curdate(),now(),curtime(),year(curdate()));

select *from date_time;