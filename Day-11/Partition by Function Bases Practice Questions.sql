
CREATE TABLE Sales4 (
  EmpID INT,
  EmpName VARCHAR(50),
  Region VARCHAR(50),
  SalesAmount INT
);

INSERT INTO Sales4 VALUES
(1, 'Amit', 'North', 1000),
(2, 'Suman', 'North', 3000),
(3, 'Raj', 'South', 2000),
(4, 'Anil', 'North', 3000),
(5, 'Pooja', 'South', 1500),
(6, 'Neha', 'East', 4000),
(7, 'Rahul', 'East', 4000),
(8, 'Karan', 'South', 3000),
(9, 'Nisha', 'North', 2000),
(10, 'Tina', 'East', 1000);

Select * from Sales4

------------------------Partition by Based Questions-------------------------------

-------------------Write a query to calculate ROW_NUMBER() for each employee within their Region.
---------------------Use PARTITION BY to calculate the total sales for each region and show it alongside individual employee records.
-------------------Write a query to get the highest selling employee per region using ROW_NUMBER() and PARTITION BY.
--------------------Show how you can use RANK() and PARTITION BY to detect top 3 performers in each region.
-------------------Create a query that lists each employee, their region, and their sales rank only within their region, with ties considered.