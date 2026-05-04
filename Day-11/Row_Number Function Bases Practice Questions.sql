

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

---------------------Row_Number Based Questions--------------------------------------------


-------------Write a query to assign a row number to each employee based on highest to lowest SalesAmount.

Select EmpName,SalesAmount,ROW_NUMBER() over (Order by SalesAmount desc) as Row_Number from Sales4

----------------Using ROW_NUMBER(), find the top 2 sales employees in the entire table.

with Rank_Sales
as 
(Select EmpName,SalesAmount,ROW_NUMBER() over (Order by SalesAmount desc) as Row_Number from Sales4)
 select * from Rank_Sales where ROW_NUMBER<=2

 ------------------Use ROW_NUMBER() to find the top 1 sales employee in each region

  with Top1
 as
 (Select EmpName,Region,SalesAmount, ROW_NUMBER() over(Partition by Region Order by SalesAmount desc) as Check_Rank from Sales4)
  Select * from Top1 where Check_Rank=1
  Order by SalesAmount desc

  ---------------Identify duplicate SalesAmount entries using ROW_NUMBER() and filter out the first occurrence.
  with Check_Duplicate
  as
  (Select EmpName,SalesAmount,Row_Number() over (Partition by SalesAmount Order by SalesAmount desc) as Row_Number from Sales4)
   Select * from Check_Duplicate where Row_Number=2

   ------------------------------Write a query to get every employee except the one with the lowest sale in each region

   with Low_Sales
  as
  (Select EmpName,Region,SalesAmount,Row_Number() over (Partition by Region Order by SalesAmount desc) as Row_Number from Sales4)
   Select * from Low_Sales where Row_Number>1








