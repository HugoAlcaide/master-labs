-- Se especifican únicamente las columnas necesarias para reducir lecturas,
-- memoria utilizada y datos transferidos al cliente.
SELECT
    h.SalesOrderID,
    h.OrderDate,
    d.ProductID,
    d.OrderQty,
    d.UnitPrice,
    p.Name AS ProductName
FROM SalesLT.SalesOrderHeader AS h
-- Los JOIN explícitos separan claramente las relaciones entre las tablas.
INNER JOIN SalesLT.SalesOrderDetail AS d
    ON d.SalesOrderID = h.SalesOrderID
INNER JOIN SalesLT.Product AS p
    ON p.ProductID = d.ProductID
-- El filtro directo sobre OrderDate permite aprovechar un índice sobre esa columna.
-- El formato yyyymmdd evita interpretaciones dependientes de la configuración regional.
WHERE h.OrderDate >= '20080101';

-- Índice opcional: evaluar con el plan de ejecución antes de crearlo.
-- Puede mejorar el filtro por fecha, pero aumenta el coste de INSERT, UPDATE y DELETE.
--
-- CREATE INDEX IX_SalesOrderHeader_OrderDate_SalesOrderID
-- ON SalesLT.SalesOrderHeader (OrderDate, SalesOrderID);