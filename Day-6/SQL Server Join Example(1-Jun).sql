use Join_Maharaj
-------------Simple Join------------
Select ProductName,Amount,StockLocation from TableA inner join TableB
on TableA.ProductID=TableB.Product_ID

---------------Join with Whole field
Select * from TableA inner join TableB
on TableA.ProductID=TableB.Product_ID

--------Join with Virtual Table------
Select * from EmployeeDetails
Select * from ProjectDetail

Select * into NewTable2025 from
(Select FirstName+' '+LastName as FullName,ProjectName from 
EmployeeDetails as E inner join ProjectDetail as P
on e.EmployeeID=P.EmployeeDetailsId) as xyz
Select * from NewTable2025
-------------------Join with where Condition
Select FirstName+' '+LastName as FullName,ProjectName from 
EmployeeDetails as E inner join ProjectDetail as P
on e.EmployeeID=P.EmployeeDetailsId
where ProjectName not in ('HR Management')
----------------------Example-5
Select * from Customer
Select * from Sales
Select Area,Sum(Qty) as Sum from Customer inner join Sales on Customer.CustomerID=Sales.CustomerID 
Group by Area
---------------------Example-6
Select * from Customer
Select * from product
Select * from Sales

Select Area,Category,Size,Qty,Price from Customer inner join Sales 
on Customer.CustomerID=Sales.CustomerID 
inner join product 
on product.ProductID=sales.ProductID
------------------Example-5
Select * from T_A
Select * from T_B
Select * from T_C
Select * from T_D
Select * from T_E

Select T_A.EmpId,T_B.EmpName,T_A.MobileNo,Salary,Dept,Location from T_A inner join T_B
on T_A.MobileNo=T_B.MobileNo
inner join T_C on T_B.Empname=T_C.Empname
inner join T_D on T_A.EmpID=T_D.EmpID
Inner join T_E on Left(T_E.EmpDept,3)=T_D.EmpID

Select EmpDept,Left(EmpDept,3) as EmpID from T_E







