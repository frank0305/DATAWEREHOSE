USE [master]
GO
/****** Object:  Database [AlquilerVehiculos]    Script Date: 13/06/2021 14:29:15 ******/
CREATE DATABASE [AlquilerVehiculos]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'AlquilerVehiculos', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\AlquilerVehiculos.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'AlquilerVehiculos_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\AlquilerVehiculos_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [AlquilerVehiculos] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [AlquilerVehiculos].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [AlquilerVehiculos] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [AlquilerVehiculos] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [AlquilerVehiculos] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [AlquilerVehiculos] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [AlquilerVehiculos] SET ARITHABORT OFF 
GO
ALTER DATABASE [AlquilerVehiculos] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [AlquilerVehiculos] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [AlquilerVehiculos] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [AlquilerVehiculos] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [AlquilerVehiculos] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [AlquilerVehiculos] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [AlquilerVehiculos] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [AlquilerVehiculos] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [AlquilerVehiculos] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [AlquilerVehiculos] SET  DISABLE_BROKER 
GO
ALTER DATABASE [AlquilerVehiculos] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [AlquilerVehiculos] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [AlquilerVehiculos] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [AlquilerVehiculos] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [AlquilerVehiculos] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [AlquilerVehiculos] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [AlquilerVehiculos] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [AlquilerVehiculos] SET RECOVERY FULL 
GO
ALTER DATABASE [AlquilerVehiculos] SET  MULTI_USER 
GO
ALTER DATABASE [AlquilerVehiculos] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [AlquilerVehiculos] SET DB_CHAINING OFF 
GO
ALTER DATABASE [AlquilerVehiculos] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [AlquilerVehiculos] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [AlquilerVehiculos] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [AlquilerVehiculos] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'AlquilerVehiculos', N'ON'
GO
ALTER DATABASE [AlquilerVehiculos] SET QUERY_STORE = OFF
GO
USE [AlquilerVehiculos]
GO
/****** Object:  Table [dbo].[Cliente]    Script Date: 13/06/2021 14:29:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cliente](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Dni] [char](8) NOT NULL,
	[Nombre] [nvarchar](50) NOT NULL,
	[Apellidos] [nvarchar](50) NOT NULL,
	[Edad] [int] NULL,
	[Ciudad] [varchar](50) NULL,
 CONSTRAINT [PK_Cliente] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Empleado]    Script Date: 13/06/2021 14:29:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Empleado](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](50) NOT NULL,
	[Apellidos] [varchar](50) NOT NULL,
	[Reporta] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Hechos]    Script Date: 13/06/2021 14:29:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Hechos](
	[IdVehiculo] [int] NOT NULL,
	[IdCliente] [int] NOT NULL,
	[IdEmpleado] [int] NOT NULL,
	[IdTiempo] [int] NOT NULL,
	[Precio] [float] NOT NULL,
	[Unidades] [int] NOT NULL,
	[Total] [float] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tiempo]    Script Date: 13/06/2021 14:29:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tiempo](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Fecha] [date] NOT NULL,
	[Año] [int] NOT NULL,
	[Trimestre] [int] NOT NULL,
	[Mes] [int] NOT NULL,
	[Dia] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Vehiculo]    Script Date: 13/06/2021 14:29:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Vehiculo](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Modelo] [varchar](50) NOT NULL,
	[Marca] [varchar](50) NOT NULL,
	[Categoria] [varchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Hechos]  WITH CHECK ADD  CONSTRAINT [fk_IdCliente] FOREIGN KEY([IdCliente])
REFERENCES [dbo].[Cliente] ([Id])
GO
ALTER TABLE [dbo].[Hechos] CHECK CONSTRAINT [fk_IdCliente]
GO
ALTER TABLE [dbo].[Hechos]  WITH CHECK ADD  CONSTRAINT [fk_IdEmpleado] FOREIGN KEY([IdEmpleado])
REFERENCES [dbo].[Empleado] ([Id])
GO
ALTER TABLE [dbo].[Hechos] CHECK CONSTRAINT [fk_IdEmpleado]
GO
ALTER TABLE [dbo].[Hechos]  WITH CHECK ADD  CONSTRAINT [fk_IdTiempo] FOREIGN KEY([IdTiempo])
REFERENCES [dbo].[Tiempo] ([Id])
GO
ALTER TABLE [dbo].[Hechos] CHECK CONSTRAINT [fk_IdTiempo]
GO
ALTER TABLE [dbo].[Hechos]  WITH CHECK ADD  CONSTRAINT [fk_IdVehivulo] FOREIGN KEY([IdVehiculo])
REFERENCES [dbo].[Vehiculo] ([Id])
GO
ALTER TABLE [dbo].[Hechos] CHECK CONSTRAINT [fk_IdVehivulo]
GO
USE [master]
GO
ALTER DATABASE [AlquilerVehiculos] SET  READ_WRITE 
GO
