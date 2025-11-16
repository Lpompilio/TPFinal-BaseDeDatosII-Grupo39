USE EcommerceDB;
GO

CREATE PROCEDURE sp_ListarVentasPorCliente
(
    @IdCliente INT
)
AS
BEGIN
    SET NOCOUNT ON;

    BEGIN TRY
        
        -- Verificamos si el cliente existe
        IF NOT EXISTS (SELECT 1 FROM Cliente WHERE IdCliente = @IdCliente)
        BEGIN
            -- Si no existe, lanzamos un error personalizado
            ;THROW 50001, 'El cliente con el ID especificado no existe.', 1;
            RETURN;
        END

        SELECT 
            V.IdVenta,
            V.Fecha,
            V.Total,
 
            C.Nombre AS NombreCliente,
            C.Apellido AS ApellidoCliente,
            C.Dni AS DniCliente,
            
            MP.Tipo AS MetodoDePago
            
        FROM 
            Venta AS V
        
        INNER JOIN 
            Cliente AS C ON V.IdCliente = C.IdCliente
        
        INNER JOIN 
            MetodoPago AS MP ON V.IdMetodoPago = MP.IdMetodoPago
            
        WHERE 
            V.IdCliente = @IdCliente
            
        ORDER BY
            V.Fecha DESC;

    END TRY
    BEGIN CATCH
        PRINT 'Ocurrió un error al listar las ventas.';
        ;THROW;
    END CATCH

END
GO