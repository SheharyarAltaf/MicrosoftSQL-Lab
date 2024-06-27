
GO
/****** Object:  Table [dbo].[Suppliers]    Script Date: 01/22/2018 09:46:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Suppliers](
	[SupplierID] [int] IDENTITY(1,1) NOT NULL,
	[CompanyName] [nvarchar](40) NOT NULL,
	[ContactName] [nvarchar](30) NULL,
	[ContactTitle] [nvarchar](30) NULL,
	[Address] [nvarchar](60) NULL,
	[City] [nvarchar](15) NULL,
	[Region] [nvarchar](15) NULL,
	[PostalCode] [nvarchar](10) NULL,
	[Country] [nvarchar](15) NULL,
	[Phone] [nvarchar](24) NULL,
	[Fax] [nvarchar](24) NULL,
	[HomePage] [ntext] NULL,
 CONSTRAINT [PK_Suppliers] PRIMARY KEY CLUSTERED 
(
	[SupplierID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Shippers]    Script Date: 01/22/2018 09:46:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Shippers](
	[ShipperID] [int] IDENTITY(1,1) NOT NULL,
	[CompanyName] [nvarchar](40) NOT NULL,
	[Phone] [nvarchar](24) NULL,
 CONSTRAINT [PK_Shippers] PRIMARY KEY CLUSTERED 
(
	[ShipperID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Region]    Script Date: 01/22/2018 09:46:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Region](
	[RegionID] [int] NOT NULL,
	[RegionDescription] [nchar](50) NOT NULL,
 CONSTRAINT [PK_Region] PRIMARY KEY NONCLUSTERED 
(
	[RegionID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Employees]    Script Date: 01/22/2018 09:46:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Employees](
	[EmployeeID] [int] IDENTITY(1,1) NOT NULL,
	[LastName] [nvarchar](20) NOT NULL,
	[FirstName] [nvarchar](10) NOT NULL,
	[Title] [nvarchar](30) NULL,
	[TitleOfCourtesy] [nvarchar](25) NULL,
	[BirthDate] [datetime] NULL,
	[HireDate] [datetime] NULL,
	[Address] [nvarchar](60) NULL,
	[City] [nvarchar](15) NULL,
	[Region] [nvarchar](15) NULL,
	[PostalCode] [nvarchar](10) NULL,
	[Country] [nvarchar](15) NULL,
	[HomePhone] [nvarchar](24) NULL,
	[Extension] [nvarchar](4) NULL,
	[Photo] [image] NULL,
	[Notes] [ntext] NULL,
	[ReportsTo] [int] NULL,
	[PhotoPath] [nvarchar](255) NULL,
 CONSTRAINT [PK_Employees] PRIMARY KEY CLUSTERED 
(
	[EmployeeID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Customers]    Script Date: 01/22/2018 09:46:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customers](
	[CustomerID] [nchar](5) NOT NULL,
	[CompanyName] [nvarchar](40) NOT NULL,
	[ContactName] [nvarchar](30) NULL,
	[ContactTitle] [nvarchar](30) NULL,
	[Address] [nvarchar](60) NULL,
	[City] [nvarchar](15) NULL,
	[Region] [nvarchar](15) NULL,
	[PostalCode] [nvarchar](10) NULL,
	[Country] [nvarchar](15) NULL,
	[Phone] [nvarchar](24) NULL,
	[Fax] [nvarchar](24) NULL,
 CONSTRAINT [PK_Customers] PRIMARY KEY CLUSTERED 
(
	[CustomerID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CustomerDemographics]    Script Date: 01/22/2018 09:46:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CustomerDemographics](
	[CustomerTypeID] [nchar](10) NOT NULL,
	[CustomerDesc] [ntext] NULL,
 CONSTRAINT [PK_CustomerDemographics] PRIMARY KEY NONCLUSTERED 
(
	[CustomerTypeID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Categories]    Script Date: 01/22/2018 09:46:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categories](
	[CategoryID] [int] IDENTITY(1,1) NOT NULL,
	[CategoryName] [nvarchar](15) NOT NULL,
	[Description] [ntext] NULL,
	[Picture] [image] NULL,
 CONSTRAINT [PK_Categories] PRIMARY KEY CLUSTERED 
(
	[CategoryID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Territories]    Script Date: 01/22/2018 09:46:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Territories](
	[TerritoryID] [nvarchar](20) NOT NULL,
	[TerritoryDescription] [nchar](50) NOT NULL,
	[RegionID] [int] NOT NULL,
 CONSTRAINT [PK_Territories] PRIMARY KEY NONCLUSTERED 
(
	[TerritoryID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CustomerCustomerDemo]    Script Date: 01/22/2018 09:46:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CustomerCustomerDemo](
	[CustomerID] [nchar](5) NOT NULL,
	[CustomerTypeID] [nchar](10) NOT NULL,
 CONSTRAINT [PK_CustomerCustomerDemo] PRIMARY KEY NONCLUSTERED 
(
	[CustomerID] ASC,
	[CustomerTypeID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Products]    Script Date: 01/22/2018 09:46:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Products](
	[ProductID] [int] IDENTITY(1,1) NOT NULL,
	[ProductName] [nvarchar](40) NOT NULL,
	[SupplierID] [int] NULL,
	[CategoryID] [int] NULL,
	[QuantityPerUnit] [nvarchar](20) NULL,
	[UnitPrice] [money] NULL,
	[UnitsInStock] [smallint] NULL,
	[UnitsOnOrder] [smallint] NULL,
	[ReorderLevel] [smallint] NULL,
	[Discontinued] [bit] NOT NULL,
 CONSTRAINT [PK_Products] PRIMARY KEY CLUSTERED 
(
	[ProductID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Orders]    Script Date: 01/22/2018 09:46:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orders](
	[OrderID] [int] IDENTITY(1,1) NOT NULL,
	[CustomerID] [nchar](5) NULL,
	[EmployeeID] [int] NULL,
	[OrderDate] [datetime] NULL,
	[RequiredDate] [datetime] NULL,
	[ShippedDate] [datetime] NULL,
	[ShipVia] [int] NULL,
	[Freight] [money] NULL,
	[ShipName] [nvarchar](40) NULL,
	[ShipAddress] [nvarchar](60) NULL,
	[ShipCity] [nvarchar](15) NULL,
	[ShipRegion] [nvarchar](15) NULL,
	[ShipPostalCode] [nvarchar](10) NULL,
	[ShipCountry] [nvarchar](15) NULL,
 CONSTRAINT [PK_Orders] PRIMARY KEY CLUSTERED 
(
	[OrderID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Order Details]    Script Date: 01/22/2018 09:46:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order Details](
	[OrderID] [int] NOT NULL,
	[ProductID] [int] NOT NULL,
	[UnitPrice] [money] NOT NULL,
	[Quantity] [smallint] NOT NULL,
	[Discount] [real] NOT NULL,
 CONSTRAINT [PK_Order_Details] PRIMARY KEY CLUSTERED 
(
	[OrderID] ASC,
	[ProductID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EmployeeTerritories]    Script Date: 01/22/2018 09:46:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EmployeeTerritories](
	[EmployeeID] [int] NOT NULL,
	[TerritoryID] [nvarchar](20) NOT NULL,
 CONSTRAINT [PK_EmployeeTerritories] PRIMARY KEY NONCLUSTERED 
(
	[EmployeeID] ASC,
	[TerritoryID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Default [DF_Order_Details_UnitPrice]    Script Date: 01/22/2018 09:46:30 ******/
