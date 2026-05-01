-------------Create Database
create database NewDB
-----------Rename Database
sp_renamedb 'NewDB','NewDatabase'
----------Drop Database
Drop Database NewDatabase
Drop Database D255
-------Activate Database
Use Join_Maharaj
-------------Total No of Database
Select count(*) as TotalNoofDatabase from sys.databases
Select * from sys.databases
-----------Name of Database
Select name from sys.databases
--------Customized Database Name with Remark
Select name,IIF(owner_sid=0x01,'System DB','User DB') as Remark from sys.databases
Select name,(case owner_sid when 0x01 then 'System DB' else 'User DB' end) as Remark from sys.databases
--------List of Tables in Active Database
select name from sys.tables
select @@ROWCOUNT as 'TotalCount'

Select * into Female from Customer where Gender='F';
Select * from Male
Select * from Female
--------------------Create Table------------
Create Table NewTable
(
EmpID int,
EmpName Varchar(20),
Salary bigint
)

Select * from NewTable
------------------Example-2
Create Table NewTable1
(
EmpID int primary key,
EmpName Varchar(max),
Salary bigint
)
Insert into NewTable1 values(111,'Raj',43433)
Insert into NewTable1 values(111,'Raj',43433)
Select * from NewTable1
---------------Example-3 (identity)
Create table NewTable2
(
EmpID int Identity(1000,1),
EmpName Varchar(max),
Salary bigint
)
insert into NewTable2(EmpName,Salary) Values('Rajiv',34333)
insert into NewTable2(EmpName,Salary) Values('Mohit',12354)
insert into NewTable2(EmpName,Salary) Values('Chandan',22255)
insert into NewTable2 Values(1004,'Virat',12356)

Select * from NewTbl
---------------Rename Table
sp_rename 'NewTable2','NewTbl'
----------------Rename ColumnName
sp_rename 'NewTbl.EmpName','Employee'
---------add Incentive Column
Alter Table NewTbl
Add Incentive bigint
Select * from Newtbl
---------Drop Incentive Column
Alter Table NewTbl
drop Column Incentive
---------Change DataType
Alter Table NewTbl
Alter Column Salary float
sp_help NewTbl
----------Drop table
Drop Table NewTbl
----------Drop Multiple Table at Same Time
Select Name from sys.tables
Drop Table NewTable,NewTable1,IndexTable
-------------------Create New Table after delete existing Table
DROP TABLE IF EXISTS Index_Table;
Create Table Index_Table
(
EmpID int,EmpName Varchar(20),Salary bigint)
Select * from Index_Table
-------------------Delete Table-
Create Table NewTable1
(
EmpID int primary key,
EmpName Varchar(max),
Salary bigint
)
Insert into NewTable1 values(111,'Raj',43433)
Insert into NewTable1 values(222,'Rajiv',23353)
Insert into NewTable1 values(333,'Mohit',13554)
Insert into NewTable1 values(444,'Sanjeev',43431)

Delete from NewTable1 Where EmpID=222
Delete from NewTable1
Select * from NewTable1

-------------Truncate Exmaple--------
Truncate Table NewTable1 

Create table NewTable2
(
EmpID int Identity(1000,1),
EmpName Varchar(max),
Salary bigint
)
insert into NewTable2(EmpName,Salary) Values('Rajiv',34333)
insert into NewTable2(EmpName,Salary) Values('Mohit',12354)
insert into NewTable2(EmpName,Salary) Values('Chandan',22255)

Select * from NewTable2
Delete from NewTable2
Truncate Table NewTable2

---Create Primary Key (New Table)
Create Table PK
(
EmpID int Primary Key,
EmpName varchar(20)
)


---Create Primary Key (Existing Table)
Drop Table P_K
Create Table P_K
(
EmpID int,
EmpName varchar(20)
)

Insert into P_K Values(555,'Raj')
Insert into P_K Values(111,'Mohit')
Select * from P_K

Alter Table P_K
Add Constraint pK25 Primary key (EmpID)

Alter Table P_K
Alter Column EmpID int not null

---Remove Primary Key from Table
Alter Table P_K
Drop Constraint pK25














