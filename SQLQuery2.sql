create database class11B;
use class11B;

create table students(
id int,
name varchar(220),
email varchar(50)
);

select * from students;


insert into students (id,name,email) values 
(2,'Abu Bakar','abubakar@gmail.com'),
(3,'Shehran','shehran@gmail.com'),
(4,'Hamza','hamza@gmail.com'),
(5,'Mudassir','mudassir@gmail.com'),
(6,'Zaki','zaki@gmail.com'),
(7,'Suleman','suleman@gmail.com'),
(8,'Aliyan','aliyan@gmail.com');


update students set name= 'sami khan' where id = 1;

update students set name = 'Shehran Ahmed', 
email = 'shehranahed@yahoo.com' where  id = 3;


delete from students where id = 4;
delete from students where name = 'Mudassir';



