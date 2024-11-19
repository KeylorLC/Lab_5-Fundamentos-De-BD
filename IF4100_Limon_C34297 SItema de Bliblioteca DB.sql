USE [master]
GO
/****** Object:  Database [IF4100_Limon_C34297]    Script Date: 19/11/2024 00:05:14 ******/
CREATE DATABASE [IF4100_Limon_C34297]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'IF4100_Limon_C34297', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\IF4100_Limon_C34297.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'IF4100_Limon_C34297_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\IF4100_Limon_C34297_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [IF4100_Limon_C34297] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [IF4100_Limon_C34297].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [IF4100_Limon_C34297] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [IF4100_Limon_C34297] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [IF4100_Limon_C34297] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [IF4100_Limon_C34297] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [IF4100_Limon_C34297] SET ARITHABORT OFF 
GO
ALTER DATABASE [IF4100_Limon_C34297] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [IF4100_Limon_C34297] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [IF4100_Limon_C34297] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [IF4100_Limon_C34297] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [IF4100_Limon_C34297] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [IF4100_Limon_C34297] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [IF4100_Limon_C34297] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [IF4100_Limon_C34297] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [IF4100_Limon_C34297] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [IF4100_Limon_C34297] SET  DISABLE_BROKER 
GO
ALTER DATABASE [IF4100_Limon_C34297] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [IF4100_Limon_C34297] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [IF4100_Limon_C34297] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [IF4100_Limon_C34297] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [IF4100_Limon_C34297] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [IF4100_Limon_C34297] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [IF4100_Limon_C34297] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [IF4100_Limon_C34297] SET RECOVERY FULL 
GO
ALTER DATABASE [IF4100_Limon_C34297] SET  MULTI_USER 
GO
ALTER DATABASE [IF4100_Limon_C34297] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [IF4100_Limon_C34297] SET DB_CHAINING OFF 
GO
ALTER DATABASE [IF4100_Limon_C34297] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [IF4100_Limon_C34297] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [IF4100_Limon_C34297] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [IF4100_Limon_C34297] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'IF4100_Limon_C34297', N'ON'
GO
ALTER DATABASE [IF4100_Limon_C34297] SET QUERY_STORE = ON
GO
ALTER DATABASE [IF4100_Limon_C34297] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [IF4100_Limon_C34297]
GO
/****** Object:  User [root]    Script Date: 19/11/2024 00:05:14 ******/
CREATE USER [root] FOR LOGIN [root] WITH DEFAULT_SCHEMA=[dbo]
GO
ALTER ROLE [db_owner] ADD MEMBER [root]
GO
/****** Object:  Schema [BIBLIOTECA]    Script Date: 19/11/2024 00:05:14 ******/
CREATE SCHEMA [BIBLIOTECA]
GO
/****** Object:  Table [BIBLIOTECA].[AUTOR]    Script Date: 19/11/2024 00:05:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [BIBLIOTECA].[AUTOR](
	[CODIGO] [int] NOT NULL,
	[NOMBRE] [varchar](30) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[CODIGO] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [BIBLIOTECA].[AUTOR_LIBRO]    Script Date: 19/11/2024 00:05:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [BIBLIOTECA].[AUTOR_LIBRO](
	[CODIGO_AUTOR] [int] NOT NULL,
	[CODIGO_LIBRO] [int] NOT NULL,
 CONSTRAINT [PK_AUTOR_LIBRO] PRIMARY KEY CLUSTERED 
(
	[CODIGO_AUTOR] ASC,
	[CODIGO_LIBRO] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [BIBLIOTECA].[EJEMPLAR]    Script Date: 19/11/2024 00:05:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [BIBLIOTECA].[EJEMPLAR](
	[CODIGO_EJEMPLAR] [int] NOT NULL,
	[LOCALIZACION] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[CODIGO_EJEMPLAR] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [BIBLIOTECA].[LIBRO]    Script Date: 19/11/2024 00:05:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [BIBLIOTECA].[LIBRO](
	[CODIGO_LIBRO] [int] NOT NULL,
	[TITULO] [varchar](50) NOT NULL,
	[ISBN] [varchar](15) NOT NULL,
	[PAGINAS] [int] NOT NULL,
	[EDITORIAL] [varchar](25) NULL,
PRIMARY KEY CLUSTERED 
(
	[CODIGO_LIBRO] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [BIBLIOTECA].[LOCALIZACION]    Script Date: 19/11/2024 00:05:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [BIBLIOTECA].[LOCALIZACION](
	[ID_LOCALIZACION] [int] NOT NULL,
	[RECINTO] [varchar](25) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID_LOCALIZACION] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [BIBLIOTECA].[USUARIO]    Script Date: 19/11/2024 00:05:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [BIBLIOTECA].[USUARIO](
	[CODIGO_USUARIO] [int] NOT NULL,
	[NOMBRE] [varchar](20) NOT NULL,
	[APELLIDOS] [varchar](40) NOT NULL,
	[TELEFONO] [varchar](10) NULL,
	[DIRECCION] [varchar](100) NOT NULL,
	[CARRERA] [varchar](40) NOT NULL,
	[LOCALIZACION] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[CODIGO_USUARIO] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [BIBLIOTECA].[USUARIO_EJEMPLAR]    Script Date: 19/11/2024 00:05:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [BIBLIOTECA].[USUARIO_EJEMPLAR](
	[CODIGO_USUARIO] [int] NOT NULL,
	[CODIGO_EJEMPLAR] [int] NOT NULL,
	[FECHA_PRESTAMO] [datetime] NOT NULL,
	[FECHA_DEVOLUCION] [date] NOT NULL,
 CONSTRAINT [PK_USUARIO_EJEMPLAR] PRIMARY KEY CLUSTERED 
(
	[CODIGO_USUARIO] ASC,
	[CODIGO_EJEMPLAR] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [BIBLIOTECA].[AUTOR_LIBRO]  WITH CHECK ADD FOREIGN KEY([CODIGO_AUTOR])
REFERENCES [BIBLIOTECA].[AUTOR] ([CODIGO])
GO
ALTER TABLE [BIBLIOTECA].[AUTOR_LIBRO]  WITH CHECK ADD FOREIGN KEY([CODIGO_LIBRO])
REFERENCES [BIBLIOTECA].[LIBRO] ([CODIGO_LIBRO])
GO
ALTER TABLE [BIBLIOTECA].[EJEMPLAR]  WITH CHECK ADD FOREIGN KEY([LOCALIZACION])
REFERENCES [BIBLIOTECA].[LOCALIZACION] ([ID_LOCALIZACION])
GO
ALTER TABLE [BIBLIOTECA].[USUARIO]  WITH CHECK ADD FOREIGN KEY([LOCALIZACION])
REFERENCES [BIBLIOTECA].[LOCALIZACION] ([ID_LOCALIZACION])
GO
ALTER TABLE [BIBLIOTECA].[USUARIO_EJEMPLAR]  WITH CHECK ADD FOREIGN KEY([CODIGO_EJEMPLAR])
REFERENCES [BIBLIOTECA].[EJEMPLAR] ([CODIGO_EJEMPLAR])
GO
ALTER TABLE [BIBLIOTECA].[USUARIO_EJEMPLAR]  WITH CHECK ADD FOREIGN KEY([CODIGO_USUARIO])
REFERENCES [BIBLIOTECA].[USUARIO] ([CODIGO_USUARIO])
GO
/****** Object:  StoredProcedure [dbo].[ActualizarAutor]    Script Date: 19/11/2024 00:05:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ActualizarAutor]
    @CodigoAutor INT,
    @NombreNuevo VARCHAR(30)
AS
BEGIN
    UPDATE BIBLIOTECA.AUTOR
    SET NOMBRE = @NombreNuevo
    WHERE CODIGO = @CodigoAutor;
END;

GO
/****** Object:  StoredProcedure [dbo].[BorrarEstudiante]    Script Date: 19/11/2024 00:05:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[BorrarEstudiante]
    @IDUsuario INT
AS
BEGIN
    DELETE FROM BIBLIOTECA.USUARIO
    WHERE CODIGO_USUARIO = @IDUsuario;
END;

GO
/****** Object:  StoredProcedure [dbo].[ConsultarLibros]    Script Date: 19/11/2024 00:05:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ConsultarLibros]
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
/****** Object:  StoredProcedure [dbo].[InsertarPrestamo]    Script Date: 19/11/2024 00:05:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[InsertarPrestamo]
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
USE [master]
GO
ALTER DATABASE [IF4100_Limon_C34297] SET  READ_WRITE 
GO
