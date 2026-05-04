use [Ansari_Bhai_ With_SQL]

CREATE TABLE Emp2 (
    EmployeeID INT PRIMARY KEY,
    Name VARCHAR(50),
    Department VARCHAR(50),
    Salary INT,
    HireDate DATE
)

Drop Table Emp2
SELECT * FROM Emp2

INSERT INTO Emp2 (EmployeeID, Name, Department, Salary, HireDate)
VALUES
(1, 'Alice', 'Sales', 40000, '2020-01-15'),
(2, 'Bob', 'Sales', 55000, '2021-03-10'),
(3, 'Charlie', 'HR', 52000, '2019-05-20'),
(4, 'Diana', 'HR', 58000, '2020-07-01'),
(5, 'Eve', 'IT', 75000, '2018-10-30')

INSERT INTO Emp2 (EmployeeID, Name, Department, Salary, HireDate)
VALUES
(6, 'Alice', 'Sales', 45000, '2020-01-15'),
(7, 'Bob', 'Sales', 52000, '2021-03-10'),
(8, 'Charlie', 'HR', 55000, '2019-05-20')

Select * from Emp2

-------------------Row_Number--------------

Select Name,ROW_NUMBER() Over(Order by Name asc) AS helpcol from Emp2

---------------Rank-----------------
Select Name,Rank() Over(Order by Name asc) AS helpcol from Emp2

---------------Rank-------------------------------

Select Name,Dense_Rank() Over(Order by Name asc) AS helpcol from Emp2

-------------------Comparison------------------

Select Name,ROW_NUMBER() Over(Order by Name asc) AS Row_Number,
Rank() Over(Order by Name asc) AS Rank,
Dense_Rank() Over(Order by Name asc) AS Dense_Rank
from Emp2

-------------Extract Duplicate Record----------------

Select Name,ROW_NUMBER() over (Partition by Name Order by Name Asc) as helpcol from Emp2
where helpcol>1

-------------------Delete Duplicate Value
Select Name into Duplicate from Emp2

select * from Duplicate

With Remove_Dupl
as
(select Name, ROW_NUMBER() over(Partition by Name Order by Name ASC) AS HelpCol from Duplicate)
Delete from Remove_Dupl where HelpCol>1




