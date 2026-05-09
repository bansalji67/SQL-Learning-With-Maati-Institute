use SQL_Practice

Create Function UDF1(@i as int,@j as int)
Returns float
as
begin
Declare @result as bigint
set @result=@i+@j
return @result
end

Select dbo.UDF1(250,450) AS TOTAL

Create Table Example2
(Number1 int,
 Number2 int
 )

  
insert into Example2 Values(332,552)
insert into Example2 Values(123,453)
insert into Example2 Values(100,453)
insert into Example2 Values(200,399)
insert into Example2 Values(200,123)
insert into Example2 Values(542,123)

 Select Number1,Number2, dbo.UDF1(Number1,Number2) as output from Example2

 -----------------------Extract ODD EVEN-----------------
 Create Function GetResult(@i as int)
 Returns varchar(max)
 as
 begin
 Declare @result as varchar(max)
 set @result =iif(@i % 2=0,'ODD','Even')
 Return @result
 end

 Select dbo.GetResult(28) as Result

 Select Number,dbo.GetResult(Number)as Result from Check_Number

 -----------------------Get Leap Year
 Create Function Get_Leap_Year(@i as int)
 Returns varchar(max)
 as
 begin
 return iif(@i % 4=0,'Leap Year','No Leap Year')
 end

 Select Year,dbo.Get_Leap_Year(Year) as Output from Leap_Year_DT

 ----------Extract Age
 Create Function Get_Age(@dt as date)
 Returns int
 as
 begin
 return datediff(YEAR,@dt,getdate())
   -case 
     when(month(@dt)>Month(getdate())
	 or (month(@dt)=month(Getdate()) and day(@dt)>day(getdate())))
	 then 1
	 else
	 0
	 end
	 end

	 Select DOB,dbo.Get_Age(DOB) as Age from DOB