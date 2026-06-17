
USE Ansari_Bhai_ With_SQL

-----------Select  Query

Select * from Agent_Data

---------------Distinct

Select Distinct Agent from Agent_Data

--------------Where

Select * from Agent_Data where AcctType='CD'

------------And

Select * from Agent_Data where AcctType='CD' and Amount>5000

------------OR

Select * from Agent_Data where AcctType='CD' OR AcctType='Savings'

----------- IN

Select * from Agent_Data where AcctType  IN ('CD','Savings','Checking')

---------Between

Select * from Agent_Data where Amount between 5000 and 20000

---------Show only headers

select * from Agent_Data where null=null

----------------Not IN

Select * from Agent_Data where AcctType NOT IN ('CD','Savings')

---------------Wild Card
---START NAME FROM A
Select * from Agent_Data where Agent like 'A%'

----End name with R

Select * from Agent_Data where Agent like '%R'

----------Execute Multiple table

Select * from Agent_Data
go
Select * from Customers
go
Select * from Emp2
go
Select * from Employees1

-------------Count------
Select Count(*) as "No of Records" from Agent_Data

Select Count(*) as "Abhishek_Counts" from Agent_Data where Agent='Abhishek Kumar'

--------------Aggregate Function

Select sum(Amount) as "Abhishek's Total" from Agent_Data where Agent='Abhishek Kumar'

Select max(Amount) as "Abhishek's Highest Amount" from Agent_Data where Agent='Abhishek Kumar'

Select min(Amount) as "Abhishek's Minimum Amount" from Agent_Data where Agent='Abhishek Kumar'

-------------Insert data

insert into Agent_Data Values('Hari Prakash','CD','Teller','Central','New',2005-12-01 ,3456,'December',2005)

insert into Agent_Data Values('Naresh Bhatt','Saving','Teller','Westside','New',2015-10-01 ,3456,'October',2015)
insert into Agent_Data Values('Gaurav Chandi','Checking','Teller','Central','New',2020-11-01 ,3456,'November',2020)
insert into Agent_Data Values('Om Prakash','CD','Teller','Central','New',2005-12-01 ,3456,'December',2005)

-----------------Update

Update Agent_Data
set Agent='Om Chaurasiya' where Agent='Om Prakash'

----------------AND WITH OR
Select * from Sapient where [Performance Score]>4 and (Rank=1 or Rank=2) and Total_Year>2

------IIF Example (Single Condition)----------------
select * from Unique_Data

Select CODE,[Emp Name],[Shift  ],IIF(Shift='N','Night',IIF(Shift='E','Evening',IIF(Shift='M','Morning','General'))) as ShiftName  from Unique_Data

-------------------Display only Headers

select * from Agent_Data where null = null

select * from Agent_Data where ''<>''

-----------------Group by Example-1

Select Agent, Count(AcctType) as TotaCount from Agent_Data
Group by Agent

-----------------Group by Example-2

Select Agent,sum(Amount) as TotalSales from Agent_Data
group by Agent


-------------Aggreate Function

Select AcctType,sum(Amount) as Total,MAX(Amount) as Max, MIN(Amount) as min,AVG(Amount) as Avg from Agent_Data
Group by AcctType

-----------------Group by Example-3 (Rollup)

Select isnull(Agent,'TOTAL') as Agent,Sum(Amount) as TotalSales,Count(Amount) as TotalCount from Agent_Data
Group by Rollup(Agent)

--------------Order By

Select Agent,AcctType,Amount from Agent_Data order by Agent asc, AcctType desc

-----------EXISI

IF Exists (Select * from Agent_Data where Agent='Pawan Kumar')
print 'Exist'
else
print 'Not Exist'

---------------------SQL Nth TOP Value

Select Distinct Top 5 Amount from Agent_Data order by Amount desc
GO
----------------Extract Bottom Nth Value

Select Distinct Top 5 Amount from Agent_Data order by Amount asc

--------------------Row Number-----------------

Select Agent,Amount,ROW_NUMBER() OVER (ORDER BY AMOUNT) AS RowNo from Agent_Data

-----------Union-----------------
Select * from T1
Union
Select * from T2

--------------Union All

Select * from T1
Union All
Select * from T2

--------------------- Create a new table by extracting data from 4 tables

Select * into DataTable1 from (Select * from CD
UNION ALL
Select * from Checking
Union All
Select * from Savings
Union All
Select * from IRA) xyz

Select * from DataTable1

-------------------Intersect---------------
--IT Shows only common records from both tables
Select * from T1
INTERSECT
Select * from T2

------------------EXCEPT
--It show only unmatched records from both tables

Select * from T2
Except
Select * from T1

------------------SUMIF & COUNTIF Example
--Q- FIND OUT THE SUM OF AcctType WISE and Count of AcctType

Select AcctType,SUM(Amount) as SUM_IF,COUNT(Amount) as Count_if from Agent_Data where YEAR=2001 
Group by AcctType

----------------SumIFS AND Countifs

Select Agent,SUM(Amount) as SUM_IFS,COUNT(Amount) as Count_IFS from Agent_Data where YEAR=2001 and AcctType='CD'
Group by Agent

----------------Pivot Table

Select * from DataTable1
pivot(sum(Amount) for AcctType in([CD],[IRA],[Savings],[Checking])) as xyz

-------------------Remove any column from table

Alter table DataTable1
Drop Column[Month]



Select * from RawData