use db_aptech;

select * from tbl_students;

select * from tbl_courses;

insert into tbl_courses values ('CPISM')
,('HDSE-II'),('ADSE-II'),('STC');

update tbl_courses set course_name = 'ADSE' where 
course_id = 0;

SELECT * FROM tbl_courses WHERE course_name 
in ('ADSE','HDSE');


SELECT * FROM tbl_courses WHERE 
course_name ='ADSE' OR course_id = 2;



SELECT * FROM tbl_courses WHERE course_name 
in ('ADSE','ADSE-II','DISM');


select std_course from tbl_students 
group by std_course;

select count(std_course) from tbl_students 
group by std_course;

select distinct(std_course) from tbl_students;