ALTER TABLE [dbo].[Order Details] ADD  CONSTRAINT [DF_Order_Details_UnitPrice]  DEFAULT (0) FOR [UnitPrice]
GO
/****** Object:  Default [DF_Order_Details_Quantity]    Script Date: 01/22/2018 09:46:30 ******/
ALTER TABLE [dbo].[Order Details] ADD  CONSTRAINT [DF_Order_Details_Quantity]  DEFAULT (1) FOR [Quantity]
GO
/****** Object:  Default [DF_Order_Details_Discount]    Script Date: 01/22/2018 09:46:30 ******/
ALTER TABLE [dbo].[Order Details] ADD  CONSTRAINT [DF_Order_Details_Discount]  DEFAULT (0) FOR [Discount]
GO
/****** Object:  Default [DF_Orders_Freight]    Script Date: 01/22/2018 09:46:30 ******/
ALTER TABLE [dbo].[Orders] ADD  CONSTRAINT [DF_Orders_Freight]  DEFAULT (0) FOR [Freight]
GO
/****** Object:  Default [DF_Products_UnitPrice]    Script Date: 01/22/2018 09:46:30 ******/
ALTER TABLE [dbo].[Products] ADD  CONSTRAINT [DF_Products_UnitPrice]  DEFAULT (0) FOR [UnitPrice]
GO
/****** Object:  Default [DF_Products_UnitsInStock]    Script Date: 01/22/2018 09:46:30 ******/
ALTER TABLE [dbo].[Products] ADD  CONSTRAINT [DF_Products_UnitsInStock]  DEFAULT (0) FOR [UnitsInStock]
GO
/****** Object:  Default [DF_Products_UnitsOnOrder]    Script Date: 01/22/2018 09:46:30 ******/
ALTER TABLE [dbo].[Products] ADD  CONSTRAINT [DF_Products_UnitsOnOrder]  DEFAULT (0) FOR [UnitsOnOrder]
GO
/****** Object:  Default [DF_Products_ReorderLevel]    Script Date: 01/22/2018 09:46:30 ******/
ALTER TABLE [dbo].[Products] ADD  CONSTRAINT [DF_Products_ReorderLevel]  DEFAULT (0) FOR [ReorderLevel]
GO
/****** Object:  Default [DF_Products_Discontinued]    Script Date: 01/22/2018 09:46:30 ******/
ALTER TABLE [dbo].[Products] ADD  CONSTRAINT [DF_Products_Discontinued]  DEFAULT (0) FOR [Discontinued]
GO
/****** Object:  Check [CK_Birthdate]    Script Date: 01/22/2018 09:46:30 ******/
ALTER TABLE [dbo].[Employees]  WITH NOCHECK ADD  CONSTRAINT [CK_Birthdate] CHECK  (([BirthDate] < getdate()))
GO
ALTER TABLE [dbo].[Employees] CHECK CONSTRAINT [CK_Birthdate]
GO
/****** Object:  Check [CK_Discount]    Script Date: 01/22/2018 09:46:30 ******/
ALTER TABLE [dbo].[Order Details]  WITH NOCHECK ADD  CONSTRAINT [CK_Discount] CHECK  (([Discount] >= 0 and [Discount] <= 1))
GO
ALTER TABLE [dbo].[Order Details] CHECK CONSTRAINT [CK_Discount]
GO
/****** Object:  Check [CK_Quantity]    Script Date: 01/22/2018 09:46:30 ******/
ALTER TABLE [dbo].[Order Details]  WITH NOCHECK ADD  CONSTRAINT [CK_Quantity] CHECK  (([Quantity] > 0))
GO
ALTER TABLE [dbo].[Order Details] CHECK CONSTRAINT [CK_Quantity]
GO
/****** Object:  Check [CK_UnitPrice]    Script Date: 01/22/2018 09:46:30 ******/
ALTER TABLE [dbo].[Order Details]  WITH NOCHECK ADD  CONSTRAINT [CK_UnitPrice] CHECK  (([UnitPrice] >= 0))
GO
ALTER TABLE [dbo].[Order Details] CHECK CONSTRAINT [CK_UnitPrice]
GO
/****** Object:  Check [CK_Products_UnitPrice]    Script Date: 01/22/2018 09:46:30 ******/
ALTER TABLE [dbo].[Products]  WITH NOCHECK ADD  CONSTRAINT [CK_Products_UnitPrice] CHECK  (([UnitPrice] >= 0))
GO
ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [CK_Products_UnitPrice]
GO
/****** Object:  Check [CK_ReorderLevel]    Script Date: 01/22/2018 09:46:30 ******/
ALTER TABLE [dbo].[Products]  WITH NOCHECK ADD  CONSTRAINT [CK_ReorderLevel] CHECK  (([ReorderLevel] >= 0))
GO
ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [CK_ReorderLevel]
GO
/****** Object:  Check [CK_UnitsInStock]    Script Date: 01/22/2018 09:46:30 ******/
ALTER TABLE [dbo].[Products]  WITH NOCHECK ADD  CONSTRAINT [CK_UnitsInStock] CHECK  (([UnitsInStock] >= 0))
GO
ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [CK_UnitsInStock]
GO
/****** Object:  Check [CK_UnitsOnOrder]    Script Date: 01/22/2018 09:46:30 ******/
ALTER TABLE [dbo].[Products]  WITH NOCHECK ADD  CONSTRAINT [CK_UnitsOnOrder] CHECK  (([UnitsOnOrder] >= 0))
GO
ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [CK_UnitsOnOrder]
GO
/****** Object:  ForeignKey [FK_CustomerCustomerDemo]    Script Date: 01/22/2018 09:46:30 ******/
ALTER TABLE [dbo].[CustomerCustomerDemo]  WITH CHECK ADD  CONSTRAINT [FK_CustomerCustomerDemo] FOREIGN KEY([CustomerTypeID])
REFERENCES [dbo].[CustomerDemographics] ([CustomerTypeID])
GO
ALTER TABLE [dbo].[CustomerCustomerDemo] CHECK CONSTRAINT [FK_CustomerCustomerDemo]
GO
/****** Object:  ForeignKey [FK_CustomerCustomerDemo_Customers]    Script Date: 01/22/2018 09:46:30 ******/
ALTER TABLE [dbo].[CustomerCustomerDemo]  WITH CHECK ADD  CONSTRAINT [FK_CustomerCustomerDemo_Customers] FOREIGN KEY([CustomerID])
REFERENCES [dbo].[Customers] ([CustomerID])
GO
ALTER TABLE [dbo].[CustomerCustomerDemo] CHECK CONSTRAINT [FK_CustomerCustomerDemo_Customers]
GO
/****** Object:  ForeignKey [FK_Employees_Employees]    Script Date: 01/22/2018 09:46:30 ******/
ALTER TABLE [dbo].[Employees]  WITH NOCHECK ADD  CONSTRAINT [FK_Employees_Employees] FOREIGN KEY([ReportsTo])
REFERENCES [dbo].[Employees] ([EmployeeID])
GO
ALTER TABLE [dbo].[Employees] CHECK CONSTRAINT [FK_Employees_Employees]
GO
/****** Object:  ForeignKey [FK_EmployeeTerritories_Employees]    Script Date: 01/22/2018 09:46:30 ******/
ALTER TABLE [dbo].[EmployeeTerritories]  WITH CHECK ADD  CONSTRAINT [FK_EmployeeTerritories_Employees] FOREIGN KEY([EmployeeID])
REFERENCES [dbo].[Employees] ([EmployeeID])
GO
ALTER TABLE [dbo].[EmployeeTerritories] CHECK CONSTRAINT [FK_EmployeeTerritories_Employees]
GO
/****** Object:  ForeignKey [FK_EmployeeTerritories_Territories]    Script Date: 01/22/2018 09:46:30 ******/
ALTER TABLE [dbo].[EmployeeTerritories]  WITH CHECK ADD  CONSTRAINT [FK_EmployeeTerritories_Territories] FOREIGN KEY([TerritoryID])
REFERENCES [dbo].[Territories] ([TerritoryID])
GO
ALTER TABLE [dbo].[EmployeeTerritories] CHECK CONSTRAINT [FK_EmployeeTerritories_Territories]
GO
/****** Object:  ForeignKey [FK_Order_Details_Orders]    Script Date: 01/22/2018 09:46:30 ******/
ALTER TABLE [dbo].[Order Details]  WITH NOCHECK ADD  CONSTRAINT [FK_Order_Details_Orders] FOREIGN KEY([OrderID])
REFERENCES [dbo].[Orders] ([OrderID])
GO
ALTER TABLE [dbo].[Order Details] CHECK CONSTRAINT [FK_Order_Details_Orders]
GO
/****** Object:  ForeignKey [FK_Order_Details_Products]    Script Date: 01/22/2018 09:46:30 ******/
ALTER TABLE [dbo].[Order Details]  WITH NOCHECK ADD  CONSTRAINT [FK_Order_Details_Products] FOREIGN KEY([ProductID])
REFERENCES [dbo].[Products] ([ProductID])
GO
ALTER TABLE [dbo].[Order Details] CHECK CONSTRAINT [FK_Order_Details_Products]
GO
/****** Object:  ForeignKey [FK_Orders_Customers]    Script Date: 01/22/2018 09:46:30 ******/
ALTER TABLE [dbo].[Orders]  WITH NOCHECK ADD  CONSTRAINT [FK_Orders_Customers] FOREIGN KEY([CustomerID])
REFERENCES [dbo].[Customers] ([CustomerID])
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_Orders_Customers]
GO
/****** Object:  ForeignKey [FK_Orders_Employees]    Script Date: 01/22/2018 09:46:30 ******/
ALTER TABLE [dbo].[Orders]  WITH NOCHECK ADD  CONSTRAINT [FK_Orders_Employees] FOREIGN KEY([EmployeeID])
REFERENCES [dbo].[Employees] ([EmployeeID])
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_Orders_Employees]
GO
/****** Object:  ForeignKey [FK_Orders_Shippers]    Script Date: 01/22/2018 09:46:30 ******/
ALTER TABLE [dbo].[Orders]  WITH NOCHECK ADD  CONSTRAINT [FK_Orders_Shippers] FOREIGN KEY([ShipVia])
REFERENCES [dbo].[Shippers] ([ShipperID])
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_Orders_Shippers]
GO
/****** Object:  ForeignKey [FK_Products_Categories]    Script Date: 01/22/2018 09:46:30 ******/
ALTER TABLE [dbo].[Products]  WITH NOCHECK ADD  CONSTRAINT [FK_Products_Categories] FOREIGN KEY([CategoryID])
REFERENCES [dbo].[Categories] ([CategoryID])
GO
ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [FK_Products_Categories]
GO
/****** Object:  ForeignKey [FK_Products_Suppliers]    Script Date: 01/22/2018 09:46:30 ******/
ALTER TABLE [dbo].[Products]  WITH NOCHECK ADD  CONSTRAINT [FK_Products_Suppliers] FOREIGN KEY([SupplierID])
REFERENCES [dbo].[Suppliers] ([SupplierID])
GO
ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [FK_Products_Suppliers]
GO
/****** Object:  ForeignKey [FK_Territories_Region]    Script Date: 01/22/2018 09:46:30 ******/
ALTER TABLE [dbo].[Territories]  WITH CHECK ADD  CONSTRAINT [FK_Territories_Region] FOREIGN KEY([RegionID])
REFERENCES [dbo].[Region] ([RegionID])
GO
ALTER TABLE [dbo].[Territories] CHECK CONSTRAINT [FK_Territories_Region]
GO


