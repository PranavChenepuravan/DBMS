create database Institute;
use Institute;
create table teaches(fno varchar(5) ,fname varchar(15),fdate date);
alter table teaches add constraint pk primary key(fno);
insert into teaches values("FK01","Gopu","2022-02-01");
insert into teaches values("FK02","Meenu","2014-11-08");
insert into teaches values("FK03","Sandar","2023-01-01");
insert into teaches values("FK04","Prabadh","2023-07-09");
insert into teaches values("FK05","Kunjiram","2023-01-01");
update teaches set fdate = "2020-01-05" where fno = "FK01";
update teaches set fdate = "2020-04-30" where fno = "FK02";
select * from teaches where fdate >'2022-01-04' and fdate <'2023-04-30';
delimiter //
create procedure shw()
begin
 select * from teaches;
end //
delimiter ;
call shw()
