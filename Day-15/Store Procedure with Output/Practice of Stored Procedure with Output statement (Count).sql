
Use SQL_Practice

Select * from EmpData5
Select Department from EmpData5

--Q-1--------Count Employees by Department

Create Procedure SP_CountDept
  @DeptName Varchar(max),
  @EmpCount int OutPut
as
begin
Select @EmpCount= Count(*) from EmpData5
where Department =@DeptName 
end

Declare @Count Int
Exec SP_CountDept 'IT',@Count Output
Print 'IT DeptCount=' + cast(@Count as varchar)

--Q-2--Count Employees in a Specific Location

Create Procedure SP_CountLocation
  @loc as varchar(max),
  @empcount int output
  as
  begin
Select @empcount= Count(*) from EmpData5 where Location=@loc
end

Declare @count int
Execute SP_CountLocation 'Bangalore',@count output
print 'Bangalore Location Count=' +Cast(@count as varchar)

--Q-3-Count Employees with Salary Greater Than X
  Create Procedure SP_CountbySalary
      @minsal as int,
	  @empcount as varchar(max) output
		as
		begin
		  Select @empcount as Empcount,count(*) as number_Of_Employees from EmpData5 where Salary>@minsal
		  end

    Declare @count int
	Exec SP_CountbySalary 60000, @count output
	print 'Employees earning above 60k=' + CAST(@count as varchar)

--Q-4-Count Employees in Department & Location
    Create Procedure SP_CountbyDeptLoc
	@Dept as varchar(max),
	@Loc as varchar(max),
	@empcount as int output
	as 
	begin
	Select @Dept as Dept,@Loc as Location,count(*) as EmpCount from EMPData5
    where Department=@Dept and Location=@Loc
	end

	Declare @count int
	Exec SP_CountbyDeptLoc 'Sales','Chennai', @count output
	Print 'EmpCount Finance in Delhi=' +Cast(@count as varchar)

--Q-5 Count All Employees (Overall)
   Create Procedure SP_COUNTALL
   @Totalempcount as int output
   as
   begin
   Select @Totalempcount=count(*) from  EMPData5
   end

   Declare @count int
   Exec SP_COUNTALL @count output
   Print 'Total Employee=' +cast(@count as varchar)