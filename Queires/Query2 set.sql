-- Write an SQL query to return all employees' FirstName, LastName, Title, and BirthDate in the Employees table. Sort the results by BirthDate with the oldest employees first.This is the same query as No. 10 in SQL Problem Set No. 1, only this time, use the Convert function to convert the BirthDate column to display Date, rather than DateTime.
SELECT FirstName, LastName, Title, DATE(BirthDate) AS BirthDate
FROM Employees
ORDER BY BirthDate;
-- Write a SQL query to show the FirstName and LastName columns. Display another column named FullName and concatenate the FirstName and LastName columns with a space between them. Do NOT add a new column to the table.
SELECT 
    FirstName, 
    LastName, 
    CONCAT(FirstName, ' ', LastName) AS FullName
FROM 
    Employees;
-- Write a SQL Query to display a column called TotalPrice that is the product (multiply them) of the UnitPrice and Quantity columns. Also display the OrderID, ProductID, UnitPrice, and Quantity columns. Order the data by OrderID and ProductID. Do NOT add a new column to the table.
SELECT 
    OrderID, 
    ProductID, 
    UnitPrice, 
    Quantity, 
    (UnitPrice * Quantity) AS TotalPrice
FROM 
    OrderDetails
ORDER BY 
    OrderID, 
    ProductID;


-- How many customers does the Customer table have? Write a SQL query to display ONE value only. Note, you will use an aggregate function to do this.
SELECT COUNT(*) AS TotalCustomers
FROM Customers;

-- . Write a query to display the first order ever made in the Orders table.
SELECT *
FROM Orders
ORDER BY OrderDate
LIMIT 1;

-- Write a SQL query to display a list of countries where the Northwind company has customers. This requires a Group By clause in your query.
SELECT Country
FROM Customers
GROUP BY Country;
-- Write a SQL query to display all the different values in the Customer table for ContactTitle, along with a count of each
SELECT ContactTitle, COUNT(*) AS TitleCount
FROM Customers
GROUP BY ContactTitle;
--  Write a SQL query to show the associated Supplier for each Product. Display the ProductID, ProductName, and CompanyName of the Supplier. Sort the records by ProductID. Note, you will need to JOIN the Suppliers table to the Products table by SupplierID. Hint: JOIN Categories ON Products.CategoryID = Categories.CategoryID

SELECT 
    p.ProductID, 
    p.ProductName, 
    s.CompanyName AS SupplierName
FROM 
    Products p
JOIN 
    Suppliers s ON p.SupplierID = s.SupplierID
ORDER BY 
    p.ProductID;
-- Write a SQL query to display a list of Orders that were made with OrderID less than 10200. Also display the Shipper that was used. Display the OrderID, OrderDate, and CompanyName of the Shipper. Sort the records by OrderID. Hint: Begin by writing a query that returns the information from the Orders table first. Then add your JOIN to get the columns from the Shippers table. Examine the Orders table to determine what column you will use for the JOIN.
SELECT 
    o.OrderID, 
    o.OrderDate, 
    s.CompanyName AS ShipperCompanyName
FROM 
    Orders o
JOIN 
    Shippers s ON o.ShipVia = s.ShipperID
WHERE 
    o.OrderID < 10200
ORDER BY 
    o.OrderID;

-- Write a query to return a list of the total number of products in each category. Sort the records in descending order by TotalProducts. Hint: This will require a JOIN between the  Products table and the Categories table. The query also requires use of the Group By  function. Start by writing a query that displays the CategoryName and all the ProductID associated with it, without grouping. Then add the Group By
SELECT 
    c.CategoryName, 
    COUNT(p.ProductID) AS TotalProducts
FROM 
    Categories c
JOIN 
    Products p ON c.CategoryID = p.CategoryID
GROUP BY 
    c.CategoryName
ORDER BY 
    TotalProducts DESC;
