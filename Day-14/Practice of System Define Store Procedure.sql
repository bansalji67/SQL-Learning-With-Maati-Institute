
use SQL_Practice

-----------System Define Store Procedure----------------
sp_help Employee

---------SP_HelpDB-----------------
sp_helpdb SQL_Practice

-------sp_rename (Table)---------------
sp_rename 'Comp','Company'

Select * from Company

--------SP_Rename (Feild)-------------
sp_rename 'Sales.SaleDate','Sales_Date'

Select * from Sales

---------SP_Rename_Database-------------
sp_renamedb 'SQLPractice','SQL_Practice'

---------------------Show All View of Table--------------
use [Ansari_Bhai_ With_SQL]
Select * from sys.views

----------SP_HELPTEXT--------
sp_helptext sp_rename

--------------SP_Exec Syntax--------------
declare @syntax as nvarchar(max)
set @syntax='Select * from SalesData'
execute sp_executesql @syntax

------------SP_CONFIGURE
SP_CONFIGURE

SP_WHO

