----------------Query1-----------------------
SELECT 
    p.ProductName,
    c.CategoryName,
    s.CompanyName AS SupplierName
FROM 
    Products p
JOIN 
    Categories c ON p.CategoryID = c.CategoryID
JOIN 
    Suppliers s ON p.SupplierID = s.SupplierID;


	------------Query2--------------------

Create view ProductDetails
Select p.ProductName, p.UnitPrice, p.UnitInStocks, p.CataoryName
From products p
Select *From ProductDetails




CREATE VIEW ProductDetails1 As
SELECT ProductName, UnitPrice, UnitsInStock, CategoryName
FROM Products
INNER JOIN Categories ON Products.CategoryID = Categories.CategoryID;
 -----------Query3------------------

Write a trigger named UpdateStock:
sql
Copy code
CREATE TRIGGER UpdateStock
AFTER INSERT ON OrderDetails
FOR EACH ROW
BEGIN
    UPDATE Products
    SET UnitsInStock = UnitsInStock - NEW.Quantity
    WHERE ProductID = NEW.ProductID;
END;




------------------Query4--------------------
--------------------------------------------

SELECT Employees.EmployeeID, Employees.LastName, Employees.FirstName, Orders.OrderID, Orders.OrderDate
FROM Employees
INNER JOIN Orders ON Employees.EmployeeID = Orders.EmployeeID;
----------------Query5-------------------------
-----------------------------------------------

SELECT Customers.CustomerID, Customers.CompanyName, Customers.ContactName
FROM Customers
INNER JOIN Orders ON Customers.CustomerID = Orders.CustomerID
GROUP BY Customers.CustomerID, Customers.CompanyName, Customers.ContactName
HAVING SUM(Orders.Freight) > 10000;

---------------
CREATE VIEW CategorySales1 As
SELECT Categories.CategoryName, SUM(OrderDetails.Quantity * OrderDetails.UnitPrice) AS TotalSales
FROM OrderDetails
INNER JOIN Products ON OrderDetails.ProductID = Products.ProductID
INNER JOIN Categories ON Products.CategoryID = Categories.CategoryID
GROUP BY Categories.CategoryName;


CREATE TRIGGER UpdateOrderTotal
AFTER INSERT ON OrderDetails
FOR EACH ROW
BEGIN
    UPDATE Orders
    SET OrderTotal = (SELECT SUM(Quantity * UnitPrice) FROM OrderDetails WHERE OrderID = NEW.OrderID)
    WHERE OrderID = NEW.OrderID;

