create database Rizwan

use Rizwan
create table Employee
(
emp_id int primary key identity(100,1),
emp_name varchar(50) not null,
emp_phone varchar(50) default '0300-0000000',
emp_email varchar(50) unique,
emp_age int check(emp_age>=18)
)
-------  DDL COMMANDS
------ ADD COLUMN -------------
alter table Employee add pass varchar(50)

------ CHANGE DATA TYPE--------
alter table Employee alter column pass int

------ Drop Column ------------
alter table Employee drop column pass

------ Rename Column ----------
exec sp_rename 'Employee.emp_phone','Telephone'

------ Drop Check COnstraint---
alter table Employee drop CK__Employee__emp_ag__0519C6AF

------ ADD CHECK CONSTRAINT----
alter table Employee add  check(emp_age>=18)

------ drop UNIQUE CONSTRAINT--
alter table Employee drop UQ__Employee__3D542B08023D5A04

------ ADD UNIQUE COSTRAINT ---
alter table Employee add constraint uq_Emplyee_email unique(emp_email)


------- Drop PRIMARY KEY -------



select * from Employee

----DML Commands----
insert into Employee values ('faisal','0320-9865321','faisal@gmail.com',18)
insert into Employee values ('aliza','0320-9865321','aliza@gmail.com',20)
insert into Employee values ('jan','0320-9865321','jan123@gmail.com',21)
insert into Employee values ('asim','0320-9865321','asim@gmail.com',22)
insert into Employee values ('Faisal Javed','0320-9865321','Faisal.Javed@gmail.com',25)
insert into Employee values ('Saeed','0320-9865321','saeed@gmail.com',26)
insert into Employee values ('ammaz','0320-9865321','ammaz@gmail.com',28)
insert into Employee values ('malik','0320-9865321','malik@gmail.com',29)

insert into Employee (emp_name,emp_email,emp_age) values ('Rehan','Rhan@gmail.com',26)

update Employee set emp_name='Aliza Zahid' where emp_id=111
update Employee set Telephone='0300-7770000' where emp_id=105
update Employee set emp_name='Muhammad Ali',emp_email='MuhammadAli@gmail.com' where emp_id=101

delete from Employee where emp_id=124

truncate table Employee


---Transact-SQL Language Elements--
--predicates, operators, functions,variables, expressions, control-of-flow, errors, and transactions, comments, and batch separators.

--predicates----
in ,Between,like contains


select * from Employee where emp_age between 25 and 30 
select * from Employee where emp_id between 102 and 107 

select * from Employee where emp_name like 'a%'
select * from Employee where emp_name like '%a'
select * from Employee where emp_name like '%ma%'


select * from Employee where emp_name in ('malik','hamza','anas')
select * from Employee where emp_age in ('25','15','21')

select * from Employee where contains ((emp_name,emp_email),'asim')

--Comparison--
--=, <, >, >=, <=, !=, !>


select * from Employee where emp_name ='malik'
select * from Employee where emp_age <= 20
select * from Employee where emp_age != 21
select * from Employee where emp_age !> 20


--Logical--
--AND, OR, NOT

select * from Employee where emp_name='malik' and emp_age=25
select * from Employee where emp_name='malik' or emp_age=21

select * from Employee where emp_age not in ('25','15','21')


---Arithmetic
--+, -, *, /, %

select emp_id/emp_age as 'Diference' from Employee


select * from Employee where emp_id%2=0
select * from Employee where emp_id%2!=0


Declare @a int ;
set @a=30;
select @a%7;

--Concatenation
-- +

select 'ID ==> '+convert(varchar(50),emp_id)+'Name ==> '+emp_name+'--- Telephone ==> '+Telephone+'--- Email ==> '+emp_email as 'Student Information' from Employee


--Assignment
-- =
Declare @b int ;
set @b=2 + 2 * (4 + (5 - 3))  ;
select @b;


--Variables 
Declare @val1 int;
Declare @val2 int;
Declare @totalMarks int;

