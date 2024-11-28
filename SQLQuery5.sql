create database db_aptech;
use db_aptech;

create table tbl_courses(
course_id int primary key identity (0,1),
course_name varchar(120) not null unique
);

create table tbl_students(
std_id int primary key identity (0,1),
std_name varchar(120) not null,
std_course int 
Foreign key (std_course) 
references tbl_courses(course_id)
)

insert into tbl_courses (course_name) values ('ADSE')
,('HDSE');

insert into tbl_courses values ('DISM');

select * from tbl_courses order by course_id ASC;


insert into tbl_students (std_name,std_course) values
('Abu Bakar',0);

insert into tbl_students values ('Hamza',1),
('Mudassir',1),('Aliyan',0);

select * from tbl_students;

insert into tbl_students values ('Osama',5);
select * from tbl_courses;

delete from tbl_courses where course_id = 1;

update tbl_courses set course_name = 
'Advance Diploma In Software Engineering' where 
course_id = 0;


select * from tbl_students inner join 
tbl_courses on 
tbl_students.std_course = tbl_courses.course_id


select std_name,course_name from tbl_students 
inner join tbl_courses on 
tbl_students.std_course = tbl_courses.course_id



select * from tbl_students 
left outer join tbl_courses on 
tbl_students.std_course = tbl_courses.course_id

select * from tbl_students 
right outer join tbl_courses on 
tbl_students.std_course = tbl_courses.course_id

select * from tbl_students 
self join tbl_students on 
tbl_students.std_id = tbl_students.std_id






