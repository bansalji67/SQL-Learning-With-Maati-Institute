
---------Master Procedure Executing Sub-Procedures Conditionally

---sub Procedure High Salary Employee
Create Procedure SP_HighSalary
as
begin
Select EmpName,Salary from EmpData6 where Salary>60000
end
go
------sub procedure Low Salary Employee
Create Procedure SP_LowSalary
as
begin
Select EmpName,Salary from EmpData6 where Salary<60000
end
go
-----------Master Procedure Run based on input
Create Procedure SP_Master_5
@type varchar(max) 
as
begin
if @type='High'
  Exec SP_HighSalary
  else
  Exec SP_LowSalary
  End
  go

  Exec SP_Master_5 'High'
  Exec SP_Master_5 'Low'