select  @val1=emp_age from Employee ;
select @val2=emp_id from Employee;

set @totalMarks=@val1+@val2;

select @totalMarks as 'Total';

--Clauses
-- where , order by , group by , having

select * from Employee where emp_name = 'hamza'
select * from Employee order by emp_age desc

select marks,name from student order by marks

select batch, COUNT(name) from student group by batch

select name,sum(marks) from student group by name having SUM(marks)>=500

select marks,COUNT(name) from student group by marks

select * from student

select name, SUM(amount) from shop group by name having SUM(amount)>=3000




-- Functions
--Rowset functions 
--Aggregate functions

select COUNT(emp_id) from Employee
select SUM(emp_salary)/10 as 'Avarage Salary' from Employee
select MIN(emp_salary) from Employee
select Max(emp_salary) from Employee
select  AVG( CONVERT(int,emp_salary)) from Employee

--Ranking functions
--RANK, DENSE _ RANK, NTILE, and ROW _ NUMBER 


select batch,name,marks,
DENSE_RANK() over (partition by batch order by marks ) as 'Rank'
from student order by batch 

select batch,name,marks,
RANK() over (partition by batch order by marks ) as 'Rank'
from student order by batch 


select batch,name,marks,
ntile(5) over (order by marks desc ) as 'Rank'
from student order by marks

select batch,name,marks,
ROW_NUMBER() over (order by batch) as 'Row Number'
from student 


--Scalar functions 
--Convert
select 'ID ==> '+convert(varchar(50),emp_id)+'Name ==> '+emp_name+'--- Telephone ==> '+Telephone+'--- Email ==> '+emp_email as 'Student Information' from Employee
--Date Time

select  GETDATE()
select SYSDATETIME()
select GETUTCDATE()
select DATEADD(yy,1,'2017-05-1')
select DATEADD(m,1,'2017-05-1')
select DATEADD(d,1,'2017-05-1')
select DATEDIFF(d,'2010-05-1','2017-05-1')
select  YEAR('2017-05-1')
select MONTH('2017-05-1')
select DAY('2017-05-1')

select DATEADD(M,15,'2017-01-01')

--Mathematical function
--RAND, ROUND, POWER, ABS, CEILING, FLOOR

select RAND()
SELECT FLOOR(RAND()*(100-1)+1);
SELECT ROUND(345.156, 1);
select POWER(3,3)
select ABS(-125)
select CEILING(12.1)
select floor(12.68)

--System function
---HOST_ID, HOST_NAME,ISNULL
select HOST_ID()
select HOST_NAME()
select ISNULL(null, 'aptech')

--String function
--SUBSTRING, LEFT, RIGHT,LEN, DATALENGTH,REPLACE, REPLICATE,UPPER, LOWER, RTRIM,LTRIM
SELECT * FROM ABC
select SUBSTRING('pakistan zinda bad',9,15)
SELECT NAME ,SUBSTRING(DOB,0,4) FROM ABC
SELECT NAME ,LEFT(DOB,6) FROM ABC
SELECT NAME ,RIGHT(DOB,8) FROM ABC
SELECT NAME ,REPLACE(dob,'AUG','JAN') FROM ABC
SELECT LEN('HELLO')
SELECT REPLACE('HELLO WORLD','WORLD','PAKISTAN')
SELECT UPPER(NAME) ,DOB FROM ABC
SELECT LOWER(NAME) ,DOB FROM ABC

SELECT RTRIM('    APTECH      ');
SELECT lTRIM('    APTECH      ');


--vARIABLES

Declare @marks int;
select @marks=marks from student where id=12
select convert( varchar(50),(@marks*100/75))+'%'


--Control-of-Flow Statement

Declare @z int ;
set @z=2;

if @z%2=0
	print 'Even'
else
	print 'Odd' 

	
--while Loop

Declare @i int;
set @i=1;

while @i<=10
begin

	select @i;
	set @i=@i+1;

end


 --Check Even Or Odd
Declare @j int;
set @j=50;

