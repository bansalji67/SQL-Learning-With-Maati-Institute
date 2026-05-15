Create Table Employee
(
EmpID int,
EmpName varchar(30),
Salary bigint,
MobileNo varchar(20)
)

insert into Employee values (111,'Rajiv',43112,9911176564)
insert into Employee values (222,'Sanjiv',23221,98181064061)
insert into Employee values (333,'Deepak',53221,9818055412)
insert into Employee values (444,'Manjeet',64223,971234421)
insert into Employee values (555,'Radhey',12345,9911176555)

Select * from Employee
---------------------Static Cursor Example---------------
Declare @EmpID int
Declare @EmpName Varchar(max)
Declare @Salary bigint
Declare @MobileNo bigint

-----------Declaring Cursor
Declare cur_static cursor static for
Select EmpID,EmpName,Salary,MobileNo from Employee
----------Opening Cursor
open cur_static 
-----------Fetching information
fetch next from cur_static into @empid,@empName,@Salary,@MobileNo
while @@FETCH_STATUS=0
begin
print 'EmpID : '+Convert(varchar(max),@EmpID)+' EmpName: '+@EmpName+' Salary: '+Convert(varchar(max),@Salary)+' MobileNo: '+Convert(varchar(max),@MobileNo)
fetch next from cur_static into @empid,@empName,@Salary,@MobileNo
end
------------Close Cursor
Close cur_static
---------Deallocate Cursor
Deallocate cur_static

------------------Create a table for Static Cursor
Create Table Marksheet
(
Marks int
)

insert into Marksheet Values(12),(24),(87),(76),(79),(65),(54),(34),(35),(43),(53),(98),(76),(32),(43),(14)
Select * from Marksheet
-------------------Static Cursor Exmaple--------------
----------declare Static Cursor
Declare @marks int
declare curStatic cursor static for
select marks from Marksheet
---------Open Cursor

open curStatic
------------Fetching Information
fetch next from curStatic into @marks
while @@FETCH_STATUS=0
begin
if @marks<33
begin
print convert(varchar(max),@marks)+' Fail'
fetch next from curStatic into @marks
end
else if @marks>=33
begin
print convert(varchar(max),@marks)+' Pass'
fetch next from curStatic into @marks
end
end
---------Close Cursor
Close CurStatic
--------Deallocate Cursor
deallocate CurStatic

---------------Dynamic Cursor Example
CREATE TABLE Employee1
(
    EmpID INT PRIMARY KEY,
    EmpName VARCHAR(100),
    Salary DECIMAL(10,2)
)
INSERT INTO Employee1 (EmpID, EmpName, Salary)
VALUES
(1, 'John', 50000),
(2, 'Alice', 60000),
(3, 'Bob', 55000);

Select * from Employee1



DECLARE @EmpID INT
Declare @EmpName VARCHAR(100)
Declare @Salary DECIMAL(10,2)
DECLARE Dynamic_Cursor CURSOR Static FOR
SELECT EmpID, EmpName, Salary FROM Employee1

OPEN Dynamic_Cursor

-- Fetch first row
FETCH NEXT FROM Dynamic_Cursor INTO @EmpID, @EmpName, @Salary

WHILE @@FETCH_STATUS = 0
BEGIN
    PRINT 'Employee: ' + CAST(@EmpID AS VARCHAR) 
          + ' - ' + @EmpName 
          + ' earns ' + CAST(@Salary AS VARCHAR);

    -- Fetch next row
    FETCH NEXT FROM Dynamic_Cursor INTO @EmpID, @EmpName, @Salary;
END

CLOSE Dynamic_Cursor
DEALLOCATE Dynamic_Cursor

Select * from Employee1



--------------Cursor Example-2-----------
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

