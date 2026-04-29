
Use [Ansari Bhai With SQL]

Select * from TableA
Select * from TableB

----------Simple Join

select ProductName,Location,Amount from TableA Inner join TableB ON TableA.ProductID=TableB.ProductID

---------------Join with Whole field

Select * from TableA Inner Join TableB ON TableA.ProductID=TableB.ProductID

--------Join with Virtual Table------
Select * from EmployeeDetails
Select * from ProjectDetails

select * into NewTable2025 from
(Select Fname+' '+Lname as Full_Name,ProjectName from EmployeeDetails 
as e Inner Join ProjectDetails as p
on e.EmployeeDetails=p.EmployeeDetails) as xyz

Select * from NewTable2025

------------------Join with Where Condition

Select Fname+' '+Lname as Full_Name,ProjectName from EmployeeDetails 
as e Inner Join ProjectDetails as p
on e.EmployeeDetails=p.EmployeeDetails
Where ProjectName='HR Management'

--------------------Use of Not IN

Select Fname+' '+Lname as Full_Name,ProjectName from EmployeeDetails 
as e Inner Join ProjectDetails as p
on e.EmployeeDetails=p.EmployeeDetails
Where ProjectName NOT IN ('HR Management')

----------------------Example-5
Select * from Customer
Select * from Sales


Select Area,SUM(Qty) AS Sum from Customer inner join Sales on Customer.CustomerID=Sales.CustomerID
Group By Area

----------------------Example-6 join with THREE Tables

Select Area, Category,Size,Qty,Price  from Customer inner join Sales on Customer.CustomerID=Sales.CustomerID
Inner join Product
on product.ProductID=Sales.ProductID

SELECT 
    Customer.Area,
    Product.Category,
    Product.Size,
    COUNT(Sales.Qty) AS Count,
    SUM(Product.Price) AS Total
FROM 
    Customer
INNER JOIN Sales ON Customer.CustomerID = Sales.CustomerID
INNER JOIN Product ON Product.ProductID = Sales.ProductID
GROUP BY 
    Customer.Area,
    Product.Category,
    Product.Size;

	--------------------Inner join with 5 Table
	Select * from T_A
	Select * from T_B
	Select * from T_C
	Select * from T_D
	Select * from T_E

	select T_A.EmpID,T_B.Empname,T_A.MobileNo,T_C.Salary,T_D.Dept,T_E.Location from T_A Inner join T_B on T_A.MobileNo=T_B.MobileNo
	Inner join T_C on T_B.Empname=T_C.Empname
	Inner join T_D on T_A.EmpID=T_D.EmpID
	Inner join T_E on T_A.EmpID=T_E.EmpID



