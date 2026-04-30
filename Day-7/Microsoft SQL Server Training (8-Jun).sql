Select * from TableA
Select * from TableB
------------------Inner Join Example-----------
Select * from TableA inner join TableB on TableA.ProductID=TableB.Product_ID
------------------Left Outer Join Example-----------
Select * from TableA Left join TableB on TableA.ProductID=TableB.Product_ID
------------------Right Outer Join Example-----------
Select * from TableA Right join TableB on TableA.ProductID=TableB.Product_ID
------------------Full Outer Join Example-----------
Select * from TableA Full join TableB on TableA.ProductID=TableB.Product_ID
------------------Cross Join Example-------
Select * from TableA Cross join TableB
-----------------Self Join Example-------------------
Select * from Employee
Select E2.Emp_name as Employee,E1.Emp_Name as Manager from Employee E1 inner join Employee E2
on E1.emp_id=E2.manager_id
--------------------Q1--------------------
Select * from EmployeeDetails
Select * from ProjectDetail
Select FirstName+' '+LastName as EmpName,ProjectName from EmployeeDetails inner join ProjectDetail
on EmployeeDetails.EmployeeID=ProjectDetail.EmployeeDetailsId
--------------------Q2--------------------
Select FirstName+' '+LastName as EmpName,ProjectName from EmployeeDetails Left join ProjectDetail
on EmployeeDetails.EmployeeID=ProjectDetail.EmployeeDetailsId
--------------------Q3--------------------
Select ProjectName,FirstName+' '+LastName as EmpName from EmployeeDetails Right join ProjectDetail
on EmployeeDetails.EmployeeID=ProjectDetail.EmployeeDetailsId
--------------------Q3--------------------
Select isnull(ProjectName,'Project Not Assigned') as ProjectName,Isnull(FirstName+' '+LastName,'Employee not assigned') as EmpName from EmployeeDetails Full join ProjectDetail
on EmployeeDetails.EmployeeID=ProjectDetail.EmployeeDetailsId
where ProjectName is null Or FirstName is null
--------------------Q4--------------------
select EmployeeID,FirstName,ProjectName from EmployeeDetails E inner join ProjectDetail as P
on E.EmployeeID in (Select P.EmployeeDetailsId from ProjectDetail 
Group by EmployeeDetailsId having Count(*)>1)
--------------------Q5--------------------
select ProjectName,FirstName from ProjectDetail as P inner join EmployeeDetails E 
on P.EmployeeDetailsId=E.EmployeeID
where P.ProjectName in (Select ProjectName from ProjectDetail 
Group by ProjectName having Count(1)>1)








