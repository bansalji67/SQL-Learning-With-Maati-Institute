--------------Join with Pivot Table-------------
Select * from Customer
Select * from Sales
Select * from product
------------------Pivot Table Example
Select * from 
(Select Category,Qty,Area from Customer inner join Sales
on Customer.CustomerID=Sales.CustomerID
inner join product on product.ProductID=Sales.ProductID) as xyz
pivot(sum(Qty) for Area in ([East],[West],[South],[Middle])) as xyz
-------------------Join with Group

Select Category,Sum(Qty) as Sum,Max(Qty) as Max, min(Qty) as Min,count(qty) as Count from Customer inner join Sales
on Customer.CustomerID=Sales.CustomerID
inner join product on product.ProductID=Sales.ProductID
Group by Rollup(Category)
-------------Join with Having
Select Category,Sum(Qty) as Sum,Max(Qty) as Max, min(Qty) as Min,count(qty) as Count from Customer inner join Sales
on Customer.CustomerID=Sales.CustomerID
inner join product on product.ProductID=Sales.ProductID
Group by Rollup(Category)
having Sum(Qty)>50 and Max(Qty)>1 and Count(Qty)=11

Select Category,Price from product
where Price>50
--------------Join across Database
-----------Customer
-----------Sales
-----------Product
Use Apr2025
Select * into Customer1 from Join_Maharaj.dbo.Customer
go
Use May2025
Select * into Product1 from Join_Maharaj.dbo.product
go
Use Jun2025
Select * into Sales1 from Join_Maharaj.dbo.Sales
------------------Join across Database-----------------------
Select Area,Category,size,Qty from Apr2025.dbo.Customer1 
inner join Jun2025.dbo.sales1 on Apr2025.dbo.Customer1.CustomerID=Jun2025.dbo.Sales1.CustomerID 
inner join May2025.dbo.Product1 on May2025.dbo.Product1.ProductID=Jun2025.dbo.Sales1.ProductID
-----------------------------Interview Quesiton-1-------

















