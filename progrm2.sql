create table aone(name varchar(20), totalmark int);
insert into aone values("Senira",150);
insert into aone values("Nesha",120);
insert into aone values("Eranja",130);
insert into aone values("Varun",230);
insert into aone values("Seema",210);
insert into aone values("Reema",NULL);
insert into aone values("Sarange",120);
insert into aone values("Adwaith",230);
insert into aone values("Kim",210);
select * from aone 
select * from aone where totalmark=NULL;
alter from aone where name="Sarange";
update aone set totalmark=250 where name="Varun";
use details;
select totalmark from aone where name="Reema" and totalmark is not NULL;
update aone set name="Robin Sakariya" where name="Adwaith";