----------------------SQL Query Example-----------------
------------SubQuery Example-(1)
Select * from SuperStore
------------highest Salary---------
Select max(Sales) as MaxSalary from SuperStore
------------2nd Highest Salary
Select Max(Sales) as SecondHighest from SuperStore
where Sales < (Select max(Sales) as MaxSalary from SuperStore)
--------------Nth Highest Salary
with NthSales
as
(select Sales,ROW_NUMBER() over (order by Sales desc) as helpCol from SuperStore)
select Sales from NthSales where helpCol<=5
-----------------------SubQuery Example-2
Select [Customer Name],Sales from SuperStore
where Sales < (Select AVG(Sales) from SuperStore)
select @@ROWCOUNT as TotalCount
---------------Extract server Name
Select @@SERVERNAME
----------------------SubQuery Example-(4)
Select * from SuperStore
Create Table NewSuperStore
(
[Customer Name] varchar(max),
Segment varchar(max),
Region varchar(max),
Sales float,
Profit float
)
---------------------SubQuery Example-(4)-------------------
insert into NewSuperStore Select [Customer Name],Segment,Region,Sales,Profit from SuperStore
Select * from New

---------------------SubQuery Example-(5)-------------------
Select * from ShiftDetails1
Insert into ShiftDetails1 values('G','General')
Select * from UniqueData
Update UniqueData set Shift='Night' from UniqueData where CODE like 'T%'

Update newUniqueData set Shift=ShiftDetails1.ShiftType from ShiftDetails1
where NewUniqueData.Shift=ShiftDetails1.ShiftName

Select * into newUniqueData from UniqueData where Shift <>'E'
Select * from newUniqueData

------------------SubQuery Example-7
Select * from (Select Segment,Region,Sales from NewSuperStore
where Segment <>'abc') as vrttbl
Pivot(Sum(Sales) for Region in ([West],[Central],[South],[East])) as Xyz
------------------SubQuery Example-8
Select * into Super_Store from SuperStore
Select Count(*) from Super_Store
Delete from Super_Store where [Customer Name] IN (Select [Customer Name] from NewSuperStore)

------------------SubQuery Example (9)-------------------------
CREATE TABLE Departments (
    DepartmentID INT PRIMARY KEY,
    DepartmentName VARCHAR(50)
)
INSERT INTO Departments (DepartmentID, DepartmentName) VALUES
(1, 'HR'),
(2, 'Sales'),
(3, 'IT'),
(4, 'Marketing')

CREATE TABLE Employees (
    EmployeeID INT PRIMARY KEY,
    EmployeeName VARCHAR(50),
    DepartmentID INT,
    Salary DECIMAL(10, 2),
    FOREIGN KEY (DepartmentID) REFERENCES Departments(DepartmentID)
)
INSERT INTO Employees (EmployeeID, EmployeeName, DepartmentID, Salary) VALUES
(101, 'Alice', 1, 60000.00),
(102, 'Bob', 1, 55000.00),
(103, 'Charlie', 2, 70000.00),
(104, 'David', 2, 65000.00),
(105, 'Eve', 2, 72000.00),
(106, 'Frank', 3, 80000.00),
(107, 'Grace', 3, 75000.00),
(108, 'Heidi', 3, 82000.00),
(109, 'Ivan', 4, 60000.00),
(110, 'Judy', 4, 58000.00);

Select * from Employee
Select * from Department

Select Name,Gender,DOB,DepartmentName from Employee,Department where DeptID=Department.ID
-------------SubQuery Example -10







