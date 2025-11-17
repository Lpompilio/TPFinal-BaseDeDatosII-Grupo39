CREATE VIEW vw_ComprasPorProveedor AS
SELECT 
    p.RazonSocial,
    COUNT(c.IdCompra) AS CantidadCompras,
    SUM(c.Total) AS TotalComprado
FROM Proveedor p
INNER JOIN Compra c ON p.IdProveedor = c.IdProveedor
GROUP BY p.RazonSocial;
GO
