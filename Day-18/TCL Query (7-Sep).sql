------------TCL Query Examples----------------
CREATE TABLE Employees (
    EmpID INT PRIMARY KEY,
    EmpName VARCHAR(50),
    Salary DECIMAL(10,2)
);

Select * from Employees

Delete from Employees
-----1. START TRANSACTION and COMMIT

Begin Transaction
INSERT INTO Employees VALUES (1, 'Amit', 50000);
INSERT INTO Employees VALUES (2, 'Riya', 60000);
Commit Transaction

----2. ROLLBACK Example
BEGIN TRANSACTION;
INSERT INTO Employees VALUES (3, 'Neha', 70000);
INSERT INTO Employees VALUES (4, 'Raj', 55000);
ROLLBACK;

----3. SAVEPOINT and ROLLBACK TO SAVEPOINT

BEGIN TRANSACTION;

INSERT INTO Employees VALUES (5, 'Arjun', 65000);
Save Transaction sp1;

INSERT INTO Employees VALUES (6, 'Kiran', 72000);
Save Transaction sp2;

-- Rollback only last insert
ROLLBACK TRANSACTION sp1;

BEGIN TRANSACTION;
INSERT INTO Employees VALUES (3, 'Raj', 65000);
Save Transaction xyz;

INSERT INTO Employees VALUES (4, 'Sam', 72000);
Save Transaction abc;

INSERT INTO Employees VALUES (5, 'Rajiv', 98777);
Save Transaction pqr;

Select * from Employees

-----------Remove All Insert Values
select * from Employees
Rollback;

-------------Commit Trasnaction
Commit


BEGIN TRANSACTION;
INSERT INTO Employees VALUES (7, 'Virat', 15000);
Save Transaction KKR;

-------------------TCL with Update Query
BEGIN TRANSACTION;
Update Employees set EmpName='Ranjeet' where Salary=50000

Save Transaction Ex1;

Select * from Employees
commit

Rollback
--------------TCL Query with delete command
Begin Transaction
Delete from Employees where Salary<=60000

Select * from Employees

Rollback

Delete from Employees
-----------1. Begin Transaction with Save Transaction
BEGIN TRANSACTION;
INSERT INTO Employees VALUES (1, 'Amit', 50000);
SAVE TRANSACTION sp1;
INSERT INTO Employees VALUES (2, 'Raj', 60000);

COMMIT;

Select * from Employees
BEGIN TRANSACTION;
INSERT INTO Employees VALUES (3, 'Sneha', 55000);
SAVE TRANSACTION sp2;

INSERT INTO Employees VALUES (4, 'Vikas', 70000);
ROLLBACK TRANSACTION sp2;  -- Undo Vikas, keep Sneha
COMMIT

BEGIN TRANSACTION;
INSERT INTO Employees VALUES (5, 'Arjun', 65000);
SAVE TRANSACTION sp1;

INSERT INTO Employees VALUES (6, 'Kiran', 72000);
SAVE TRANSACTION sp2;

ROLLBACK TRANSACTION sp1;  -- Undo Kiran & Arjun
COMMIT
Select * from Employees


