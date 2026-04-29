
Use [Ansari Bhai With SQL]

-----Simple SQL Query 

Select * from Orders

------------Conditional Query

Select * from Orders where [Ship Mode]='First Class' and Region='West'

-----Show specific Fields 

Select [Ship Mode],[Customer ID],Segment,City from Orders

-------Unique Records----------

Select Distinct(Region) from Orders

-----------------Question Paper (UGH)-----------------

select * from Orders where null=null
select * from Orders where ''<>''

-------------Execute multiple Tables

select * from Orders
go 
select * from People

----------------------Order by Example----------

Select Segment,Sales from Orders
order by Sales desc

------------Top 5 Sales Product Name

select  top 5 [Product Name],Sales from Orders
Order by Sales Desc

------------Bottom 5 Sales Product Name


select  top 5 [Product Name],Sales from Orders
Order by Sales asc

------------Group by Example--------

select Segment,Round(sum(Sales),2) as Total_Sales, 
Round(Sum(Profit),2) as Total_Profit
from Orders
Group by Segment

------------Group by Example2

Select sum(Sales) as Sales,Max(Sales) as Max,Min(Sales) as Min, Avg(Sales) as Avg_Sales,Count(Sales) as Count from Orders

------------Group by Example3

Select [Sub-Category],  sum(Sales) as Sales,Max(Sales) as Max,Min(Sales) as Min, Avg(Sales) as Avg_Sales,Count(Sales) as Count from Orders
Group by [Sub-Category] 