---------------------------------------------
---------------------------------------------
--------------------Lab 6--------------------
---------------------------------------------
---------------------------------------------
select * from orders
select * from customers
select * from Employees
select * from Products
select * from Shippers
select * from [Order Details]

--1 Return customers and their orders, including customers who placed no orders (CustomerID, OrderID, OrderDate)
SELECT c.CustomerID, o.OrderID, o.OrderDate
FROM customers c, orders o
WHERE c.CustomerID = o.CustomerID
UNION
SELECT c.CustomerID, NULL AS OrderID, NULL AS OrderDate
FROM customers c
WHERE c.CustomerID NOT IN (SELECT CustomerID FROM orders)

--2) Report only those customer IDs who never placed any order. (CustomerID, OrderID, OrderDate)
SELECT CustomerID 
FROM Customers 
WHERE CustomerID NOT IN (SELECT CustomerID FROM Orders)

--3) Report those customers who placed orders on July,1997. (CustomerID, OrderID, OrderDate)
SELECT CustomerID, OrderID, OrderDate 
FROM Orders 
WHERE YEAR(OrderDate) = 1997 AND MONTH(OrderDate) = 7

--4) Report the total orders of each customer. (customerID, totalorders)
SELECT Customers.CustomerID, COUNT(Orders.OrderID) AS TotalOrders
FROM Customers, Orders, [Order Details]
WHERE Customers.CustomerID = Orders.CustomerID
  AND Orders.OrderID = [Order Details].OrderID
