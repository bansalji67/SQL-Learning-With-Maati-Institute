
--------------Create Employees TABLE----------

CREATE TABLE Employees ( 
    EmployeeID INT PRIMARY KEY, 
    FirstName VARCHAR(50), 
    LastName VARCHAR(50), 
    Department VARCHAR(50), 
    Salary DECIMAL(10, 2), 
    HireDate DATE 
); 

INSERT INTO Employees (EmployeeID, FirstName, LastName, Department, Salary, HireDate) 
VALUES 
    (1, 'John', 'Doe', 'HR', 50000.00, '2020-01-15'), 
    (2, 'Jane', 'Smith', 'Marketing', 55000.00, '2019-05-20'), 
    (3, 'Mike', 'Johnson', 'IT', 60000.00, '2018-09-10'), 
    (4, 'Emily', 'Williams', 'Finance', 58000.00, '2021-03-12'), 
    (5, 'David', 'Lee', 'Operations', 52000.00, '2017-11-25'); 

	Select * from Employees

	-----------------------------Customers Table----------
	CREATE TABLE Customers ( 
    CustomerID INT, 
    FirstName VARCHAR(50), 
    LastName VARCHAR(50), 
    Email VARCHAR(100), 
    Address VARCHAR(200), 
    City VARCHAR(50), 
    Country VARCHAR(50) 
); 

Drop Table Customers

INSERT INTO Customers (CustomerID, FirstName, LastName, Email, Address, City, Country) 
VALUES 
    (1, 'Michael', 'Brown', 'michael@example.com', '123 Main St', 'New York', 'USA'), 
    (2, 'Emma', 'Johnson', 'emma@example.com', '456 Elm St', 'Los Angeles', 'USA'), 
    (3, 'Oliver', 'Smith', 'oliver@example.com', '789 Oak St', 'Chicago', 'USA'), 
    (4, 'Sophia', 'Williams', 'sophia@example.com', '101 Maple Ave', 'Houston', 'USA'), 
    (5, 'James', 'Lee', 'james@example.com', '222 Pine St', 'San Francisco', 'USA'),
	(2, 'Emma', 'Johnson', 'emma@example.com', '456 Elm St', 'Los Angeles', 'USA'),
	(1, 'Michael', 'Brown', 'michael@example.com', '123 Main St', 'New York', 'USA')

	------------Create Orders1 Table

	CREATE TABLE Orders1 ( 
    OrderID INT PRIMARY KEY, 
    CustomerID INT, 
    OrderDate DATE, 
    TotalAmount DECIMAL(10, 2), 
    IsShipped BIT 
); 

INSERT INTO Orders1 (OrderID, CustomerID, OrderDate, TotalAmount, IsShipped) 
VALUES 
(1, 3, '2023-07-01', 100.00, 1), 
(2, 1, '2023-07-05', 250.00, 1), 
(3, 4, '2023-07-10', 180.00, 0), 
(4, 2, '2023-07-15', 300.00, 1), 
(5, 5, '2023-07-20', 120.00, 1); 