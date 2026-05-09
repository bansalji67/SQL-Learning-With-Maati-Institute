use [Ansari_Bhai_ With_SQL]

------------Normal UDF
Create Function UDF1(@i as int,@j as int)
returns float
as
begin
Declare @result as bigint
set @result=@i+@j
return @result
end
----------Execute Function

Select dbo.UDF1(300,200) AS Result

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

Select * from Example2

Select Number1,Number2,dbo.UDF1(Number1,Number2) as output from Example2


 ----------------Extract Odd/Even No
Create Function Get_Result(@i as bigint)
Returns varchar(max)
as
begin
Declare @result as varchar(max)
set @result=IIF(@i % 2=0,'Even','Odd')
Return @result
end

Select dbo.GetResult(27) as Result

Select * from Marksheet
alter table Marksheet
drop column Result
-----------------Execute
Select Marks,dbo.Get_Result(Marks) as Odd_Even from Marksheet

-----------------Extract Leap Year
Create Function GetLeap_Year(@i as date)
Returns varchar(max)
as 
begin
Return iif(year(@i) % 4=0,'Leap Year','No Leap Year')
end

Select dbo.GetLeap_Year('2023-10-23')as Result

-------------Extract FYQ
Create Function Get_FYQ(@dt as date)
Returns varchar(max)
as
begin
Return iif(Month(@dt)<=3,'Q4',IIF(MONTH(@dt)<=6,'Q1',IIF(MONTH(@dt)<=9,'Q2','Q3')))
END

Exec dbo.Get_FYQ(getdate())

Select Agent,Amount,dbo.Get_FYQ(Date) as Qtr from Agent_Data


-------------Extract FYM

Create Function Get_FYM(@dt as date)
Returns varchar(max)
as
begin
Return iif(month(@dt)>=4,month(@dt)-3,Month(@dt)+9)
end

Select Agent,Amount,dbo.Get_FYM(Date) as FYMonth from Agent_Data

-------------Extract Age from DOB
Create Function Get_Age(@dt as date)
Returns int
as
begin
Return Datediff(YEAR,@dt,Getdate())
-Case
  when(Month(@dt)>Month(Getdate())
  or (Month(@dt)=Month(Getdate()) and day(@dt)>day(getdate())))
  then 1 
  else
  0
  end
   end

   Select dbo.Get_Age('1990-05-21') as Age

   Select Agent,Date,dbo.Get_Age(Date) as Age from Agent_Data

   Select * from Employees

   Select FirstName,HireDate,dbo.Get_Age(HireDate) as age from Employees

   Select * from Marksheet
   
   --------------------GetResult Fail/Pass/Second/First/excellent

   Create Function Get_Results(@i as int)
   Returns varchar(max)
   as
   begin
   return iif(@i<33,'Fail',iif(@i<=45,'Pass',iif(@i<=65,'2nd',iif(@i<=75,'1st','Excellent'))))
   end

   Select Marks,dbo.Get_Results(Marks) as Result_Status from Marksheet



