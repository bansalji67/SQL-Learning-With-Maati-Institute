use SQL_Practice

select * from AgentDT
-------------Last Example-----------

Create Procedure sp_getinfo @accttype varchar(max)
as
begin
Select Agent,AcctType,Amount from AgentDT WHERE AcctType=@accttype
END

Exec sp_getinfo 'CD'
---------Stored Procedure with Output statement (Count)

Create Procedure sp_getoutput @accttype varchar(max),@Output as bigint output
as
begin
Select Agent,AcctType,Amount from AgentDT WHERE AcctType=@accttype
Select @@ROWCOUNT
END

Declare @example as varchar(max)
exec sp_getoutput @accttype='IRA', @output=@example

-----------Stored Procedure with Set No count on Statement
---to remove the message of number of rows changes will not display by using 'Set NoCount on' & Set 'NoCount off'
set nocount on
Declare @example as varchar(max)
exec sp_getoutput @accttype='IRA', @output=@example
Set nocount off

----------Stored Procedure with Report-1
Create Procedure SP_getReport @Customer varchar(max)
as 
begin
Select Agent,sum(Amount) as sum,max(Amount) as max,min(Amount) as min from AgentDT
where Customer=@Customer
Group by Agent
END

Exec SP_getReport @Customer='Existing'

-----------Stored Procedure with Pivot Table
Create Procedure SP_getPivot @Customer varchar(max)
as 
begin
Select * from(Select Agent,AcctType,Amount from AgentDT where Customer=@Customer)as xyz
pivot(sum(Amount) for AcctType in ([CD],[Checking],[IRA],[Savings])) as xyz
END

Exec SP_getPivot @Customer='Existing'

----------Stored Procedure with show structure
sp_helptext SP_getPivot

----------Stored procedure with Encryption
Alter Procedure SP_getPivot @Customer varchar(max)
with encryption
as 
begin
Select * from(Select Agent,AcctType,Amount from AgentDT where Customer=@Customer)as xyz
pivot(sum(Amount) for AcctType in ([CD],[Checking],[IRA],[Savings])) as xyz
END
sp_helptext SP_getPivot

----------------Stored Procedure with Create Table (Static)
Alter Procedure SP_TableCreation
as
begin
Create Table MyFreshTable
(EmpID Int,
 EmpName Varchar(max),
 Salary bigint
 )
 Print 'Table Created Sucessfully'
 end

 Exec SP_TableCreation

 Select * from MyFreshTable
 
 -----------Stored Procedure with Create Table (Dynamic)
 Alter Procedure dynamictable @tblname varchar(max)
 as
 begin
    Declare @syntax nvarchar(max)
   Set @syntax= 'Create Table' + QUOTENAME(@tblname) +'(EmpID Int,Empname varchar(max),Salary int))'
   exec sp_executesql @syntax
   Print @tblname + 'has successfully created'
   end

   Exec dynamictable 'NEWDD'




 Drop Procedure SP_DynamicTable

 
