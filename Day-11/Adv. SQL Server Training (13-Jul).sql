CREATE TABLE Employees (
    EmployeeID INT PRIMARY KEY,
    Name VARCHAR(50),
    Department VARCHAR(50),
    Salary INT,
    HireDate DATE
)
Select * from Employees

INSERT INTO Employees (EmployeeID, Name, Department, Salary, HireDate)
VALUES
(6, 'Alice', 'Sales', 40000, '2020-01-15'),
(7, 'Bob', 'Sales', 56000, '2021-03-10'),
(8, 'Charlie', 'HR', 62000, '2019-05-20')
(4, 'Diana', 'HR', 58000, '2020-07-01'),
(5, 'Eve', 'IT', 75000, '2018-10-30')

-------------------Row_Number-----------
Select Name,Row_number() Over (Order by name asc) as helpCol from Employees
-------------------Rank-----------
Select Name,Rank() Over (Order by name asc) as helpCol from Employees
-------------------Dense Rank-----------
Select Name,Dense_Rank() Over (Order by name asc) as helpCol from Employees

Select Name,Row_number() Over (Order by name asc) as helpCol from Employees
-------------------Rank-----------
Select Name,Rank() Over (Order by name asc) as helpCol from Employees
-------------------Dense Rank-----------

Select Name,Row_Number() Over (Order by name asc) as Row_Number,
Rank() Over (Order by name asc) as Rank,
Dense_Rank() Over (Order by name asc) as Dense_Rank from Employees
--------------------Extract Duplicate Value----------
Select Name,ROW_NUMBER() over (Partition by Name Order by Name asc) as HelpCol from Employees
------------------------Delete Duplicate Vaulue-----
Select Name into duplicate from Employees
Select * from duplicate
Drop Table Duplicate

with Noorain
as
(select Name,ROW_NUMBER() over (Partition by Name order by Name asc) as HelpCol
From duplicate)
Delete from Noorain where HelpCol>1
-------------Delete duplicate Value without using CTE
Select * into DuplicateTable from 
(Select name,ROW_NUMBER() over (partition by Name Order by Name) as HelpCol from duplicate) as xyz
delete from DuplicateTable
where HelpCol>1
Select * from DuplicateTable
---------------







Select Name,Row_Number() Over (partition by Name Order by name asc) as Row_Number,
Rank() Over (partition by name Order by name asc) as Rank,
Dense_Rank() Over (Partition by Name Order by name asc) as Dense_Rank from Employees
-----------------------Example-1
Insert into Employees(EmployeeID,Salary) Values(10,75000),(11,75000)
Select top 2 Salary from Employees
order by Salary desc
Select Salary,ROW_NUMBER() over (Order by Salary Desc) as helpCol from Employees

with nthSalary
as
(Select Salary,dense_Rank() over (Order by Salary Desc) as helpCol from Employees)
Select distinct salary from NthSalary where HelpCol<=5
order by salary desc

---------------------LEAD Example in SQL--------
CREATE TABLE Sales (
    SalesID INT,
    SalesPerson VARCHAR(50),
    SaleAmount INT,
    SaleDate DATE
);

INSERT INTO Sales VALUES
(1, 'Alice', 500, '2024-01-01'),
(2, 'Alice', 700, '2024-02-01'),
(3, 'Alice', 650, '2024-03-01'),
(4, 'Bob',   800, '2024-01-15'),
(5, 'Bob',   900, '2024-02-15'),
(6, 'Bob',   870, '2024-03-15');
Select * from Sales
Select SalesPerson,SaleDate,SaleAmount,Lead(SaleAmount,1) over 
(partition by Salesperson Order by SaleDate desc) as helpcol from Sales

Select SalesPerson,SaleDate,SaleAmount,Lag(SaleAmount,1) over 
(partition by Salesperson Order by SaleDate desc) as helpcol from Sales

CREATE TABLE Employee1 (
    EmployeeID INT,
    Name VARCHAR(50),
    Department VARCHAR(50),
    Salary INT
);

INSERT INTO Employee1 VALUES
(1, 'Alice', 'Sales', 60000),
(2, 'Bob', 'Sales', 55000),
(3, 'Charlie', 'HR', 52000),
(4, 'Diana', 'HR', 58000),
(5, 'Eve', 'IT', 75000),
(6, 'Frank', 'IT', 72000),
(7, 'Grace', 'Sales', 50000),
(8, 'Hank', 'HR', 51000);

------------------NTILE FUNCTION Example-------------
Select Name,Department,Salary,NTILE(3) over (Order by Salary Desc) from Employee1

CREATE TABLE Sales (
    SaleID INT,
    SalesPerson VARCHAR(50),
    Region VARCHAR(50),
    SaleAmount INT,
    SaleDate DATE
);
Drop Table Sales

INSERT INTO Sales VALUES
(1, 'Alice', 'East', 1000, '2024-01-01'),
(2, 'Alice', 'East', 1200, '2024-02-01'),
(3, 'Bob',   'West', 800,  '2024-01-15'),
(4, 'Bob',   'West', 1300, '2024-02-15'),
(5, 'Carol', 'East', 1500, '2024-01-10'),
(6, 'Carol', 'East', 1600, '2024-03-01'),
(7, 'Dan',   'West', 900,  '2024-03-10');




SELECT
    SalesPerson,
    Region,
    SaleDate,
    SaleAmount,

    ROW_NUMBER() OVER (PARTITION BY SalesPerson ORDER BY SaleDate) AS RowNum,
    RANK() OVER (PARTITION BY Region ORDER BY SaleAmount DESC) AS RegionalRank,
    DENSE_RANK() OVER (ORDER BY SaleAmount DESC) AS GlobalDenseRank,
    LAG(SaleAmount, 1) OVER (PARTITION BY SalesPerson ORDER BY SaleDate) AS PrevSale,
    LEAD(SaleAmount, 1) OVER (PARTITION BY SalesPerson ORDER BY SaleDate) AS NextSale,
    NTILE(4) OVER (ORDER BY SaleAmount DESC) AS SaleQuartile,
    SUM(SaleAmount) OVER (PARTITION BY SalesPerson ORDER BY SaleDate 
                          ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW) AS RunningTotal
FROM Sales;








--------------Sum,Max,Min,Avg example
Select SalesPerson,SaleDate,SaleAmount,
SUM(SaleAmount) OVER (PARTITION BY SalesPerson ORDER BY SaleDate 
                          ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW) AS RunningTotal
FROM Sales;

Select SalesPerson,SaleDate,SaleAmount,
Max(SaleAmount) OVER (PARTITION BY SalesPerson ORDER BY SaleDate
                          ROWS BETWEEN Current Row AND Unbounded Following) AS RunningTotal
FROM Sales;

Select SalesPerson,SaleDate,SaleAmount,
Max(SaleAmount) OVER (PARTITION BY SalesPerson ORDER BY SaleDate
                          ROWS BETWEEN Current Row AND Unbounded Following) AS MaxRunning,
Min(SaleAmount) OVER (PARTITION BY SalesPerson ORDER BY SaleDate
                          ROWS BETWEEN Unbounded PReceding AND Current Row) AS MinRunning
FROM Sales;








