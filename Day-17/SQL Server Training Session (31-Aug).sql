------------------Trigger Exmaple--------------
Create Table TableNew
(
EmpID int,
EmpName Varchar(max),
MobileNo bigint,
Salary bigint
)
-----------------Trigger with Insert Query---------
Create trigger Trig_Insert on TableNew
for insert
as
declare @salary bigint
select @salary=Salary from inserted
if @salary>0
begin
print 'Record inserted sucessfully'
end
else
begin
Rollback Transaction
Print 'Invalid Criteria'
end

-----------------Insert Trigger Exmaple-------
insert into TableNew Values(1112,'Manjeet Singh',9911176564,43433)
insert into TableNew Values(1113,'Deepak Kumar',9911176564,43433)
insert into TableNew Values(1114,'Mohit Jain',9911176564,43433)
insert into TableNew Values(1115,'Sanjeev Garg',9911176564,43433)
insert into TableNew Values(1116,'Deepak Saini',9911176564,43433)
insert into TableNew Values(1117,'Deepak Saini',9911176564,43433)
insert into TableNew Values(1118,'Deepak Saini',9911176564,43433)
insert into TableNew Values(1119,'Deepak Saini',9911176564,43433)


-----------------Update------------------
Select * from TableNew
Create Trigger TrigUpdate on TableNew
after Update
as
Declare @EmpName as varchar(max)
Select @EmpName=EmpName From inserted
if @EmpName<>'Deepak Saini'
print 'Successfully'
else
Rollback
print 'Invalid Criteria'
Select * from TableNew

---------------Update Trigger Exmaple-----------
Update TableNew set MobileNo=9810065061 where EmpName<>'Deepak Saini'
Select * from TableNew

--------------Disable Trigger
Disable Trigger Trig_Insert on TableNew
insert into TableNew Values(1119,'Pawan Sharma',9911176564,-5322)

--------------Enable Trigger
enable Trigger Trig_Insert on TableNew
insert into TableNew Values(1119,'Pawan Sharma',9911176564,-5322)
------------Delete Trigger Exmaple
Create Trigger Delete_trigger on Tablenew
for delete
as
declare @Salary bigint
select @Salary=Salary from deleted
if @Salary>0
print 'Deleted successfully'
else
Rollback Transaction
print 'Invalid Criteria'

---------------Trigger with Delete Command
Delete from TableNew where salary<0

CREATE TABLE Employees (
    EmpID INT PRIMARY KEY,
    EmpName VARCHAR(100),
    Department VARCHAR(50),
    Salary DECIMAL(10,2)
);



Alter TRIGGER MahaTrigger
ON Employees
AFTER INSERT, UPDATE, DELETE
AS
BEGIN
Declare @dept varchar(max)
Select @dept=Department from inserted
Select @dept=Department from deleted
if @dept='HR'
begin
print 'Successfully'
end
else
begin
Rollback Transaction
print 'Invalid Criteria'
End
end

----------------------------Example of MahaTrigger----------
disable Trigger MahaTrigger on Employees
insert into Employees Values(555,'Kamal Khurana','HR',232322)
enable trigger MahaTrigger on Employees

set nocount on
delete from Employees where Department='HR'
set nocount off

-------------------Trigger Exmaple-------------
CREATE TABLE Employee (
    EmpID INT,
    EmpName VARCHAR(100),
    Department VARCHAR(50),
    Salary DECIMAL(10,2))

Create Trigger NewInsertTrig on Employee
instead of Insert
as
Declare @EmpId int
Declare @Empname Varchar(100)
Declare @Department Varchar(50)
Declare @Salary float
Select @EmpId=EmpID,@Empname=EmpName,@Department=Department,@Salary=Salary from inserted
if @Salary>0
begin
insert into Employee values(@EmpId,@Empname,@Department,@Salary)
print 'Inserted successfully'
end
else
begin
print 'Invalid Criteria'
end

Insert into Employee Values(1100,'Nitin Saini','IT',-4332)

-------------------DDL Trigger Example in SQL
Create Trigger DDLTrig on Database
For Create_Table
as
print 'Table Creation is not allow'
Rollback

Create Table Table2026
(
EmpID int,
EmpName Varchar(max)
)

Disable trigger DDLTrig on Database
Enable trigger DDLTrig on Database

----------DDL MahaTrigger Exmaple------------
Create Trigger DDLMahatrigger on Database
For Create_Table,Alter_Table,Drop_Table
as
begin
Rollback Transaction
Print 'DDL Query not allowed'
end

Drop Table FreshTable

Alter Table FreshTable
Add Salary bigint










CREATE TRIGGER trg_Logon_Audit
ON ALL SERVER
FOR LOGON
AS
BEGIN
    DECLARE @LoginName NVARCHAR(100) = ORIGINAL_LOGIN();

    INSERT INTO master.dbo.LogonAudit (LoginName, LogonTime)
    VALUES (@LoginName, GETDATE());
END;



Select * from master.dbo.LogonAudit

