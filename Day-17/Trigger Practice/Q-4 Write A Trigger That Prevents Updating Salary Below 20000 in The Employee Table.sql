
--Q-4 DML Trigger Write a trigger that prevents updating salary below 20000 in the Employee table.

Alter Trigger TrgPreventLowSalaryUpdate
on Emp6
after insert
as
begin
   if Exists(Select * from inserted where Salary>20000)
   begin
   raiserror('salary can not be update below 20000',16,1)
   Rollback
   end
   end

   -----------Execute
   Select * from Emp6

   UPDATE Emp6
SET Salary = 15000
WHERE EmpID = 8;


