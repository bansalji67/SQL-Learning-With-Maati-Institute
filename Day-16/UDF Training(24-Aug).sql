-----------------Normal UDF Example-------------
Create Function getTotal(@i as int,@j as int)
returns float
as
begin
declare @result as bigint
set @result=@i+@j
return @result
end

-----------------Execute Function------------
select dbo.getTotal(200,300) as Result
Create Table Example
(
Number1 int,
Number2 int
)

insert into Example Values(332,552)
insert into Example Values(123,453)
insert into Example Values(100,453)
insert into Example Values(200,399)
insert into Example Values(200,123)
insert into Example Values(542,123)

Select number1,number2,dbo.getTotal(number1,number2) as output from Example
------------------------------Extract Odd/Even No
Create Function GetResult(@i as bigint)
returns varchar(max)
as
begin
declare @result as varchar(max)
set @result=IIF(@i % 2=0,'Even','Odd')
return @result
end
----------------------Execute the Function----------
Select dbo.getResult(24) as Result
Select * from Marksheet

Alter Table Marksheet
Drop Column Result

------------------Example-----------------
Select Marks,dbo.getResult(marks) as Odd_Even from Marksheet

---------------------Extract Leap Year Example--------------
Alter Function GetResult(@i as bigint)
returns varchar(max)
as
begin
return IIF(@i % 2=0,'Even','Odd')
end
---------------------Extract Leap Year
Create Function getLeapYear(@i as date)
returns Varchar(max)
as
begin
return iif(Year(@i) % 4=0,'Leap Year','No Leap Year')
end
 
Select dbo.getLeapYear('2026-10-22')
--------------Extract FYQ
Create Function getFYQ(@dt as date)
returns varchar(20)
as
begin
return IIF(month(@dt)<=3,'Q4',IIF(Month(@dt)<=6,'Q1',IIF(Month(@dt)<=9,'Q2','Q3')))
end

---------------Execute Function-----------------
Select dbo.getFYQ(getdate())
Select * from Dataset
Select Agent,SalesDate,dbo.getFYQ(SalesDate) as Qtr from Dataset
------------------Inline table valued Function------------------
Alter Function get_Information(@accttype as varchar(24)) 
returns Table
as
return (Select * from Dataset where AcctType=@accttype)

CREATE FUNCTION getInformation1 (@accttype VARCHAR(50))
RETURNS TABLE
AS
RETURN
(
    SELECT *
    FROM Dataset
    WHERE AcctType = @accttype
);

------------Execute inlined Table Valued Function--------------
Select * from dbo.get_Information('IRA')

--------------------Table Valued Function-------------
Create Function Get_GroupbyReport(@accttype as varchar(max))
Returns Table
as
Return (Select isnull(Agent,'TOTAL') as Agent,Sum(Sales) as Sum,Max(Sales) as Max,Min(Sales) as Min,Avg(Sales) as Avg from Dataset
Group by Rollup(Agent))
Select * from Get_GroupbyReport('IRA')

Select * from SuperStore

Alter FUNCTION dbo.getOrdersByYear (@Year INT)
RETURNS @Result TABLE
(
    [Order ID] nvarchar(max),
    [Order Date] DATETIME,
    Sales DECIMAL(10,2)
)
AS
BEGIN
    INSERT INTO @Result
    SELECT [Order ID], [Order Date], Sales
    FROM SuperStore
    WHERE YEAR([Order Date]) = @Year;

    RETURN;
END;

Select * from dbo.getOrdersByYear(2016)


