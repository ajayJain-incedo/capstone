
## Trigger
delimiter //
create trigger add_image
before insert on product
for each row
begin
declare newpid int(5);
select IFNULL(MAX(pid), 1100) into newpid from product;
set new.pimage = concat(newpid+1,'.jpg');
end; //



## Test data for product table:

insert into product(pid,pname,pdesc,price,category,available_quantity)
values(1101,'Fit Protein','Healthy protein for adults',1099.50,'Health&Beauty',100);

insert into product(pname,pdesc,price,category,available_quantity)
values('Titan Watch','Smartwatch by titan',3999.00,'Fashion',50);

insert into product(pname,pdesc,price,category,available_quantity)
values('Nivea Football','Football edition 21 by nivea',4999.00,'Sports',100);

insert into product(pname,pdesc,price,category,available_quantity)
values('Dell Laptop','Slim Design Laptop by Dell',105999.00,'Electronics',50);

insert into product(pname,pdesc,price,category,available_quantity)
values('American Tourister Bag','Virat Kohli limited edition bag',2099.50,'Fashion',100);

insert into product(pname,pdesc,price,category,available_quantity)
values('Apple iphone 13 pro max','Newest edition in the iphone pro series',149999.50,'Mobiles',100);

insert into product(pname,pdesc,price,category,available_quantity)
values('Studds Helmet','Best Protection helmet isi approved',2199.50,'Sports',100);

insert into product(pname,pdesc,price,category,available_quantity)
values('Sony Bravia 4K TV','Latest OLED 4K Smart Ultra HD Sony TV',479999.00,'Appliances',20);

insert into product(pname,pdesc,price,category,available_quantity)
values('Airpods Max','Apple airpods max bluetooth headset',49999.99,'Electronics',50);

insert into product(pname,pdesc,price,category,available_quantity)
values('Macbook M1 Pro','Apple 2021 macbook m1 pro',239999.99,'Electronics',30);

select * from product;




#Testing with dummy data
insert into cart_item(user_id,product_id,product_price,quantity,amount)
values(1001,1101,1099.50,1,1099.50);
insert into cart_item(user_id,product_id,product_price,quantity,amount)
values(1002,1103,4999.00,1,4999.00);
insert into cart_item(user_id,product_id,product_price,quantity,amount)
values(1003,1110,239999.99,1,239999.99);
insert into cart_item(user_id,product_id,product_price,quantity,amount)
values(1001,1103,4999.00,1,4999.00);
## Test 2
insert into cart_item(user_id,product_id,product_price,quantity,amount)
values(1001,1104,105999.00,1,105999.00);
insert into cart_item(user_id,product_id,product_price,quantity,amount)
values(1001,1103,4999.00,1,4999.00);
## Test 3
insert into cart_item(user_id,product_id,product_price,quantity,amount)
values(1001,1110,239999.99,1,239999.99);
insert into cart_item(user_id,product_id,product_price,quantity,amount)
values(1001,1103,4999.00,1,4999.00);

select * from cart_item;
