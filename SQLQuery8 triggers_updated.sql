create trigger after_update_product1
on products
After update 
as
declare @id int;
declare @name varchar(120);
declare @price int;

select @id = id from inserted;
select @name = name from inserted;
select @price = price from inserted;

insert into product_backup 
(id,name,price,action,action_time) values
(@id,@name,@price,'record update',
CURRENT_TIMESTAMP)

select * from products;
select * from product_backup;

update products set price = 650000 where id = 0;

update products set price = 450000 where id = 0;