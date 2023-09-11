create database pass;
use pass;
DELIMITER //
create procedure giving(a int)
begin
 declare y int;
 set y = 1;
 set y = y + a;
 select y;
end //
DELIMITER ;
call giving(9);
