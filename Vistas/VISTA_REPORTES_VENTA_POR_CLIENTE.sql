CREATE VIEW V_Resumen_Ventas_Cliente AS
SELECT
    C.Nombre,
    C.Apellido,
    C.Dni,
    COUNT(V.IdVenta) AS CantidadDeVentas,
    ISNULL(SUM(V.Total), 0) AS TotalGastado
FROM
    Cliente AS C
LEFT JOIN
    Venta AS V ON C.IdCliente = V.IdCliente
GROUP BY
    C.IdCliente,
    C.Nombre,
    C.Apellido,
    C.Dni;
GO



