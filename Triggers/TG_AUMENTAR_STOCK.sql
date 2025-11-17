USE EcommerceDB;
GO
-- ==========================================
-- TRIGGER: Aumentar stock al registrar una compra
-- ==========================================
CREATE TRIGGER trg_AumentarStockCompra
ON DetalleCompra
AFTER INSERT
AS
BEGIN
    UPDATE p
    SET p.StockActual = p.StockActual + i.Cantidad
    FROM Producto p
    INNER JOIN inserted i ON p.IdProducto = i.IdProducto;
END;
GO