create database imdDB;
use imdDB;

create table actors(
nconst varchar(255)primary key,
primaryName varchar(255),
birthYear int,
deathYear int,
primaryProfession varchar(255),
knownForTitles varchar(255)
);

-- show variables like 'secure_file_prive';

set global net_read_timeout = 600;
set global net_write_timeout = 600;
set global wait_timeout = 600;
set global interactive_timeout = 600;

set global max_allowed_packet = 1073741824;

load data infile "C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/name.basics.tsv"
into table actors
fields terminated by  '\t'
lines terminated by  '\n'

ignore 1 rows
(nconst,	primaryName,	@birthYear,	@deathYear,	primaryProfession, knownForTitles)
set 
birthYear = nullif(@birthYear, '\\n'),
deathYear = nullif(@deathYear, '\\n');

-- indexig
create index actor_index on actors(primaryName);

select * from actors;

-- exporet into csv
/* with column headers
select 'emp_id', 'emp_name','hire date', 'salary','dept_id','manaher_id'
union
into outfile " file path" with file name
fields terminated by ','
enclosed by '"'
lines terminated by '\n';
*/
select 'nconst','primaryName','birthYear','deathYear','primaryProfession', 'knownForTitles'
union 
-- select nconst,	primaryName, birthYear,	deathYear,	primaryProfession, knownForTitles
select * from actors
into outfile 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/actors1.csv'
fields terminated by ","
-- encloed by '"'
lines terminated by '/n';

desc actors;

-- -------------------------------------------------------------------------------------------------------------------------------------------
-- for title fle
-- file attribute: titleId	ordering	title	region	language	types	attributes	isOriginalTitle



create table title(
    titleId VARCHAR(255), 
    ordering INT,
    title text(255),
    region VARCHAR(255),
    language VARCHAR(255),
    types VARCHAR(255),
    attributes VARCHAR(255),
    isOriginalTitle boolean
);

drop table title;

load data infile "C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/title.akas.tsv"
into table title
fields terminated by  '\t'
lines terminated by  '\n'
ignore 1 rows
(titleId,	ordering,	title,	@region,	@language,	@types,	@attributes,	isOriginalTitle)
set 
region = nullif(@region, '\\n'),
language = nullif(@language, '\\n'),
types = nullif(@types, '\\n'),
attributes = nullif(@attributes, '\\n');

select * from title;

select * from title where title = 'carmecita';
desc title;

create index movie_title_index on 
title(title(100));

set profiling = 1 ;
show profiles;

-- note: for csv topic
-- fields terminated by ',' for csv file use ','
-- enclosed by '"'; when the value is given in '' or '' cot then use it

-- using CSV through
create table lung_cancer(
id int primary key,
age int,
gender varchar(255),
country varchar(255),
diagnosis_data date,
cancer_stage varchar(255)
);

load data infile "C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/title.akas.tsv"
into table title
fields terminated by  ','
lines terminated by  '\n'
ignore 1 rows;
-- (---------)
-- uncompleted code

-- -----------------------------------------------------------------------------------------------------------------------------------------

-- how to create CSV files
/* without column header
select * from employees
into outfile 'file path'; -- with forwad slash --  write name of file name with path
fields terminated by ','
enclosed by '"'
lines terminated by '\n';
*/

/* with column headers
select 'emp_id', 'emp_name','hire date', 'salary','dept_id','manaher_id'
union
into outfile " file path" with file name
fields terminated by ','
enclosed by '"'
lines terminated by '\n';
*/


-- -----------------------------------------------------------------------------------------------------------------------------------------
-- practice sesson 

-- task import the data into table 
-- create index on any one column
-- export the data into csv

create table titanic (
    passengerid int primary key,
    survived varchar(255),
    pclass varchar(255),
    name varchar(255),
    sex varchar(10),
    age decimal(5,2),
    sibsp varchar(255),
    parch varchar(255),
    ticket varchar(50),
    fare decimal(10,2),
    cabin varchar(50),
    embarked varchar(5)
);
drop table titanic;

load data infile "C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/titanic.tsv"
into table titanic
fields terminated by '\t'
lines terminated by '\n'
ignore 1 rows
(passengerid, survived, pclass, name, sex, @age, @sibsp, @parch, ticket, @fare, @cabin, @embarked)
set
age = nullif(@age,'//n'),
sibsp = nullif(@sibsp,'//n'),
parch = nullif(@parch,'//n'),
fare = nullif(@fare,'//n'),
cabin = nullif(@cabin,'//n'),
embarked = nullif(@embarked,'//n');

select * from titanic;

select count(passengerId) from titanic;
create index passenger_index on titanic(passengerid);

-- export the data into new_titanic.csv file
select 'passengerid', 'survived', 'pclass', 'name', 'sex','age', 'sibsp', 'parch', 'ticket', 'fare', 'cabin', 'embarked'
union 
select * from titanic
into outfile 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/new_titanic.csv'
fields terminated by ','
enclosed by '"'
lines terminated by '\n';



-- how to export database
-- CLI
-- GUI

-- mysqldump -u root -p college_db.sql

