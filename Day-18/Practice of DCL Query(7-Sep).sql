

----------------DCL Commands-------------------------
CREATE TABLE Emp_Details (
    EmpID INT PRIMARY KEY,
    EmpName VARCHAR(50),
    Salary DECIMAL(10,2)
);

-- Create a login at SQL Server level
CREATE LOGIN Bansals1 WITH PASSWORD = 'Meethi@123';

-- Map login to a database user
CREATE USER Bansals1 FOR LOGIN Bansals1;

-- Grant SELECT and INSERT permissions on Employees to TestUser
GRANT SELECT, INSERT ON Emp_Details TO Bansals1;

--✅ Now, TestUser can read and insert into Emp_Details.






