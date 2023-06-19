create database student11;
use student11;
create table section(s_id int,name varchar(20),strength int);
insert into section values(321,"computer science",20);
insert into section values(322,"portal",45);
insert into section values(323,"geeksforgeeks",50);
insert into section values(324,"abc",100);
DELIMITER //
create function totalstrength()
returns int
deterministic
begin
declare total int;
set total=0;
select sum(strength) into total from section;
return total;
end;
// 
DELIMITER ;
select totalstrength();