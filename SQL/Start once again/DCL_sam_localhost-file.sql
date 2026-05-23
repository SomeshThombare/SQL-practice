show grants;

use  sales_analysis;
select customer_id, customer_name
from customers; 
show grants for 'sam'@'localhost';

start transaction;
insert into  customers(customer_name,city,C_date) values ('sam','Akt','2026-03-18');

commit;