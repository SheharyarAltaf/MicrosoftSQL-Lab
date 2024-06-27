
select * from Employees
select * from Customers
select * from Categories
select * from Orders



-----------------------Task1----------------------
------------------------------------------------

Create View Alpha AS
      Select C.CompanyName, C.Phone from Customers C 
      where C. CustomerID IN (
      Select O.CustomerID from Orders O where O.EmployeeID IN ( 
      Select E.EmployeeID from Employees E where E.Country = 'Germany') )

select * from Alpha

--------------------Task2--------------------------
---------------------------------------------------

Create View [2022-CS-721] As
     Select E.EmployeeID, E.FirstName, E.LastName 
	 from Employees E


Select * from [2022-CS-721]


-------------------Task3---------------------------
---------------------------------------------------


ALTER View [2022-CS-721] As
     Select E.EmployeeID, E.FirstName, E.LastName, E.PostalCode, E.Extension,E.Country 
	 from Employees E


Select * from [2022-CS-721]

------------------Task4---------------------------
--------------------------------------------------
Create View [21] AS 
       Select E.HomePhone, E.FirstName, E.City from Employees E


Select * from [21]


----------------Task5-------------------------------
----------------------------------------------------
Alter View [21] AS 
       Select E.FirstName+ ' ' +E.LastName AS FullName, E.City from Employees E


Select * from [21]


---------------Task6--------------------------------
---------------------------------------------------
Drop View Alpha, [2022-CS-721], [21]






