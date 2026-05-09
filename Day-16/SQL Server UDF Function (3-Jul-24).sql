-------------UDF (user defined Function)---------------
create function UDF(@value1 as int,@value2 as int)
returns bigint
as
begin
return @value1+@value2
end
----------------Execute Function-----------
Select dbo.udf(300,300) as TotalSum
Create Table UDFTable
(
Value1 int,
Value2 int
)
insert into UDFTable values(231,322),(353,632),(253,214),(532,322),(363,235),(322,632)
Select value1,Value1,dbo.UDF(value1,value2) as TotalSum from UDFTable

--------------UDF Example-2--------------
Create Function FYQtr(@date as date)
returns varchar(max)
as
begin
return IIF(month(@date)<=3,'Q4',IIF(month(@date)<=6,'Q1',IIF(month(@date)<=9,'Q2','Q3')))
end

------------Execute UDF-----------------
Select [Order Date],[Region],Sales from SuperStore

Select [Order Date],[Region],dbo.FYQtr([Order Date]) as qtr,Sales from SuperStore
select * from SuperStore
----------------Extract Odd/Even No

Alter Function getODDEven(@num as int)
Returns varchar(max)
as
begin
return IIF(@num % 2=0,'Even','Odd')
end

Select Marks,dbo.getODDEven(Marks) as Remark from Marksheet
Alter Table Marksheet
Drop Column Remarks

------------------Extract Leap Year------------------
Create Function getLeapYear(@num as int)
Returns varchar(max)
as
begin
return IIF(year(@num) % 4=0,'Leap year','No Leap year')
end
-------------------Extract DOB--------------
Alter Function getDOB(@yr as int,@month as int,@day as int)
returns nvarchar(max)
as
begin
return DATEFROMPARTS(year(getdate())-@yr,month(getdate())-@month,day(getdate())-@day)
end

Create Table D_O_B
(
yr int,
mm int,
dd int
)
insert into D_O_B values(19,10,25)
insert into D_O_B values(14,11,5)
insert into D_O_B values(28,12,21)
insert into D_O_B values(43,05,12)
insert into D_O_B values(45,10,5)
insert into D_O_B values(29,08,12)
insert into D_O_B values(39,05,11)
Select * from D_O_B

Select yr,mm,dd from D_O_B
Select dbo.getdob(20,10,12) as DOB

------------------GetResult Fail/Pass/Second/First/excellent
Select * from Marksheet

Create Function GetResult (@marks as bigint)
returns Varchar(max)
as
begin
declare @txt as varchar(max)
if @marks<33
set @txt='Fail'
else if @marks<45
set @txt='Pass'
else if @marks<60
set @txt='Second'
else if @marks<75
set @txt='First'
else
set @txt='Excellent'
return @txt
end 
Select Marks,dbo.GetResult(Marks) as Result from Marksheet
------------------------Extract WeekNumber-----------
Alter Function WeekNum(@date as Date)
returns nvarchar(max)
as
begin
return 'Week-'+convert(varchar(max),Floor(day(@date)/7))
end

select [order Date],dbo.WeekNum([order Date]) as WeekNum,Sales from Superstore

SET @I=@I+1
END
CREATE FUNCTION is_prime(n BIGINT NOT NULL) returns BIGINT AS
  BEGIN
    IF n <= 1 THEN
      RETURN FALSE;
    END IF;
    FOR i IN 2 .. (n-1) LOOP
      EXIT WHEN i * i > n;
      IF n % i != 0 THEN
        CONTINUE;
      END IF;
      RETURN FALSE;
    END LOOP;
    RETURN TRUE;
  END

  -------------Extract GST Amount
Create Function Extract_GST
(@amount as bigint)
returns float
as
begin
return Round(@amount-(@amount/1.18),2)
end

