create table Salary
(BSalary float not null,
HRA as BSalary*0.10 persisted,
TA as BSalary*0.15 persisted,
DA as BSalary*0.15 persisted)

insert into Salary values(10000)
insert into Salary values(20000)
insert into Salary values(30000)

select * from Salary

--------------------------------------------------------
drop database ExerciseDb
create database ExerciseDb

use ExerciseDb

create table Products
(PId int primary key identity(1000,1),
PName nvarchar(50) not null,
PPrice float,
PTax as PPrice*0.1 persisted,
PCompany nvarchar(50) check(PCompany in('Samsung','Apple','Redmi','HTC','RealMe')),
PQty int check(PQty>=1) default 1
)

insert into Products values('Laptop',52000.50,'Apple',1)
insert into Products values('Mobile',33000.50,'HTC',1)
insert into Products values('Laptop',90000.50,'Apple',4)
insert into Products values('Laptop',44000.50,'redmi',2)
insert into Products values('Mobile',55000.50,'Apple',5)
insert into Products values('Mobile',70000.50,'Samsung',3)
insert into Products values('Laptop',40000.50,'Realme',1)
insert into Products values('Mobile',20000.50,'HTC',1)
insert into Products values('Laptop',100000.50,'Apple',2)
insert into Products values('Laptop',99000.50,'Apple',3)

create proc ProductProc
(
@name nvarchar(50),
@price float,
@company nvarchar(50),
@qty int
)
as
select * from Products


execute ProductProc 'Laptop',52000.50,'Apple',1