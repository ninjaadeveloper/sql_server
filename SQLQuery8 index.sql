use class11B

select * from users;

create table tbl_students(
id int identity(0,1) ,
name varchar(120),
email varchar(50)
)

select * from tbl_students;

create index tbl_students_id_index
on tbl_students(id);

drop index tbl_students_id_index;

create clustered index tbl_students_id_index
on tbl_students(id);

create nonclustered index tbl_students_id_index
on tbl_students(id);