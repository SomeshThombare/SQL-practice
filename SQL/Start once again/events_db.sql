-- 16/03/2026/ EVENTS
create database events_db;
use events_db;

CREATE TABLE patients (
 patient_id INT PRIMARY KEY AUTO_INCREMENT,
 name VARCHAR(100),
 email VARCHAR(150) UNIQUE,
 admitted_at DATETIME,
 status VARCHAR(20)
);
CREATE TABLE medicines (
 medicine_id INT PRIMARY KEY AUTO_INCREMENT,
 name VARCHAR(100),
 stock INT,
 expiry_date DATE
);
CREATE TABLE appointments (
 appointment_id INT PRIMARY KEY AUTO_INCREMENT,
 patient_id INT,
 doctor VARCHAR(100),
 scheduled_at DATETIME,
 status VARCHAR(20),
 
 FOREIGN KEY (patient_id) REFERENCES patients(patient_id)
);
CREATE TABLE event_log (
 log_id INT PRIMARY KEY AUTO_INCREMENT,
 event_name VARCHAR(100),
 ran_at DATETIME,
 message TEXT
);

INSERT INTO patients (name, email, admitted_at, status) VALUES
('Rahul Sharma','rahul@gmail.com','2026-03-01 09:00:00','admitted'),
('Priya Verma','priya@gmail.com','2026-03-02 11:30:00','discharged'),
('Amit Singh','amit@gmail.com','2026-03-03 14:00:00','admitted'),
('Neha Kapoor','neha@gmail.com','2026-03-03 10:15:00','admitted'),
('Vikas Mehta','vikas@gmail.com','2026-03-04 16:20:00','discharged'),
('Anjali Gupta','anjali@gmail.com','2026-03-05 08:40:00','admitted'),
('Rohit Jain','rohit@gmail.com','2026-03-06 13:10:00','admitted'),
('Sneha Reddy','sneha@gmail.com','2026-03-06 17:25:00','discharged'),
('Karan Malhotra','karan@gmail.com','2026-03-07 09:45:00','admitted'),
('Pooja Sharma','pooja@gmail.com','2026-03-08 12:30:00','admitted'),
('Arjun Nair','arjun@gmail.com','2026-03-08 15:00:00','discharged'),
('Simran Kaur','simran@gmail.com','2026-03-09 10:20:00','admitted'),
('Rakesh Kumar','rakesh@gmail.com','2026-03-10 14:35:00','admitted'),
('Meera Iyer','meera@gmail.com','2026-03-11 11:00:00','discharged'),
('Sanjay Patel','sanjay@gmail.com','2026-03-12 16:10:00','admitted');

INSERT INTO medicines (name, stock, expiry_date) VALUES
('Paracetamol',120,'2027-05-01'),
('Ibuprofen',80,'2026-12-01'),
('Amoxicillin',60,'2026-10-15'),
('Azithromycin',40,'2026-09-01'),
('Metformin',90,'2027-03-01'),
('Aspirin',150,'2027-07-01'),
('Cetirizine',75,'2026-08-01'),
('Dolo 650',110,'2027-02-15'),
('Pantoprazole',50,'2026-11-10'),
('Atorvastatin',65,'2027-01-01'),
('Insulin',30,'2026-06-01'),
('Vitamin D',100,'2027-04-01'),
('Calcium Tablets',85,'2027-08-01'),
('Cough Syrup',55,'2026-09-20'),
('Antacid',70,'2027-01-10');



