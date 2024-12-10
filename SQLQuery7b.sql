/* Store Procedure with parameter */
create PROCEDURE sp_getuser @userId int
AS
select * from users where id = @userId

execute sp_getuser @userId = 3;
execute sp_getuser @userId = 1001;