while @j<=60
begin

if @j%2=0 select CONVERT( varchar(50),@j)+' => Even'
else select CONVERT( varchar(50),@j)+' => Odd'
set @j=@j+1;

end





-- Comments 
--single line (--) and multiline (starts with /* and ends with */)


--batch saperator 
--go  ;


select * from student where name='YASEEN' 


---Rename Database

alter database aptech
modify name=MyAptech

select SUSER_SNAME(owner_sid) as 'Owner Name', * from sys.databases where name ='khurramdb'


create database KhurramDb
use khurramdb
exec sp_changedbowner asad



-----DCL Data Control Languages
---- Create login 
create login shehroz with password='sh123'
------grant 

use master
grant create any database to asad


----revoke 
use master
revoke create any database from asad


-----Deny
use master
deny create any database to asad


select * from student where name like 'a[l]i'


----Computing Values in ResultSet

select marks, convert(varchar(50), (marks*100/150) )+'%' as 'Percentage' from student

--Using DISTINCT
select distinct name from student

-- Using TOP and PERCENT

select top (10)  * from student order by ID desc

select top (50) percent  * from student 

-- SELECT with INTO
select top (10)  *  into stdTop10 from student order by ID desc

--LIKE keyword 

select * from student where name like 'a[^l]i'
select * from student where name like 'a%'
select * from student where name like 'a__'
select * from student where name like '%a%'
select * from student where name like 'a[a-z][a-z]'


--output Clause

update  student set name ='Mohsin zahoor khan' output inserted.name as 'New Name',deleted.name as 'Old Name'  where ID=4

-- .write
create table feedback (txt varchar(max))
insert into feedback values ('hello world')
select * from feedback
update feedback set txt.write('Pakistan',6,15 ) where txt='hello wPakistan'


-- Working with XML 
create table UserInfo(
id int identity primary key,
info xml
)

insert into UserInfo values ('<info><name>Ali</name><phone>0321-9865321</phone></info>')
insert into UserInfo values ('<info><name>Khurram</name><phone>0300-9865321</phone></info>')
insert into UserInfo values ('<info><name>Jaan </name><phone>0333-9865321</phone></info>')
insert into UserInfo values ('<info><name>Faisal</name><phone>0321-0000321</phone></info>')
insert into UserInfo values ('<info><name>Ammaz</name><phone>0321-7777321</phone></info>')
insert into UserInfo values ('<info><name>Gull</name><phone>0321-6666321</phone></info>')

select * from userinfo

select ID,info.value('(info/name)[1]','varchar(50)') from userinfo
select ID,info.query('info/name') from userinfo

select info.value('(info/phone)[1]','varchar(50)') from userinfo where info.value('(info/name)[1]','varchar(50)')='ali'


-- 
create table MyShop
(
id int identity primary key,
sname varchar(50),
pname varchar(50),
quantity int,
price float
)

insert into MyShop values ('ali','mouse',2,200)
insert into MyShop values ('hamza','keyBoard',5,250)
insert into MyShop values ('asad','pen',20,50)
insert into MyShop values ('yaseen','cup',23,45)
insert into MyShop values ('Khurram','BoardMarker',10,100)
insert into MyShop values ('Malik','Shirt',6,700)

-- grouping and aggregating data
select * from MyShop

select sname ,SUM(price*quantity) from MyShop group by sname

SELECT sname ,pname, SUM(price*quantity) FROM MyShop  group by sname ,pname order by sname
--GROUP BY with WHERE
SELECT sname ,pname, SUM(price*quantity) FROM MyShop where pname='mouse'  group by sname ,pname order by sname

--GROUP BY with ALL
SELECT sname ,pname, SUM(price*quantity) FROM MyShop where pname='mouse'  group by all sname ,pname order by sname

--GROUP BY with HAVING
SELECT sname ,pname, SUM(price*quantity) as 'Total Amount' FROM MyShop   group by sname ,pname   having SUM(price*quantity)>5000 order by sname

