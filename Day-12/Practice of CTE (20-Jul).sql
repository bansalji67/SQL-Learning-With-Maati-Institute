Use [Ansari_Bhai_ With_SQL]

Select * from Agent_Data

----------------CTE Example1------------------
with MyCTE
AS
(Select Agent,AcctType,Amount from Agent_Data)
 Select * from MyCTE

 ----------------CTE Example2------------------
 with CTE_Report
 as
 (Select Agent,sum(Amount) as Total,max(Amount) as Max_Value,min(Amount) as Min_Value from Agent_Data
  Group by Agent)
  SELECT * FROM CTE_Report

   ----------------CTE Example3------------------

   with Pivot_Report
   as
   (select * from (Select Agent,AcctType,Amount from Agent_Data) as xyz
   Pivot(sum(Amount) for AcctType in ([CD],[IRA],[Checking],[Savings])) as xyz)
   Select * from Pivot_Report

      ----------------CTE Example4------------------

	  Select * from Superstore

	  Select Category,max(Sales) as Totalmax from Superstore
	  Group by Category
	  
	  -----------2nd Highest Sales
	  Select max(Sales) as Totalmax from Superstore
	  where Sales< (Select max(Sales) from Superstore)
	  
	  --------------Remove Duplicates------------
	  Use Basic

	  select * into UniqueData1 from UniqueData

	  Select * from UniqueData1

	  with RemoveDuplicate
	  as
	  (Select EmpName,ROW_NUMBER() over (Partition by EmpName Order by EmpName) as helpcol 
	  from UniqueData1)
	  Delete from RemoveDuplicate where helpcol>1

	  with Unique_Count
	  as
	  (Select EmpName,ROW_NUMBER() over (Partition by EmpName Order by EmpName asc) as helpcol
	  from UniqueData1)
	  Select * from Unique_Count where helpcol>1

	  ------------------Interview Question---------------------
	  Create Table CTE
	  (TotalCost float,
	   GST float,
	   NetCost float
	   	  )

		 Create Table GST
		 (TotalCost float
		 )

		 Insert into GST Values(1234),(5000),(1000),(500),(400)

		 Select * from GST
		 Select * from CTE
		------------------------------------Update Record in CTE Table--------------  
		  with UpdateRecord
		  as
		 (Select TotalCost as TotalCost,TotalCost*0.18 as GST,TotalCost-(TotalCost*0.18) as NetCost from GST)
		  Insert into CTE SELECT * from UpdateRecord

	  
