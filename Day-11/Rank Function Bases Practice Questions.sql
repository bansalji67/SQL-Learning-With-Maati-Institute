


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

-------------------------------Rank Based Questions----------------------------------

-----------------Show the RANK() of employees based on SalesAmount (highest first).

Select EmpName,SalesAmount,Rank() over (order by SalesAmount Desc) as Rank from Sales4

Select EmpName,Region,SalesAmount,Dense_Rank() over (Partition by Region order by SalesAmount Desc) as Rank from Sales4

------------------Show the rank of employees in each region using PARTITION BY Region and ORDER BY SalesAmount DESC.

Select EmpName,Region,SalesAmount,Rank() over (Partition by Region Order by SalesAmount) as Ranking from Sales4

--------------------What is the difference between ROW_NUMBER() and RANK() when two employees have the same sales? Show with output.

Select EmpName,Region,SalesAmount,ROW_NUMBER() over(Partition by SalesAmount Order by SalesAmount) as ROW_NUMBER,
RANK() OVER (PARTITION BY SalesAmount Order by SalesAmount Desc) as Rank from Sales4

------------------Write a query to find 2nd highest sales in each region using RANK().
with Rank_Sales
as
(Select EmpID,EmpName,Region,SalesAmount,Dense_RANK() over (Partition by Region Order by SalesAmount Desc) as SalesRank from Sales4)
 Select * from Rank_Sales where SalesRank=2

 -------------------Find employees who share the same rank using RANK() (i.e., tied sales amount).
 with SameRanking
 as
 (Select EmpName,Region,SalesAmount,RANK() over (Partition by Region order by SalesAmount desc) as Ranking from Sales4)
  select * from SameRanking where Ranking=1