--Summarizing Data
--Cube and RollUp

select coalesce( sname , 'Grant Total') ,SUM(price*quantity) from MyShop group by cube(sname)
select coalesce( sname , 'Grant Total') ,SUM(price*quantity) from MyShop group by rollup(sname)
---------Grant Total And Sub Total
SELECT coalesce(sname,'Gran Total') ,coalesce(pname,'Sub Total'), SUM(price*quantity) FROM MyShop  group by rollup(sname ,pname) 
---------

SELECT coalesce(sname,'Gran Total') ,

case
	when coalesce(sname,'Gran Total')='Gran Total'
	then 'Gran Total'
	else coalesce(pname,'Sub Total')
end
, SUM(price*quantity) FROM MyShop  group by rollup(sname ,pname) 

-----
SELECT coalesce(sname,'Gran Total') ,

case
	when coalesce(sname,'Gran Total')='Gran Total'
	then 'Gran Total'
	else coalesce(pname,'Sub Total')
end
, SUM(price*quantity) FROM MyShop  group by Cube(sname ,pname) 


---Spatial Datatypes
--Geometry,Geography
--Methods point, lineString , Polygone
Datatype::method('WKT',SRID);

select * from sys.spatial_reference_systems

select geometry::STPointFromText('Point(0 1)',4326);
select geometry::STLineFromText('lineString(0 0,0 1,1 0, 1 1)',4326);

Declare @poly1 geography;
Declare @poly2 geography;
select @poly1= geography::STPolyFromText('polygon((0 0,-1.5 -1.5,0 -1,0 0))',4326);
select @poly2= geography::STPolyFromText('polygon((0 0,1.5 0.5,0 1,0 0))',4326);

select @poly1.STUnion(@poly2)



Declare @p1 geography;
Declare @p2 geography;

SET @p1=geography::STPointFromText('Point(24.8873325 67.1522536)',4326); --Aptech Location
SET @p2=geography::STPointFromText('Point(24.8729899 67.04169330000002)',4326); --Aptech Location

select @p1.STDistance(@p2)/1000

create table Locations(
Name varchar(50),
loc geography 
)

insert into Locations values ('saddar karachi',geography::STPointFromText('Point(24.8531846 67.01667250000003)',4326))

Declare @aptech geography;
SET @aptech=geography::STPointFromText('Point(24.8873325 67.1522536)',4326); --Aptech Location

select 'From Aptech to '+Name ,CONVERT(varchar(100), @aptech.STDistance(loc)/1000)+' KM' from locations



--Subqueries

create table product(pid int identity primary key,pname varchar(50),price float);
create table salesProduct(pid int,quantity int )

select * from product
select * from salesProduct

select * from product where pid = (select pid from salesProduct where quantity=5) 
--Nested SubQuery
select * from product where pid in (select pid from salesProduct where quantity in (select q from tbl)) 
--Correlated Queries
select pid,pname,price ,(select quantity from salesProduct where pid =product.pid) as 'Quantity',(select quantity from salesProduct where pid =product.pid)*price from product

--------JOINS
--Inner Joins
--Outer Joins
--Self-Joins
--Eque Join
--Union


--Inner Joins

create table teacher
(
t_id int identity primary key,
t_name varchar(50) not null,
t_email varchar(50),
DOJ date default getdate()
) 

insert into TEACHER (t_name,t_email) values ('Sir Shahnawaz','Shahnawaz@gmail.com') ,
('Sir Qwais','Qwais@gmail.com') ,
('Sir Ibtesaam','Ibtesaam@gmail.com') ,
('Sir Zameer','Zameer@gmail.com') ,
('Sir Afreen','Afreen@gmail.com') 

select * from teacher

create table std
(
s_id int identity primary key ,
s_name varchar(50) not null,
s_phone varchar(50),
t_id int foreign key references teacher(t_id)
)

insert into std values ('Hamza','0321-00002121',1)
insert into std values ('Asad','0321-33332154',3)
insert into std values ('Malik','0321-99996598',3)
insert into std values ('yaseen','0321-1785200',4)
insert into std values ('ayaz','0321-85858585',5)

