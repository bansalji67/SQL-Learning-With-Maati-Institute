
----------Run Two Simple Procedures in One
---Proce Employee with Department
Create Procedure SP_Empwith_Dept1
as
begin
Select e.EmpName,d.DeptName,e.Salary
from EmpData6 e
Inner Join Dept_DT6 d on e.DeptID=e.DeptID
end
go
------DeptWise Emp Count
Create Procedure SP_Dept_WiseCount1
as
begin
Select d.DeptName,Count(e.EmpID) AS EmpCount
from Dept_DT6 d
Left Join EmpData6 e on d.DeptID=e.DeptID
Group by d.DeptName
end
go
------Master Procedure calling both
Create Procedure SP_Master2
as
begin
 Exec SP_Empwith_Dept1
 Exec SP_Dept_WiseCount1
 END
 GO

--------Execute
Exec SP_Master2


