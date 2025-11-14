CREATE VIEW v_ProductosConStockBajo
AS
SELECT
    IdProducto,
    Nombre,
    StockActual
FROM
    Producto
WHERE
    StockActual < 5;
GO




SELECT * FROM v_ProductosConStockBajo; -- Para ver esta vista