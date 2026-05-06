
Use SQL_Practice

CREATE TABLE EmployeePerformance (
    EmpID INT PRIMARY KEY,
    EmpName VARCHAR(50),
    Department VARCHAR(50),
    MonthlyTarget INT,
    ActualSales INT
);
INSERT INTO EmployeePerformance (EmpID, EmpName, Department, MonthlyTarget, ActualSales)
VALUES 
(1, 'Sumit', 'Sales', 100, 110),
(2, 'Anita', 'Sales', 100, 90),
(3, 'Ravi', 'HR', 50, 55),
(4, 'Pooja', 'IT', 60, 58),
(5, 'Raj', 'Sales', 100, 105),
(6, 'Nikita', 'HR', 50, 48),
(7, 'Amit', 'IT', 60, 60),
(8, 'Meena', 'Sales', 100, 70),
(9, 'Kunal', 'Sales', 100, 100),
(10, 'Tina', 'HR', 50, 49),
(11, 'Gaurav', 'Sales', 100, 95),
(12, 'Divya', 'IT', 60, 64),
(13, 'Rakesh', 'Sales', 100, 107),
(14, 'Neha', 'HR', 50, 52),
(15, 'Manoj', 'IT', 60, 59),
(16, 'Kiran', 'Sales', 100, 102),
(17, 'Swati', 'HR', 50, 50),
(18, 'Vinay', 'IT', 60, 55),
(19, 'Preeti', 'Sales', 100, 87),
(20, 'Deepak', 'IT', 60, 61);

Select * from EmployeePerformance

---------1. IIF to Check Target Achievement 
---------if ActualSales Greater then MonthlyTarget Result show Target Achieved or Not Acheived

Select EmpName,Department,MonthlyTarget,
IIF(ActualSales>=MonthlyTarget,'Target Acheived','Not Acheived') 
as Result 
from EmployeePerformance

-----------2. IIF with Variable for Bonus Eligibility
----------Write a SQL query to determine the bonus eligibility of employees based on their actual sales

Declare @BonusLimit Int=100
Select EmpName,ActualSales,
iif(ActualSales>=@BonusLimit,'Eligible for Bonus','Not Eligible') 
as BonusStatus from EmployeePerformance

-------3. IIF Inside a CASE + Variable Threshold

---Add Column name as Performance and fill the records as below Criteria
   
   Declare @threshold int=95

   Select EmpName,ActualSales, iif(ActualSales>=@threshold,
   iif(ActualSales>=105,'Star Performer','Good Performer'),'Need Improvement') 
   as Performance from EmployeePerformance

   ---4.  IIF for Department-based Labeling

   Select EmpName,Department,iif(Department in('Sales','HR'),'Customer Facing','Support Team') as DataType from EmployeePerformance

   ---5.  IIF with Loop - Print Employees Over Target

   Declare @i int=1
   Declare @EmpName varchar(50),@Actual int,@Target int

   while @i<=20
   Begin
   Select @EmpName=EmpName,@Actual=ActualSales,@Target=MonthlyTarget
        from EmployeePerformance where EmpID=@i
		print @EmpName+ '-'+ iif(@Actual>=@Target,'Achieved','Missed')
		Set @i=@i+1
		End

		 Select * from EmployeePerformance
	
	--Q.6 IIF for Score Banding

	---Add a column Name as ScoreBand and fill the reocrd as per below
	--1. Actual Sales >=105  'Excellent'
	--2. Actual Sales >=95   'Good'
	--3     Else             'Average'
	

	Select EmpName,ActualSales, IIF(ActualSales>=105,'Excellent',
	iif(ActualSales>=95, 'Good','Average')) as ScoreBand 
	from EmployeePerformance       
	
	----Q.7  IIF to Highlight Underperformance

	Select EmpName,Department,ActualSales,
	iif(ActualSales<MonthlyTarget,'Underperformance','Ok') as PerformanceFlag 
	from EmployeePerformance

	--Q.8 IIF + Variable to Show Departmental Score Types
	----Show Good IT Performer using below criteria
	---if Department is IT And Actual Sales >=60
	
	Declare @FocusDept as Varchar(50)='IT'
	Declare @ActSales as Int =60
	
	Select EmpName,Department,
	iif(Department=@FocusDept and ActualSales>=@ActSales,'Good IT Performer','Other') 
	as ScoreType from EmployeePerformance

	--Q.9 IIF + Mathematical Logic for Extra Credit

	Select EmpName,MonthlyTarget,ActualSales,
	iif(ActualSales-MonthlyTarget>=2,'Extra Credit','Standard') 
	as Remarks from EmployeePerformance
