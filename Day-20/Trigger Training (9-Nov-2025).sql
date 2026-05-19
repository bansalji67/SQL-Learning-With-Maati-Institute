--------------Trigger Example-1
Create Table TableNew1
(
EmpID int,
EmpName Varchar(20),
Sales bigint
)

Alter Trigger Trig_Insert on TableNew1
after Insert
as
declare @sales as bigint
select @sales=sales from inserted
if @sales>10000
begin
print 'Inserted successfully'
end
else
begin
Rollback Transaction
print 'Invalid Criteria'
end
---------------------Use trigger------------
insert into TableNew1 Values(222,'Mohit',2000)
Select * from TableNew1
--------------------Insert,Update,delete Trigger
Select * from RawData
Create Trigger MahaTrigger2025 on RawData
after insert,update,delete
as
begin
declare @monthname varchar(max)
select @monthname=monthName from inserted
select @monthname=monthName from deleted
if @monthname='Oct'
begin
print 'Transaction successfully'
end
else
begin
Rollback transaction
print 'Invalid Transaction'
end
end

------------Insert Query
Select * from RawData
insert into RawData Values (GETDATE(),'Oct','Prime','Lenovo','XYZ',343,234,55,234,23)
-----------Delete Query
Delete from RawData where MonthName='Sep'
---------Update Query
Update Rawdata set [Brand Name]='Apple' where [Brand Name]='Dell' And MonthName='Oct'
-------------------------DDL Trigger--------------
Create Trigger DDL_Trig on Database
after Create_Table,Alter_Table,Drop_Table
as
begin
Rollback Transaction
print 'You have no rights of DDL Activity'
end
-------------------------------DDL Trigger Exmaple
Create Table NewTable2028
(
EmpID int,
EmpName Varchar(max),
Salary bigint
)
drop Table DataSet
------------------Disable Trigger
Disable trigger DDL_Trig on database
------------------Enable Trigger
enable trigger DDL_Trig on database

--------------------Server Triger---------






















