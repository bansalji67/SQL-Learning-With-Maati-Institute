------------Execute Normal Query
Select * from Dataset
------------Extract Conditional Data
Select * from Dataset where AcctType='CD' and Agent='Pawan Kumar' And Customer='New'
-----------Extract Unique Agent Name
Select Distinct Agent from Dataset

-----------Extract Unique Name using Group by
Select Agent from Dataset
Group by Agent
-----------------Group by Example-1
Select Agent,Count(AcctTYpe) as TotalCount from Dataset
Group by Agent
-----------------Group by Example-2
Select Agent,Sum(Amount) as TotalSales from Dataset
Group by Agent

-------------Aggreate Function
Select AcctType, Sum(Amount) as Sum,Max(Amount) as Max,Min(Amount) as Min,Avg(Amount) as Avg from Dataset
Group by Accttype
Select * from Dataset
-----------Group by Example-3
Select Agent,Count(AcctTYpe) as TotalCount from Dataset
Group by Agent





-----------------Group by Example-3 (Rollup)
Select isnull(Agent,'TOTAL') as Agent,Sum(Amount) as TotalSales,Count(Amount) as TotalCount from Dataset
Group by Rollup(Agent)

---------------------- SQL ORDER BY (Data Sorting)
Select Agent,AcctType,Amount from Dataset Order by Agent Asc,AcctType desc
------------------------SQL Exists
if Exists (select * from Dataset where Agent='Noorain Ansari')
print 'Exists'
else
print 'Not Exists'
--------------------Extract SQL Nth TOP Value
Select * from Dataset
Select distinct Top 5 Amount from Dataset order by Amount desc
go
---------------Extract Bottom Nth Value
Select distinct Top 5 Amount from Dataset order by Amount asc
-------------Extract SQL ROW NUM
Select Agent,ROW_NUMBER() over (order by Amount) as RowNo,Amount from Dataset
--------------------SQL IS Not NULL-------------
Create Table FreshNewTable1
(
EmpID int,
EmpName Varchar(max)
)

insert into FreshNewTable1 values(111,'Raj')
insert into FreshNewTable1 values(222,null)
insert into FreshNewTable1 values(333,'Manish')
insert into FreshNewTable1 values(444,null)
Select * from FreshNewTable1 where EmpName is not null

--------------UHG Interview Question----------
Select * from Dataset where null=null
Select * from Dataset where ''<>''
Select * from Dataset where 1<>1
----------Query with Other Database--------
Select * from Adv_SQL.dbo.Example
-------------Select Union ------------
Select * from T1
Union
Select * from T2
-------------Select Union All------------
Select * from T1
Union All
Select * from T2
--------------------Data Report-----------
Select * from CD
Union All
Select * from IRA
Union All
Select * from Savings
Union All
Select * from Checking

--------------------Data Report Group by-----------
Select * into DataTable1 from (Select * from CD
Union All
Select * from IRA
Union All
Select * from Savings
Union All
Select * from Checking) xyz

Select * from DataTable1
------------SQL Intersect-------------
Select  * from T1
--Intersect
Select * from T2

----------------SQL Except
Select * from T2
Except
Select * from T1
-----------------SUMIF & COUNTIF Example
select AcctType, sum(amount) as Sumif,count(amount) as countif from dataset where Year = 2014 
group by AcctType

-----------------SUMIFS & COUNTIFS Example
select Agent, sum(amount) as Sumifs,count(amount) as countifs from dataset 
where Year = 2014 and AcctType='CD'
group by Agent
-------------------Pivot Table Example
Select Agent,AcctType,Sum(Amount) as Sum from DataTable1
Group by Agent,AcctType

Select * from DataTable1
Pivot(Sum(Amount) for AcctType in ([CD],[IRA],[Savings],[Checking])) as noor
--------------Question Papers-------------------------
Select * from RawData1
------------Example1
Select Buyer,Sum(Amount) as TotalAmount from RawData1
Group by Buyer
------------Example2
Select * from (Select Type,Buyer,Amount from RawData1) as xyz
Pivot(Sum(Amount) for Buyer in ([Dad],[Kelly],[Mom])) as xyz
--------Example2
Select Sum(Amount) as [Sum of Amount] from RawData1
---Find out the total sales price of the fruits with the help of pivot table ?							
Select Fruits,Sum([Sales Price]) as Totalsales from RawData2
Group by Fruits
---Find out the sales amount as per the zone(South & West) ?					
Select Zone,Sum(Sales) as TotalSales from RawData3
where zone in ('South','West')
Group by Zone
------Make a pivot table on the basis of status ?				
Select status,Count(Status) as TotalCount from RawData4
Group by Rollup(Status)









































