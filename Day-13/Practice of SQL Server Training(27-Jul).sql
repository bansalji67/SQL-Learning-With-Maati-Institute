
Use [Ansari_Bhai_ With_SQL]

---------------System Define Variable
------------Example-1

----Extract Server Name

Select @@SERVERNAME 'ServerName'

----Extract Version Name
Select @@VERSION as Version

--------Extract UserName
select @@SERVICENAME
print @@version

-------------------System Define Variable Example-4

Select * from sys.tables
Select * from Example1

Select Agent, AcctType,Customer,Amount from Agent_Data
where Agent='Ashok Kumar' and Customer='New'
Select @@ROWCOUNT as TotalCount

-------------------Variable Declration
Declare @i as int      ---Declaration Statement
Declare @j as int

Set @i=20           ----------Initialize
Set @j=30

Select @i+@j as TotalSum


-------------variable declaration Example-2
Declare @Agent as varchar(max)
set @Agent='Ashok Kumar'

if exists (select @Agent from Agent_Data where Agent=@Agent)
Select 'EXISTS' as Result
ELSE
SELECT 'Not Exists' AS Result


--------------Normal If with Variable----------
Declare @Marks as int
Set @Marks=62
if @Marks<33
Print 'Fail'
else if @Marks<45
Print 'Pass'
else if @Marks<60
Print 'Second'
else if @Marks<75
Print 'First'
Else
Print 'Excellent'

-------------------IIF (Immediate if)---------------------
Select * from Marksheet

Update Marksheet set RESULT=Null

Update Marksheet set RESULT=IIF(Marks<33,'Fail',iif(Marks<45,'Pass',iif(Marks<60,'Second',iif(Marks<75,'First','Excellent'))))

-------------IIF with And & OR Example
Select * from Sapient

Alter Table Sapient
Add Remarks varchar(max)

Update Sapient set Remarks=iif([Performance Score]>4 and([Rank]=1 or [Rank]=2) and (Total_Year>2),'Eligiible','Not Eligible')

----------------IIF With Pivot Table----------------
select * from Agent_Data

Select * into PivotExample from (Select Agent,AcctType,Date,Amount from Agent_Data) as xyz

Select * from PivotExample

Select * from (Select Agent,'Q'+ CONVERT(Varchar(max),Datepart(Q,Date)) as QuarterLabel,Amount from PivotExample) as Source
Pivot (sum(Amount) for QuarterLabel IN ([Q1],[Q2],[Q3],[Q4])) AS xyz

Select * from (Select Agent,'Q'+ CONVERT(Varchar(max),Datepart(Q,Date)) as QuarterLabel,Amount from PivotExample where Year(Date)=2001) as Source
Pivot (sum(Amount) for QuarterLabel IN ([Q1],[Q2],[Q3],[Q4])) AS xyz

-------------------------Nested Select Case--------------------
Select * from Marksheet

Update Marksheet set RESULT= (Case when Marks<33 THEN 'Fail'
                                 when Marks<45 THEN 'Pass'
								 when Marks<60 THEN 'Second'
								 when Marks<75 THEN 'First'
							    Else
								'Excellent'
								End)

--------------------------------Loops
Declare @k as int
Set @k=1
While @k<=10
begin
Print @k
Set @k=@k+1
end



