/*
    View:      dbo.vw_ProductSalesAnalysis
    Purpose:   Provides aggregated sales performance by product and category.
    Author:    Development Team
*/
USE AdventureWorksLT;
GO

CREATE OR ALTER VIEW dbo.vw_ProductSalesAnalysis
AS
SELECT
    p.Name AS ProductName,
    pc.Name AS CategoryName,
    SUM(sod.OrderQty) AS TotalQuantitySold,
    SUM(sod.LineTotal) AS TotalRevenue,
    AVG(sod.UnitPrice) AS AverageSalePrice,
    COUNT(DISTINCT sod.SalesOrderID) AS NumberOfOrders
FROM SalesLT.Product AS p
INNER JOIN SalesLT.ProductCategory AS pc
    ON pc.ProductCategoryID = p.ProductCategoryID
INNER JOIN SalesLT.SalesOrderDetail AS sod
    ON sod.ProductID = p.ProductID
GROUP BY
    p.ProductID,
    p.Name,
    pc.ProductCategoryID,
    pc.Name;
GO