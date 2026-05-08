
-------------Master with Parameters Passed to Sub-Procedures
---Proce1 Employee in specific location

Create Procedure SP_Emp_by_Location
  @City as varchar(max)
  as
  begin
  Select EmpName,Salary,Location from EmpData6 
  where Location=@City
  end
  go
  ---Proce2 Employee in Specific Dept
  Create Procedure SP_Emp_by_Dept
  @DeptInt as int
  as
  begin
  Select EmpName,Salary
  from EmpData6
  where DeptID=@DeptInt
  end
  go
  ----Master Proce Run Both Parameter
  Create Procedure SP_Master4
  @City varchar(50),@DeptID Int
  as
  begin
  Exec SP_Emp_by_Location @City
  Exec SP_Emp_by_Dept @DeptID
  END
  ---------------Execute

  Exec SP_Master4 'Delhi',1