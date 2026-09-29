-- Mask SSN to show only last 4 digits
 ALTER TABLE dbo.Employees
 ALTER COLUMN SSN ADD MASKED WITH (FUNCTION = 'partial(0, "XXX-XX-", 4)');

 -- Mask Salary with a random value
 ALTER TABLE dbo.Employees
 ALTER COLUMN Salary ADD MASKED WITH (FUNCTION = 'random(50000, 150000)');

 -- Mask Email to show first character and domain
 ALTER TABLE dbo.Employees
 ALTER COLUMN Email ADD MASKED WITH (FUNCTION = 'email()');

 -- Mask credit card to show only last 4 digits
 ALTER TABLE dbo.Customers
 ALTER COLUMN CreditCardNumber ADD MASKED WITH (FUNCTION = 'partial(0, "XXXX-XXXX-XXXX-", 4)');

 -- Mask phone number to show only last 4 digits
 ALTER TABLE dbo.Customers
 ALTER COLUMN Phone ADD MASKED WITH (FUNCTION = 'partial(0, "XXX-XXX-", 4)');

-- Create a user without UNMASK permission
 CREATE USER MaskedViewer WITHOUT LOGIN;
 GRANT SELECT ON dbo.Employees TO MaskedViewer;
 GRANT SELECT ON dbo.Customers TO MaskedViewer;

 -- Query as the masked user (data appears masked)
 EXECUTE AS USER = 'MaskedViewer';
 SELECT FirstName, LastName, Email, SSN, Salary FROM dbo.Employees;
 SELECT CompanyName, ContactName, Phone, CreditCardNumber FROM dbo.Customers;
 REVERT;

 -- Query as admin (data appears unmasked)
 SELECT FirstName, LastName, Email, SSN, Salary FROM dbo.Employees;