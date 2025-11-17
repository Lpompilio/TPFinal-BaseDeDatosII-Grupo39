USE EcommerceDB
GO

-- ==========================================
-- FUNCIÓN: Cantidad de productos por categoría
-- ==========================================

CREATE FUNCTION fn_CantidadProductosPorCategoria
(
    @IdCategoria INT
)
RETURNS INT
AS
BEGIN
    DECLARE @Resultado INT;

    SELECT @Resultado = COUNT(*)
    FROM Producto
    WHERE IdCategoria = @IdCategoria;

    RETURN @Resultado;
END;
GO
