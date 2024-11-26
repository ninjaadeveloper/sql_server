use class11B;
use mydb

select * from students ;
select * from students where name = 'zaki'

create table users(
	id int primary key identity(0,1),
	username varchar(120)not null,
	email varchar(50) unique,
	age int check(age>=18),
	usertype varchar(20) default 'Students'
);

insert into users (username,email,age) values 
('Asad','asad@yahoo.com',19)

select * from users

insert into users (username,email,age,usertype) values 
('Omar','omar@gmail.com',22,'Employee')

insert into users (username,email,age) values 
('Rafiq','rafiq@gmail.com',18)

select * from users

delete from users where id = 4;


alter database class11B modify name = PR2_11B;


execute sp_renamedb 'class11B','db_class11B'

execute sp_rename 'users','tbl_users';

select * from tbl_users;


alter table tbl_users add gender varchar(20);

alter table tbl_users alter column 
gender varchar(150);

alter table tbl_users drop column gender;

alter table tbl_users alter column 
usertype typeuser;

execute sp_rename 
'tbl_users.usertype','typeuser','column'