
Use [Ansari Bhai With SQL]

Select * from Customer
Select * from Sales
Select * from product

------------------Pivot Table Example
Select * from
(Select Category,Area,Qty from Customer 
Inner join Sales on Customer.CustomerID=Sales.CustomerID
Inner join Product on Sales.ProductID=Product.ProductID) as xyz
Pivot (sum(Qty) for area in ([East],[West],[South],[Middle])) as xyz

Select * from
(Select Category,Area,TotalSales from Customer 
Inner join Sales on Customer.CustomerID=Sales.CustomerID
Inner join Product on Sales.ProductID=Product.ProductID) as xyz
Pivot (sum(TotalSales) for area in ([East],[West],[South],[Middle])) as xyz

-------------------Join with Group
Select Category,Sum(TotalSales) as sum,Max(TotalSales) as max,Min(TotalSales) as min from Customer 
Inner join Sales on Customer.CustomerID=Sales.CustomerID
Inner join Product on Sales.ProductID=Product.ProductID
Group by Category

Select Category,Sum(Qty) as sum,count(Qty) as count,Max(Qty) as max,Min(Qty) as min from Customer 
Inner join Sales on Customer.CustomerID=Sales.CustomerID
Inner join Product on Sales.ProductID=Product.ProductID
Group by Category

-------------Join with Having
Select Category,Sum(Qty) as sum,count(Qty) as count,Max(Qty) as max,Min(Qty) as min from Customer 
Inner join Sales on Customer.CustomerID=Sales.CustomerID
Inner join Product on Sales.ProductID=Product.ProductID
Group by Category
Having sum(Qty)>=50 and max(Qty)>9


--------------Join across Database

Use Join_Across_Database1
Select * into Customer1 from [Ansari Bhai With SQL].dbo.Customer
go
Use Join_Across_Database2
Select * into Product1 from [Ansari Bhai With SQL].dbo.Product
Use Join_Across_Database3
go
Select * into Sales1 from [Ansari Bhai With SQL].dbo.Sales

---------------Run Join Across Query

Select Category,Area,Size,Price from Join_Across_Database1.dbo.Customer1
inner join Join_Across_Database3.dbo.Sales1 on Join_Across_Database1.dbo.Customer1.CustomerID=Join_Across_Database3.dbo.Sales1.CustomerID
inner join Join_Across_Database2.dbo.Product1 on Join_Across_Database2.dbo.Product1.ProductID=Join_Across_Database3.dbo.Sales1.ProductID



