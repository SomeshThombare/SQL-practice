-- Inbuilt functions:-
create database inbuiltFunctionDB;
use inbuiltFunctionDB;
-- Numeric functions(Mathematical):-
-- abs(x):- absolute value
select abs(-101);
select abs(-1);
select abs(100);
-- ceil(x)/ceiling(x):- round up
select ceil(90.56);
select ceil(90.40);
-- floor(x):- round down
select floor(45.99);
-- round(x, d) :- round to d decimals 
select round(999.89548,3);
-- truncate(x,d) :- cut decimals
select truncate(999.89599,2);
-- mod(a, b):- remainder
select mod(10,2);
-- power(x,y)/pow(x,y):- x^y
select pow(10,2);
-- sqrt(x) :- square root
select sqrt(25);
-- rand() :- returns random numbers from (0 to 1)
select rand(); 
select rand() * 6;  
select floor(rand() * 6);
select ceil(rand() * 6); 

create table students (s_id int primary key auto_increment,
s_name varchar(225) not null, s_grade int);
insert into students (s_name,s_grade)values("Paras",ceil(rand() * 10));
select * from students;
-- sign(x):-
select sign(-101); -- > returns -1 when negative value
select sign(101); -- > return 1 when positive value
select sign(0); -- > returns 0 when 0 
-- pi():-
select pi();
-- string functions:-
-- length() :- lenght in bytes
select length("Paras");
select length("💕"); 
-- char_length():- lenght in charachters
select char_length("Paras");
select char_length("💕"); 
-- upper(str)/ucase(str):-
select ucase("KaranSharma@Gmail.com");
-- lower(str)/lcase(str):-
select lcase("KaranSharma@Gmail.com");
-- concat():- join strings
select *,concat(lower(s_name),"@gmail.com") as email from students;
-- concat_ws(seprator,string1,string2...) :- join with seprator
select concat_ws(",","2026","01","23") as todays_date;
-- substring(string, index, length)/substr(string, index, length):- Extract part
select substr("MySQL",3,1);
select substr("MySQL",3,2);
-- left(string, index)/ right(string, index):-
select left("MySQL",3);
select right("MySQL",3);
-- Replace(string, "Text to be replaced", "Text to be replaced with"):-
-- replace the text
select * from students;
select *, replace(s_name, 'Kriti', 'Kashish') from students;
select replace("PostgresSQL","Postgres","My");
-- instr(string, substr of which you need to find the index of):- find position
select instr("hello friend", "e");
-- locate(substr of which you need to find the index of, String, index):- find  position
select locate("e","hello friend",5);
-- reverse():- reverse string
select reverse('abc');
-- lpad()/rpad() :- pad string
select lpad("Kriti",10,"*");
select rpad("Kriti",10,"*");
select *, rpad(s_name,10,"-") from students;


-- format(): format numbers:-
select format(123456789.5634232,3);
-- Date and time function:-
-- 1) curdate():- returns today's date
select curdate();
-- 2) Current_date():- same as curdate().
-- 3) curtime() :- returns current time
select curtime();
-- 4) now():- used with date and time
-- date and time :- "2026-01-23 15:14:23"
-- timestamp :- "2026-01-23 10:14:23"
select now();
-- 5) current_timestamp():- used with timestamp
select current_timestamp();
-- 6) sysdate():-
select sysdate();
-- extracting parts of date/time functions:-
-- 1) year
select year("2002-09-04");
-- 2) months
select month("2002-09-04");
-- 3) day()
select day("2002-09-04");
-- 4) dayname():-
select dayname(now());
-- 5) monthname():-
select monthname(now());
-- 6) hour():-
select hour(now());
-- 7) minute():-
select minute(now());
-- 6) second():-
select second(now());
-- date():-
select date(now());
-- time():-
select time(now());
-- date calculations:-
-- 1) datediff():-
select datediff(now(),"2008-11-26");
select datediff("2026-12-31",now());
-- 2) timestampdiff():-
select timestampdiff(year,"2008-11-26",now()) as year_passed_since_mumbai_attacks;
select timestampdiff(year,"2004-09-24",now()) as my_age;
select timestampdiff(year,now(),"2030-01-24");
select timestampdiff(month,now(),"2030-01-24");
select timestampdiff(day,now(),"2030-01-24");
select timestampdiff(hour,now(),"2030-01-24");
select timestampdiff(minute,now(),"2030-01-24");
select timestampdiff(second,now(),"2030-01-24");
-- 3) date_add()
select date_add("2000-01-01",interval 50 year);
-- 4) date_sub()
select date_sub(now(),interval 50 year);
-- 5) adddate()
select adddate("2000-01-01",50);
-- 6) subdate()
select subdate("2000-01-01",50);
-- 7) last_day():-
select last_day("2026-02-05");
select last_day(now());
-- formating and conversion:-
-- date_format();
select date_format(now(),"%d-%m-%y"); 
select date_format(now(),"%D-%M-%Y"); 
select date_format(now(),"%W-%D-%M-%Y"); 