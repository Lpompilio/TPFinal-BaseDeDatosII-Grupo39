USE EcommerceDB;
GO
-- ==========================================
-- TRIGGER: Descontar stock al registrar una venta
-- ==========================================
CREATE TRIGGER trg_DescontarStockVenta
ON DetalleVenta
AFTER INSERT
AS
BEGIN
    UPDATE p
    SET p.StockActual = p.StockActual - i.Cantidad
    FROM Producto p
    INNER JOIN inserted i ON p.IdProducto = i.IdProducto;
END;
GO