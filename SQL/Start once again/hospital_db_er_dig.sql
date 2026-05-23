create database hospital_db;
use hospital_db;


create table hospital(
hospital_id int primary key ,
hospital_name varchar(255),
address varchar(255),
city varchar(255),
contact_no varchar(12),
email varchar(255));

create table department (
department_id int primary key auto_increment,
hospital_id int,
department_name varchar(255),
department_location varchar(255),
description text ,
constraint Fk_department_hostpital foreign  key (hospital_id) references hospital(hospital_id) on delete cascade on update cascade );

select * from department;
select * from hospital;

create table room(
room_id int primary key auto_increment,
hospital_id int,
room_number int,
room_type enum("ICU", "General" ," Private"),
room_charge int,
status enum("available", "occupied"),
constraint Fk_room_hospital foreign key (hospital_id) references hospital (hospital_id) on delete cascade on update cascade);

create table doctors (
doctor_id int primary key auto_increment,
department_id int, -- (FK)
hospital_id int, -- (FK)
doctor_name varchar(255),
specialization varchar(255),
phone varchar(13),
salary decimal(9,2),
experience_years year,
constraint Fk_doctors_dept foreign key (department_id)references department (department_id) on delete cascade on update cascade,
constraint Fk_doctore_hospital foreign key (hospital_id) references hospital(hospital_id) on delete cascade on update cascade);

create table patinets(
patient_id int primary key auto_increment,
patient_name varchar(255),
gender enum('male','female','other'),
age int,
address varchar(255),
phone varchar(12),
blood_group varchar(3),
date_of_registration timestamp);

create table medicine (
medicine_id int primary key auto_increment,
medicine_name varchar(255),
manufacturer varchar(255),
price int,
expiry_date date,
stock_quantity int);

create table bills (
bill_id int  auto_increment,
patient_id int,
hospital_id int,
total_amount int,
payment_status enum('paid', 'unpaid'),
payment_method enum ('online','cash'),
bill_date date,
primary key (bill_id, patient_id, hospital_id),
constraint Fk_bills_patine foreign key (patient_id)references patinets(patient_id)on delete cascade on update cascade,
constraint Fk_bills_hospital foreign key(hospital_id) references hospital (hospital_id) on delete cascade on update cascade);

create table appointemet (
appointment_id int primary key auto_increment, -- (Partial Key or PK)
doctor_id int, -- (FK)
patient_id int,  -- (FK)
appointment_date date,
appointment_time time,
status varchar(255),
constraint Fk_appointment_doctoer foreign key (doctor_id) references doctors(doctor_id) on delete cascade on update cascade,
constraint Fk_appointment_patinent foreign key (patient_id)references patinets(patient_id)on delete cascade on update cascade
);

create table record (
record_id int primary key auto_increment,
patient_id int, -- (FK)
doctor_id int, -- (FK) 
diagnosis varchar(255),
treatment_details text,
admission_date date,
discharge_date date,
constraint Fk_record_patient foreign key (patient_id) references patinets(patient_id) on delete cascade on update cascade,
constraint Fk_reocrd_doctor foreign key (doctor_id) references doctors(doctor_id) on delete cascade on update cascade );

create table prescription ( 
prescription_id int primary key auto_increment,
record_id int,-- (FK)
doctor_id int, -- (FK)
patient_id int , -- (FK)
prescription_date date ,
constraint Fk_prescription_record foreign key (record_id) references record (record_id)on delete cascade on update cascade ,
constraint Fk_prescription_patient foreign key (patient_id) references patinets(patient_id) on delete cascade on update cascade,
constraint Fk_prescription_doctor foreign key (doctor_id) references doctors(doctor_id) on delete cascade on update cascade);

create table Prescription_Medicine(
prescription_id int ,
medicine_id int,
quantity int,
dosage int,
duration varchar(255),
constraint Fk_prescription_medicine_prescription foreign key (prescription_id) references prescription (prescription_id) on delete cascade on update cascade,
constraint Fk_prescription_medicine_medicine foreign key (medicine_id) references medicine(medicine_id) on delete cascade on update cascade);




