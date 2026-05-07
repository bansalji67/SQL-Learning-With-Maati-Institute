------------------System defined Stored Procedure------------
------------sp_help
sp_help dataset
------------Sp_helpdB
sp_helpdb Basic_SQL
--------------sp_rename (Table)
sp_rename 'Departments','Deprt'
select * from Deprt
--------------sp_rename (Field)

select * from Dataset
sp_rename 'Dataset.Amount','Sales'

----------------sp_renamedb
sp_renamedb 'July2025','Aug2025'
----------------SHow All Views of Table-------
use Basic_SQL
Select * from sys.views
--------------sp_helptext
sp_helptext sp_renamedb
-----------------Sp_helpUser
sp_helpUser
--------------Sp_exec 'Syntax'
declare @syntax as nvarchar(max)
set @syntax='Select * from dataset'
execute sp_executesql @syntax
execute sp_executesql Select * from dataset
sp_configure
sp_who 
sp_spaceused
sp_depends 

-----------------Normal Stored procedure
Create procedure SpNormal
as
begin
select Agent,AcctType,Sales from Dataset
end
------------Execute Stored Procedure--------------
Execute SpNormal
Exec SpNormal
SpNormal

-------------Stored procedure with Where Condition

Alter procedure ConditionalSP
as
begin
select Agent,AcctType,Sales from Dataset 
where Sales > (Select AVG(sales) from Dataset)
select @@ROWCOUNT as AboveAvg
end

Execute ConditionalSP 
----------------Stored Procedure with Single parameter---------
Create procedure Sp_Parameter @acctType as varchar(max)
as
begin
select Agent,AcctType,Sales from Dataset where AcctType=@acctType
select @@ROWCOUNT as TotalOutput
end
Execute Sp_Parameter @acctType='Savings'
------------Stored Procedure with Multiple parameter


Create procedure Sp_MultiParameter @agent as varchar(max),@acctType as varchar(max)
as
begin
select Agent,AcctType,Sales from Dataset where AcctType=@acctType and agent=@agent
select @@ROWCOUNT as TotalOutput
end

Sp_MultiParameter 'Ashok Kumar','CD'

sp_helptext Sp_MultiParameter

---------------Stored Procedure with Output statement (Count)--------
Create Procedure







