/*Store Procedure without parameter */
CREATE PROCEDURE get_all 
as
select * from users;


/* Call Store Procedure */
execute get_all;


