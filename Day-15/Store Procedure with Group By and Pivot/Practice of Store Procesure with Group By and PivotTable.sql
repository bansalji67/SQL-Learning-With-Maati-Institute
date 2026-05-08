
use SQL_Practice
-----------Store Procedure example with Group by and Pivot table

--Q-1 Department-wise Employee Count
Create Procedure SP_DeptWise_Count_Emp
as
begin
 Select Department,count(*) as Deptwise_Count from EMPData5
 Group by Department
 end

 Exec SP_DeptWise_Count_Emp

 --Q.2 Location-wise Average Salary

   Create Procedure SP_Location_wise_Sal
   as 
   begin
   Select Location,Round(AVG(Salary),0) as AVG_Sal from EMPData5
   group by Location
   end

   Exec SP_Location_wise_Sal

   
   --Q.3 Department and Location Employee Count

    Create Procedure SP_Emp_Count_DeptLocation_wise
	as 
	begin
	Select Department,Location,Count(*) as TotalCount from EMPData5
	Group by Department,Location
	Order by Department,Location 
	end

	Exec SP_Emp_Count_DeptLocation_wise

--Q.4 Department-wise Employee Distribution by Location
     Create Procedure SP_DeptLocationPivot
	 as
	 begin
	 Select Department,[Delhi],[Mumbai],[Chennai],[Bangalore] from(Select EmpID,Department,Location from EMPData5) as xyz
	pivot(count(EmpID) for Location in([Delhi],[Mumbai],[Chennai],[Bangalore]))as XYZ
	end

	Exec SP_DeptLocationPivot

--Q.5 Salary Range Distribution by Department

Create Procedure SP_SalaryRangePivot
AS
BEGIN
Select Department,[<40000] as Low,[40000-60000] AS Mid,[>60000] as High
from(
 Select Department,
       Case when Salary<40000 then '<40000'
	        When Salary Between 40000 and 60000 then '40000-60000'
			else '>60000'
			end as SalaryRange,EmpID FROM EMPData5) as source
			Pivot(count(EmpID) FOR SalaryRange in ([<40000],[40000-60000],[>60000]))as pivottable
			end

			Exec SP_SalaryRangePivot


