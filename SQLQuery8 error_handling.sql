select * from students;

insert into students values 
(9,1454545,'ali@gmail.com')

insert into students values 
('ALI',1454545,'ali@gmail.com')

begin try
	insert into students values 
	('ASAD','ASAD','ali@gmail.com')
end try
begin catch
	print 'id must be in number'
end catch

begin try
 select 10/0
end try
begin catch 
	select ERROR_NUMBER();
end catch

begin try
 select 10/0
end try
begin catch 
	select ERROR_MESSAGE();
end catch


begin try
	insert into students values 
	('ASAD','ASAD','ali@gmail.com')
end try
begin catch
	select ERROR_MESSAGE();
end catch