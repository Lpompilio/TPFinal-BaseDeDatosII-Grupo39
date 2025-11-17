USE EcommerceDB
GO
-- ==========================================
-- FUNCIÓN: Total gastado por cliente
-- ==========================================

CREATE FUNCTION fn_TotalGastadoPorCliente
(
    @IdCliente INT
)
RETURNS DECIMAL(10,2)
AS
BEGIN
    DECLARE @Total DECIMAL(10,2);

    SELECT @Total = SUM(V.Total)
    FROM Venta V
    WHERE V.IdCliente = @IdCliente;

    RETURN ISNULL(@Total, 0);
END;
GO
