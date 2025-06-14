use rakshi;
-- Create Table Categories
-- Create Table Categories
CREATE TABLE Categories (
    CategoryID INT NOT NULL,
    CategoryName VARCHAR(15) NOT NULL,
    Description VARCHAR(200),
    PRIMARY KEY (CategoryID)
);

-- Create Table CustomerGroupThresholds
CREATE TABLE CustomerGroupThresholds (
    CustomerGroupName VARCHAR(20),
    RangeBottom FLOAT,
    RangeTop FLOAT
);

-- Create Table Customers
CREATE TABLE Customers (
    CustomerID VARCHAR(5) NOT NULL,
    CompanyName VARCHAR(40) NOT NULL,
    ContactName VARCHAR(30),
    ContactTitle VARCHAR(30),
    Address VARCHAR(60),
    City VARCHAR(15),
    Region VARCHAR(15),
    PostalCode VARCHAR(10),
    Country VARCHAR(15),
    Phone VARCHAR(24),
    Fax VARCHAR(24),
    PRIMARY KEY (CustomerID)
);

-- Create Table Employees
CREATE TABLE Employees (
    EmployeeID INT NOT NULL,
    LastName VARCHAR(20) NOT NULL,
    FirstName VARCHAR(10) NOT NULL,
    Title VARCHAR(30),
    TitleOfCourtesy VARCHAR(25),
    BirthDATE DATE,
    HireDATE DATE,
    Address VARCHAR(60),
    City VARCHAR(15),
    Region VARCHAR(15),
    PostalCode VARCHAR(10),
    Country VARCHAR(15),
    HomePhone VARCHAR(24),
    Extension VARCHAR(4),
    Notes VARCHAR(500),
    ReportsTo INT,
    PhotoPath VARCHAR(255),
    PRIMARY KEY (EmployeeID),
    FOREIGN KEY (ReportsTo) REFERENCES Employees(EmployeeID)
);

-- Create Table Shippers
CREATE TABLE Shippers (
    ShipperID INT NOT NULL,
    CompanyName VARCHAR(40) NOT NULL,
    Phone VARCHAR(24),
    PRIMARY KEY (ShipperID)
);

-- Create Table Suppliers
CREATE TABLE Suppliers (
    SupplierID INT NOT NULL,
    CompanyName VARCHAR(40) NOT NULL,
    ContactName VARCHAR(30),
    ContactTitle VARCHAR(30),
    Address VARCHAR(60),
    City VARCHAR(15),
    Region VARCHAR(15),
    PostalCode VARCHAR(10),
    Country VARCHAR(15),
    Phone VARCHAR(24),
    Fax VARCHAR(24),
    HomePage VARCHAR(200),
    PRIMARY KEY (SupplierID)
);


-- Create Table Orders
CREATE TABLE Orders (
    OrderID INT NOT NULL,
    CustomerID VARCHAR(5) NOT NULL,
    EmployeeID INT,
    OrderDATE DATE,
    RequiredDATE DATE,
    ShippedDATE DATE,
    ShipVia INT,
    Freight FLOAT,
    ShipName VARCHAR(40),
    ShipAddress VARCHAR(60),
    ShipCity VARCHAR(15),
    ShipRegion VARCHAR(15),
    ShipPostalCode VARCHAR(10),
    ShipCountry VARCHAR(15),
    PRIMARY KEY (OrderID),
    FOREIGN KEY (CustomerID) REFERENCES customers(CustomerID),
    FOREIGN KEY (ShipVia) REFERENCES shippers(ShipperID),
    FOREIGN KEY (EmployeeID) REFERENCES employees(EmployeeID)
    
);

-- Create Table Products
CREATE TABLE Products (
    ProductID INT NOT NULL,
    ProductName VARCHAR(40) NOT NULL,
    SupplierID INT,
    CategoryID INT,
    QuantityPerUnit VARCHAR(20),
    UnitPrice FLOAT,
    UnitsInStock INT,
    UnitsOnOrder INT,
    ReorderLevel INT,
    Discontinued TINYINT(1) NOT NULL,
    PRIMARY KEY (ProductID),
    FOREIGN KEY (SupplierID) REFERENCES suppliers(SupplierID),
    FOREIGN KEY (CategoryID) REFERENCES categories(CategoryID)
    
);

-- Create Table OrderDetails
CREATE TABLE OrderDetails (
    OrderID INT NOT NULL,
    ProductID INT NOT NULL,
    UnitPrice FLOAT NOT NULL,
    Quantity INT NOT NULL,
    Discount FLOAT NOT NULL,
    PRIMARY KEY (OrderID, ProductID),
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID),
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);