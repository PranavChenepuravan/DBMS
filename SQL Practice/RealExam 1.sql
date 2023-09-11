create database reservation;
use reservation;
create table catagories(category_id int,name varchar(50),parent_category int);
alter table catagories add constraint pk primary key(category_id);
alter table catagories modify name varchar(50) not null;
create table parent_dt(id int,name varchar(20),parent_category int primary key);
insert into parent_dt values(1,"Boomi",1);
alter table catagories add constraint fk foreign key(parent_category) references parent_dt(parent_category); 
