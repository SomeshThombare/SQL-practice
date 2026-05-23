create database student_practical;
use student_practical;
create table employee(
emp_id int primary key,
emp_code smallint ,
salary decimal(20,2),
full_name varchar(150),
gender char(1),
email varchar(150),
join_date date,
login_time time,
created_at datetime,
profile_pic mediumblob,
is_active boolean,
video longblob
);

insert into employee (emp_id, emp_code, salary, full_name, gender, email, join_date, login_time, 
                      created_at, profile_pic, is_active, video) 
                      values(101,001,2500,'Somnath Thommbare','M','sam@gmail.com',
                      '2025-01-14', '15:06:07', '2026-01-14 15:06:07',
                      load_file('C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/pic.jpg'),
                      1,load_file('C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/video.mp4')
                      );
                      
INSERT INTO employee (emp_id, emp_code, salary, full_name, gender, email, join_date, login_time, 
created_at, profile_pic, is_active, video) VALUES (102,102,35000.00,'Somnath','M',
'somnath@gmail.com',CURDATE(),CURTIME(),NOW(),LOAD_FILE('C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/pic2.jpg'),
1,LOAD_FILE('C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/video2.mp4')), 

(103,103,45000.00,'Rohan','M','rohan@gmail.com',CURDATE(),CURTIME(),NOW(),
LOAD_FILE('C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/pic3.jpg'),1,
LOAD_FILE('C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/video3.mp4'));

INSERT INTO employee (emp_id, emp_code, salary, full_name, gender, email, join_date, login_time, created_at, profile_pic, is_active, video) VALUES
(104,104,40000.00,'Virat Kohli','M','virat@gmail.com',CURDATE(),CURTIME(),NOW(),LOAD_FILE('C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/pic2.jpg'),1,LOAD_FILE('C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/video2.mp4')),
(105,105,38000.00,'Rohit Sharma','M','rohit@gmail.com',CURDATE(),CURTIME(),NOW(),LOAD_FILE('C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/pic2.jpg'),1,LOAD_FILE('C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/video2.mp4')),
(106,106,36000.00,'MS Dhoni','M','dhoni@gmail.com',CURDATE(),CURTIME(),NOW(),LOAD_FILE('C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/pic2.jpg'),1,LOAD_FILE('C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/video2.mp4')),
(107,107,42000.00,'Smriti Mandhana','F','smriti@gmail.com',CURDATE(),CURTIME(),NOW(),LOAD_FILE('C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/pic2.jpg'),1,LOAD_FILE('C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/video2.mp4')),
(108,108,39000.00,'Harmanpreet Kaur','F','harmanpreet@gmail.com',CURDATE(),CURTIME(),NOW(),LOAD_FILE('C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/pic2.jpg'),1,LOAD_FILE('C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/video2.mp4')),
(109,109,41000.00,'KL Rahul','M','klrahul@gmail.com',CURDATE(),CURTIME(),NOW(),LOAD_FILE('C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/pic2.jpg'),1,LOAD_FILE('C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/video2.mp4')),
(110,110,37000.00,'Jemimah Rodrigues','F','jemimah@gmail.com',CURDATE(),CURTIME(),NOW(),LOAD_FILE('C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/pic2.jpg'),1,LOAD_FILE('C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/video2.mp4'));

DELETE FROM employee
WHERE emp_id = 101;

select * from employee;
show variables like '%secure_file_priv%'