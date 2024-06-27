
select * from Employees
select * from Customers
select * from Categories
select * from Orders









create table Audit(
        CustomerNumber varchar(255) NOT NULL,
		CustomerName varchar(255) NOT NULL,
		DateForInsertion Date,
		TypeOfAudit varchar(10),
		City varchar(255),
		Country varchar(255)
);
 select * from Customers
 select * from Audit


-----------------Question:1------------------------


CREATE TRIGGER insert_triger
ON customers
AFTER INSERT
AS
BEGIN
  INSERT INTO C_Audit (CustomerNumber, CustomerName, DateForInsertion, TypeOfAudit, City, Country)
  SELECT I.CustomerID, I.CompanyName, GETDATE(), 'insert', I.City, I.Country
  FROM inserted I
END

INSERT INTO Customers (CustomerID, CompanyName, City, Country)
VALUES (12323, 'Shery','Lahore','Pakistan')
Select * from C.Audit


-------------Question:2----------

CREATE TRIGGER update_triger
ON customers
AFTER UPDATE
AS
BEGIN
  INSERT INTO Audit (CustomerNumber, CustomerName, DateForInsertion, TypeOfAudit, City, Country)
  SELECT I.Phone, I.CompanyName, GETDATE(), 'update', I.City, I.Country
  FROM inserted I
END

UPDATE Customers
SET CompanyName = 'Messam'
WHERE CustomerID = 'AROUT'
Select * from Audit

----------------Question3--------------


CREATE TRIGGER delete_triger
ON customers
AFTER DELETE
AS
BEGIN
  INSERT INTO Audit (CustomerNumber, CustomerName, DateForInsertion, TypeOfAudit, City, Country)
  SELECT D.Phone, D.CompanyName, GETDATE(), 'delete', D.City, D.Country
  FROM DELETED D
END
	DELETE FROM customers WHERE Phone = '9876543210';
	Select * from Audit
	Select *from Customers



CREATE table Employee_Audit(
        FirstName varchar(255) NOT NULL,
		LastName varchar(255) NOT NULL,
		TypeOfAudit varchar(10),
		OfficeCode varchar(255),
		JobTitle varchar(255)
);

Select * from Employee_Audit
Select * from Employees


------------------------------Question:4--------------------



CREATE TRIGGER employee_insert_audit_trigger
ON employees
AFTER INSERT
AS
BEGIN
   INSERT INTO Employee_Audit(FirstName, LastName,TypeOfAudit, OfficeCode, JobTitle)
   SELECT I.FirstName, I.LastName, 'insert',I.PostalCode,I.Title
   From Inserted I
END

/*Question:5
Write a Trigger on Employee Table that will invoke whenever a new entry is being updated
in the table.*/

CREATE TRIGGER employee_update_audit_trigger
ON employees
AFTER UPDATE
AS
BEGIN
   INSERT INTO Employee_Audit(FirstName, LastName,TypeOfAudit, OfficeCode, JobTitle)
   SELECT I.FirstName, I.LastName, 'UPDATE',I.PostalCode,I.Title
   From inserted I
END


/*Question:6
Write a Trigger on Employee Table that will invoke whenever any entry is being deleted
from the table.*/

CREATE TRIGGER employee_delete_audit_trigger
ON employees
AFTER DELETE
AS
BEGIN
   INSERT INTO Employee_Audit(FirstName, LastName,TypeOfAudit, OfficeCode, JobTitle)
   SELECT d.FirstName, d.LastName, 'delete',d.PostalCode,d.Title
   From deleted d
END 


/*Question:7
Write a query to disable all triggers created above.*/

DISABLE Trigger ALL ON Customers;
DISABLE Trigger ALL ON Employees;

/*Question:8
Write a query to enable insert triggers created above.*/
ENABLE Trigger ALL ON Customers;
ENABLE Trigger ALL ON Employees;