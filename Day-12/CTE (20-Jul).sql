

Select * from Dataset
-------------------CTE Example-1---------------
with MyCTE
as
(Select Agent,AcctType,Amount from Dataset)
Select * from MyCTE
-------------------CTE Example-2---------------
with CTEReport
as
(Select Agent,Sum(Amount) as Sum,Max(Amount) as Max,Min(Amount) as Min from Dataset
Group by Agent)
select * from CTEReport
-------------------CTE Example-3---------------

With PivotReport(Agent,AcctType,Amount) 
as
(Select AcctType,Agent,Amount from Dataset)
Select * from PivotReport

With PivotReport
as
(Select * from (Select Agent,AcctType,Amount from Dataset) as xyz
Pivot(Sum(Amount) for AcctType in ([CD],[IRA],[Checking],[Savings])) as xyz)
Select * from PivotReport
---------------CTE Example-5
Select Category,Sales from SuperStore

Select Category,Max(Sales) as TotalMax from SuperStore
Group by Category
-------------------2nd Highest Sales
Select Max(Sales) as TotalMax from SuperStore
where Sales<(Select Max(Sales) from SuperStore)
--------------remove duplicates------------

with RemoveDuplicate
as
(Select EmpName,ROW_NUMBER() over (Partition by Empname Order By EmpName Asc) as HelpCol
from UniqueData)
Delete from RemoveDuplicate where HelpCol>1

with UniqueCount
as
(Select EmpName,ROW_NUMBER() over (Partition by Empname Order By EmpName Asc) as HelpCol
from UniqueData)
select * from UniqueCount where HelpCol>1
------------------Interview Question-----------
Create Table CTE
(
TotalCost float,
GST float,
NetCost float
)

Create Table GST
(
TotalCost float
)
Insert into GST Values (1234),(5000),(1000),(500),(400)
Select * from GST
Select * from CTE

------------------Interview Question---------
with UpdateRecord
as
(Select TotalCost as TotalCost,TotalCost*0.18 as GST,TotalCost-(TotalCost*0.18) as NetCost from GST)
insert into CTE Select * from UpdateRecord

Select 246*0.18






