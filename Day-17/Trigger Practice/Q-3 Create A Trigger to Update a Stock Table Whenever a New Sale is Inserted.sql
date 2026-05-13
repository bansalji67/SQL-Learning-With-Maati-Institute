
--Q3 DML Trigger Create a trigger to update a Stock table whenever a new Sale is inserted

Create Trigger Trg_UpdatedStockonSales
on Sales_DT 
after insert
as
begin
 Update s
 set s.Quantity=s.Quantity-I.Quantity   --------Query for Automatically update stock record in stock table
 from Stocks s
 inner join inserted I on s.ItemID=I.ItemID
 end
------------Execute Trigger

INSERT INTO Sales_DT (SaleID, ItemID, Quantity, SaleDate)
VALUES (1007, 14, 10, GETDATE());

Select * from Stocks
Select * from Sales_Dt