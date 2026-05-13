
Select * from Orders_DT
-------------Create Trigger
--Q Write a trigger to prevent deletion of records from the Orders table.

Create Trigger Trag_PreventOrderDelete
on Orders_DT
instead of Delete
as
Print'Deletion from Orders table is not allowed'
Rollback Transaction

---------Execute
Select * from Orders_DT
DELETE FROM Orders_DT WHERE OrderID = 101;