insert into std values ('Hamza','0321-9865321',6)
insert into std values ('Asad','0321-9865321',7)
insert into std values ('Malik','0321-9865321',8)
insert into std values ('yaseen','0321-9865321',9)
insert into std values ('ayaz','0321-9865321',10)

insert into std values ('Hamza','0321-9865321',1)
insert into std values ('Asad','0321-9865321',3)
insert into std values ('Malik','0321-9865321',4)
insert into std values ('yaseen','0321-9865321',5)
insert into std (s_name,s_phone) values ('faisal','0321-9865321')

select * from std

--Inner Join
select S.s_id as 'Student ID',S.s_name,S.s_phone,T.t_name,T.t_email from
std as S
inner join
TEACHER as T
on
S.t_id=T.t_id
go
select * from TEACHER
go
select * from std


--LEFT OUTER JOIN
select S.s_id as 'Student ID',S.s_name,S.s_phone,T.t_name,T.t_email from
std as S
left outer join
TEACHER as T
on
S.t_id=T.t_id

--RIGHT OUTER JOIN

select S.s_id as 'Student ID',S.s_name,S.s_phone,T.t_name,T.t_email from
std as S
right outer join
TEACHER as T
on
S.t_id=T.t_id

--SELF JOIN

Create table Employees
(
e_id int identity primary key,
e_name varchar(50) not null ,
e_email varchar(50) unique,
s_id int foreign key references Employees(e_id)
)

select * from employees
insert into employees (e_name,e_email) values ('Miss Fozia','FoziaNaqvi@gmail.com')
insert into employees values ('Sir waseem','waseem@gmail.com',1)
insert into employees values ('Sir Fehman','Fehman@gmail.com',2)
insert into employees values ('Miss Wafa','Wafa@gmail.com',2)
insert into employees values ('Sir Fawad','Fawad@gmail.com',2)

insert into employees values ('Sir Muneer','Muneer@gmail.com',3)
insert into employees values ('Sir Shahnawaz','Shahnawaz@gmail.com',3)
insert into employees values ('Sir Qwais','Qwais@gmail.com',3)
insert into employees values ('Sir Ibtesam','Ibtesam@gmail.com',3)
insert into employees values ('miss Maleeha','Maleeha@gmail.com',3)

select E.e_id,E.e_name,E.e_email,S.e_name from 
employees as E
inner join
employees as S
on
E.s_id=S.e_id


-- EQUE JOIN
select std.*,TEACHER.* from std,TEACHER where std.t_id=TEACHER.t_id
select * from sys.tables


 --MERGE Statement

create table PurchaseProduct
(
id int identity primary key,
name varchar(50),
price varchar(50),
quantity int
)
create table stock
(
id int ,
name varchar(50),
price varchar(50),
quantity int
)
select * from PurchaseProduct
select * from stock

insert into PurchaseProduct values ('mouse',250,5)
insert into PurchaseProduct values ('Keyboard',350,4)
insert into PurchaseProduct values ('Marker',40,10)

merge into stock as s
using PurchaseProduct as p
on 
s.id=p.id
when matched then
update set
s.name=p.name,
s.price=p.price,
s.quantity=p.quantity
when not matched then
insert (id,name,price,quantity) values (p.id,p.name,p.price,p.quantity) 
when not matched by source then
delete;

-- Common Table Expressions (CTEs)

with CTE_stdRecord
as
(
select std.*,TEACHER.t_name from std,TEACHER where std.t_id=TEACHER.t_id
)
select t_name , COUNT(s_name)  from CTE_stdRecord group by t_name

--Combining Data Using SET Operators
--UNION
(select * from PurchaseProduct) union (select * from stock)
(select * from PurchaseProduct) union all (select * from stock)
--INTERSECT
(select * from PurchaseProduct)INTERSECT (select * from stock)
--EXCEPT
(select * from PurchaseProduct)EXCEPT (select * from stock)


