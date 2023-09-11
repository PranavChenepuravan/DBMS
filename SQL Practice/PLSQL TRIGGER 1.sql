create database Practice;
use Practice;
set sql_safe_updates=0;
create table Phone_Book(Name varchar(20),Number int);
select * from Phone_Book;
create table Old_Phone(Name Varchar(20),Number int);
delimiter //
create trigger old_number after update on Phone_Book
for each row
begin
insert into Old_Phone Values(old.name,old.number);
end
// delimiter ;
insert into Phone_Book values('Arun',1234567890);
update  Phone_Book set number=98765309 where name='arun';
select * from Old_Phone;
select * from Phone_Book;