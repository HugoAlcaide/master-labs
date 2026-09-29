-- Remove security policy and function
 DROP SECURITY POLICY IF EXISTS CustomerRegionPolicy;
 DROP FUNCTION IF EXISTS Security.fn_RegionFilter;
 DROP SCHEMA IF EXISTS Security;

 -- Remove test users
 DROP USER IF EXISTS MaskedViewer;
 DROP USER IF EXISTS WestSalesRep;
 DROP USER IF EXISTS EastSalesRep;

 -- Drop tables
 DROP TABLE IF EXISTS dbo.Customers;
 DROP TABLE IF EXISTS dbo.Employees;