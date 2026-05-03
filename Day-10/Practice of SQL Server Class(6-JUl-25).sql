
Use JoinMaharaj
----------------------SQL Query Example-----------------
Select * from Superstore

------------highest Sales---------
Select Max(Sales) as Max_Sales from Superstore

------------2nd Highest Salary
Select max(Sales) as '2nd_Highest_Salary' from Superstore
where Sales <(Select Max(Sales) as Max_Sales from Superstore)

--------------Nth Highest Salary
With NthSales
as
(Select Sales,ROW_NUMBER() over (order by Sales Desc) as HelpCol from Superstore)
select Sales from NthSales where HelpCol=9

--------------------all top 3 Sales

With NthSales
as
(Select Sales,ROW_NUMBER() over (order by Sales Desc) as HelpCol from Superstore)
select Sales from NthSales where HelpCol<4

-----------------------SubQuery Example-2

Select [Customer Name],Sales from Superstore
where Sales >(Select AVG(Sales) as avg_Sales from Superstore)
select @@ROWCOUNT as TotalCount

---------------Extract server Name
Select  @@SERVERNAME

----------------------SubQuery Example-(3)
Create Table NewSuperStore
([Customer Name] varchar(max),
 Segment varchar(max),
 Region varchar(max),
 Sales float,
 Profit float)

 ----------------SubQuery Example--4

 Insert into NewSuperStore select [Customer Name],Segment,Region,Sales,Profit from Superstore

 Select * from NewSuperStore

Use [Ansari_Bhai_ With_SQL]

Select * from BrandTable

Create Table Shift_Details
(Shift_Type Varchar(max),
Shift_Name Varchar(max)
)

Select * from Shift_Details
select * from SHIFT_Data
select * from TableA

 ----------------SubQuery Example--5
 Update SHIFT_Data set Shift=Shift_Details.Shift_Type from Shift_Details where SHIFT_Data.Shift=Shift_Details.Shift_Name

  ----------------SubQuery Example--6
 Select * from (Select Segment,Region,Sales from NewSuperStore) as VirtualTB
 Pivot (sum(Sales) for Region in ([West],[Central],[East],[South])) as xyz

  Select* from (select Segment,Region,Profit from NewSuperStore) as vt
 Pivot (Sum(Profit) for Segment in ([Corporate],[Consumer],[Home Office])) as vby

   ----------------SubQuery Example--6
   Select * into Super_Store from Superstore

   Delete from Super_Store where [Customer Name] in (Select [Customer Name] from NewSuperStore)

     ----------------SubQuery Example--7
  CREATE TABLE Departments (
    DepartmentID INT PRIMARY KEY,
    DepartmentName VARCHAR(50)
)

INSERT INTO Departments (DepartmentID, DepartmentName) VALUES
(1, 'HR'),
(2, 'Sales'),
(3, 'IT'),
(4, 'Marketing')

CREATE TABLE Employees4 (
    EmployeeID INT PRIMARY KEY,
    EmployeeName VARCHAR(50),
    DepartmentID INT,
    Salary DECIMAL(10, 2),
    FOREIGN KEY (DepartmentID) REFERENCES Departments(DepartmentID)
)

INSERT INTO Employees4 (EmployeeID, EmployeeName, DepartmentID, Salary) VALUES
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

Select * from Employees4
Select * from Departments

Select EmployeeName,Salary,DepartmentName from Employees4 ,Departments where Employees4.EmployeeID=Departments.DepartmentID 



 
