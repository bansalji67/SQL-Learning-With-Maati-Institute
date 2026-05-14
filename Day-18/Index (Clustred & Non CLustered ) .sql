--------------------Index Exmaple---------------
-----------Table Creating
Create Table Table2
(
EmpID int,
EmpName Varchar(max),
Salary bigint
)
insert into Table2 Values(555,'Rajesh',343343)
insert into Table2 Values(444,'Mohit',12345)
insert into Table2 Values(333,'Pankaj',43433)
insert into Table2 Values(111,'Kamal',434224)
insert into Table2 Values(222,'Varun',20000)

Select * from Table2
---------------------Clustred Index example--------
Create clustered index Inx001 on Table2
(
EmpID asc,
Salary Desc
)

Select * from Table2

Drop Index Inx001 on Table2

Create clustered index Inx002 on Table2
(
Salary desc
)
------------------NonClustered Index
Create Nonclustered Index Inx003 on Table2
(
Salary desc
)

DROP INDEX Inx004 ON Table2;
Create Nonclustered Index Inx004 on Table2
(
EmpID desc,
Salary asc
)
----------------Default Clustred Index with Primary Key
CReate Table NewTable
(
EmpID int primary key,
EmpName varchar(max),
Salary bigint,
MobileNo bigint
)

-------------Check Index in Priamry key
sp_help newTable

-------------------