declare @empName varchar(max)
declare @gender varchar(max)
declare cur_static cursor static for
select EmpName,Gender from NewTable1
open cur_static
fetch next from cur_static into @empName,@gender
while @@FETCH_STATUS=0
begin
if @gender='Male'
begin
print 'EmpName : '+'Mr. '+@empname+ ' Gender : '+@gender
fetch next from cur_static into @empName,@gender
end
else
begin
print 'EmpName : '+'Ms. '+@empname+ 'Gender : '+@gender
fetch next from cur_static into @empName,@gender
end
end
close cur_static
deallocate cur_static
-------------------Dynamic Cursor Exmaple-----------
Declare @empname as varchar(max)
declare @gender as varchar(max)
declare d_cursor cursor dynamic for 
Select Empname,Gender from NewTable1
Open d_cursor
fetch next from d_cursor into @empname,@gender
while @@FETCH_STATUS=0
begin
if @gender='Female'
begin 
update NewTable1 set Empname='Ms. '+@empname where Gender='Female'
fetch next from d_cursor into @empname,@gender
end
else if @gender='Male'
begin
update NewTable1 set Empname='Mr. '+@empname where Gender='Male'
fetch next from d_cursor into @empname,@gender
end
end
close d_cursor
deallocate d_cursor

Select * from NewTable1

---------------How can update the records------
update NewTable1 set Empname=LTRIM(Right(Empname,len(EmpName)-8))
Select LTRIM(Right('Mr. Mr. Rajiv Singh',len('Mr. Mr. Rajiv Singh')-8))
----------------Forward Only Cursor-----------
CREATE TABLE Employee2 
(
    EmpID INT PRIMARY KEY,
    EmpName VARCHAR(100),
    Salary DECIMAL(10,2)
);

INSERT INTO Employee2 (EmpID, EmpName, Salary)
VALUES
(1, 'John', 50000),
(2, 'Alice', 60000),
(3, 'Bob', 55000);

DECLARE @EmpID INT, @EmpName VARCHAR(100), @Salary DECIMAL(10,2);
DECLARE Forward_Cursor CURSOR FORWARD_ONLY FOR
SELECT EmpID, EmpName, Salary
FROM Employee2;

OPEN Forward_Cursor;

-- Fetch first row
FETCH NEXT FROM Forward_Cursor INTO @EmpID, @EmpName, @Salary;

-- Loop through rows
WHILE @@FETCH_STATUS = 0
BEGIN
    PRINT 'Employee: ' + CAST(@EmpID AS VARCHAR) 
          + ' - ' + @EmpName 
          + ' earns ' + CAST(@Salary AS VARCHAR)

FETCH NEXT FROM Forward_Cursor INTO @EmpID, @EmpName, @Salary;
END;

CLOSE Forward_Cursor;
DEALLOCATE Forward_Cursor;
---------------KeySet Cursor Exmaple---------

CREATE TABLE Employees (
    EmpID INT PRIMARY KEY,
    EmpName VARCHAR(100),
    Salary DECIMAL(10,2)
);

INSERT INTO Employees (EmpID, EmpName, Salary)
VALUES
(1, 'John', 50000),
(2, 'Alice', 60000),
(3, 'Bob', 55000);

DECLARE @EmpID INT, @EmpName VARCHAR(100), @Salary DECIMAL(10,2);
DECLARE Employee_Cursor CURSOR KEYSET FOR
SELECT EmpID, EmpName, Salary
FROM Employees;

OPEN Employee_Cursor;

-- Fetch first row
FETCH NEXT FROM Employee_Cursor INTO @EmpID, @EmpName, @Salary;

WHILE @@FETCH_STATUS = 0
BEGIN
    PRINT 'Employee: ' + CAST(@EmpID AS VARCHAR) 
          + ' - ' + @EmpName 
          + ' earns ' + CAST(@Salary AS VARCHAR);

    FETCH NEXT FROM Employee_Cursor INTO @EmpID, @EmpName, @Salary;
END;

CLOSE Employee_Cursor;
DEALLOCATE Employee_Cursor;

OPEN Employee_Cursor;
UPDATE Employees SET Salary = 70000 WHERE EmpID = 2;

Select * from Employees

INSERT INTO Employees VALUES (4, 'David', 65000);

OPEN Employee_Cursor;
INSERT INTO Employees VALUES (5, 'Raja', 75000);


