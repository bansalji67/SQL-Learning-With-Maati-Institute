-----------------------DCL Query Langauge--------------
CREATE TABLE Empdetails (
    EmpID INT PRIMARY KEY,
    EmpName VARCHAR(50),
    Salary DECIMAL(10,2)
)

-----------Create a test login and user:

-- Create a login at SQL Server level
CREATE LOGIN NOOR WITH PASSWORD = 'Maati@123'

-- Map login to a database user
CREATE USER NOOR FOR LOGIN NOOR;

----------- Grant SELECT and INSERT permissions on Employees to TestUser
GRANT SELECT, INSERT ON Empdetails TO NOOR;


