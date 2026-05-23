 -- ER  diagram of Ecommorece site
create database Ecommerce_db;
use Ecommerce_db;

-- step 1 - convert strong entity 
 /* 
 1) user(user_id pk, l_name, f_name, email uniqu, p_no, password, role, created_at)
 2) Product(product_id pk, name, email unique, p_no unique)
 3) seller (seller_id pk, name, email unique, p_no unique)
 4} category( catgory_id pk, caegory  name)
 5}order(order_id pk, order_date, status, total_amount)
 6)payment(payment_id pk, payment_method, payment_status, payment_date)
 7) cart(cart_id pk, created-at)
 
 -- step 2-- convert weak entities:-
 rule: weaak entity gets: owneaar pk as fk , its partial key, composite pk.
 
 1) address(weak entity, address, owned by users)
       address(user_id fk, address_id, street, city, state, pincode, pk(userl_id, address_id))
       
2) review(user_id fk, product_id fk, rating, comment, review_date, primary key(user_id, product_id))

step 3) convertogn one to one relationsips
step 4) convertatign one to many  relationship (1:n)
step 5) convert many to many relationship(M:n)
 
 */
 
 -- strong entities
 create table Users(user_id int primary key auto_increment,
 last_name varchar(255),
 first_name varchar(255),
 email varchar(255) unique, 
 phone_no varchar(13),
 password varchar(255),
 role enum("user","seller","admin"), 
 created_at timestamp default current_timestamp);
 
 create table seller (seller_id int primary key ,
 constraint Fk_seller_user foreign key (seller_id) references users(user_id) on delete cascade on update cascade);
 
create table category(category_id int primary key auto_increment ,
 category_name varchar(255), parent_category_id int,
  constraint FK_category_parent_cat foreign key (parent_category_id) references category(category_id) on update cascade on delete  set null);
 
 create table Product(product_id int primary key  auto_increment,
 name varchar(255),
 price decimal(9,2),
 stock int ,
 seller_id int ,
 constraint FK_product_seller foreign key (seller_id) references seller(seller_id)
on delete cascade on update cascade); 

create table orders(order_id int  primary key auto_increment,
 order_date timestamp default current_timestamp,
 status varchar(255), total_amount decimal(9,2),
 user_id int,
 constraint FK_users_orders foreign key(user_id) references users(user_id) on delete cascade on update cascade);
 
 create table cart (cart_id int primary key auto_increment,
 created_at timestamp  default current_timestamp,
 user_id int unique,
 constraint FK_user_cart foreign key (user_id) references users(user_id) on delete cascade on update cascade);
 
 create table payment(payment_id int primary key auto_increment,
 payment_method varchar(255), payment_status varchar(255),
 payment_date timestamp default current_timestamp,
 order_id int unique,
 constraint Fk_User_payment foreign key (order_id) references orders(order_id) on update cascade on delete cascade);
 
 -- creatign weak entities
 create table address(user_id int , address_id int,
 street varchar(255), 
city varchar(255), state varchar(255), pincode varchar(255), primary key (user_id, address_id),
constraint FK_users_addres foreign key (user_id) references users(user_id) on delete cascade on update cascade);

create table review (user_id int, product_id int, 
rating int check(rating >= 1 or rating <= 10),
comment text,
review_date timestamp default current_timestamp,
primary key (user_id , product_id),
constraint Fk_user_review foreign key (user_id) references users(user_id) on delete cascade on update cascade,
constraint Fk_product_review foreign key (product_id) references product(product_id) on delete cascade on update cascade);

-- many to many relationship junction tables
create table order_item (product_id int, order_id int, qunatity int,
price_at_time decimal(9,2),
primary key(order_id, product_id),
constraint Fk_order_product foreign key (product_id) references product(product_id) on delete cascade on update cascade,
constraint Fk_order_item foreign key (order_id) references orders(order_id) on delete cascade on update cascade);

create table cart_item(product_id int, cart_id int, quantity int ,
primary key (product_id, cart_id),
constraint Fk_cart_item_product foreign key (product_id) references product(product_id) on delete cascade on update cascade,
constraint Fk_cart_itme_cart  foreign key (cart_id) references cart(cart_id) on delete cascade on update cascade);

create table product_category(product_id int , category_id int, 
primary key(product_id, category_id),
constraint Fk_product_category_product  foreign key (product_id)references product(product_id) on delete cascade on update cascade, 
constraint Fk_product_category_category foreign key(category_id) references category(category_id)on delete cascade on update cascade);
 