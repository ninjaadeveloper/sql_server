use class11B;


select * from students;

select * from tbl_users;

select * from students where name like 'Z%';

select * from students where name like 'a%';

select * from students where name like '%n';

select * from students where name like '%an%';

select * from students where name like 'S%N';

select * from students where name like 'S%D';

select * from students where name like '_a%';

select * from students where name like '__u%';

select * from students where name like '%a_';

select * from students where name like '%m__';

select * from tbl_users where age between 17 AND 20;

create table users(
id int primary key identity(0,1),
name varchar(120) not null,
email varchar(120)not null,
age int,
salary int,
city varchar(100),
gender varchar(20)
);

INSERT INTO users VALUES
('Zaki','zaki@gmail.com',23,50000,'Karachi','M'),
('Bilal','bilal@gmail.com',18,22000,'Hyderabad','M'),
('Affan','ali@gmail.com',22,19000,'Lahore','M'),
('Yawar','yawar@gmail.com',24,30000,'Karachi','M'),
('Daniyal','daniyal@gmail.com',19,25000,'Sukkar','M'),
('Shehran','shehran@gmail.com',20,22000,'Sanghar','M'),
('Mudassir','mudassir@gmail.com',20,100000,'Multan','M'),
('Waqar','waqar@gmail.com',20,20000,'Islamabad','M'),
('hamza','hamza@gmail.com',20,25000,'Karachi','M'),
('usama','usama@gmail.com',20,10000,'Karachi','M')


select * from users;

select count(city),city from users group by city;

select distinct(city) from users;

SELECT SUM(salary) as total_salary , city  FROM users GROUP BY city HAVING city IN 
('Lahore','Karachi','Islamabad');






