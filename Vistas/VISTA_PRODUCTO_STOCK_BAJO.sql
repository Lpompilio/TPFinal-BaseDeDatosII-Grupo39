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




SELECT * FROM V_Productos_Stock_Bajo; -- Para ver esta vista