GROUP BY Customers.CustomerID


--5) Write a query to generate a five copies of each employee. (EmployeeID, FirstName, LastName)
SELECT EmployeeID, FirstName, LastName
FROM Employees
UNION ALL
SELECT EmployeeID, FirstName, LastName
FROM employees
UNION ALL
SELECT EmployeeID, FirstName, LastName
FROM Employees
UNION ALL
SELECT EmployeeID, FirstName, LastName
FROM Employees
UNION ALL
SELECT EmployeeID, FirstName, LastName
FROM employees

--6) List all the products whose price is more than average price.
SELECT ProductID, ProductName 
FROM Products  
WHERE UnitPrice > (SELECT AVG(UnitPrice) FROM Products) 

--7) Find the second highest price of product.
SELECT MAX(UnitPrice) 
FROM Products 
WHERE UnitPrice < (SELECT MAX(UnitPrice) FROM Products) 

--8) Write a query that returns a row for each employee with a hire day in the range 04-07-1992 through 04-08-1993. (EmployeeID, Date)
SELECT EmployeeID, HireDate AS Date
FROM Employees
WHERE HireDate BETWEEN '1992-04-07' AND '1993-04-08'

--9) Return USA customers, and for each customer return the total number of orders and total quantities.  (CustomerID, Totalorders, totalquantity)
SELECT Customers.CustomerID, 
       COUNT(Orders.OrderID) AS TotalOrders, 
       SUM([Order Details].Quantity) AS TotalQuantity
