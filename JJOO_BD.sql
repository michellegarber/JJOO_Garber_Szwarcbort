USE [master]
GO
/****** Object:  Database [JJOO_Szwarcbort_Garber]    Script Date: 19/8/2024 12:43:11 ******/
CREATE DATABASE [JJOO_Szwarcbort_Garber]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'JJOO_Szwarcbort_Garber', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\JJOO_Szwarcbort_Garber.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'JJOO_Szwarcbort_Garber_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\JJOO_Szwarcbort_Garber_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [JJOO_Szwarcbort_Garber] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [JJOO_Szwarcbort_Garber].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [JJOO_Szwarcbort_Garber] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [JJOO_Szwarcbort_Garber] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [JJOO_Szwarcbort_Garber] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [JJOO_Szwarcbort_Garber] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [JJOO_Szwarcbort_Garber] SET ARITHABORT OFF 
GO
ALTER DATABASE [JJOO_Szwarcbort_Garber] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [JJOO_Szwarcbort_Garber] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [JJOO_Szwarcbort_Garber] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [JJOO_Szwarcbort_Garber] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [JJOO_Szwarcbort_Garber] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [JJOO_Szwarcbort_Garber] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [JJOO_Szwarcbort_Garber] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [JJOO_Szwarcbort_Garber] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [JJOO_Szwarcbort_Garber] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [JJOO_Szwarcbort_Garber] SET  DISABLE_BROKER 
GO
ALTER DATABASE [JJOO_Szwarcbort_Garber] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [JJOO_Szwarcbort_Garber] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [JJOO_Szwarcbort_Garber] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [JJOO_Szwarcbort_Garber] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [JJOO_Szwarcbort_Garber] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [JJOO_Szwarcbort_Garber] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [JJOO_Szwarcbort_Garber] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [JJOO_Szwarcbort_Garber] SET RECOVERY FULL 
GO
ALTER DATABASE [JJOO_Szwarcbort_Garber] SET  MULTI_USER 
GO
ALTER DATABASE [JJOO_Szwarcbort_Garber] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [JJOO_Szwarcbort_Garber] SET DB_CHAINING OFF 
GO
ALTER DATABASE [JJOO_Szwarcbort_Garber] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [JJOO_Szwarcbort_Garber] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [JJOO_Szwarcbort_Garber] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'JJOO_Szwarcbort_Garber', N'ON'
GO
ALTER DATABASE [JJOO_Szwarcbort_Garber] SET QUERY_STORE = OFF
GO
USE [JJOO_Szwarcbort_Garber]
GO
/****** Object:  User [alumno]    Script Date: 19/8/2024 12:43:11 ******/
CREATE USER [alumno] FOR LOGIN [alumno] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  Table [dbo].[Deportes]    Script Date: 19/8/2024 12:43:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Deportes](
	[IdDeporte] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](50) NOT NULL,
	[Foto] [text] NOT NULL,
 CONSTRAINT [PK_Deportes] PRIMARY KEY CLUSTERED 
(
	[IdDeporte] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Deportistas]    Script Date: 19/8/2024 12:43:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Deportistas](
	[IdDeportista] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](50) NOT NULL,
	[Apellido] [varchar](50) NOT NULL,
	[FechaNacimiento] [date] NOT NULL,
	[Foto] [varchar](50) NOT NULL,
	[IdPais] [int] NOT NULL,
	[IdDeporte] [int] NOT NULL,
 CONSTRAINT [PK_Deportistas] PRIMARY KEY CLUSTERED 
(
	[IdDeportista] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Paises]    Script Date: 19/8/2024 12:43:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Paises](
	[IdPais] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](50) NOT NULL,
	[Bandera] [text] NOT NULL,
	[FechaFundacion] [date] NOT NULL,
 CONSTRAINT [PK_Paises] PRIMARY KEY CLUSTERED 
(
	[IdPais] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Deportes] ON 

INSERT [dbo].[Deportes] ([IdDeporte], [Nombre], [Foto]) VALUES (1, N'Hockey', N'hockey.jpg')
INSERT [dbo].[Deportes] ([IdDeporte], [Nombre], [Foto]) VALUES (3, N'Voley', N'voley.jpg')
INSERT [dbo].[Deportes] ([IdDeporte], [Nombre], [Foto]) VALUES (5, N'Tenis', N'tenis.jpg')
SET IDENTITY_INSERT [dbo].[Deportes] OFF
GO
SET IDENTITY_INSERT [dbo].[Deportistas] ON 

