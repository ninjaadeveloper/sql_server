use class11B;

select * from users;

/* Call View */
select * FROM GET_USERS_DATA;

insert into users (name,email,age,salary,city,gender)
values ('Abu Bakar','abubukar@gmail.com',
22,55000,'Karachi','M')

update GET_USERS_DATA set city = 'Lahore' where 
name = 'Yawar';

