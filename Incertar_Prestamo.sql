CREATE PROCEDURE InsertarPrestamo
    @IDUsuario INT,
    @IDEjemplar INT,
    @FechaPrestamo DATETIME,
    @FechaDevolucion DATE
AS
BEGIN
    INSERT INTO BIBLIOTECA.USUARIO_EJEMPLAR (CODIGO_USUARIO, CODIGO_EJEMPLAR, FECHA_PRESTAMO, FECHA_DEVOLUCION)
    VALUES (@IDUsuario, @IDEjemplar, @FechaPrestamo, @FechaDevolucion);
END;
GO