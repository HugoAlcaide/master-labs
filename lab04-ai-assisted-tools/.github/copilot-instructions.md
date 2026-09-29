 # T-SQL Development Guidelines for Copilot

 ## Naming Conventions
 - Tables: PascalCase, singular form (Customer, Product, SalesOrder)
 - Columns: PascalCase (FirstName, OrderDate, UnitPrice)
 - Stored procedures: usp_ActionEntity (usp_GetCustomerOrders, usp_InsertProduct)
 - Views: vw_EntityDescription (vw_ActiveCustomers, vw_ProductInventory)
 - Indexes: IX_TableName_ColumnName

 ## T-SQL Style Guidelines
 - Always use explicit column lists in SELECT statements (avoid SELECT *)
 - Include schema prefix for all objects (SalesLT.Product, SalesLT.Customer)
 - Use ANSI JOIN syntax (INNER JOIN, LEFT JOIN) instead of comma-separated tables
 - Include SET NOCOUNT ON at the beginning of stored procedures
 - Use TRY...CATCH blocks for error handling in stored procedures

 ## Security Requirements
 - Use parameterized queries, never concatenate user input
 - Never include actual credentials or connection strings in code
 - Use least-privilege principles for GRANT statements

 ## Comments
 - Include a header comment with procedure name, purpose, and author
 - Add inline comments for complex logic