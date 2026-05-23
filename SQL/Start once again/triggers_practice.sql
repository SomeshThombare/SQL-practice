-- 16/03/2026/Mon
-- trigggers ands events
use triggers_events;

select * from customers;
select * from order_items;
select * from orders;
select * from products;

/*
q4.before update trigger
product price cannot be negative
task: create before upate trigger on products
of new.price  < 0 
show error.
*/

delimiter $$
create trigger produdct_before_update_trigger
before update on products
for each row
begin
	if new.price < 0 then
    signal sqlstate '45000'
    set message_text = 'price canot be negative';
    end if;
end $$
delimiter ;

update products set price = -4500 where product_id = 1;


/*
Q.5 after update trgger
secnario: whenever stock is updated  manually log it
task: create after update trigger on products
inser into inverntoy_log
*/
delimiter $$
create trigger product_after_update_trigger
after update on products
for each row
begin
	if old.stock <> new.stock then
    insert into inventory_log(product_id, old_stock, new_stock)
    values(new.product_id, old.stock, new.stock);
    end if;
end $$
delimiter ;


/*
Q.6 prevet deletig produts id stock is still availalble.
task:
create before delet triger on products
if stock > 0;
*/

delimiter $$
create trigger prevent_product_delet
before delete on products
for each row
begin
  if old.stock > 0 then 
  signal sqlstate  '45000'
  set message_text = 'product is not null so u cannot delet ';
  end if;
end $$
delimiter ;

drop trigger prevent_product_delet;

/*
Q.7 if a product is deleted , log taht action
task: create after delete triggers on products
insert record in inventory log
*/

delimiter $$
create trigger log_deleted_products
after delete on products 
for each row
begin
	
    insert into inventory_log(product_id, old_stock, new_stock)
    values(old.product_id, old.stock, 0);

end $$
delimiter ;

select * from products;
delete from products where product_id = 10;
select  * from order_items;
select * from inventory_log;

/*
Q.8: after insert trigger (orders)
whenever a new orders is placed , print message
example: 
new order placed
order_id : x
customer_id : Y
*/

delimiter $$
create trigger after_insert_trigger
after insert on orders
for each row
begin
	insert into msg_logs(message)
    values(concat('New order placed - Order id:', new.order_id,
			'Customer Id:', new.customer.id));
end $$
delimiter ;

drop trigger  after_insert_trigger;

create table msg_logs(log_id int primary key auto_increment,
message text,
creaated_at timestamp default current_timestamp);
select * from msg_logs;

/*
Q. 10  advance trigger question
-- if product strock falls below 5 units
automatically disply warning:
low stock warning
task: create a new table low_stock_prodcuts --> product_id , product_stock
*/
create table low_stock_products( p_id int primary key auto_increment,
product_id int, 
product_stock int,
created_at timestamp default current_timestamp);

ALTER TABLE low_stock_products 
RENAME COLUMN p_id TO low_stock_id;

delimiter $$
create trigger low_stock_update
after update on products
for each row
begin
     INSERT INTO low_stock_products (product_id, product_stock)
        VALUES (old.product_id, new.stock);
	
end $$
delimiter ;

 select * from order_items;
drop trigger advance_trigger;
select * from low_stock_products;
select * from products;

