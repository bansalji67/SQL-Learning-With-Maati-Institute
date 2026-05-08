use SQL_Practice
Select * from EmpData6
Select * from Dept_DT6

--Q.1 INNER JOIN → Can you give me a list of employees with the department they work in, their salary, and work location?”

 Create Procedure SP_EmpWithDept_InnerJoin
 as
 begin
 Select e.EmpID,e.EmpName,d.DeptName,e.Location 
 from EmpData6 e
 Inner join Dept_DT6 d on e.DeptID=d.DeptID
 end

 Drop Procedure SP_EmpWithDept_InnerJoin

 Exec SP_EmpWithDept_InnerJoin
   

 --Q.2 Some employees don’t have a department yet. Can you make a list of all employees and 
 --    show their department if they have one, otherwise keep it blank?”

  Create Procedure SP_EmpWithoutDept_Leftjoin
  as
  begin
  Select e.EmpName,e.Location,e.Salary,d.DeptName from EmpData6 e
  left join Dept_DT6 d on e.DeptID=d.DeptID
  end

  Exec SP_EmpWithoutDept_Leftjoin
  

  --Q.3 I want to see all departments, even if they don’t have any employees. (Departments Without Employees)
  --Can you prepare that list with department name and employee name?”

      Create Procedure SP_DeptwithEmp_Rightjoin
	  as
	  begin
	  Select d.DeptName,e.EmpName,e.Salary from EmpData6 e
	  Right join Dept_DT6 d on e.DeptID=d.DeptID
	  end

	  Exec SP_DeptwithEmp_Rightjoin

	--Q.4 Employees who don’t belong to any department, and departments that don’t have employees.

	      Create Procedure SP_Fulljoin_EmpDept
		  as
		  begin
		  Select e.EmpName,d.DeptName,e.Salary from EmpData6 e
		  Full Join Dept_DT6 d on e.DeptID=d.DeptID
	      end

		  Exec SP_Fulljoin_EmpDept

	--Q.5 average salary of employees per department.

	     Create Procedure SP_Deptwise_Avg_Salary
		 as
		 begin
	     Select d.DeptName,avg(e.Salary) as Avg_Salary_Deptwise from EmpData6 e
         join Dept_DT6 d on e.DeptID=d.DeptID
		 group by d.DeptName
		 end

		 Exec SP_Deptwise_Avg_Salary

	--Q.6 pairs of employees who are located in the same city (self join /inner join)

	 Create Procedure SP_EmpSame_Location
	 as
	 begin
	 Select e1.EmpName as Emp1,e2.EmpName as Emp2,e1.Location from EmpData6 e1
	 inner join EmpData6 e2 on e1.Location=e2.Location and e1.EmpID<e2.EmpID
	 end


	 
	 Exec SP_EmpSame_Location

	--Q.7 I need a matrix where every employee is shown against every department, 
	    --even if they don’t belong to it. Can you prepare such a list?”
		
		Create Procedure SP_EmpDeptCrossJoin
		as
		begin
		Select e.EmpName,d.DeptName from EmpData6 e
		Cross join Dept_DT6 d
		end

		Exec SP_EmpDeptCrossJoin

	--Q.8 You want to create a report showing employee name, their department name, 
	--and compare employee’s current location with the department’s official location.
	
	Create Procedure SP_EmpDeptLocation
	as
	begin
	Select e.EmpName,d.DeptName,d.Location as DeptLocation,e.Location as EmpLocation from EmpData6 e
	inner join Dept_DT6 d on e.DeptID=e.DeptID
	end

	Exec SP_EmpDeptLocation

	--Q.9 HR wants a report that shows number of employees in each department, including departments with 0 employees.
      
	  Create Procedure SP_DeptWiseCount
	  as
	  begin
	  Select d.DeptName,count(e.EmpName) as EmpCount from Dept_DT6 d
	  Left join EmpData6 e on d.DeptID=e.DeptID
	  group by d.DeptName
	  end

	  Exec SP_DeptWiseCount

	--Q.10 Can you prepare a list of departments along with the highest-paid employee in each one and their salary?”

	  Create Procedure SP_HighestPaidBYDept
	  as
	  begin
	  Select e.EmpName,d.DeptName,Salary  from EmpData6 e
	  Inner join Dept_DT6 d on e.DeptID=d.DeptID 
	  Where e.Salary=(Select max(Salary) from EmpData6 where DeptID=e.DeptID)
	  end

	  Exec SP_HighestPaidBYDept

	  ----------------------Store Procedure with Multi Store Procedure

	  Create Procedure SP_Master
	  as
	  begin
	  Exec SP_HighestPaidBYDept
	  Exec SP_DeptWiseCount
	  end

	  Exec SP_Master
	  