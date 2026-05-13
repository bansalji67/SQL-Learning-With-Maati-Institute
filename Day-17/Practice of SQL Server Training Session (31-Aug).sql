
use [Ansari_Bhai_ With_SQL]

-------------------Trigger Example------------
Create Table Trigger_Table
(EmpID Int,
 EmpName Varchar(max),
 MobileNo Bigint,
 Salary Int
 )
 -------------------Trigger With Insert Query--------
 Create Trigger Trig_insert on Trigger_Table
 for insert
 as
 Declare @salary bigint
 Select @salary=Salary from inserted
 if @salary>0
 begin
 print 'Record inserted successfully'
 end
 else
 begin
 Rollback Transaction
 Print 'Invalid Criteria'
 end

 ---------------Insert Trigger Example
 Insert into Trigger_Table Values(112,'Deepak Saini',9876622321, 34566)

 --------------Trigger with Insert MobileNo Length
 Alter Trigger Trig_Insert_MobileNo on Trigger_Table
 for insert
 as
 Declare @MobileNo Bigint
 Select @MobileNo=MobileNo from inserted
 if LEN(@MobileNo)=10
 begin
 Print 'Record Inserted Successfully'
 end
 else
 begin
 Rollback Transaction
 Print'Invalid Criteria'
 end


 Insert into Trigger_Table Values(115,'Hari Singh',8767231247, 65566)

 Select * from Trigger_Table

 -----------Update Trigger

 insert into Trigger_Table Values(1112,'Manjeet Singh',9911176564,43433)
insert into Trigger_Table Values(1113,'Deepak Kumar',9911176564,43433)
insert into Trigger_Table Values(1114,'Mohit Jain',9911176564,43433)
insert into Trigger_Table Values(1116,'Sanjeev Garg',9911176564,43433)
insert into Trigger_Table Values(1117,'Deepak Saini',9911176564,43433)
insert into Trigger_Table Values(1118,'Deepak Saini',9911176564,43433)
insert into Trigger_Table Values(1119,'Deepak Saini',9911176564,43433)
insert into TableNew Values(1120,'Deepak Saini',9911176564,43433)

---------------Create Trigger with Update condition using after

Create Trigger TrigUpdate on Trigger_Table
After Update
as
Declare @EmpName as Varchar(max)
Select @EmpName=EmpName from inserted
if @EmpName<>'Deepak Saini'
Print 'Successfully'
else
Rollback
Print 'Invalid Criteria'

Update Trigger_Table set MobileNo=7897234586 where EmpName<>'Deepak Saini'

---------------Disable Trigger
Disable Trigger Trig_insert on Trigger_Table

insert into Trigger_Table Values(1121,'Param Singh',9911176564,-433)

---------------Enable Trigger

Enable Trigger Trig_insert on Trigger_Table

insert into Trigger_Table Values(1123,'Shiv Singh',9911176564,-54733)

Select * from GenderTable
Select * from Customer
----------Create Duplicate Table from Existing

Select CustomerID,Customer,Gender,Area,TotalSales into GenderTable from Customer	

-----------Create Trigger With Updata Condition using after
alter Trigger Trigg_Update on GenderTable
After Update
as
Declare @Gender as Varchar(max)
Select @Gender=Gender from inserted
if @Gender='Male'
Print 'Record Update Successfully'
else
begin
Rollback
Print 'Invalid Criteria'

Update GenderTable set TotalSales=FLOOR(Rand() *1000)+1 WHERE Gender='Male'

Select * from GenderTable

--------------------Delete Trigger Example
Create Trigger Delete_Trigger on Trigger_Table
after Delete
as
Declare @Salary bigint
select @Salary=Salary from deleted
if @Salary<0
Print 'Delete Successfully'
else
Rollback Transaction
Print 'Invalid Criteria'

Delete from Trigger_Table where Salary<0

Select * from Trigger_Table



CREATE TABLE Employee4 (
    EmpID INT PRIMARY KEY,
    EmpName VARCHAR(100),
    Department VARCHAR(50),
    Salary DECIMAL(10,2)
)

---------------- Trigger with Insert_Update_Delete all in one
Create Trigger Trg_Emp_Audit
on Employee4
After Insert,Update,Delete
as
begin
Declare @Dept as varchar(max)
select @Dept=Department from inserted
select @Dept=Department from deleted
if @Dept='HR'
begin
Print 'Successfully'
end
else
begin
Rollback Transaction
Print 'Invalid Criteria'
end
end
-------------------Execute Trigger
Disable Trigger Trg_Emp_Audit on Employee4

Enable Trigger Trg_Emp_Audit on Employee4

Insert into Employee4 values(444,'Naresh Pathak','IT',98152)

Select * from Employee4

Delete from Employee4 where Department='IT'

----------------------Use of Instead of-------------------
CREATE TABLE Employee5 (
    EmpID INT,
    EmpName VARCHAR(100),
    Department VARCHAR(50),
    Salary DECIMAL(10,2))


	Create Trigger NewInserting on Employee5
	instead of insert
	as
	Declare @EmpID Int
	Declare @EmpName Varchar(100)
	Declare @Department Varchar(50)
	Declare @Salary Float
	Select @EmpID=EmpID,@EmpName=EmpName,@Department=Department,@Salary=Salary from inserted
	if @Salary>0
	Begin
	Insert into Employee5 Values(@EmpID,@EmpName,@Department,@Salary)
	Print 'Inserted Successfully'
	end
	else
	begin
	Print 'Invalid Criteria'
	end
	
	
Insert into Employee5 Values(1101,'Hari Singh','HR',34332)
Insert into Employee5 Values(1102,'Varun Narang','Operations',45332)
Insert into Employee5 Values(1103,'Sanket Sharma','Admin',54332)
Insert into Employee5 Values(1104,'Dhruv Jha','IT',32678)
Insert into Employee5 Values(1105,'Rakesh Nautiyal','IT',45678)

Select * from Employee5


---------------------------Trigger with instead of through Update query
Alter TRIGGER NewUpdate
ON Employee5
INSTEAD OF UPDATE
AS
BEGIN
    -- Update using set-based logic (not single variable assignment)
    UPDATE E
    SET 
        E.EmpName = I.EmpName,
        E.Department = I.Department,
        E.Salary = I.Salary
    FROM Employee5 E
    INNER JOIN inserted I ON E.EmpID = I.EmpID;

    PRINT 'Updated Successfully';
END;

UPDATE Employee5
SET Salary = 67899
WHERE EmpName = 'Hari Singh' AND Salary = 34332;

----------------DDL Trigger Example in SQL on Databse
Create Trigger DDLTrigg on Database
for Create_Table
as
Print 'Table Creation is not allowed'
Rollback

Create TABLE Check_Tablee
(EmpID Int,
 EmpName Varchar(max)
 )

 Disable trigger DDLTrigg on Database

 -------------DDL Maha Trigger-----------
 Create Trigger DDLMahaTrigger on Database
 for Create_Table,Alter_Table,Drop_Table
 as
 begin
 Rollback Transaction
 Print'DDL Query not allowed'
 end

 Drop Table Customer

 ALTER TABLE Customer
 add Salary int

 Disable Trigger DDLMahaTrigger on Database