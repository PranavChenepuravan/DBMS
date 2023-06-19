create database student99911;
use student;
create table details(name varchar(20),id int,mark int);
insert into details values ("Anu",1,50);
insert into details values("varun",2,60);
insert into details values("ajin",3,50);
insert into details values("akash",4,30);
delimiter //
create procedure p1()
begin 
select name from details where mark > 50;
end // 
delimiter ;
call p1();