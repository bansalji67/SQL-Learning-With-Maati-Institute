
Use [Ansari_Bhai_ With_SQL]

-------------DML Query Example---------------
Create Table NewTbl1
(EmpID Int,
 EmpName Varchar(max),
 Salary bigint
 )

 

 Select * from NewTbl1

 -------------Normal Insert Query-------------

Insert into NewTbl1 Values(111,'Raj',43432)
Insert into NewTbl1 Values(222,'Mohit',12345)
Insert into NewTbl1 Values(333,'Sanjeev',23422)
Insert into NewTbl1 Values(444,'Radhey',12345)

Delete NewTbl1
------------------Insert Query with Multiple Records

Insert into NewTbl1 Values(111,'Raj',43432),(222,'Mohit',12345),(333,'Sanjeev',23422),(444,'Radhey',12345)

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

Select *  from AutoTable1

------------Insert Query from Single Table

Create Table FreshTable
(
EmpID int,
EmpName Varchar(Max),
Salary bigint
)
Select * from FreshTable

---------------INSERT DATA

Insert into FreshTable select * from NewTbl1


--Insert Query from Single Table with Where condition

Create Table NewDT
(EmpID Int,
 EmpName Varchar(max),
 Salary Bigint
 )

 insert  into NewDT select * from NewTbl1 where Salary>20000

 Select * from NewDT

 
----Insert Query From Multiple Tables SubQuery-------

Select * from IRA
Select * from CD
Select * from Savings 
Select * from Checking

Drop Table MasterTable1

-------------Create Duplicate table with same fields structure

 Select * into MasterTable1 from CD  where null=null

 Select * from MasterTable1

 ------------Insert data from Multipale data

 insert into MasterTable1
 select * from CD
 Union
 Select * from Checking
 Union
 Select * from IRA
 Union
 Select * from Savings

 ---------------Insert Query from Multiple tables with Join----------

 Select * from Customer
 Select * from Product
 Select * from Sales

 Create Table BrandTable
 (Customer Varchar(max),
  Gender Varchar(max),
  Category Varchar(max),
  Size Varchar(20),
  Price Int,
  Qty Int,
  )
  Insert into BrandTable 
  Select Customer,Gender,Category,Size,Price,Qty from Customer Inner join Sales on Customer.CustomerID=Sales.CustomerID
  Inner join Product on Sales.ProductID=Product.ProductID

  Select * from BrandTable

  ---------------Update Query Exmaple-1
  Update BrandTable set Gender='F' WHERE Gender='Female'
  Update BrandTable set Gender='M' WHERE Gender='Male'

   ---------------Update Query Exmaple-2

   Update BrandTable set Gender=IIF(Gender='F','Female','Male')

   ---------------Update Query Exmaple-3

   Update BrandTable set Gender=(Case Gender When 'Male' then 'M' else 'F' END)

   ---------------Update Query Exmaple-4
   select * from Marksheet

  Update Marksheet set Result=iif(Marks<33,'Fail',iif(Marks<=45,'Pass',iif(Marks<=65,'3rd',iif(Marks<=75,'2nd',iif(Marks<=85,'1st','Excellent')))))
