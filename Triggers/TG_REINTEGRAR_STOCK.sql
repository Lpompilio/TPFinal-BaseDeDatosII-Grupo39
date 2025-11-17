USE EcommerceDB;
GO
-- =======================================================
-- TRIGGER: Reintegrar stock al ELIMINAR un detalle de venta
-- =======================================================
CREATE TRIGGER trg_ReintegrarStockVenta
ON DetalleVenta
AFTER DELETE  -- Se dispara DESPUÉS de una ELIMINACIÓN
AS
BEGIN
    -- La tabla especial 'deleted' contiene los datos 
    -- de la(s) fila(s) que acaban de ser borradas.

    UPDATE p
    SET p.StockActual = p.StockActual + d.Cantidad -- Se SUMA (reintegra) el stock
    FROM Producto p
    INNER JOIN deleted d ON p.IdProducto = d.IdProducto;
END;
GO