Use SQL_Practice

CREATE TABLE SalesData (
    SaleID INT PRIMARY KEY,
    SalesPerson VARCHAR(50),
    Region VARCHAR(20),
    SaleAmount DECIMAL(10,2),
    SaleDate DATE
);

INSERT INTO SalesData (SaleID, SalesPerson, Region, SaleAmount, SaleDate)
VALUES
(1, 'Sumit', 'North', 5000, '2025-01-01'),
(2, 'Anita', 'East', 3000, '2025-01-03'),
(3, 'Ravi', 'North', 2500, '2025-01-05'),
(4, 'Pooja', 'West', 4500, '2025-01-07'),
(5, 'Raj', 'East', 4000, '2025-01-10'),
(6, 'Sumit', 'North', 5200, '2025-01-11'),
(7, 'Anita', 'East', 3100, '2025-01-12'),
(8, 'Ravi', 'North', 2700, '2025-01-13'),
(9, 'Pooja', 'West', 4800, '2025-01-14'),
(10, 'Raj', 'East', 4200, '2025-01-15'),
(11, 'Sumit', 'North', 5300, '2025-01-16'),
(12, 'Anita', 'East', 3300, '2025-01-17'),
(13, 'Ravi', 'North', 2900, '2025-01-18'),
(14, 'Pooja', 'West', 4900, '2025-01-19'),
(15, 'Raj', 'East', 4300, '2025-01-20'),
(16, 'Sumit', 'North', 5400, '2025-01-21'),
(17, 'Anita', 'East', 3500, '2025-01-22'),
(18, 'Ravi', 'North', 3100, '2025-01-23'),
(19, 'Pooja', 'West', 5000, '2025-01-24'),
(20, 'Raj', 'East', 4400, '2025-01-25');

Select * from SalesData

---------Total Sales by a Specific Person
-------------find out total sales of Sumit

Declare @SalesPerson Varchar(50)='Sumit'

Select sum(SaleAmount) as TotalSales from SalesData where SalesPerson=@SalesPerson

----------Count of Sales in a Region
------------find out the count of Region--'East'

Declare @Region Varchar(50)='East'

Select Count(*) as RegionCount from SalesData where Region=@Region

-------------Loop Over Sale IDs (Print Only)
Declare @SalesID Int=1

while @SalesID<=5
begin
--Select SalesPerson,Region,SaleAmount from SalesData where SaleID<@SalesID
Print 'Processing SalesID' +' '+ Cast(@SalesID AS VARCHAR)
SET @SalesID=@SalesID+1
END

-----------Sales Greater Than a Given Amount
Declare @SalesAmount int=4500

select * from SalesData where SaleAmount<@SalesAmount

-----------Total Sales for a Custom Date Range

Declare @StartDate Date='2025-01-10';
Declare @EndDate  Date='2025-01-20';

Select sum(SaleAmount) as TotalSales from SalesData where SaleDate between @StartDate and @EndDate

--------------Dynamic Region and Threshold
-----Find out sales of North Region where SalesAmount Greather then 5000
Declare @Regions Varchar(20)='North'

Declare @Threshold Decimal(10,2)=5000

Select * from SalesData where Region=@Regions and SaleAmount>@Threshold

------------Top N Sales
----Find out top 4 sales using variable

Declare @Topn Int=4

Select Top(@Topn) * from SalesData Order by SaleAmount Desc

--------------Insert into Another Table Based on Variable

----------insert only which data where SalesAmount Greater then 5000

CREATE TABLE HighSales (
    SaleID INT,
    SalesPerson VARCHAR(50),
    SaleAmount DECIMAL(10,2)
);

Select * from HighSales
Delete HighSales

Declare @TargetAmount Decimal(10,2)=5000

Insert into HighSales Select SaleID,SalesPerson,SaleAmount from SalesData where SaleAmount>=@TargetAmount

-----------------Use Variable Inside a CASE Statement
---Add Status column where SalesAmount Greater then 4500 should be Eligible else Not Eligible
Declare @BonusThreshold Decimal(10,2)=4500

Select SalesPerson,SaleAmount,
     Case when SaleAmount>=@BonusThreshold then 'Eligible' 
	 else
	 'Not Eligible' 
	 end as Status
	 from SalesData

-------------------Loop to Sum Sale Amounts One-by-One

Declare @Total DECIMAL(10,2)=0
Declare @SalesAmount Decimal(10,2)
Declare @CurrentID INT=1

While @CurrentID<=5
begin
Select SaleID,SalesPerson,Region from SalesData where SaleID=@CurrentID
Set @Total=@Total +ISNULL(@SalesAmount,0)
Set @CurrentID=@CurrentID+1
end
Print 'Total of First 5 Sales' + Cast(@Total as varchar)

Alter Table SalesData
add Remarks varchar(max)

-----------Get Sales above a threshold
--Find out the all sales Amount which is greater then 4500

Declare @SalesThreshold decimal(10,2) ---Declare Variable

Set @SalesThreshold=4500              --Intialize Variable

Select * from SalesData where SaleAmount<@SalesThreshold

----------Count of Sales after a certain date

Declare @stdate date
set @stdate='2025-01-15'

select count(*) AS Number_of_Sales_Count from SalesData where SaleDate>=@stdate

-----------Total sales by a region

Declare @TargetReg varchar(20)
set @TargetReg='West'

Select sum(SaleAmount) as Total_Sales
from SalesData where Region=@TargetReg

-------------Use CASE with variable to assign grade
 
 --Add a Columne as PerformanceGrade where you need to fill this according to below criteria
 ---SaleAmount is less then 3000 then result should be-- 'Need Imporovement'
 ------SalesAmount is greater then 3000 then result should be---- 'Average'
 --------------and sales is greater then 4700 then result should be-- 'Top Performer'

 Declare @Score decimal(10,2)
 set @Score=4700

 Select SaleID,SalesPerson,SaleAmount,
 Case
   When SaleAmount>=@Score then 'Top Performer'
   When SaleAmount>=3000 then 'Average'
   else
   'Need Improvement'
   end as Performance_Grade
   from SalesData