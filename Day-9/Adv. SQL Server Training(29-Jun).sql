---------------------DML Query Exmaples-------------
---Normal Insert Query

Create Table NewTbl
(
EmpID int,
EmpName Varchar(Max),
Salary bigint
)

Select * from NewTbl
-------------Normal Insert Query-------------
Insert into NewTbl Values(111,'Raj',43432)
Insert into NewTbl Values(222,'Mohit',12345)
Insert into NewTbl Values(333,'Sanjeev',23422)
Insert into NewTbl Values(444,'Radhey',12345)

Select * from NewTbl
Delete from NewTbl
------------------Insert Query with Multiple Records
Insert into NewTbl Values(111,'Raj',34335),(222,'Radhey',344454),(333,'Mohit',23452)
Select * from NewTbl

---------------Insert Conditional Record
Create Table AutoTable
(
EmpID int identity(1000,1),
EmpName Varchar(max),
Company Varchar(Max),
Location varchar(max)
)
-------------------Insert conditional record
Insert into AutoTable Values('Mohit','EXL','Noida')
Insert into AutoTable Values('Lakhan','UHG','Gurgaon')
Insert into AutoTable Values('Hitesh','HCL','Chennai')

Select * from AutoTable

Create Table AutoTable1
(
EmpID int,
EmpName Varchar(max),
Company Varchar(Max),
Location varchar(max)
)
Insert into AutoTable1(EmpName,Company,Location) Values('Mohit','EXL','Noida')
Insert into AutoTable1(EmpName,Company,Location) Values('Lakhan','UHG','Gurgaon')
Insert into AutoTable1(EmpName,Company,Location) Values('Hitesh','HCL','Chennai')
Select * from AutoTable1
------------Insert Query from Single Table
Create Table FreshTable
(
EmpID int,
EmpName Varchar(Max),
Salary bigint
)
Select * from FreshTable
Insert into FreshTable Select * from NewTbl
Select * from FreshTable

--Insert Query from Single Table with Where condition

Create Table NewData
(
EmpID int,
EmpName Varchar(Max),
Salary bigint
)

Select * from NewTbl

insert into NewData select * from NewTbl where Salary>=25000
Select * from NewData

----Insert Query From Multiple Tables SubQuery-------
Select * from IRA
Select * from CD
Select * from Savings 
Select * from Checking

Select * into MasterTableExample from CD where null= null
Drop Table MasterTableExample
Select * from MasterTableExample

----------------Insert Multiple Table Data in Master Table
Insert into MasterTableExample
Select * from CD
Union 
Select * from IRA
Union
Select * from Checking 
Union 
Select * from Savings

---------------Insert Query from Multiple tables with Join----------
Select * from Customer
Select * from Sales
Select * from Product
Create Table BrandTable
(
Customer varchar(max),
Gender Varchar(20),
Category Varchar(max),
Size varchar(max) ,
Price bigint,
Qty bigint
)

Select * from BrandTable

Insert into BrandTable 
Select Customer,Gender,Category,Size,price,Qty from Customer inner join Sales
On Customer.CustomerID=Sales.CustomerID
Inner join Product
on PRODUCT.ProductID=Sales.ProductID
---------------Update Query Exmaple-1
select * from BrandTable
Update BrandTable set Gender='Female' where Gender='F'
Update BrandTable set Gender='Male' where Gender='M'

---------------Update Query Exmaple-2
Update BrandTable set Gender=IIF(Gender='Male','M','F')
Select * from BrandTable
---------------Update Query Exmaple-3
Update BrandTable set Gender=(Case Gender when 'M' then 'Male' else 'Female' end)
---------------Update Query Exmaple-4
select * from Marksheet
Update Marksheet Set Result=Null
Update Marksheet set result=IIF(Marks<33,'Fail','Pass')
Update Marksheet set result=IIF(Marks<33,'Fail',Iif(Marks<45,'Pass',iif(Marks<60,'second',Iif(Marks<75,'First','Excellent'))))

-------------Update Query Example (5)
Create Table GCST_Example
(
GrandTotal float,
GST float,
NetValue float
)

Insert into GCST_Example(GrandTotal) Values(2000),(3000),(4000),(5000),(6000),(100),(200)
Select * from GCST_Example

Update GCST_Example set GST=Round((GrandTotal-(GrandTotal/1.18)),0),NetValue=Round((GrandTotal/1.18),0)

------------------Delete Query Example--------------
Select * from GCST_Example
Delete from GCST_Example where GST>500
----------------
Drop Table if exists PivotTable,PivotTable1
Select * from PivotTable1



