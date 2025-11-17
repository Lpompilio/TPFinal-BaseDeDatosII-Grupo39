USE EcommerceDB;
GO

CREATE PROCEDURE sp_BuscarProductoPorNombre
    @Texto NVARCHAR(50)
AS
BEGIN
    SELECT 
        p.IdProducto,
        p.Nombre,
        p.Descripcion,
        p.Precio,
        p.StockActual,
        c.Nombre AS Categoria
    FROM Producto p
    INNER JOIN Categoria c ON p.IdCategoria = c.IdCategoria
    WHERE p.Nombre LIKE '%' + @Texto + '%'
       OR p.Descripcion LIKE '%' + @Texto + '%'
    ORDER BY p.Nombre ASC;
END;
GO
