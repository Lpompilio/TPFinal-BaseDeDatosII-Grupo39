USE EcommerceDB;
GO
-- =======================================================
-- TRIGGER: Reintegrar stock al ELIMINAR un detalle de venta
-- =======================================================
CREATE TRIGGER trg_ReintegrarStockVenta
ON DetalleVenta
AFTER DELETE  
AS
BEGIN
    UPDATE p
    SET p.StockActual = p.StockActual + d.Cantidad -- Se SUMA (reintegra) el stock
    FROM Producto p
    INNER JOIN deleted d ON p.IdProducto = d.IdProducto;
END;

GO

