create database Office;
use office;
create table Employees(id int,ename varchar(20),psiotion varchar(12),sallary float(4),PRIMARY KEY(ID));
drop table Employees;
insert into Employees values(1,"Roshan","HRM",75000);
insert into Employees values(2,"Vishnu","Clerk",25000);
insert into Employees values(3,"Mohan","Supervisor",45000);
insert into Employees values(4,"Jithin","Security",19000);
insert into Employees values(5,"Roshan","HRM",75000);
select * from Employees;


create table Duties(id int,About varchar(20),PRIMARY KEY(id),FOREIGN KEY(id) references Employees(ID));
insert into Duties values(1,"Managing");
insert into Duties values(2,"Documentation");
insert into Duties values(3,"Survey");
insert into Duties values(7,"Protection");
update Duties set About="Managing" where id=2;
select * from Duties;
drop table Duties;
