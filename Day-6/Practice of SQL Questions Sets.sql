	  Use [Ansari Bhai With SQL]
---Q-1---- Retrieve the top 3 highest-paid employees. 

Select Top 3 * from Employees
Order by Salary Desc

----Q-2--Find the customers who have placed orders. 


Select * from Employees
Select * from Orders1
Select * from Customers

SELECT DISTINCT Customers.[CustomerID], 
    Customers.FirstName, 
    Customers.LastName
FROM 
    Customers
INNER JOIN 
    Orders1 ON Customers.CustomerID = Orders1.CustomerID

---Q.3----------- Show employees and their department names in alphabetical orders

		Select Customers.FirstName,City,Employees.Department from Customers
		inner join Employees on Customers.CustomerID=Employees.EmployeeID
		Order by Department asc

--Q.4------------Find the customers who have placed orders for more than once. 

	SELECT 
    C.CustomerID,
    C.FirstName,
    C.LastName,
	COUNT(O.OrderID) AS OrderCount
FROM 
    Customers C
JOIN 
    Orders1 O ON C.CustomerID = O.CustomerID
GROUP BY 
    C.CustomerID, C.FirstName, C.LastName
HAVING 
    COUNT(O.OrderID) > 1;

	
  




  