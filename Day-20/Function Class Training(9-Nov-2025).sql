-----------------------User defined Function----------------
----Example1
Create Function UDF_1(@value1 as int,@value2 as int)
returns bigint
begin
return @value1+@value2
end

------------Execute Function
select dbo.UDF_1(1000,2000) as Total
Create Table Example
(
value1 int,
value2 int
)
insert into Example Values(1234,4333),(100,200),(422,432),(243,632),(232,124)

Select Value1,Value2,dbo.UDF_1(value1,value2) as TotalSum from Example

---------------Extract Odd/Even No
Create Function getOddEven(@number as int)
returns varchar(max)
begin
return IIF(@number % 2 =0,'Even','Odd')
end

Create Table Dataset
(
value1 int
)
insert into dataset values(12),(24),(42),(17),(73),(89),(97),(73),(43)
Select Value1,dbo.getoddEven(Value1) as Remark from Dataset
----------------Extract Quarter Number
Select * from Notepad
Alter Function getQtr (@salesdate as date)
returns nvarchar(max)
begin
return iif(month(convert(date,@salesdate))<=3,'Qtr-1',iif(month(convert(date,@salesdate))<=6,'Qtr-2',iif(month(convert(date,@salesdate))<=9,'Qtr-3','Qtr-4')))
end

Select Date,dbo.getQtr(Date) as Qtr from Notepad
Select Convert(Date,SalesDate) as SalesDate into DateFormat from SalesData
Select SalesDate,dbo.getQtr(SalesDate) as Qtr from DateFormat
-------------------Table Valued Function
create function UDF_INFO(@product as varchar(max))
returns table
return (select * from Notepad where Product=@product)
---------------Extract Information
Select * from Notepad
select * from dbo.UDF_INFO('Laptop')
-------------Extract Report
Select Product,Count(*) as TotalCount from Notepad
Group by Product
Alter function UDF_REPORT(@country as varchar(max),@discountband as varchar(max))
returns table
return (select Segment,count(Sales) as TotalCount from Notepad where Country=@Country or DiscountBand=@discountband Group by Segment)

Select * from dbo.UDF_Report('USA','Low')
Select * from dbo.UDF_REPORT('USA','High')





















