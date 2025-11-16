USE EcommerceDB;
GO

CREATE PROCEDURE sp_ListarVentasPorRangoFechas
(
    @FechaDesde DATE,
    @FechaHasta DATE
)
AS
BEGIN
    SET NOCOUNT ON;

    BEGIN TRY

        -- Validamos fechas
        IF @FechaDesde IS NULL OR @FechaHasta IS NULL
        BEGIN
            ;THROW 50020, 'Las fechas no pueden ser nulas.', 1;
            RETURN;
        END;

        IF @FechaDesde > @FechaHasta
        BEGIN
            ;THROW 50021, 'La fecha inicial no puede ser mayor que la fecha final.', 1;
            RETURN;
        END;

        SELECT 
            V.IdVenta,
            V.Fecha,
            V.Total,

            C.IdCliente,
            C.Nombre AS NombreCliente,
            C.Apellido AS ApellidoCliente,

            MP.Tipo AS MetodoDePago
        FROM 
            Venta AS V

        INNER JOIN 
            Cliente AS C ON V.IdCliente = C.IdCliente

        INNER JOIN 
            MetodoPago AS MP ON V.IdMetodoPago = MP.IdMetodoPago

        WHERE 
            V.Fecha BETWEEN @FechaDesde AND @FechaHasta

        ORDER BY 
            V.Fecha DESC, 
            V.IdVenta DESC;

    END TRY
    BEGIN CATCH
        PRINT 'Ocurrió un error al listar las ventas por rango de fechas.';
        ;THROW;
    END CATCH

END
GO
