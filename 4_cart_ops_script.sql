## Procedure for remove from cart [On the View cart page] [For this, the product id needs to stored and given as input]
delimiter //
create procedure remove_item(in pid int(5), in uid int(5))
begin
delete from cart_item
where product_id = pid and user_id = uid;
end; //

call remove_item(pid,uid);



## Procedure for remove from cart and order table [If user cancels/navigates back after choosing a payment option]
delimiter //
create procedure remove_order(in orderid int(5), in userid int(5))
begin

update cart_item
set order_id = NULL
where order_id = orderid and user_id = userid;

delete from orders
where oid = orderid and user_id = userid;

end; //

call remove_order(oid,uid);

select * from orders;
select * from cart_item;

