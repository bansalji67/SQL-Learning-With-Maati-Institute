-------------------------TempTable---------------
Create Table #tempTable1
(
EmpID int,
EmpName varchar(max),
Salary bigint
)

Select * from #tempTable1

---------------Global TempTable
Create Table ##GlobalTempTable
(
EmpID int,
EmpName Varchar(max),
Salary bigint
)
-