INSERT [dbo].[Deportistas] ([IdDeportista], [Nombre], [Apellido], [FechaNacimiento], [Foto], [IdPais], [IdDeporte]) VALUES (4, N'Agustina', N'GORZELANY ', CAST(N'1998-11-08' AS Date), N'gorzelany.jpg', 4, 1)
INSERT [dbo].[Deportistas] ([IdDeportista], [Nombre], [Apellido], [FechaNacimiento], [Foto], [IdPais], [IdDeporte]) VALUES (6, N'Alyssa', N'MANLEY', CAST(N'1996-03-06' AS Date), N'manley.jpg', 6, 1)
INSERT [dbo].[Deportistas] ([IdDeportista], [Nombre], [Apellido], [FechaNacimiento], [Foto], [IdPais], [IdDeporte]) VALUES (8, N'Eva', N'DE GOEDE', CAST(N'1989-03-23' AS Date), N'goede.jpg', 6, 1)
INSERT [dbo].[Deportistas] ([IdDeportista], [Nombre], [Apellido], [FechaNacimiento], [Foto], [IdPais], [IdDeporte]) VALUES (9, N'Kiki', N'BERTENS', CAST(N'1991-12-10' AS Date), N'bertens.jpg', 6, 5)
INSERT [dbo].[Deportistas] ([IdDeportista], [Nombre], [Apellido], [FechaNacimiento], [Foto], [IdPais], [IdDeporte]) VALUES (10, N'Sebastian', N'BAEZ', CAST(N'2000-12-28' AS Date), N'baez.jpg', 4, 5)
INSERT [dbo].[Deportistas] ([IdDeportista], [Nombre], [Apellido], [FechaNacimiento], [Foto], [IdPais], [IdDeporte]) VALUES (11, N'Novak', N'DJOKOVIC', CAST(N'1987-05-22' AS Date), N'novak.jpg', 5, 5)
INSERT [dbo].[Deportistas] ([IdDeportista], [Nombre], [Apellido], [FechaNacimiento], [Foto], [IdPais], [IdDeporte]) VALUES (12, N'Taylor', N'FRITZ', CAST(N'1997-10-28' AS Date), N'fritz.jpg', 7, 5)
INSERT [dbo].[Deportistas] ([IdDeportista], [Nombre], [Apellido], [FechaNacimiento], [Foto], [IdPais], [IdDeporte]) VALUES (15, N'Luciano', N'DE CECCO', CAST(N'1989-01-30' AS Date), N'dececco.jpg', 4, 3)
INSERT [dbo].[Deportistas] ([IdDeportista], [Nombre], [Apellido], [FechaNacimiento], [Foto], [IdPais], [IdDeporte]) VALUES (16, N'Maja', N'OGNJENOVIC', CAST(N'1987-11-22' AS Date), N'ognjenovic.jpg', 5, 3)
INSERT [dbo].[Deportistas] ([IdDeportista], [Nombre], [Apellido], [FechaNacimiento], [Foto], [IdPais], [IdDeporte]) VALUES (17, N'Celeste ', N'PLAK', CAST(N'1994-09-03' AS Date), N'plak.jpg', 6, 3)
INSERT [dbo].[Deportistas] ([IdDeportista], [Nombre], [Apellido], [FechaNacimiento], [Foto], [IdPais], [IdDeporte]) VALUES (18, N'Kelsey', N'ROBINSON', CAST(N'1992-05-25' AS Date), N'robinson.jpg', 7, 3)
SET IDENTITY_INSERT [dbo].[Deportistas] OFF
GO
SET IDENTITY_INSERT [dbo].[Paises] ON 

INSERT [dbo].[Paises] ([IdPais], [Nombre], [Bandera], [FechaFundacion]) VALUES (4, N'Argentina', N'argentina.png', CAST(N'1816-07-09' AS Date))
INSERT [dbo].[Paises] ([IdPais], [Nombre], [Bandera], [FechaFundacion]) VALUES (5, N'Serbia', N'serbia.png', CAST(N'1835-02-15' AS Date))
INSERT [dbo].[Paises] ([IdPais], [Nombre], [Bandera], [FechaFundacion]) VALUES (6, N'Holanda', N'holanda.jpg', CAST(N'1521-07-26' AS Date))
INSERT [dbo].[Paises] ([IdPais], [Nombre], [Bandera], [FechaFundacion]) VALUES (7, N'Estados Unidos', N'usa.png', CAST(N'1776-07-04' AS Date))
SET IDENTITY_INSERT [dbo].[Paises] OFF
GO
ALTER TABLE [dbo].[Deportistas]  WITH CHECK ADD  CONSTRAINT [FK_Deportistas_Deportes] FOREIGN KEY([IdDeporte])
REFERENCES [dbo].[Deportes] ([IdDeporte])
GO
ALTER TABLE [dbo].[Deportistas] CHECK CONSTRAINT [FK_Deportistas_Deportes]
GO
ALTER TABLE [dbo].[Deportistas]  WITH CHECK ADD  CONSTRAINT [FK_Deportistas_Paises] FOREIGN KEY([IdPais])
REFERENCES [dbo].[Paises] ([IdPais])
GO
ALTER TABLE [dbo].[Deportistas] CHECK CONSTRAINT [FK_Deportistas_Paises]
GO
USE [master]
GO
ALTER DATABASE [JJOO_Szwarcbort_Garber] SET  READ_WRITE 
GO
