create database Fnct;
use Fnct;
create table section(id int,department varchar(20),strength int);
insert into section values(1,"CS",101);
insert into section values(2,"BSC",77);
insert into section values(3,"BA",444);
insert into section values(1,"BCOM",151);
DELIMITER //
create function tot()
returns int
deterministic
begin 
 declare totstre int;
 set totstre=0; 
 select sum(strength) into totstre from section;
 return totstre;
end; // 
DELIMITER ;
select tot();
drop function tot