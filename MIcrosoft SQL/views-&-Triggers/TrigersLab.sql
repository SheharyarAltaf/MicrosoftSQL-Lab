CREATE Table CustomerAudit(
    CustomerNumber int,
    CustomerName varchar (255),
    DateofInsertion DATE,
    TypeofAudit varchar (10),
    City varchar (255),
    Country varchar (255)
)

CREATE TRIGGER trg_Customer_Insert
ON Customers
AFTER INSERT
AS
BEGIN
    SET NOCOUNT ON;

    INSERT INTO CustomerAudit (CustomerNumber, CustomerName, DateofInsertion, TypeOfAudit, City, Country)
    SELECT CustomerID, CompanyName, GETDATE(), 'insert', City, Country
    FROM inserted;
END;

INSERT INTO Customers

VALUES
( 
 1553,'gakeel','Shakeel','Raheel','KSK','KSK','KSK','','','',''
)

Select * FROM CustomerAudit

UPDATE [Customers]
SET
    CompanyName = 'Musa'
WHERE
    CompanyName = 'Wakeel'

	Select * FROM Customers Where CompanyName in ('Musa','Wakeel')

	Create Trigger CustomerDelete
ON Customers 
After Delete 
AS
BEGIN
    Insert INTO CustomerAudit
    Select CustomerID,CompanyName,GETDATE(),'Delete',City,Country FROM deleted
    END

	DELETE FROm Customers
Where CompanyName = 'gakeel'

Create Table EmployeeAudit(
    FirstName varchar(255),
    LastName varchar (255),
    Email varchar(255),
    TypeofAudit varchar(255),
    OfficeCode varchar(29),
    JobTitle varchar(255))

	CREATE Trigger InsertEmployees
 ON Employees
 After INSERT
 AS 

BEGIN
    INSERT INTO EmployeeAudit 
    Select FirstName, LastName, '@none', 'insert', PostalCode, Title
    FROM inserted
END

Insert INto Employees
(FirstName,LastName,PostalCode,Title)
Values('Pakora','Khan','52110','Data Guy')
Select * FROM EmployeeAudit

CREATE Trigger UpdateEmployees
 ON Employees
 After UPdate
 
 AS 

BEGIN
    INSERT INTO EmployeeAudit 
    Select FirstName, LastName, '@none', 'update', PostalCode, Title
    FROM inserted
END

UPDATE [Employees]
SET
FirstName = 'Sheryar' 
WHERE  FirstName = 'Sheery' 

CREATE Trigger DelEmployees
 ON Employees
 After Delete
 AS 

BEGIN
    INSERT INTO EmployeeAudit 
    Select FirstName, LastName, '@none', 'delete', PostalCode, Title
    FROM deleted
    
END


DISABLE TRIGGER DelEmployees  ON Employees;
DISABLE TRIGGER InsertEmployees  ON Employees;
DISABLE TRIGGER UpdateEmployees  ON Employees;



Enable TRIGGER InsertEmployees  ON Employees;
Enable TRIGGER UpdateEmployees  ON Employees;
Enable TRIGGER DelEmployees  ON Employees;