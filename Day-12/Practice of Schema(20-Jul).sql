
USE Basic
-------------------------SCHEMA EXAMPLE------------------

--------------Create NEW SCHEMA

Create Schema BPO Authorization DBO
Create Table BPO.NewTable
(EmpID Int,
 EmpName Varchar(max),
 Salary Bigint
 )

 Select * from bpo.NewTable

 Drop Table NewTable

 ---------------Insert Data
 Insert into bpo.NewTable Values(111,'Raj',43232)
 Delete Table NewTable		
 Drop Table NewTable

 -----------Transfer Schema on other Existing Table

 Alter Schema BPO Transfer object::dbo.RawData1
 Select * from bpo.RawData1

 ----------Remove Schema----------------------
 Drop schema BPO
 Alter Schema DBO Transfer Object::BPO.RawData1
 Alter Schema DBO Transfer Object::BPO.NewTable

 ---------------Show Schema of Database
Select * from sys.schemas