insert into users(uid,first_name,last_name,email,pass,mobile,address) 
values(1001,'Rakesh','Sharma','rakesh21@gmail.com','r0123','9838868901','House 3,Shanti Nagar,Phase-4,gurgaon');

insert into users(first_name,last_name,email,pass,mobile,address) 
values('Rishi','Jain','rishijain1@gmail.com','rishi01','9837688901','House 4,Surya Nagar,lucknow');

insert into users(first_name,last_name,email,pass,mobile,address) 
values('Shreya','Sharma','shreya12@gmail.com','s9988','9235868901','House 12,arya colony,jaipur');

insert into users(first_name,last_name,email,pass,mobile,address) 
values('Harish','Jain','harish32@gmail.com','hj321','9838843201','house 6,hari nagar,jodhpur');

insert into users(first_name,last_name,email,pass,mobile,address) 
values('Ronak','Vasu','ronak01@gmail.com','vasu12','6678868901','house 1,vaishali apartment,Phase-4,noida');

insert into users(first_name,last_name,email,pass,mobile,address,usertype) 
values('Daksh','Ameta','dakshameta@gmail.com','daksh33','7908868901','A-403,Columbus Apartment,Phase-4,gurgaon','A');

select * from users;




insert into product(pid,pname,pdesc,price,category,available_quantity)
values(1101,'Fit Protein','Healthy protein for adults',1099.50,'Supplements',100);

insert into product(pname,pdesc,price,category,available_quantity)
values('Titan Watch','Smartwatch by titan',3999.00,'Fashion',50);

insert into product(pname,pdesc,price,category,available_quantity)
values('Nivea Football','Football edition 21 by nivea',4999.00,'Sports',100);

insert into product(pname,pdesc,price,category,available_quantity)
values('Dell Laptop','Slim Design Laptop by Dell',105999.00,'Electronics',50);

insert into product(pname,pdesc,price,category,available_quantity)
values('American Tourister Bag','Virat Kohli limited edition bag',2099.50,'Travel',100);

insert into product(pname,pdesc,price,category,available_quantity)
values('Apple iphone 13 pro max','Newest edition in the iphone pro series',149999.50,'Mobiles',100);

insert into product(pname,pdesc,price,category,available_quantity)
values('Studds Helmet','Best Protection helmet isi approved',2199.50,'Vehicle',100);

insert into product(pname,pdesc,price,category,available_quantity)
values('Sony Bravia 4K TV','Latest OLED 4K Smart Ultra HD Sony TV',479999.00,'Appliances',20);

insert into product(pname,pdesc,price,category,available_quantity)
values('Airpods Max','Apple airpods max bluetooth headset',49999.99,'Electronics',50);

insert into product(pname,pdesc,price,category,available_quantity)
values('Macbook M1 Pro','Apple 2021 macbook m1 pro',239999.99,'Supplements',30);

select * from product;