--PIVOT
create table _emp
(
name varchar(50),
salary int
)
insert into _emp values ('ali',20000)
insert into _emp values ('asad',5000)
insert into _emp values ('malik',8000)
insert into _emp values ('ali',15000)
insert into _emp values ('asad',1000)

select * from (select name ,salary from _emp ) as sourceTble
pivot
(
sum(salary) for name in ([ali],[hamza],[asad])
) as pvt

--Views
-- create, Alter, Drop
--Select,Insert,Update,delete with views
-- CheckOption, SchemaBinding, Referesh Views



alter view v_stdInfo
as
select s.s_id as 'Student ID',s.s_name,s.s_phone,t.t_name,t.t_email,t.doj from
 std as s
 inner join
 TEACHER as t
 on
 s.t_id=t.t_id

drop view v_stdinfo


select * from v_stdinfo where t_name='Sir Afreen'

update v_stdinfo set s_name='Ali' where s_name='Hamza'


alter view v_std
as
select * from student where marks >=70 
GO
--USING  check option
alter view v_std
as
select * from student where marks >=70 with check option
GO

select * from v_std

delete from v_std where ID=1
insert into v_std values ('jan Muhammad',50,'2015-08-E')


--VIEW WITH SCHEMABINDING
alter view v_std with schemaBinding
as
select ID,name,marks,batch from dbo.student where marks >=70 with check option
GO

select * from v_std

--Referesh Views
alter table student add phone varchar(50)
select * from v_std

exec sp_refreshview 'MyView'

--CREATE USER DEFINE STORED PROCEDURE
create proc sp_stdInfo
as
begin
	select * from Student
end
exec sp_stdinfo
--PARAMETRIZED STORED PROCEDURE
--INPUT PARAMETER
create proc sp_newStd(@name varchar(50),@marks varchar(50),@batch varchar(50),@phone varchar(50))
as
begin
	insert into student values (@name,@marks,@batch,@phone);
end

exec sp_newstd 'Ammaz','85','2017-04-F','0300-9865321'
--OUTPUT PARAMETER
create procedure sp_percentage (@Obtain int ,@Total int , @Per int output)
as
begin
	set @Per =(@Obtain*100)/@Total
end

Declare @percentage  int;
execute sp_percentage 50,75,@percentage out;
print convert( varchar(50),@percentage)+'%'

--Alter STORED PROCEDURE
alter proc sp_stdInfo
as
begin
	select * from Student
end
exec sp_stdinfo
--Drop STORED PROCEDURE
drop proc sp_stdInfo
--EXTENDED STORED PROCEDURE
EXECUTE xp_fileexist 'd:\Example.java'
--Viewing Stored Procedure Definitions
exec sp_helptext 'sp_percentage'
exec sp_helptext 'xp_fileexist'
-- Nested Stored Procedures
CREATE PROCEDURE NestedProcedure
AS
BEGIN
EXEC uspGetCustTerritory
EXEC uspGetSales 'France'
END

--CREATE NON CLUSTERED INDEX

create table Faisal
(
id int,
name varchar(50),
phone varchar(50)
)

insert into Faisal values (10,'Malik','030-9865321')
insert into Faisal values (5,'Anas','030-9865321')
insert into Faisal values (6,'Malik','030-9865321')
insert into Faisal values (2,'hassan','030-9865321')
insert into Faisal values (3,'Gulbaz','030-9865321')
insert into Faisal values (9,'Asim','030-9865321')
insert into Faisal values (1,'Noman','030-9865321')
insert into Faisal values (4,'Khurram','030-9865321')
insert into Faisal values (7,'Shehroz','030-9865321')
insert into Faisal values (8,'Ammaz','030-9865321')

select * from Faisal
create nonclustered index FaisalIndex on Faisal(name)
--CREATE CLUSTERED INDEX
create clustered index ClusteredIndex_ID on Faisal (id)

