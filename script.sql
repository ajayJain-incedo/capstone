create database shopping;
use shopping;

create table users
(uid int(5) not null auto_increment,
 first_name varchar(20),
 last_name varchar(20),
 email varchar(20),
 pass varchar(20),
 mobile numeric(10),
 address varchar(200),
 usertype char(1) default 'C' check((usertype= 'A') or (usertype='C')),
 created_at timestamp default current_timestamp,
 constraint users_uid_pk primary key(uid)
);


create table product
(pid int(5) not null auto_increment,
 pname varchar(80),
 pdesc varchar(200),
 price decimal(10,2),
 category varchar(20),
 discount_percent decimal(5,2) default 0.00,
 pimage varbinary(8000),
 rating decimal(2,1) default 0.0,
 available_quantity int,
 units_sold int default 0,
 constraint product_pid_pk primary key(pid)
);


create table orders
(oid int(5) not null auto_increment,
 user_id int(5),
 total_amount decimal(10,2),
 payment_status char(7) check((payment_status= 'Done') or (payment_status='Pending')),
 constraint order_oid_pk primary key(oid),
 constraint order_user_id_fk foreign key(user_id) references users(uid)
);


create table cart_item
(order_id int(5),
 product_id int(5),
 quantity int,
 amount decimal(10,2),
 constraint cart_item_order_id_fk foreign key(order_id) references orders(oid),
 constraint cart_item_product_id_fk foreign key(product_id) references product(pid)
);