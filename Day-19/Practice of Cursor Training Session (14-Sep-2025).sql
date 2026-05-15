use [Ansari_Bhai_ With_SQL]

Create Table Emp_Details2
(
EmpID int,
EmpName varchar(30),
Salary bigint,
MobileNo varchar(20)
)

insert into Emp_Details2 values (111,'Rajiv',43112,9911176564)
insert into Emp_Details2 values (222,'Sanjiv',23221,98181064061)
insert into Emp_Details2 values (333,'Deepak',53221,9818055412)
insert into Emp_Details2 values (444,'Manjeet',64223,971234421)
insert into Emp_Details2 values (555,'Radhey',12345,9911176555)

Select * from Emp_Details2

---------------------Static Cursor Example---------------
Declare @EmpID Int
Declare @EmpName varchar(max)
Declare @Salary Bigint
Declare @MobileNo Bigint

-----------Declaring Cursor
Declare cur_statics Cursor static for 
Select EmpID,EmpName,Salary,MobileNo from Emp_Details2
----------Opening Cursor
Open cur_statics
-----------Fetching information
fetch next from  cur_statics into @empid,@empname,@Salary,@MobileNo
while @@FETCH_STATUS=0
begin
Print 'EmpID :'+convert(varchar(max),@EmpID)+' EmpName: '+@EmpName+' Salary:'+Convert(varchar(max),@Salary)+' MobileNo:'+Convert(varchar(max),@MobileNo)
fetch next from  cur_statics into @empid,@empname,@Salary,@MobileNo
end
------------Close Cursor
Close cur_statics
---------Deallocate Cursor
Deallocate cur_statics

--------------------Create a table for Static Cursor
Create Table Marksheet1
(
Marks int
)
insert into Marksheet1 Values(12),(24),(87),(76),(79),(65),(54),(34),(35),(43),(53),(98),(76),(32),(43),(14)
Select * from Marksheet1

-------------------Static Cursor Exmaple--------------
Declare @marks int
Declare Cursorstatic cursor static for
select Marks from Marksheet1
-------------Open Cursor
open Cursorstatic
-----------------Fetching Information
Fetch next from Cursorstatic into @marks
while @@FETCH_STATUS=0
begin
if @marks<33

Print convert(varchar(max),@marks)+' Fail'
else 
Print convert(varchar(max),@marks)+' Pass'
Fetch next from Cursorstatic into @marks
end 
---------Close Cursor
Close Cursorstatic
---------Deallocate Cursor
Deallocate Cursorstatic
--------------------------Create Table

Create Table NewTable1
(
Empname varchar(20),
Gender varchar(20)
)
insert into NewTable1 Values('Rajiv Singh','Male')
insert into NewTable1 Values('Gunjan SIngh','Female')
insert into NewTable1 Values('Anju Sinha','Female')
insert into NewTable1 Values('Sanjeev Garg','Male')
insert into NewTable1 Values('Pankaj Tripathi','Male')
insert into NewTable1 Values('Radha','Female')
insert into NewTable1 Values('Rajiv Singh','Male')
insert into NewTable1 Values('Gunjan SIngh','Female')
insert into NewTable1 Values('Anju Sinha','Female')
insert into NewTable1 Values('Sanjeev Garg','Male')
insert into NewTable1 Values('Pankaj Tripathi','Male')
insert into NewTable1 Values('Radha','Female')
insert into NewTable1 Values('Rajiv Singh','Male')
insert into NewTable1 Values('Gunjan SIngh','Female')
insert into NewTable1 Values('Anju Sinha','Female')
insert into NewTable1 Values('Sanjeev Garg','Male')
insert into NewTable1 Values('Pankaj Tripathi','Male')
insert into NewTable1 Values('Radha','Female')
insert into NewTable1 Values('Rajiv Singh','Male')
insert into NewTable1 Values('Gunjan SIngh','Female')
insert into NewTable1 Values('Anju Sinha','Female')
insert into NewTable1 Values('Sanjeev Garg','Male')
insert into NewTable1 Values('Pankaj Tripathi','Male')
insert into NewTable1 Values('Radha','Female')

Select * from NewTable1

----------------Dynamic Cursor----------------
DECLARE @EmpName VARCHAR(MAX);
DECLARE @gender VARCHAR(MAX);

DECLARE d_cursor CURSOR DYNAMIC FOR
    SELECT EmpName, Gender FROM NewTable1;

OPEN d_cursor;

FETCH NEXT FROM d_cursor INTO @EmpName, @gender;

WHILE @@FETCH_STATUS = 0
BEGIN
    IF @gender = 'Female'
        UPDATE NewTable1
        SET EmpName = 'Ms.' + @EmpName
        WHERE Gender = 'Female' AND EmpName = @EmpName;

    ELSE IF @gender = 'Male'
        UPDATE NewTable1
        SET EmpName = 'Mr.' + @EmpName
        WHERE Gender = 'Male' AND EmpName = @EmpName;

    FETCH NEXT FROM d_cursor INTO @EmpName, @gender;
END;

CLOSE d_cursor;
DEALLOCATE d_cursor;


Select * from NewTable1
Drop Table NewTable1


-------------how can Update the record-------------
Update NewTable1 set Empname=LTRIM(right(Empname,LEN(EmpName)-6))
select LTRIM(RIGHT('Mr.Mr.Mr.Rajiv Singh',LEN('Mr.Mr.Mr.Rajiv Singh')-6))

Mr.Mr.Mr.Rajiv Singh