select * from Gulbaz
create table Gulbaz
(
id int,
name varchar(50),
phone varchar(50)
)
create table FaisalAgain
(
id int identity primary key,
name varchar(50),
phone varchar(50)
)
create nonclustered index FaisalIndexName on FaisalAgain(name)
create nonclustered index FaisalIndexPhone on FaisalAgain(phone)

Declare @ii int;
set @ii=1;
while @ii <=500000
begin

insert into FaisalAgain values ('FaisalAgain','0303-9865321')
SET @ii=@ii+1;
end


--TRIGGERS
--DDL Trigger (for,after) (create ,alter , drop)
--DML Trigger (for,after,instead of) (insert,update,delete)

--DDL Trigger

alter trigger trg_createTbl on database
for create_table
as
begin
	PRINT 'you cannot create the table';
	rollback
end

------
create trigger trg_dropTbl on database
for drop_table
as
begin
	PRINT 'you cannot drop the table';
	rollback
end
----------
create table logsTbl
(
id int identity primary key,
usrname varchar(50),
dbnase varchar(50),
tblname varchar(50),
[datetime] datetime,
[action] varchar(50),

)
--trigger for Logs 
alter trigger trg_TblLogs on database
for create_table,alter_table,drop_table
as
begin
Declare @data xml;
set @data= eventData();
--select @data;
insert into logsTbl values (
@data.value('(/EVENT_INSTANCE/LoginName)[1]','varchar(50)'),
@data.value('(/EVENT_INSTANCE/DatabaseName)[1]','varchar(50)'),
@data.value('(/EVENT_INSTANCE/ObjectName)[1]','varchar(50)'),
getdate(),
@data.value('(/EVENT_INSTANCE/EventType)[1]','varchar(50)')
)
end

create table khan(id int)
alter table ali add fgfg varchar(50)
drop table khan

select * from logstbl
--Disable Enable Trigger
disable trigger trg_createTbl on database
enable trigger trg_createTbl on database

--DML Trigger
create trigger trig_stdTbl on  student
instead of delete
as
begin
print 'You Cannot delete record from student table';
end

select * from student
delete from student where id =3
---------- logs for student table-------------
create table stdLogs(
id int identity primary key,
oldRecord text,
newRecord text,
[datetime] datetime,
[user] varchar(50),
[action] varchar(50)
)
alter trigger trg_StdLogs on student
for update,insert,delete
as
begin
Declare @action varchar(50);
	if EXISTS(SELECT * FROM DELETED) and  EXISTS(SELECT * FROM inserted)
		set @action='update';
	
	else if EXISTS(SELECT * FROM inserted) 
		set @action='insert';
	
	else if EXISTS(SELECT * FROM DELETED)
		set @action='delete';

Declare @old varchar(250);
Declare @new varchar(250);
Declare @user varchar(50);
SELECT @user=login_name FROM sys.dm_exec_sessions WHERE session_id = @@SPID
select @old=convert(varchar(20),id)+','+name+','+convert(varchar(20),marks)+','+batch from deleted
select @new=convert(varchar(20),id)+','+name+','+convert(varchar(20),marks)+','+batch from inserted

insert into stdLogs values (@old,@new,getdate(),@action,@user)
end


select * from stdLogs 
select * from student 
delete from student where id=65
insert into student values ('malik',50,'2015-09-G')
update  student set name='Muhammad Asad' where id =65

--Control-of-flow

Declare @marks int;
set @marks = 66;

if @marks>=80
	begin
		select 'A+';
		select 'A+';
		select 'A+';
		select 'A+';
		
	end
else if @marks>=70
	select 'A';

else if @marks>=60
select 'B';

else if @marks>=50
select 'C';

else if @marks>=40
select 'D';

else if @marks>=33
select 'E';

else
select 'Fail';
--assignment operators
+= Add and then, assign
-= Subtract and then, assign
*= Multiply and then, assign
/= Divide and then, assign
%= Modulo and then, assign
&= Bitwise AND and then, assign
^= Bitwise XOR and then, assign
|= Bitwise OR and then, assign

