
--Q.2 DML Trigger Write a trigger to prevent deletion of records from the Orders table.

CREATE TRIGGER TrgPreventOrderDelete 
ON Orders2 
INSTEAD OF DELETE 
AS
BEGIN 
RAISERROR ('Deletion from Orders table is not allowed.', 16, 1); --Query for prevent deletion of record
ROLLBACK TRANSACTION; 
end
------------------Execute Trigger-

DELETE FROM Orders2 WHERE OrderID = 102;

Select * from Orders2

Disable Trigger TrgPreventOrderDelete on Orders2

Enable Trigger TrgPreventOrderDelete on Orders2