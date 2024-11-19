CREATE PROCEDURE ConsultarLibros
    @CodigoLibro INT = NULL,
    @Titulo VARCHAR(50) = NULL,
    @ISBN VARCHAR(15) = NULL,
    @Paginas INT = NULL,
    @Editorial VARCHAR(25) = NULL
AS
BEGIN
    SELECT *
    FROM BIBLIOTECA.LIBRO
    WHERE (CODIGO_LIBRO = @CodigoLibro OR @CodigoLibro IS NULL)
      AND (TITULO LIKE '%' + @Titulo + '%' OR @Titulo IS NULL)
      AND (ISBN = @ISBN OR @ISBN IS NULL)
      AND (PAGINAS = @Paginas OR @Paginas IS NULL)
      AND (EDITORIAL LIKE '%' + @Editorial + '%' OR @Editorial IS NULL);
END;
GO
