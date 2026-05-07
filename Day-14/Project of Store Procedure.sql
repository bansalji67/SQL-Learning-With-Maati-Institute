
Use SQL_Practice

Select * from Emp1
Select * from ['Projects]
Select * from ['Logs]
Select * from ['EmployeeProjects]

---Q-1 Write a stored procedure to get the top 5 highest-paid employees. 
Create Procedure TOP5_SP
AS
BEGIN
Select Top(5) * from Emp1
order by Salary desc
END

Exec TOP5_SP

--Q-2 Create a stored procedure to update an employee’s salary based on EmployeeID
  
  Create Procedure UpdateEmpSalary @empid int,@newsal int
  as
  begin
  Update Emp1 set Salary=@newsal where EmpID=@empid
  END

  Exec UpdateEmpSalary @empid=4,@newsal=72000

  --Q-3 Write a stored procedure to insert a new record into Employees table and return the new EmployeeID.
  Create Procedure Insert_New_Record @empid int,
                     @fname as varchar(max),
					 @lname as varchar(max),
					 @dept as varchar(max),
					 @sal as int,
					 @hiredate as date
                   as
                begin
				Insert into Emp1(EmpID,Fname,Lname,Dept,Salary,HireDate) VALUES(@empid,@fname,@lname,@dept,@sal,@hiredate)
				end

Exec Insert_New_Record @empid=9,@fname='Hari',@lname='Lal',@dept='IT',@sal=56000,@hiredate='2022-01-15' 

--Q-4 Create a stored procedure to fetch employees who worked more than 100 hours on any project. 
Create Procedure GetEmpOver100Hrs
as 
begin
SELECT e.EmpID,(e.Fname + ' ' + e.Lname) AS FullName,ep.[Hours Workd]
FROM Emp1 e
JOIN ['EmployeeProjects] ep 
    ON e.EmpID = ep.EmpID
WHERE ep.[Hours Workd] > 100;
end

Exec GetEmpOver100Hrs