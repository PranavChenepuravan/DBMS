create database it;
use it;
delimiter //
create procedure summation()
begin
 declare a int;
 declare b int;
 declare c int;
 set a = 212;
 set b = 32;
 set c = a + b;
 select a,b,c;
end //
delimiter ;
call summation()
drop procedure summation;