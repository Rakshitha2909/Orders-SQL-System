-- Write an SQL query to return all records from the Shippers table.
SELECT * from Shippers;

--  Write an SQL query to return the CategoryName and Description from the Categories table
SELECT CategoryName, Description from Categories;

-- Write an SQL query to return the FirstName, LastName, and HireDate of all employees with the title of Sales Representative
SELECT LastName, FirstName, HireDate from Employees where Title='Sales Representative';

-- Write an SQL query to return the FirstName, LastName, and HireDate of all employees with the title of Sales Representative living in the United States
SELECT LastName, FirstName, HireDate from Employees where Title='Sales Representative' and country='USA' ;

-- Write an SQL query to return all of the orders placed by employee with EmployeeID 5
SELECT * FROM Orders where EmployeeId=5;

-- Write an SQL query to return the SupplierID, ContactName, and ContactTitle for those Suppliers whose ContactTitle is NOT Marketing Manager
SELECT SupplierID,ContactName,ContactTitle FROM Suppliers where ContactTitle!= 'Marketing Manager';

-- Write an SQL query to return the ProductID and ProductName for Products where the ProductName includes the string "queso.”
Select ProductID, ProductName from Products where ProductName LIKE '%Ques%';

-- Write an SQL query to return the OrderID, CustomerID, and ShipCountry for the Orders where the ShipCountry is Italy or France
SELECT OrderID, CustomerID, ShipCountry FROM Orders WHERE ShipCountry = 'Italy' or ShipCountry = 'France';

-- Write an SQL query to return the OrderID, CustomerID, and ShipCountry for the Orders where the ShipCountry is either Brazil, Mexico, Argentina, or Venezuela. Do NOT use the OR operator.
SELECT OrderID, CustomerID, ShipCountry FROM Orders WHERE ShipCountry IN ('Brazil', 'Mexico', 'Argentina', 'Venezuela');

-- Write an SQL query to return all employees' FirstName, LastName, Title, and BirthDate in the Employees table. Sort the results by BirthDate with the oldest employees first
SELECT FirstName, LastName, Title, BirthDate FROM Employees ORDER BY BirthDate;