FROM Customers, Orders, [Order Details]
WHERE Customers.CustomerID = Orders.CustomerID
  AND Orders.OrderID = [Order Details].OrderID
  AND Customers.Country = 'USA'
GROUP BY Customers.CustomerID


/*10) Write a query that returns all customers in the output, but matches them with their respective orders
only if they were placed on July 04,1997. (CustomerID, CompanyName, OrderID, Orderdate)*/
SELECT c.CustomerID, c.CompanyName, o.OrderID, o.OrderDate FROM Customers c, Orders o 
WHERE c.CustomerID = (SELECT CustomerID FROM Orders WHERE OrderDate = '1997-07-04')



--11) Are there any employees who are older than their managers?
--Let Nancy Davolio is Manager with EmployeeID = 1
SELECT EmployeeID, FirstName, Employee_age  FROM Employees 
WHERE Employee_age > (SELECT DATEDIFF(year, (Select BirthDate from employees where EmployeeID = 1), GETDATE()))


--12) List that names of employees and their ages. (EmployeeName, Age, Manager Age)
ALTER TABLE Employees ADD Employee_Age int --Make new column as Employee_Age for Employee

UPDATE Employees SET Employee_Age =  ( SELECT DATEDIFF(year, (Select BirthDate from employees where EmployeeID = 1), GETDATE()) ) WHERE EmployeeID = 1
UPDATE Employees SET Employee_Age =  ( SELECT DATEDIFF(year, (Select BirthDate from employees where EmployeeID = 2), GETDATE()) ) WHERE EmployeeID = 2
UPDATE Employees SET Employee_Age =  ( SELECT DATEDIFF(year, (Select BirthDate from employees where EmployeeID = 3), GETDATE()) ) WHERE EmployeeID = 3
UPDATE Employees SET Employee_Age =  ( SELECT DATEDIFF(year, (Select BirthDate from employees where EmployeeID = 4), GETDATE()) ) WHERE EmployeeID = 4
UPDATE Employees SET Employee_Age =  ( SELECT DATEDIFF(year, (Select BirthDate from employees where EmployeeID = 5), GETDATE()) ) WHERE EmployeeID = 5
UPDATE Employees SET Employee_Age =  ( SELECT DATEDIFF(year, (Select BirthDate from employees where EmployeeID = 6), GETDATE()) ) WHERE EmployeeID = 6
UPDATE Employees SET Employee_Age =  ( SELECT DATEDIFF(year, (Select BirthDate from employees where EmployeeID = 7), GETDATE()) ) WHERE EmployeeID = 7
UPDATE Employees SET Employee_Age =  ( SELECT DATEDIFF(year, (Select BirthDate from employees where EmployeeID = 8), GETDATE()) ) WHERE EmployeeID = 8
UPDATE Employees SET Employee_Age =  ( SELECT DATEDIFF(year, (Select BirthDate from employees where EmployeeID = 9), GETDATE()) ) WHERE EmployeeID = 9
SELECT Firstname+LastName AS FullName , EmployeeID, Employee_Age FROM Employees


--13) List the names of products which were ordered on 8th August 1997. (ProductName, OrderDate)
SELECT OrderDate, ProductName FROM Orders, Products WHERE ProductID IN (
SELECT ProductID FROM [Order Details] WHERE OrderID = (
SELECT OrderID FROM Orders WHERE OrderDate = '1997-08-08') )


--14) List the addresses, cities, countries of all orders which were serviced by Anne and were shipped late. (Address, City, Country)
SELECT ShipAddress, ShipCity, ShipCountry 
FROM Orders 
WHERE  EmployeeID IN (SELECT EmployeeID FROM Employees  WHERE FirstName = 'Anne') --serviced by Anne
AND ShippedDate > RequiredDate                                                    --and shipped late as well 



--15) List all countries to which Chocolade have been shipped. (Country)
SELECT ShipCountry FROM Orders WHERE OrderID IN (
SELECT OrderID FROM [Order Details] WHERE ProductID = ( SELECT ProductID FROM Products WHERE ProductName = 'Chocolade'))