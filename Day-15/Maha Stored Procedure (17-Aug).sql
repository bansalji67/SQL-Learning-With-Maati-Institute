------------------------Last Example
Create Procedure sp_getInfo @accttype varchar(max)
as
begin
	Select Agent,AcctType,Sales from Dataset where AcctType=@accttype
end
Execute sp_getinfo 'CD'
----------Stored Procedure with Output statement (Count)--------
Create Procedure sp_getOutput @accttype varchar(max),@output bigint output
as
begin
	Select Agent,AcctType,Sales from Dataset where AcctType=@accttype
	select @@ROWCOUNT
end

declare @example as varchar(max)
execute sp_getOutput @accttype='IRA', @output=@example

----Stored Procedure with Set No count on Statement

set nocount on
declare @example as varchar(max)
execute sp_getOutput @accttype='IRA', @output=@example
set nocount off

-------------------Stored Procedure with Report-1
Create Procedure Sp_getReport @customer varchar(max)
as
begin
select Agent,sum(Sales) as Sum,Max(Sales) as Max,Min(Sales) as min from Dataset
where Customer=@customer
Group by Agent
end

Execute sp_getReport @Customer='Old'
--------------------Stored Procedure with Pivot Table
Create Procedure Sp_getPivot @customer varchar(max)
as
begin
Select * from (select Agent,AcctType,Sales from Dataset where Customer=@customer) as xyz
pivot(sum(Sales) for AcctType in ([CD],[IRA],[Savings],[Checking])) as xyz 
end
Execute Sp_getPivot 'Old'
-------------Stored Procedure with show structure
sp_helptext Sp_getPivot

------------------Stored procedure with Encryption
Alter Procedure Sp_getPivot @customer varchar(max)
With encryption
as
begin
Select * from (select Agent,AcctType,Sales from Dataset where Customer=@customer) as xyz
pivot(sum(Sales) for AcctType in ([CD],[IRA],[Savings],[Checking])) as xyz 
end

------------------
sp_helptext Sp_getPivot
---------------------Stored Procedure with Create Table (Static)
Alter Procedure Sp_TableCreation
as
begin
Create Table MyNewFreshTable
(
EmpID int,
EmpName Varchar(max),
Salary bigint
)
print 'Table Created Successfully'
End
------------Execute the Procedure---------
Execute Sp_TableCreation
Select * from MyNewFreshTable

---------------Stored Procedure with Create Table (Dynamic)
Alter Procedure sp_dynamicTable @tblname varchar(max)
as
begin
	declare @syntax as nvarchar(max)
	set @syntax='create table '+@tblname+'(EmpName varchar(max),MobileNo Bigint,Location varchar(max))'
	Execute sp_sqlexec @syntax
	print @tblname +' has successfully created'
end

Execute sp_dynamicTable 'NewIRA'
Select * from NewIRA

-------------------Maha Stored Procedure-----------------
Alter Procedure Maha_Procedure @txt as varchar(max)
as
begin
if @txt='Create'
begin
	Create Table abcxyz
	(
	EmpID int,
	EmpName varchar(max),
	Salary bigint
	)
	print 'Table Created'
End
else if @txt='Select'
begin
select * from abcxyz
end
else if @txt='Insert'
begin
Insert into abcxyz values(111,'Raj',43433)
Insert into abcxyz values(222,'Sanju',2345)
Insert into abcxyz values(333,'Manjeet',1234)
Insert into abcxyz values(444,'Lokesh',35535)
	print 'Data Inserted successfully'

end
else if @txt='Delete'
begin
delete from abcxyz
print 'Data Delete'
end
else if @txt='Drop'
begin 
drop table abcxyz
end
end


----------------Execute Maha Procedure--------
Execute Maha_Procedure @txt='Create'
Execute Maha_Procedure @txt='Select'
Execute Maha_Procedure @txt='Insert'
Execute Maha_Procedure @txt='Select'
Execute Maha_Procedure @txt='Delete'
Execute Maha_Procedure @txt='Select'
Execute Maha_Procedure @txt='Drop'







Create Procedure sp_getInfo @accttype varchar(max)
as
begin
	Select Agent,AcctType,Sales from Dataset where AcctType=@accttype
end
Execute sp_getinfo 'CD'

Create Procedure MultiProcedure 
as
begin
Execute sp_getinfo 'CD'
end

Execute MultiProcedure 

---------------Stored Procedure with Error Handler
Create Procedure sample 
as
begin
select 1/0
end

begin Try
Execute sample 
end Try

Begin Catch
Select ERROR_MESSAGE() as msg,ERROR_NUMBER() as number,ERROR_PROCEDURE() ProcName,ERROR_LINE() as Errline
end Catch

























