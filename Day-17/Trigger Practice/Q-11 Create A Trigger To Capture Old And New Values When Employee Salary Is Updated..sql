
--Q-11 Practice Task Create a trigger to capture old and new values when Employee salary is updated.

	CREATE TABLE Salary_Audit (
    AuditID INT IDENTITY(1,1) PRIMARY KEY,
    EmpID INT,
    OldSalary DECIMAL(10,2),
    NewSalary DECIMAL(10,2),
    UpdatedAt DATETIME DEFAULT GETDATE()
);

Create Trigger TrgCaptureSalaryChange
on Emp6
after update
as
begin
insert into Salary_Audit(EmpID,OldSalary,NewSalary)
select D.EmpID,D.Salary,I.Salary from deleted d
inner join inserted I ON D.EmpID=I.EmpID
END

SELECT * FROM EMP6
--------------Execute Trigger

Update Emp6 set Salary=58000 where EmpID=10

Select * from Salary_Audit

