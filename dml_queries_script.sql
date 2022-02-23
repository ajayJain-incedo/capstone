## AFTER USER ADDS SOMETHING TO CART
## Query for view cart [On the view cart page]

select pname, product_id,product_price,quantity,amount
from cart_item, product
where user_id = uid and cart_item.product_id = product.pid ;



## WHEN USER CLICKS ON BUY NOW BUTTON [On the view cart page]
## The total amount for all cart_items will be inserted in orders table
## The auto-generated order id will be inserted back to the cart table

## Procedure for inserting values from cart_item table into orders table

delimiter //
create procedure insert_order(in uid int(5))
begin
declare total decimal(10,2);
declare orderid int(5);
select sum(amount) into total
from cart_item
where user_id=uid;
insert into orders(user_id,total_amount)
values(uid,total);

 select oid into orderid
 from orders
 where user_id = uid and payment_status = 'Pending';

 update cart_item
 set order_id = orderid
 where user_id = uid;
end; //

call insert_order(uid);
select * from orders;
select * from cart_item;



## AFTER CLICKING ON BUY NOW, USER SHALL COME TO PAYMENT PAGE AND SELECT PAY MODE
## THEN USER SHALL CLICK ON PROCEED TO PAY
## When user clicks on Pay, the payment status for corresponding order id will be updated to 'done'
## And The cart_item record for that order id will be removed and stored in the order_history table

## Procedure for updating status and moving from cart_item table into order_history table [When user clicks on Proceed to Pay]

delimiter //
create procedure insert_history(in orderid int(5))
begin
update orders
set payment_status = 'Done'
where oid = orderid;

insert into order_history (user_id,order_id,product_id,product_quantity,pay_amount,product_name)
select user_id,order_id,product_id,quantity,amount,pname
from cart_item , product
where order_id = orderid and cart_item.product_id = product.pid;

delete from cart_item
where order_id = orderid;
end; //

call insert_history(oid);
select * from order_history;



## IF USER WANTS TO CHECK ORDER HISTORY
## Query for viewing order history

select product_name, order_id, product_id, product_quantity,pay_amount
from order_history
where user_id = uid;












