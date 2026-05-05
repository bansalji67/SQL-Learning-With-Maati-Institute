----------------------------SCHEMA Example-----

----1). Create New Schema

Create Schema RPO Authorization DBO
Create Table RPO.NewTable2
(
EmpID int,
EmpName Varchar(max),
Salary bigint
)

Select * from bpo.NewTable
insert into bpo.NewTable Values(111,'Raj',43433)
delete from NewTable
drop Table NewTable
Select * from NewTable

-----------Transfer Schema on other Table
Alter Schema  BPO Transfer Object::dbo.RawData1  
Select * from BPO.RawData1
----------Remove Schema----------------------
drop Schema BPO
Alter schema DBO Transfer Object::BPO.RawData1
Alter schema DBO Transfer Object::BPO.NewTable
---------------Show Schema of Database
Select * from sys.schemas
-------------------------
sp_help NewTable2





