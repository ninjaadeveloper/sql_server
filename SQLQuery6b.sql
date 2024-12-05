use db_aptech;

select * from tbl_courses;
select * from tbl_students;

create table tbl_cities (
id int primary key identity(0,1),
city_name varchar(120)
);

select * from tbl_cities;

alter table tbl_students add std_city int 
foreign key (std_city) references tbl_cities(id)

insert into tbl_cities values('Karachi'),
('Lahore'),('Larkana'),('Hyderabad'),('Multan')



update tbl_students set std_city = 1 
where std_id = 0;

update tbl_students set std_city = 1 
where std_id = 1;


update tbl_students set std_city = 4 
where std_id = 2;

update tbl_students set std_city = 3 
where std_id = 3;

select * from tbl_students;


select * from tbl_students 
join tbl_courses on tbl_students.std_course = tbl_courses.course_id

select std_name as Student ,course_name as Course,city_name as City from tbl_students 
join tbl_courses on tbl_students.std_course = tbl_courses.course_id 
join tbl_cities on tbl_students.std_city = tbl_cities.id



