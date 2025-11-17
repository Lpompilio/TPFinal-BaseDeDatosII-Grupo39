CREATE VIEW vw_ComprasPorProveedor AS
SELECT 
    p.RazonSocial,
    COUNT(c.IdCompra) AS CantidadCompras,
    SUM(c.Total) AS TotalComprado
FROM Proveedor p
INNER JOIN Compra c ON p.IdProveedor = c.IdProveedor
GROUP BY p.RazonSocial;
GO

-- Para Mostrar la Vista

SELECT * FROM vw_ComprasPorProveedor;

-- Para filtrar datos dentro de la vista

SELECT *
FROM vw_ComprasPorProveedor
WHERE RazonSocial = 'TechWorld SA';
