select * from users;


insert into users (name,email,age,salary,city,gender)values
('Suleman Khan','sulemn2gmail.com',23,45000,
'KHI','M');

begin transaction
insert into users (name,email,age,salary,city,gender)values
('Zaki Khan','zaki2gmail.com',23,45000,
'KHI','M');

commit transaction -- save karwany kay lie

rollback transaction -- undo
