-----Simple SQL Query 
Select * from Orders
------------Conditional Query
select * from Orders where [Ship Mode]='First Class' and Region='test'
-----Show specific Fields 
Select Region,segment,Sales,Profit from Orders
-------Unique Records----------
select distinct Region from Orders

-----------------Question Paper (UGH)-----------------
select * from Orders where null=null
select * from Orders where ''<>''
-------------Execute multiple Tables
Select * From Table2
go
select * from WildCardTable
----------------------Order by Example----------
Select Segment,Sales from Orders
Order by Sales desc
------------Top 5 Sales Product Name
Select top 5 [Product Name],Sales from Orders
Order by Sales desc
------------Bottom 5 Sales Product Name
Select top 5 [Product Name],Sales from Orders
Order by Sales

------------Group by Example--------
Select Segment,round(sum(Sales) ,2) as Sales,
Round(sum(Profit),2) as Profit from Orders
group by Segment
------------Group by Example2
select Sum(Sales) as Sum,Max(Sales) as Max,Min(Sales) as Min,Avg(Sales) avg,Count(Sales) as Count from Orders
-----------Group by Example3
select [Sub-Category],Sum(Sales) as Sum,Max(Sales) as Max,Min(Sales) as Min,Avg(Sales) avg,Count(Sales) as Count from Orders
group by [Sub-Category]

















