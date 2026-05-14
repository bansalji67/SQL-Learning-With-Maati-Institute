
--------------------Index Exmaple---------------
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

------------------NonClustered Index

Create NonClustered Index inx002 on Table2
(Salary Desc
 )

 Create NonClustered Index inx004 on Table2
 (EmpID asc,
  Salary Desc
  )

  ----------------Default Clustred Index with Primary Key
	Create Table NewTable
	(
	EmpID int primary key,
	EmpName varchar(max),
	Salary bigint,
	MobileNo bigint
	)