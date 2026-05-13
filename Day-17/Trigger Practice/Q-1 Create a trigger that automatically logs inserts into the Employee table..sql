Use Ansari_Bhai_With_SQL

--Q1 DML Trigger Create a trigger that automatically logs inserts into the Employee table.

CREATE TABLE Employee_Log (
    LogID INT IDENTITY(1,1) PRIMARY KEY,
    EmpID INT,
    EmpName VARCHAR(100),
    Department VARCHAR(50),
    Salary DECIMAL(10,2),
    InsertedAt DATETIME DEFAULT GETDATE()
);

Select * from Employee_Log
Select * from Emp6

Create Trigger TriggEmpLog
on Emp6
after insert
as
Begin
insert into Employee_Log(EmpID,EmpName,Department,Salary) ---these two line query for automatically update data into Emp_log table
  Select EmpID,EmpName,Department,Salary                  ---  
  from Inserted
  end

  ----------Execute

  INSERT INTO Emp6 (EmpID, EmpName, Department, Salary)
  VALUES (101, 'Sumit Bansal', 'IT', 60000);

  INSERT INTO Emp6 (EmpID, EmpName, Department, Salary)
  VALUES (102, 'Hari Kishan', 'Sales', 64000);
