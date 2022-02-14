create table users
(uid int(5) not null auto_increment,
 first_name varchar(20),
 last_name varchar(20),
 email varchar(20),
 pass varchar(20),
 mobile number(10),
 address varchar(200),
 usertype char(1) check((usertype= 'A') or (usertype='C')),
 created_at date default sysdate,
 constraint users_uid_pk primary key(uid)
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


create table product
(pid int(5) not null auto_increment,
 pname varchar(20),
 pdesc varchar(200),
 price decimal(10,2),
 category varchar(20),
 discount_percent decimal(5,2),
 pimage varbinary(max),
 rating decimal(2,1),
 available_quantity number,
 units_sold number,
 constraint product_pid_pk primary key(pid)
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


create table orders
(oid int(5) not null auto_increment,
 user_id int(5),
 total_amount decimal(10,2),
 payment_status char(7) check((payment_status= 'Done') or (payment_status='Pending')),
 constraint order_oid_pk primary key(oid),
 constraint order_user_id_fk foreign key(user_id) references user(uid)
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


create table cart_item
(order_id int(5),
 product_id int(5),
 quantity number,
 amount decimal(10,2),
 constraint cart_item_order_id_fk foreign key(order_id) references order(oid),
 constraint cart_item_product_id_fk foreign key(product_id) references product(pid)
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

