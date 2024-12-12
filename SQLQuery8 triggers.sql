create trigger after_update_product
on products
After insert 
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

insert into products (name,price) values
('I-Phone 16',450000)

insert into products (name,price) values
('Samsunz Z-Fold',250000)








