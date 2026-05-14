
Use [Ansari_Bhai_ With_SQL]

CREATE TABLE Emp7 (
    EmpID INT PRIMARY KEY,
    EmpName VARCHAR(50),
    Salary DECIMAL(10,2)
);

-----1. START TRANSACTION and COMMIT

Begin Transaction
INSERT INTO Emp7 VALUES (1, 'Amit', 50000);
INSERT INTO Emp7 VALUES (2, 'Riya', 60000);
Commit Transaction

----2. ROLLBACK Example
BEGIN TRANSACTION;
INSERT INTO Emp7 VALUES (3, 'Neha', 70000);
INSERT INTO Emp7 VALUES (4, 'Raj', 55000);
ROLLBACK

Select * from Emp7
Delete from Emp7

----3. SAVEPOINT and ROLLBACK TO SAVEPOINT

BEGIN TRANSACTION;

INSERT INTO Emp7 VALUES (5, 'Arjun', 65000);
Save Transaction sp1;

INSERT INTO Emp7 VALUES (6, 'Kiran', 72000);
Save Transaction sp2;

----Rollback to first  savepoint(remove kiran keep arjun)

Rollback Transaction sp1;
Select * from Emp7

-------------Another Example 
--(Here after insert below records when we rollback transaction sp1 it will remove chandan and kamal records from the table)

INSERT INTO Emp7 VALUES (6, 'Mohit', 65000);
Save Transaction sp1;

INSERT INTO Emp7 VALUES (7, 'Chandan', 72000);
Save Transaction sp2;

INSERT INTO Emp7 VALUES (8, 'Kamal', 72000);
Save Transaction sp3;

Select * from Emp7

Rollback Transaction sp1

--------------------another example
INSERT INTO Emp7 VALUES (9, 'Inder', 59000);
Save Transaction sp4;

INSERT INTO Emp7 VALUES (10, 'Chandu', 12000);
Save Transaction sp5;

INSERT INTO Emp7 VALUES (11, 'Kamalnath', 42000);
Save Transaction sp6;

-----------Remove All Insert Values
begin Transaction
Rollback Transaction

Select * from Emp7

----------Commit
Commit

---------------TCL Query with Update
Begin Transaction
Update Emp7 set EmpName='Radhey' where Salary=50000

Select * from Emp7
-----------------------after run update command when we Run Rollback query it will update previous name which is Amit
Rollback

---------------TCL Query with Delete command

--After Run the below query when we run rollback command it will give back record which we already deleted
Begin Transaction
Delete from Emp7 where Salary<60000

-------------Rollback
Rollback
-----------1. Begin Transaction with Save Transaction
Delete from Emp7

BEGIN TRANSACTION;
INSERT INTO Emp7 VALUES (1, 'Amit', 50000);

SAVE TRANSACTION sp1;
INSERT INTO Emp7 VALUES (2, 'Raj', 60000);

Select * from Emp7
Commit

BEGIN TRANSACTION;
INSERT INTO Emp7 VALUES (3, 'Sneha', 55000);
SAVE TRANSACTION sp2;

INSERT INTO Emp7 VALUES (4, 'Vikas', 70000);
ROLLBACK TRANSACTION sp2;  -- Undo Vikas, keep Sneha