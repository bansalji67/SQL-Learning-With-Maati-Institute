-----------------------System defined Variable----------
------------Example-1
----Extract Server Name
Select @@SERVERNAME 'ServerName'
----Extract Version Name
Select @@VERSION as Version
----Extract UserName
Select @@SERVICENAME
print @@version

--------------System defined Variable -Example 4

Select Agent,AcctType,Customer,Amount from Dataset
Where Agent='Ashok Kumar' and Customer='New'
Select @@ROWCOUNT as TotalCount
----------------Variable declaration
-------Declaration Statemenet
Declare @i as int
declare @j as int


set @i=20
set @j=30

select @i+@j

-------------variable declaration Example-2
declare @agent as varchar(max)
set @agent='Ashok Kumar'
if exists (select Agent from Dataset where Agent=@agent)
Select 'Exists' as Result
else
Select 'not exists' as Result

--------------Normal If with Variable----------
Declare @marks as int
set @marks=67
if @marks<33
print 'Fail'
else if @marks<45
print 'Pass'
else if @marks<60
print 'Second'
else if @marks<75
print 'First'
else
print 'Excelent'

----------------IIF (Immediate IF)------------
Select * from Marksheet

Update Marksheet set Result=IIF(marks<33,'Fail',IIF(marks<45,'Pass',
IIF(marks<60,'Second',IIF(marks<75,'First','Excellent'))))
-------------IIF with And & OR Example
Select * from Sapient

Alter Table Sapient
Add Remark varchar(max)

Update Sapient set Remark=IIF([Performance Score]>4 And ([Rank]=1 or [Rank]=2) And (Total_Year>2),'Eligble','Not Eligible')
----------------IIF With Pivot Table
Select * into PivotExmaple from (Select Agent,SalesDate,Amount from Dataset) as xuz

Select Agent,Salesdate,'Q'+Convert(varchar(max),Datepart(Q,salesdate)) as xyz,Amount from Dataset

Select * from (Select Agent,'Q'+Convert(varchar(max),Datepart(Q,Salesdate)) as xyz, Amount from PivotExmaple where Year(SalesDate)=2019) as xyz
Pivot(sum(Amount) for xyz  in ([Q1],[Q2],[Q3],[Q4])) as Xyz

------------------Nested Select Case
Select * from Marksheet
update Marksheet set Result=null

update Marksheet set Result=
(Case 
when Marks<33 then 'Fail'
when Marks<45 then 'Pass'
when Marks<60 then 'Second'
when Marks<75 then 'First'
else
 'Excellent'
end)

------------------Loop Maharaj-1






























