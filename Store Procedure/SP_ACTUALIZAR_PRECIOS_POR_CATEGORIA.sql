USE EcommerceDB;
GO

CREATE PROCEDURE sp_ActualizarPreciosPorCategoria
(
    @IdCategoria INT,
    @PorcentajeCambio DECIMAL(5,2)
)
AS
BEGIN
    SET NOCOUNT ON;

    BEGIN TRY

        -- Verificamos si la categoría existe
        IF NOT EXISTS (SELECT 1 FROM Categoria WHERE IdCategoria = @IdCategoria)
        BEGIN
            ;THROW 50010, 'La categoría con el ID especificado no existe.', 1;
            RETURN;
        END;

        -- Validamos porcentaje
        IF @PorcentajeCambio = -100
        BEGIN
            ;THROW 50011, 'El porcentaje no puede ser -100.', 1;
            RETURN;
        END;

        -- Actualizamos precios
        UPDATE Producto
        SET Precio = Precio * (1 + @PorcentajeCambio / 100.0)
        WHERE IdCategoria = @IdCategoria;

    END TRY
    BEGIN CATCH
        PRINT 'Ocurrió un error al actualizar los precios por categoría.';
        ;THROW;
    END CATCH

END
GO
