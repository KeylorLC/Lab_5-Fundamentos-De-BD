
CREATE PROCEDURE ActualizarAutor
    @CodigoAutor INT,
    @NombreNuevo VARCHAR(30)
AS
BEGIN
    UPDATE BIBLIOTECA.AUTOR
    SET NOMBRE = @NombreNuevo
    WHERE CODIGO = @CodigoAutor;
END;
GO