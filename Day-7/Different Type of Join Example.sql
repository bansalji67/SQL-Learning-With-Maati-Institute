USE [Ansari Bhai With SQL]

Select * from TableA
Select * from TableB

-------------Inner Join-------------

Select * from TableA inner join TableB on TableA.ProductID=TableB.ProductID

-------------Left Outer Join-------------

Select * from TableA Left Outer join TableB on TableA.ProductID=TableB.ProductID

-------------Right Outer Join-------------

Select * from TableA Right Outer join TableB on TableA.ProductID=TableB.ProductID

-------------Full Outer Join-------------

Select * from TableA Full Outer join TableB on TableA.ProductID=TableB.ProductID

-------------Cross Join-------------

Select * from TableA Cross join TableB 

-----------------Self Join------------------------------
Select * from Employees1

Select E2.EmpName as ename, E1.EmpName as Manager FROM Employees1 E1 inner join Employees1 E2
ON E1.EmpID=E2.Manager_ID

