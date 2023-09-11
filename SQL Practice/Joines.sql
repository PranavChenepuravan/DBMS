create database Joinop;
use Joinop;
create table country(c_ID int,c_name varchar(10));
create table state(s_ID int,c_ID int,s_name varchar(15));
insert into country values(1,'India');
insert into country values(2,'Nepal');
insert into country values(4,'Srilanka');

insert into state values(1,1,'Maharashtra');
insert into state values(2,1,'Punjab');
insert into state values(3,2,'Kathmandu');
insert into state values(4,null,'California');

select * from country;
select * from state;
select * from country inner join state on country.c_ID=state.c_ID;
select * from country left join state on country.c_ID=state.c_ID;
select * from country right join state on country.c_ID=state.c_ID;

select * from country left join state on country.c_ID = state.c_ID
UNION ALL
select * from country right join state on country.c_ID = state.c_ID;