Declare @k int;
set @k =10;

set @k*=5;
set @k&=40;
select @k;

select 50&40
select 50|40
select 50^40

-- Synonyms
create synonym stdFromDb
for db.dbo.Student

select * from stdFromDb

--WAITFOR
WAITFOR delay '00:00:05'
select * from stdFromDb

WAITFOR time '18:42:00'
select * from stdFromDb


--WHILE
Declare @faisal int;
set @faisal =1;

while @faisal<=100
	begin
	
	set @faisal+=1;
	
	if @faisal = 50
	break
	
	if @faisal%2=0
	continue;
	
	select @faisal;
	
	

	end

----------- goto Label--------
Declare @f int;
set @f =1;

mylabel:

select @f;
set @f+=1;

if @f<=10 goto mylabel

--User Define Function
--Scaler Valued Function
--Non Parameterized Function
create function getUseeName()
returns varchar(50)
as
begin
	Declare @login varchar(50);
	SELECT @login=login_name FROM sys.dm_exec_sessions WHERE session_id = @@SPID;
	return @login;
end

select dbo.getUseeName()

--Parameterized Function
create function getSquare(@a int)
returns int
as
begin

return (@a*@a)

end

select dbo.getSquare(12)
--Table Valued Function
create function getStdInf(@id int)
returns table
as
return (select * from student where id=@id)
----------
select * from dbo.getStdInf(50)

--Ranking functions AND  OVER CLOUSE
--RANK, DENSE _ RANK, NTILE, and ROW _ NUMBER 


select batch,name,marks,
DENSE_RANK() over (partition by batch order by marks ) as 'Rank'
from student order by batch 

select batch,name,marks,
RANK() over (partition by batch order by marks ) as 'Rank'
from student order by batch 


select batch,name,marks,
ntile(5) over (order by marks desc ) as 'Rank'
from student order by marks

select batch,name,marks,
ROW_NUMBER() over (order by batch) as 'Row Number'
from student 


--OFFSET
select * from student order by id OFFSET 10 ROWS FETCH NEXT 5 ROWS ONLY

--TCL Transaction control language
--rollback, commit ,savepoint


create table account
(
id int identity primary key,
name varchar(50),
amount float,
)
select * from account

create table trnsaction
(
tid int identity primary key,
tranAmount float,
datetme datetime default getdate(),
Ac_holder_ID int foreign key references account(id)
)

insert into account values ('Faisal',100000)
insert into account values ('Jan Muhammad',5000)
insert into account values ('Shehbaz',20000)
insert into account values ('Asim',1000)
insert into account values ('Khurram',2500)


create proc sp_tran(@id int,@amount float)
as
begin
Declare @actualAmount float;
select @actualAmount=amount from account where id=@id

if @actualAmount>=@amount
	begin
	insert into trnsaction (tranAmount,Ac_holder_ID) values (@amount,@id);
	update account set amount=amount-@amount where id=@id
	end
else
	print 'Required amount not available';
end

exec sp_tran 1,500 
exec sp_tran 1,5000 

begin tran
exec sp_tran 5,5000


commit tran
rollback

SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED

ALTER DATABASE MyDatabase  
SET ALLOW_SNAPSHOT_ISOLATION ON  

ALTER DATABASE Aptech  
SET READ_COMMITTED_SNAPSHOT ON  


SET TRANSACTION ISOLATION LEVEL READ COMMITTED


select * from account
select A.name,T.tranamount,T.datetme from
account as A
inner join
trnsaction as T
on
A.id=T.Ac_holder_ID
select 10/0
---------------------------
begin try

select 	10/0


end try
begin catch
Declare @errorno int;
set @errorno= ERROR_NUMBER();
if @errorno=8134
select 'Ap zero Se kisi number ko divide nahen karsakte';
/*
select ERROR_SEVERITY();
select ERROR_STATE();
select ERROR_PROCEDURE();
select ERROR_LINE();
select ERROR_MESSAGE();
*/
end catch