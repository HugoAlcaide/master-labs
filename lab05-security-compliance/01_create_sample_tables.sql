-- Create tables for the exercise
 CREATE TABLE dbo.Employees (
     EmployeeID int PRIMARY KEY IDENTITY(1,1),
     FirstName nvarchar(50) NOT NULL,
     LastName nvarchar(50) NOT NULL,
     Email nvarchar(100) NOT NULL,
     SSN char(11) NOT NULL,
     Salary decimal(18,2) NOT NULL,
     Department nvarchar(50) NOT NULL
 );

 CREATE TABLE dbo.Customers (
     CustomerID int PRIMARY KEY IDENTITY(1,1),
     CompanyName nvarchar(100) NOT NULL,
     ContactName nvarchar(100) NOT NULL,
     Phone nvarchar(20) NOT NULL,
     CreditCardNumber nvarchar(19) NOT NULL,
     SalesRegion nvarchar(20) NOT NULL
 );

 -- Insert sample data
 INSERT INTO dbo.Employees (FirstName, LastName, Email, SSN, Salary, Department)
 VALUES 
     ('Sarah', 'Chen', 'sarah.chen@contoso.com', '123-45-6789', 95000.00, 'Engineering'),
     ('Marcus', 'Johnson', 'marcus.johnson@contoso.com', '234-56-7890', 75000.00, 'Engineering'),
     ('Emily', 'Williams', 'emily.williams@contoso.com', '345-67-8901', 82000.00, 'Sales'),
     ('David', 'Brown', 'david.brown@contoso.com', '456-78-9012', 68000.00, 'Sales'),
     ('Lisa', 'Garcia', 'lisa.garcia@contoso.com', '567-89-0123', 71000.00, 'HR');

 INSERT INTO dbo.Customers (CompanyName, ContactName, Phone, CreditCardNumber, SalesRegion)
 VALUES
     ('Northwind Traders', 'John Smith', '206-555-0100', '4111-1111-1111-1111', 'West'),
     ('Adventure Works', 'Jane Doe', '425-555-0150', '5500-0000-0000-0004', 'East'),
     ('Fabrikam Inc', 'Bob Wilson', '503-555-0175', '3400-0000-0000-009', 'West'),
     ('Contoso Ltd', 'Alice Brown', '360-555-0125', '6011-0000-0000-0004', 'East');