/*
    Procedure: dbo.usp_GetCustomerOrderSummary
    Purpose:   Retrieves customer order totals and the most recent order date.
    Author:    Development Team
*/

USE AdventureWorksLT;
GO

CREATE OR ALTER PROCEDURE dbo.usp_GetCustomerOrderSummary
    @CustomerID INT = NULL
AS
BEGIN
    SET NOCOUNT ON;

    BEGIN TRY
        SELECT
            c.CustomerID,
            CONCAT(c.FirstName, ' ', c.LastName) AS CustomerName,
            COUNT(DISTINCT soh.SalesOrderID) AS TotalNumberOfOrders,
            COALESCE(SUM(sod.LineTotal), 0.00) AS TotalOrderAmount,
            MAX(soh.OrderDate) AS LastOrderDate
        FROM SalesLT.Customer AS c
        LEFT JOIN SalesLT.SalesOrderHeader AS soh
            ON soh.CustomerID = c.CustomerID
        LEFT JOIN SalesLT.SalesOrderDetail AS sod
            ON sod.SalesOrderID = soh.SalesOrderID
        WHERE @CustomerID IS NULL
           OR c.CustomerID = @CustomerID
        GROUP BY
            c.CustomerID,
            c.FirstName,
            c.LastName
        ORDER BY
            c.CustomerID;
    END TRY
    BEGIN CATCH
        THROW;
    END CATCH;
END;
GO