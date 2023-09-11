create database Dude;
use Dude;
create table Basic(id int,name varchar(30),age int);
insert into Basic values(1,"Faheem",24);
insert into Basic values(2,"Hari",22);
insert into Basic values(1,"Hani",23);
insert into Basic values(1,"Akash",23);
delimiter //
create procedure hij()
begin
 select name,age from Basic where age > 22;
end //
delimiter ;
call hij();