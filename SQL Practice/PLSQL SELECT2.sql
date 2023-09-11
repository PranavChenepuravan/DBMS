create database AWH;
use AWH;
create table teachers(name varchar(20),subject varchar(10));
insert into teachers values("Sruti","ADS"),("Keerthi","ACN"),("Prajina","MFC"),("Aswini","OB");
DELIMITER //
create procedure see()
begin
 select name from teachers;
end //
DELIMITER ;
call see;