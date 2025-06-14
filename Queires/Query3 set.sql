-- Write a SQL query to display total Customers per Country and City
SELECT 
    Country, 
    City, 
    COUNT(*) AS TotalCustomers
FROM 
    Customers
GROUP BY 
    Country, 
    City;

-- Write a SQL query to determine which Products need to be ordered. Products that need to be ordered are those where UnitsInStock is less than or equal to the ReorderLevel.Sort the results by ProductID.
SELECT PRODUCTNAME 
FROM Products 
WHERE UNITSINSTOCK <= REORDERLEVEL
ORDER BY PRODUCTID;

-- Redefine SQL query number 22 to include columns UnitsInStock, ReOrderLevel, and Discontinued. This time, the Products that need to be ordered are those where UnitsInStock plus (+) UnitsOnOrder are less than or equal to ReOrderLevel and the Discontinued flag is false (0).

SELECT UNITSINSTOCK,REorderlevel, DIScontinued
FROM Products 
WHERE (UNITSINSTOCK+UNITSONORDER <= REORDERLEVEL) AND DISCONTINUED=0
ORDER BY PRODUCTID;

-- Write a SQL query to display a list of customers (CompanyName) by Region, sorted alphabetically. Within the same Region, customers should be sorted by CustomerID. Use a method that will place NULL values at the END of the list. HINT: Use a CASE Statement to do this.
Select COMPANYNAME from Customers order by region, CUSTOMERID;

-- Write a SQL query to display the three ship countries with the highest average freight, in descending order by average freight. HINT: You’ll use the Orders table, and using the Freight and ShipCountry columns.
select avg(FREIGHT) as averageFreight,SHIPCOUNTRY 
from orders 
group by SHIPCOUNTRY 
order by averageFreight desc 
limit 3;