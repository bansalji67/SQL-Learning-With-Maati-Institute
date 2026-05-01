
Use [Ansari_Bhai_ With_SQL]

-------------Create Database------------
Create Database NewDB

--------------Rename the Databse----------
sp_renamedb 'NewDB','NewDatabase'

------------Drop Database------------
Drop database NewDatabase

-------------Active Database

Use [Ansari_Bhai_ With_SQL]

-----------Total No of Database-------------
select count(*) as TotalNoOfDatabase from sys.databases

Select * from sys.databases

-------------Name of Database

Select name from sys.databases

-------------Customized Database name with Remarks

select Name,IIF(owner_sid=0x01,'System DB','User DB') AS Remarks from sys.databases

select Name, (Case owner_sid when 0x01 then 'System DB' else 'User DB' end) AS Remarks from sys.databases

--------------List of Tables in Active Database

select name from sys.tables
select @@ROWCOUNT as 'TotalCount'

------------Create Table in Different Way

select * into Male from Customer where Gender='Male'

select * into Female from Customer where Gender='Female'

Select * from Customer

select * from Male
Select * from Female

------------------Create Table-------------
Create Table New_Tbl
(EmpID Int,
 EmpName Varchar(50),
 Salary bigint
 )

 ----------------Example2------------
 Create Table New_Tabl1
 (EmpID Int Primary Key,
  EmpName Varchar(max),
  Salary Bigint
   )

   Insert into New_Tabl1 Values(111,'Raj',34566)
   Insert into New_Tabl1 Values(222,'Raju',9877)
   ------------------------------Example3-------------
   Create Table New_Tbl2
   (EmpID int identity (1000,1),
    EmpName Varchar(max),
	Salary Bigint
      )

	  Insert into New_Tbl2(EmpName,Salary) Values('Raju',8765)
	  Insert into New_Tbl2(EmpName,Salary) Values('Rakesh',7865)
	  Insert into New_Tbl2(EmpName,Salary) Values('Roshan',4455)
	  Insert into New_Tbl2(EmpName,Salary) Values('Rohan',98764)

	  Select * from New_Tbl2

	  ------------------Rename the Table-----------
	  sp_rename 'New_Tbl2','New_Table2'

	  Select * from New_Table2

	  ----------Rename Column Name----------------
	  sp_rename 'New_Table2.EmpName','Employee'

	  -------------Alter Table--------------
	  Alter Table New_Table2
	  add Incentive bigint

	  ------------Drop Column-------------
	  Alter Table New_Table2
	  Drop Column Incentive
	  -----------Change Data Type------------
	  Alter Table New_Table2
	  alter column Salary float
	  
	  -------------Check any table's Data Type
	  
	  sp_help New_Table2

	  ----------Create New Table after delete existing table

	  Drop Table if exists index_Table
	  Create Table Index_Table
	  (EmpID Int,EmpName Varchar(max),Salary bigint)

	  Select * from Index_Table
	  