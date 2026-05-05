
-----------------------TempTable---------------------

Create Table #TempTable1
(EmpID Int,
 EmpName Varchar(max),
 Salary Bigint
 )

 Select * from #TempTable1

 -------------------Global TempTable-------------------
 Create Table ##GlobalTempTable
 (EmpID int,
  EmpName Varchar(max),
  Salary Bigint
  )