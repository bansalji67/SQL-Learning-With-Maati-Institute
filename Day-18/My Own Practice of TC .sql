
CREATE TABLE Emp_DT2 (
    EmpID INT PRIMARY KEY,
    EmpName VARCHAR(50),
    Department VARCHAR(50),
    Salary INT
);

-- Insert 50 sample employees
INSERT INTO Emp_DT2 (EmpID, EmpName, Department, Salary)
VALUES 
(1,'Amit','HR',50000),(2,'Sumit','IT',60000),(3,'Ritu','Finance',55000),
(4,'Neha','IT',45000),(5,'Raj','HR',48000),(6,'Priya','Finance',52000),
(7,'Karan','IT',53000),(8,'Anita','HR',47000),(9,'Rohit','Finance',59000),
(10,'Simran','IT',62000),(11,'Pooja','HR',51000),(12,'Vikas','Finance',54000),
(13,'Anil','IT',50000),(14,'Shivani','HR',46000),(15,'Manish','Finance',56000),
(16,'Nisha','IT',58000),(17,'Sonal','HR',49500),(18,'Varun','Finance',60000),
(19,'Tanya','IT',57000),(20,'Deepak','HR',52000),(21,'Isha','Finance',53000),
(22,'Rakesh','IT',55000),(23,'Meena','HR',50000),(24,'Saurabh','Finance',59000),
(25,'Alok','IT',62000),(26,'Reena','HR',48000),(27,'Sunil','Finance',51000),
(28,'Kriti','IT',50000),(29,'Anuj','HR',47000),(30,'Shweta','Finance',56000),
(31,'Vineet','IT',53000),(32,'Pallavi','HR',49500),(33,'Rajan','Finance',58000),
(34,'Divya','IT',60000),(35,'Ramesh','HR',52000),(36,'Nikita','Finance',55000),
(37,'Harsh','IT',57000),(38,'Neelam','HR',48000),(39,'Aakash','Finance',50000),
(40,'Payal','IT',62000),(41,'Kunal','HR',54000),(42,'Richa','Finance',53000),
(43,'Siddharth','IT',56000),(44,'Mona','HR',51000),(45,'Himanshu','Finance',58000),
(46,'Shalini','IT',60000),(47,'Akshay','HR',52000),(48,'Komal','Finance',50000),
(49,'Aditya','IT',55000),(50,'Neetu','HR',47000);

Use [Ansari_Bhai_ With_SQL]

Select * from Emp_DT2

--Q-1  Simple Insert with Commit

BEGIN TRANSACTION;
INSERT INTO Emp_DT2 (EmpID, EmpName, Department, Salary)
VALUES (51,'Rohan','Finance',50000);
COMMIT;

Select * from Emp_DT2

--Q-2  Simple Update + Commit
--before commit below Transaction when we run Rollback command it will show actual salary without adding 5000 in salary

BEGIN TRANSACTION;
UPDATE Emp_DT2
SET Salary = Salary + 5000
WHERE Department='IT';

Rollback
Commit

--Q-3  Delete + Rollback
---after run below transaction we can get back those recrods which we deleted using rollback

BEGIN TRANSACTION;
DELETE FROM Emp_DT2
WHERE EmpID BETWEEN 45 AND 50;

Select * from Emp_DT2
ROLLBACK;

--Q-4   Insert + Rollback

BEGIN TRANSACTION;
INSERT INTO Emp_DT2(EmpID, EmpName, Department, Salary)
VALUES (52,'Ananya','HR',48000);
ROLLBACK;

--Q-5 Savepoint + Partial Rollback

BEGIN TRANSACTION;
UPDATE Emp_DT2 SET Salary = Salary + 2000 WHERE EmpID = 1;
SAVE TRANSACTION Save1;
UPDATE Emp_DT2 SET Salary = Salary + 3000 WHERE EmpID = 2;
ROLLBACK TRANSACTION Save1;

Select * from Emp_DT2

--Q-6 Insert Multiple + Rollback
 -- after insert multiple below record we can remove it using rollback command

BEGIN TRANSACTION;
INSERT INTO Emp_DT2 VALUES (53,'Rhea','Finance',52000);
INSERT INTO Emp_DT2 VALUES (54,'Vikram','IT',58000);
ROLLBACK;

--Q-7 Delete Some + Commit
 --if we delete below records with commit command then we can not rollback these records again
BEGIN TRANSACTION;
DELETE FROM Emp_DT2 WHERE EmpID IN (10,20,30);
COMMIT;

--Q-8 Update + Savepoint + Rollback

Update Emp_DT2 Set Salary=Salary+1000 where Department='HR'
Save Transaction sp1
--------------
begin Transaction
Commit
-----------      -------------
Update Emp_DT2 Set Salary=Salary-1200 WHERE Department='IT'
Save Transaction sp2
------------       ------------------------
begin Transaction
Rollback Transaction sp1

Select * from Emp_DT2

--Q-9 Insert + Update + Commit

BEGIN TRANSACTION;
INSERT INTO Emp_DT2 VALUES (55,'Tanvi','IT',49000);
UPDATE Emp_DT2 SET Salary = Salary + 2000 WHERE EmpID=55;
COMMIT;

Rollback

--Q-10 Delete + Insert + Rollback

BEGIN TRANSACTION;
DELETE FROM Emp_DT2 WHERE EmpID=5;
INSERT INTO Emp_DT2 VALUES (56,'Ankit','HR',51000);
ROLLBACK;