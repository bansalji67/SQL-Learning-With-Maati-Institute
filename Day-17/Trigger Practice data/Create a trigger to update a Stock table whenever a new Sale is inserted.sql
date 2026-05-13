
---Q Create a trigger to update a Stock table whenever a new Sale is inserted.

Create Trigger Tragg_UpdateStockonSales
on Sales_DT
AFTER INSERT
AS
BEGIN
Update S
SET S.Quantity=S.Quantity-I.Quantity
from Stock s
 INNER JOIN inserted I ON S.ItemID = I.ItemID;
END;

-------------Execute
INSERT INTO Sales_DT (SaleID, ItemID, Quantity, SaleDate)
VALUES (1001, 1, 3, GETDATE());

Select * from Sales_DT

INSERT INTO Sales_DT(SaleID, ItemID, Quantity, SaleDate)
VALUES 
(121, 2, 5, GETDATE()),
(122, 3, 2, GETDATE());