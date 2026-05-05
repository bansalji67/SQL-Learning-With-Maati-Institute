
Use SQL_Practice

Select * from Emp4
Select * from Sales
Select * from Performance



-----------1.	Find all employees who joined after 2020. Use a CTE to filter and return their names and departments.
with RecentJoin
as
(Select EmpName,Department,JoinDate from Emp4 where JoinDate>'2020-12-31')
Select * from RecentJoin

--Q.2 Calculate the average salary by department using a CTE.
 with AvgSal
 as
 (Select Department, Avg(Salary) AS Avg_Salary from Emp4
  Group by Department)
  Select * from AvgSal

  --Q.3--Using CTE, find employees who have more than 1 sale.

 WITH SalesCount
 as
(select EmpID,COUNT(*) as TotalSales FROM Sales
Group by EmpID)
Select e.EmpName,e.Department,s.TotalSales from SalesCount s
join Emp4 e on e.EmpID=s.EmpID
WHERE TotalSales>1

--Q.4 List top 5 employees with the highest total sales using a CTE.

with TotalSales_PerEmp
as
(Select EmpID,sum(SaleAmount) as TotalSales from Sales
Group by EmpID),
RankedEmployee 
as
(Select e.EmpName,e.Department,t.TotalSales,RANK() over (order by t.TotalSales desc) as SalesRank from TotalSales_PerEmp t
join Emp4 e on e.EmpID=t.EmpID)

Select  EmpName,Department,TotalSales from RankedEmployee
where SalesRank<=5

--Q.5 Identify employees whose performance score average is below 75 using a CTE.
  
  with Below75
  as
 (Select EmpID,Avg(Score) as Avg_Score from Performance
 Group by EmpID)
 select * from Below75 where Avg_Score<75
 
 --Q.6	Find employees with no sales using a CTE and LEFT JOIN.

 Select s.EmpID,s.SaleAmount from Sales s Left Join Emp4 e on s.EmpID=e.EmpID


