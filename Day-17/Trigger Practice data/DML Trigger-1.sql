----------Create Table
CREATE TABLE Employee_Log (
    LogID INT IDENTITY(1,1) PRIMARY KEY,
    EmpID INT,
    EmpName VARCHAR(100),
    Department VARCHAR(50),
    Salary DECIMAL(10,2),
    InsertedAt DATE DEFAULT GETDATE()
);
------------Create DML Trigger----
--Q Create a trigger that automatically logs inserts into the Employee table.

CREATE TRIGGER trg_LogEmployeeInsert
ON Emp6
AFTER INSERT
AS
BEGIN
    INSERT INTO Employee_Log (EmpID, EmpName, Department, Salary)
    SELECT EmpID, EmpName, Department, Salary
    FROM inserted;
END;
---------------- Execute Trigger


Select * from Emp6
SELECT TOP 5 * FROM Emp6;
SELECT TOP 5 * FROM Employee_Log;

----Here is LOGID Automatically Generated when we insert any new record like below

INSERT INTO Emp6 (EmpID, EmpName, Department, Salary)
VALUES (101, 'Sumit Bansal', 'IT', 60000);

SELECT * FROM Employee_Log WHERE EmpID = 101;

INSERT INTO Emp6 (EmpID, EmpName, Department, Salary)
VALUES 
(102, 'Anita Mehra', 'HR', 45000),
(103, 'Ravi Kumar', 'Finance', 70000);