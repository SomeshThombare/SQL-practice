-- 18/03/2026/WED
-- DCL 
-- 1. greant
-- 2. revoke

-- create a user with your own name on localhost
-- estanlish a connection for that user
-- and give priviliges for any one database and all the tables inside thet daatabase
-- priviliges shoud be inserting, updating and selecting data
-- then revoke updating adn inserting for that user.

create user 'sam'@'localhost' identified by 'sam123';

grant select, insert, update
on sales_analysis.*
to 'sam'@'localhost';

revoke update, insert
on sales_analysis.*
from  'sam'@'localhost';



-- give select priviliges of company_sp_pracitice.emp
-- for all column 
-- emp_id , emp_name and age

grant select(customer_id, customer_name)
on  sales_analysis.customers
to 'sam'@'localhost';

-- give me all prviliges for departmetn  table in c_s_P DB to the user
-- insert  a new departmetn inside a transaction
-- and  comit those changes

grant all privileges
on sales_analysis.*
to 'sam'@'localhost';

grant insert
on sales_analysis.*
to 'sam'@'localhost';

use sales_analysis;
select * from customers;