INSERT INTO appointments (patient_id, doctor, scheduled_at, status) VALUES
(1,'Dr. Mehta','2026-03-02 10:00:00','completed'),
(2,'Dr. Shah','2026-03-03 11:30:00','completed'),
(3,'Dr. Patel','2026-03-04 09:15:00','scheduled'),
(4,'Dr. Verma','2026-03-04 14:00:00','scheduled'),
(5,'Dr. Gupta','2026-03-05 10:45:00','cancelled'),
(6,'Dr. Mehta','2026-03-05 12:00:00','completed'),
(7,'Dr. Shah','2026-03-06 09:30:00','scheduled'),
(8,'Dr. Patel','2026-03-06 16:00:00','completed'),
(9,'Dr. Verma','2026-03-07 11:00:00','scheduled'),
(10,'Dr. Gupta','2026-03-07 13:45:00','scheduled'),
(11,'Dr. Mehta','2026-03-08 10:30:00','completed'),
(12,'Dr. Shah','2026-03-08 15:00:00','scheduled'),
(13,'Dr. Patel','2026-03-09 09:00:00','scheduled'),
(14,'Dr. Verma','2026-03-09 14:20:00','completed'),
(15,'Dr. Gupta','2026-03-10 11:15:00','scheduled'),
(1,'Dr. Mehta','2026-03-10 16:30:00','scheduled'),
(3,'Dr. Shah','2026-03-11 10:00:00','scheduled'),
(5,'Dr. Patel','2026-03-11 12:45:00','cancelled'),
(7,'Dr. Verma','2026-03-12 09:50:00','scheduled'),
(9,'Dr. Gupta','2026-03-12 15:10:00','scheduled');

show variables like 'event_scheduler';

show tables;
select * from patients;
select * from medicines;
select * from event_log;
select * from appointments;

-- one time event
delimiter $$
create event expire_old_appointments
on schedule at "2026-03-16 16:36:00"
comment "One time event for data clean up: expire all appointment older than 1 year"
do
begin
update appointments 
 set status = 'expired'
 where scheduled_at < now() - interval 30 day
 and status = 'scheduled';
end $$
delimiter ;

-- how to see teh comment of your events
select event_name, event_comment
from information_schema.EVENTS
WHERE EVENT_NAME = 'expire_old_appointments';

-- RECURRING EVENT :-
SELECT * FROM EVENT_LOG;

CREATE EVENT HEARTBET_LOG
ON schedule EVERY 1 MINUTE
STARTS NOW() + INTERVAL 1 minute
ENDS NOW() + INTERVAL 5 MINUTE
DO
INSERT INTO EVENT_LOG (EVENT_NAME, RAN_AT, MESSAGE)
 VALUES("HEARTBEAT_EVENT_LOG",NOW(),"EVENT SCHEDULAR IS RUNNING FINE");


CREATE TABLE ARCHIVE_PATIENTS LIKE PATIENTS;
DESC ARCHIVE_PATIENTS;
-- ARCHIVE ALL THE PATIENTS WHO HAVE BEEN DISCHARGED FOR MORE THAN 50 DAYS.
DELIMITER $$
CREATE EVENT IF NOT EXISTS ARCHIVE_OLD_PATIENTS
ON SCHEDULE EVERY 1 minute -- 1 DAY
STARTS NOW() + INTERVAL 30 SECOND
COMMENT "USED FOR ARCHIVING OLD PATIENTS"
DO 
BEGIN 
-- ARCHIVING THE PATIENTS INTO ARCHIVE TABLE
INSERT INTO ARCHIVE_PATIENTS 
 SELECT * FROM PATIENTS
 WHERE STATUS = "discharged" AND
 ADMITTED_AT < NOW() - INTERVAL 50 DAY;
 
 -- deleting patients appointments
 delete from appointments
 where patient_id in (SELECT patient_id FROM PATIENTS
 WHERE STATUS = "discharged" AND
 ADMITTED_AT < NOW() - INTERVAL 50 DAY);
 
 -- DELETING THOSE PATIENTS FROM PATINET TABLE
 DELETE FROM PATIENTS
WHERE STATUS = "discharged" AND
 ADMITTED_AT < NOW() - INTERVAL 50 DAY;
END $$
DELIMITER ;
show events;
select * from appointments;
SELECT * FROM PATIENTS;
SELECT * FROM ARCHIVE_PATIENTS;
SHOW EVENTS;
desc appointments;

select * from appointments;