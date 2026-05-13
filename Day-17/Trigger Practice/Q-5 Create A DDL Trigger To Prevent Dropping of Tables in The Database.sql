
--Q-5 DDL Trigger Create a DDL trigger to prevent dropping of tables in the database.

Create Trigger TrgPreventDropTable
on Database
for Drop_Table
as
begin
raiserror('Dropping is not allowed',16,1)
Rollback
end

Drop Table Emp6
------------------Execute-----------
disable trigger TrgPreventDropTable on Database