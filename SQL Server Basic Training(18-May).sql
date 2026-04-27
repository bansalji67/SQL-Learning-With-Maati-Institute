----------------------------Query Optimization Session-------------------------
------------SQL SELECT Statement---------------
Select * from Dataset

-----------SQL Particular Field
Select Agent,AcctType,Amount from Dataset

-------------SQL DISTINCT (Unique)
Select Distinct Agent from Dataset

------------------Execute Multiple Table
Select * from Dataset
go
Select * from Raw_Data
go
Select * from mytable
go
Select * from New_Table1
------------SQL WHERE
Select * from Dataset where agent='Abhishek Kumar'

-------------------SQL AND
Select * from Dataset where agent='Abhishek Kumar' And AcctType='CD'
-------------------SQL OR
Select * from Dataset where agent='Abhishek Kumar' Or AcctType='Fixed'
--------------------------Company Question Paper (Sapient)
Select * from Sapient
--------------PS>4 or(Rank=1,Rank=2) And Totalyear>2
Select * from Sapient where [Performance Score]>4 And (RANK=1 Or Rank=2) And Total_Year>2

------------------IIF Example (Single condition)---------------------------
Select Code,Empname,Shift,IIF(Shift='Night','N',IIF(Shift='General','G',IIF(Shift='Morning','M','E')))  from UniqueData

--------------------Query with Multiple Fields
Select * from Dataset where Agent='Pawan Kumar' and AcctType='CD' and Branch='Central' And Customer='new'
-------------------------------Question Paper (UGH)-Way1
Select count(*) from sys.tables
Select * from Dataset where null=null
Select * from RawData where null=null

-----------------Question Paper (UGH)-Way2
Select * from Dataset where ''<>''
Select * from RawData where ''<>''
----------------------SQL IN
Select * from Dataset where Agent in ('Pawan Kumar','Abhishek Kumar')

----------------------SQL Not IN
Select * from Dataset where Agent not in ('Pawan Kumar','Abhishek Kumar')

----------------------SQL BETWEEN--------
Select Agent, AcctType, SalesDate, Amount from Dataset where SalesDate between '2014-1-1' and '2016-12-31'

Select EmpName from WildCardTable where EmpName between 'Deepak Kumar Singh' and 'Ram'
--------------------------Wild Card-----------------
Select * from WildCardTable
--------------------Name start from A
Select * from WildCardTable where EmpName like 'A%'
-------------------End with R
Select * from WildCardTable where EmpName like '%r'
-------------------With Not
Select * from WildCardTable where EmpName not like '%r'
-------------------SQL ORDER BY
Select * from WildCardTable order by EmpName Asc
Select * from WildCardTable order by EmpName desc
----------------By Default Ascending Order-----------
Select * from WildCardTable order by EmpName




























