USE [master]
GO
/****** Object:  Database [Taller_CondicionFisica]    Script Date: 15/10/2022 12:43:10 a. m. ******/
CREATE DATABASE [Taller_CondicionFisica]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Taller_CondicionFisica', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\Taller_CondicionFisica.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Taller_CondicionFisica_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\Taller_CondicionFisica_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [Taller_CondicionFisica] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Taller_CondicionFisica].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Taller_CondicionFisica] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Taller_CondicionFisica] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Taller_CondicionFisica] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Taller_CondicionFisica] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Taller_CondicionFisica] SET ARITHABORT OFF 
GO
ALTER DATABASE [Taller_CondicionFisica] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Taller_CondicionFisica] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Taller_CondicionFisica] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Taller_CondicionFisica] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Taller_CondicionFisica] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Taller_CondicionFisica] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Taller_CondicionFisica] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Taller_CondicionFisica] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Taller_CondicionFisica] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Taller_CondicionFisica] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Taller_CondicionFisica] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Taller_CondicionFisica] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Taller_CondicionFisica] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Taller_CondicionFisica] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Taller_CondicionFisica] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Taller_CondicionFisica] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Taller_CondicionFisica] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Taller_CondicionFisica] SET RECOVERY FULL 
GO
ALTER DATABASE [Taller_CondicionFisica] SET  MULTI_USER 
GO
ALTER DATABASE [Taller_CondicionFisica] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Taller_CondicionFisica] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Taller_CondicionFisica] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Taller_CondicionFisica] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Taller_CondicionFisica] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Taller_CondicionFisica] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'Taller_CondicionFisica', N'ON'
GO
ALTER DATABASE [Taller_CondicionFisica] SET QUERY_STORE = OFF
GO
USE [Taller_CondicionFisica]
GO
/****** Object:  Table [dbo].[Datos_Pacientes]    Script Date: 15/10/2022 12:43:11 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Datos_Pacientes](
	[IdPaciente] [int] NOT NULL,
	[Nombre] [nvarchar](50) NOT NULL,
	[Apellidos] [nvarchar](50) NOT NULL,
	[FechaNacimiento] [date] NOT NULL,
	[IdTipoDocumento] [int] NULL,
	[DocumentoIdentidad] [varchar](50) NULL,
	[IdSexo] [int] NULL,
 CONSTRAINT [PK_Datos] PRIMARY KEY CLUSTERED 
(
	[IdPaciente] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Encuestas_Psicosociales]    Script Date: 15/10/2022 12:43:11 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Encuestas_Psicosociales](
	[IdEncuestaPsicosocial] [int] NOT NULL,
	[IdEvaluacion] [int] NOT NULL,
 CONSTRAINT [PK_Encuestas_Psicosociales] PRIMARY KEY CLUSTERED 
(
	[IdEncuestaPsicosocial] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Evaluaciones]    Script Date: 15/10/2022 12:43:11 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Evaluaciones](
	[IdEvaluacion] [int] NOT NULL,
	[IdPaciente] [int] NOT NULL,
	[FechaEvaluacion] [date] NOT NULL,
	[SitioEvaluacion] [nvarchar](50) NOT NULL,
	[Peso(kg)] [decimal](4, 1) NOT NULL,
	[Talla(cms)] [decimal](4, 1) NOT NULL,
	[Edad] [tinyint] NULL,
	[IdTipoEvaluacion] [int] NOT NULL,
 CONSTRAINT [PK_Evaluaciones] PRIMARY KEY CLUSTERED 
(
	[IdEvaluacion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Habilidades]    Script Date: 15/10/2022 12:43:11 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Habilidades](
	[IdHabilidad] [int] NOT NULL,
	[Habilidad] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Habilidades] PRIMARY KEY CLUSTERED 
(
	[IdHabilidad] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Medidas]    Script Date: 15/10/2022 12:43:11 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Medidas](
	[IdMedida] [int] NOT NULL,
	[NombreMedida] [nvarchar](max) NOT NULL,
	[IdPrueba] [int] NOT NULL,
	[IdRangoEdad] [int] NOT NULL,
 CONSTRAINT [PK_Medidas] PRIMARY KEY CLUSTERED 
(
	[IdMedida] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Preguntas_EvaMoto]    Script Date: 15/10/2022 12:43:11 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Preguntas_EvaMoto](
	[IdPregunta] [int] NOT NULL,
	[Pregunta] [nvarchar](max) NULL,
	[IdRangoEdad] [int] NOT NULL,
	[IdHabilidad] [int] NOT NULL,
 CONSTRAINT [PK_Preguntas_EvaMoto] PRIMARY KEY CLUSTERED 
(
	[IdPregunta] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Preguntas_Psicosocial]    Script Date: 15/10/2022 12:43:11 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Preguntas_Psicosocial](
	[IdPregunta] [int] NOT NULL,
	[Pregunta] [nvarchar](max) NULL,
 CONSTRAINT [PK_Preguntas_Psicosocial] PRIMARY KEY CLUSTERED 
(
	[IdPregunta] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Pruebas]    Script Date: 15/10/2022 12:43:11 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Pruebas](
	[IdPrueba] [int] NOT NULL,
	[NombrePrueba] [nvarchar](20) NOT NULL,
 CONSTRAINT [PK_Pruebas] PRIMARY KEY CLUSTERED 
(
	[IdPrueba] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Rangos_edades]    Script Date: 15/10/2022 12:43:11 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Rangos_edades](
	[IdRangoEdad] [int] NOT NULL,
	[RangoEdad] [nvarchar](30) NOT NULL,
 CONSTRAINT [PK_Rangos_edades] PRIMARY KEY CLUSTERED 
(
	[IdRangoEdad] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Respuestas_EvaMoto]    Script Date: 15/10/2022 12:43:11 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Respuestas_EvaMoto](
	[IdRespuesta] [int] NOT NULL,
	[Respuesta] [bit] NULL,
 CONSTRAINT [PK_Resuestas_EvaMoto] PRIMARY KEY CLUSTERED 
(
	[IdRespuesta] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Respuestas_Psicosocial]    Script Date: 15/10/2022 12:43:11 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Respuestas_Psicosocial](
	[IdRespuesta] [int] NOT NULL,
	[Respuesta] [nvarchar](50) NULL,
 CONSTRAINT [PK_Respuestas_preguntasPsicosocial] PRIMARY KEY CLUSTERED 
(
	[IdRespuesta] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Resultados_EncuestaPsicosocial]    Script Date: 15/10/2022 12:43:11 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Resultados_EncuestaPsicosocial](
	[IdResultados_Psicosocial] [int] NOT NULL,
	[IdEncuestaPsicosocial] [int] NOT NULL,
	[IdPregunta] [int] NOT NULL,
	[IdRespuesta] [int] NOT NULL,
	[RespuestaNumerica] [smallint] NULL,
	[RespuestaTexto] [nvarchar](10) NULL,
 CONSTRAINT [PK_Resultados_EncuestaPsicosocial] PRIMARY KEY CLUSTERED 
(
	[IdResultados_Psicosocial] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Resultados_Evaniños]    Script Date: 15/10/2022 12:43:11 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Resultados_Evaniños](
	[IdResultados_pacientes] [int] NOT NULL,
	[IdEvaluacion] [int] NOT NULL,
	[IdPregunta] [int] NOT NULL,
	[IdRespuesta] [int] NOT NULL,
 CONSTRAINT [PK_Evaluciones_niños] PRIMARY KEY CLUSTERED 
(
	[IdResultados_pacientes] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Resultados_MedidasTomadas]    Script Date: 15/10/2022 12:43:11 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Resultados_MedidasTomadas](
	[IdResultadosMT] [int] NOT NULL,
	[IdEvaluacion] [int] NOT NULL,
	[IdMedida] [int] NULL,
	[RespuestaNumerica] [decimal](5, 2) NULL,
	[IdUnidadMedida] [int] NULL,
 CONSTRAINT [PK_Resultados_MedidasTomadas] PRIMARY KEY CLUSTERED 
(
	[IdResultadosMT] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Sexos]    Script Date: 15/10/2022 12:43:11 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Sexos](
	[IdSexo] [int] NOT NULL,
	[Nombre] [nvarchar](10) NOT NULL,
 CONSTRAINT [PK_Sexos] PRIMARY KEY CLUSTERED 
(
	[IdSexo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tipos_DocumentosIdentidad]    Script Date: 15/10/2022 12:43:11 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tipos_DocumentosIdentidad](
	[IdTipoDocumento] [int] NOT NULL,
	[TipoDocumento] [nvarchar](5) NOT NULL,
	[Descripción] [nvarchar](50) NULL,
 CONSTRAINT [PK_Tipos_DocumentosIdentidad] PRIMARY KEY CLUSTERED 
(
	[IdTipoDocumento] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tipos_evaluaciones]    Script Date: 15/10/2022 12:43:11 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tipos_evaluaciones](
	[IdTipoEvaluacion] [int] NOT NULL,
	[TipoEvaluacion] [nvarchar](50) NULL,
 CONSTRAINT [PK_Tipos_evaluaciones] PRIMARY KEY CLUSTERED 
(
	[IdTipoEvaluacion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Unidad_medidas]    Script Date: 15/10/2022 12:43:11 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Unidad_medidas](
	[IdUnidadMedida] [int] NOT NULL,
	[NombreUMedida] [nvarchar](50) NOT NULL,
	[AbreviaciónUMedida] [nvarchar](5) NOT NULL,
 CONSTRAINT [PK_Unidad_medidas] PRIMARY KEY CLUSTERED 
(
	[IdUnidadMedida] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Datos_Pacientes] ([IdPaciente], [Nombre], [Apellidos], [FechaNacimiento], [IdTipoDocumento], [DocumentoIdentidad], [IdSexo]) VALUES (1, N'Yuly', N'Mosquera', CAST(N'2021-06-24' AS Date), 1, N'1047747384', 2)
INSERT [dbo].[Datos_Pacientes] ([IdPaciente], [Nombre], [Apellidos], [FechaNacimiento], [IdTipoDocumento], [DocumentoIdentidad], [IdSexo]) VALUES (2, N'Katerin', N'Cortes', CAST(N'2000-06-01' AS Date), 3, N'1074563897', 2)
INSERT [dbo].[Datos_Pacientes] ([IdPaciente], [Nombre], [Apellidos], [FechaNacimiento], [IdTipoDocumento], [DocumentoIdentidad], [IdSexo]) VALUES (3, N'Mauricio', N'Lopez', CAST(N'2020-06-10' AS Date), 1, N'1038859937', 1)
INSERT [dbo].[Datos_Pacientes] ([IdPaciente], [Nombre], [Apellidos], [FechaNacimiento], [IdTipoDocumento], [DocumentoIdentidad], [IdSexo]) VALUES (4, N'Eduardo', N'Bustamante', CAST(N'1992-11-05' AS Date), 3, N'3888482663', 1)
INSERT [dbo].[Datos_Pacientes] ([IdPaciente], [Nombre], [Apellidos], [FechaNacimiento], [IdTipoDocumento], [DocumentoIdentidad], [IdSexo]) VALUES (6, N'Abigail', N'Palacios', CAST(N'2015-12-25' AS Date), 2, N'1003884938', 2)
INSERT [dbo].[Datos_Pacientes] ([IdPaciente], [Nombre], [Apellidos], [FechaNacimiento], [IdTipoDocumento], [DocumentoIdentidad], [IdSexo]) VALUES (7, N'Sebastian', N'Marmolejo', CAST(N'2006-05-11' AS Date), 2, N'337788', 1)
INSERT [dbo].[Datos_Pacientes] ([IdPaciente], [Nombre], [Apellidos], [FechaNacimiento], [IdTipoDocumento], [DocumentoIdentidad], [IdSexo]) VALUES (8, N'Sandra', N'Montes', CAST(N'1963-01-14' AS Date), 3, N'545427783', 2)
GO
INSERT [dbo].[Encuestas_Psicosociales] ([IdEncuestaPsicosocial], [IdEvaluacion]) VALUES (1, 1)
INSERT [dbo].[Encuestas_Psicosociales] ([IdEncuestaPsicosocial], [IdEvaluacion]) VALUES (2, 2)
INSERT [dbo].[Encuestas_Psicosociales] ([IdEncuestaPsicosocial], [IdEvaluacion]) VALUES (3, 3)
INSERT [dbo].[Encuestas_Psicosociales] ([IdEncuestaPsicosocial], [IdEvaluacion]) VALUES (4, 4)
INSERT [dbo].[Encuestas_Psicosociales] ([IdEncuestaPsicosocial], [IdEvaluacion]) VALUES (5, 5)
INSERT [dbo].[Encuestas_Psicosociales] ([IdEncuestaPsicosocial], [IdEvaluacion]) VALUES (6, 6)
INSERT [dbo].[Encuestas_Psicosociales] ([IdEncuestaPsicosocial], [IdEvaluacion]) VALUES (7, 7)
GO
INSERT [dbo].[Evaluaciones] ([IdEvaluacion], [IdPaciente], [FechaEvaluacion], [SitioEvaluacion], [Peso(kg)], [Talla(cms)], [Edad], [IdTipoEvaluacion]) VALUES (1, 4, CAST(N'2022-07-20' AS Date), N'Instituto', CAST(76.5 AS Decimal(4, 1)), CAST(170.5 AS Decimal(4, 1)), 30, 4)
INSERT [dbo].[Evaluaciones] ([IdEvaluacion], [IdPaciente], [FechaEvaluacion], [SitioEvaluacion], [Peso(kg)], [Talla(cms)], [Edad], [IdTipoEvaluacion]) VALUES (2, 7, CAST(N'2022-07-28' AS Date), N'Facultad nacional de salud publica', CAST(68.3 AS Decimal(4, 1)), CAST(176.0 AS Decimal(4, 1)), 16, 3)
INSERT [dbo].[Evaluaciones] ([IdEvaluacion], [IdPaciente], [FechaEvaluacion], [SitioEvaluacion], [Peso(kg)], [Talla(cms)], [Edad], [IdTipoEvaluacion]) VALUES (3, 8, CAST(N'2022-07-29' AS Date), N'Comfama centro', CAST(58.9 AS Decimal(4, 1)), CAST(163.2 AS Decimal(4, 1)), 59, 4)
INSERT [dbo].[Evaluaciones] ([IdEvaluacion], [IdPaciente], [FechaEvaluacion], [SitioEvaluacion], [Peso(kg)], [Talla(cms)], [Edad], [IdTipoEvaluacion]) VALUES (4, 1, CAST(N'2022-10-05' AS Date), N'Unidad deportiva José René Higuita', CAST(9.0 AS Decimal(4, 1)), CAST(74.8 AS Decimal(4, 1)), 1, 1)
INSERT [dbo].[Evaluaciones] ([IdEvaluacion], [IdPaciente], [FechaEvaluacion], [SitioEvaluacion], [Peso(kg)], [Talla(cms)], [Edad], [IdTipoEvaluacion]) VALUES (5, 2, CAST(N'2022-02-01' AS Date), N'Facultad nacional de salud publica', CAST(62.9 AS Decimal(4, 1)), CAST(161.5 AS Decimal(4, 1)), 22, 3)
INSERT [dbo].[Evaluaciones] ([IdEvaluacion], [IdPaciente], [FechaEvaluacion], [SitioEvaluacion], [Peso(kg)], [Talla(cms)], [Edad], [IdTipoEvaluacion]) VALUES (6, 6, CAST(N'2022-07-13' AS Date), N'Instituto', CAST(23.0 AS Decimal(4, 1)), CAST(122.0 AS Decimal(4, 1)), 7, 2)
INSERT [dbo].[Evaluaciones] ([IdEvaluacion], [IdPaciente], [FechaEvaluacion], [SitioEvaluacion], [Peso(kg)], [Talla(cms)], [Edad], [IdTipoEvaluacion]) VALUES (7, 3, CAST(N'2022-10-11' AS Date), N'Hogar infantil', CAST(12.9 AS Decimal(4, 1)), CAST(88.0 AS Decimal(4, 1)), 2, 1)
GO
INSERT [dbo].[Habilidades] ([IdHabilidad], [Habilidad]) VALUES (1, N'Correr')
INSERT [dbo].[Habilidades] ([IdHabilidad], [Habilidad]) VALUES (2, N'Subir escaleras')
INSERT [dbo].[Habilidades] ([IdHabilidad], [Habilidad]) VALUES (3, N'Patear')
INSERT [dbo].[Habilidades] ([IdHabilidad], [Habilidad]) VALUES (4, N'Lanzar')
INSERT [dbo].[Habilidades] ([IdHabilidad], [Habilidad]) VALUES (5, N'Atrapar')
INSERT [dbo].[Habilidades] ([IdHabilidad], [Habilidad]) VALUES (6, N'Saltar')
GO
INSERT [dbo].[Medidas] ([IdMedida], [NombreMedida], [IdPrueba], [IdRangoEdad]) VALUES (1, N'Presion arterial sistolica', 1, 9)
INSERT [dbo].[Medidas] ([IdMedida], [NombreMedida], [IdPrueba], [IdRangoEdad]) VALUES (2, N'Presion arterial diastolica', 1, 9)
INSERT [dbo].[Medidas] ([IdMedida], [NombreMedida], [IdPrueba], [IdRangoEdad]) VALUES (3, N'Perimetro brazo', 3, 9)
INSERT [dbo].[Medidas] ([IdMedida], [NombreMedida], [IdPrueba], [IdRangoEdad]) VALUES (4, N'Perimetro cadera', 3, 9)
INSERT [dbo].[Medidas] ([IdMedida], [NombreMedida], [IdPrueba], [IdRangoEdad]) VALUES (5, N'Perimetro pierna', 3, 9)
INSERT [dbo].[Medidas] ([IdMedida], [NombreMedida], [IdPrueba], [IdRangoEdad]) VALUES (6, N'Perimetro cintura', 3, 9)
INSERT [dbo].[Medidas] ([IdMedida], [NombreMedida], [IdPrueba], [IdRangoEdad]) VALUES (7, N'Diametro rodilla', 3, 9)
INSERT [dbo].[Medidas] ([IdMedida], [NombreMedida], [IdPrueba], [IdRangoEdad]) VALUES (8, N'Diametro codo', 3, 9)
INSERT [dbo].[Medidas] ([IdMedida], [NombreMedida], [IdPrueba], [IdRangoEdad]) VALUES (9, N'Pliegue abdominal', 3, 9)
INSERT [dbo].[Medidas] ([IdMedida], [NombreMedida], [IdPrueba], [IdRangoEdad]) VALUES (10, N'Pliegue subescapular', 3, 9)
INSERT [dbo].[Medidas] ([IdMedida], [NombreMedida], [IdPrueba], [IdRangoEdad]) VALUES (11, N'Pliegue cresta iliaca', 3, 9)
INSERT [dbo].[Medidas] ([IdMedida], [NombreMedida], [IdPrueba], [IdRangoEdad]) VALUES (12, N'Pliegue supraespinal', 3, 9)
INSERT [dbo].[Medidas] ([IdMedida], [NombreMedida], [IdPrueba], [IdRangoEdad]) VALUES (13, N'Pliegue en muslo', 3, 9)
INSERT [dbo].[Medidas] ([IdMedida], [NombreMedida], [IdPrueba], [IdRangoEdad]) VALUES (14, N'Pliegue de pierna', 3, 9)
INSERT [dbo].[Medidas] ([IdMedida], [NombreMedida], [IdPrueba], [IdRangoEdad]) VALUES (15, N'Pliegue biceps', 3, 9)
INSERT [dbo].[Medidas] ([IdMedida], [NombreMedida], [IdPrueba], [IdRangoEdad]) VALUES (16, N'Pliegue triceps', 3, 8)
INSERT [dbo].[Medidas] ([IdMedida], [NombreMedida], [IdPrueba], [IdRangoEdad]) VALUES (17, N'Test de wells', 4, 9)
INSERT [dbo].[Medidas] ([IdMedida], [NombreMedida], [IdPrueba], [IdRangoEdad]) VALUES (18, N'Dinanometria manual izquierda', 4, 9)
INSERT [dbo].[Medidas] ([IdMedida], [NombreMedida], [IdPrueba], [IdRangoEdad]) VALUES (19, N'Dinanometria manual derecha', 4, 9)
INSERT [dbo].[Medidas] ([IdMedida], [NombreMedida], [IdPrueba], [IdRangoEdad]) VALUES (20, N'Salto horizontal', 4, 6)
INSERT [dbo].[Medidas] ([IdMedida], [NombreMedida], [IdPrueba], [IdRangoEdad]) VALUES (21, N'Test velocidad 20 metros', 4, 6)
INSERT [dbo].[Medidas] ([IdMedida], [NombreMedida], [IdPrueba], [IdRangoEdad]) VALUES (22, N'Test agilidad y coordinacion', 4, 9)
INSERT [dbo].[Medidas] ([IdMedida], [NombreMedida], [IdPrueba], [IdRangoEdad]) VALUES (23, N'Test resistencia general', 4, 9)
INSERT [dbo].[Medidas] ([IdMedida], [NombreMedida], [IdPrueba], [IdRangoEdad]) VALUES (24, N'Salto vertical', 4, 7)
INSERT [dbo].[Medidas] ([IdMedida], [NombreMedida], [IdPrueba], [IdRangoEdad]) VALUES (25, N'Test press de banca', 4, 7)
INSERT [dbo].[Medidas] ([IdMedida], [NombreMedida], [IdPrueba], [IdRangoEdad]) VALUES (26, N'Test sentadilla profunda', 4, 7)
INSERT [dbo].[Medidas] ([IdMedida], [NombreMedida], [IdPrueba], [IdRangoEdad]) VALUES (27, N'Test abdominales 30 segundos', 4, 8)
INSERT [dbo].[Medidas] ([IdMedida], [NombreMedida], [IdPrueba], [IdRangoEdad]) VALUES (28, N'Test PushUp', 4, 8)
INSERT [dbo].[Medidas] ([IdMedida], [NombreMedida], [IdPrueba], [IdRangoEdad]) VALUES (29, N'Maduracion sexual', 2, 5)
GO
INSERT [dbo].[Preguntas_EvaMoto] ([IdPregunta], [Pregunta], [IdRangoEdad], [IdHabilidad]) VALUES (1, N'Corre descoordinado, pero no se cae, no cambia de dirección sin detenerse.', 1, 1)
INSERT [dbo].[Preguntas_EvaMoto] ([IdPregunta], [Pregunta], [IdRangoEdad], [IdHabilidad]) VALUES (2, N'Sube escaleras despacio solo pie por pie, sin apoyo de manos', 1, 2)
INSERT [dbo].[Preguntas_EvaMoto] ([IdPregunta], [Pregunta], [IdRangoEdad], [IdHabilidad]) VALUES (3, N'Intenta patear en bloque o que se desplace el balón', 1, 3)
INSERT [dbo].[Preguntas_EvaMoto] ([IdPregunta], [Pregunta], [IdRangoEdad], [IdHabilidad]) VALUES (4, N'Lanza una pelota de abajo hacia arriba', 1, 4)
INSERT [dbo].[Preguntas_EvaMoto] ([IdPregunta], [Pregunta], [IdRangoEdad], [IdHabilidad]) VALUES (5, N'Salta hacia arriba con los dos pies, no controla equilibrio al caer, no flexiona al caer.', 1, 6)
INSERT [dbo].[Preguntas_EvaMoto] ([IdPregunta], [Pregunta], [IdRangoEdad], [IdHabilidad]) VALUES (6, N'Corre sin dominio completo, pero no está descoordinado, cambia dirección sin detenerse.', 2, 1)
INSERT [dbo].[Preguntas_EvaMoto] ([IdPregunta], [Pregunta], [IdRangoEdad], [IdHabilidad]) VALUES (7, N'Sube escaleras alternando pies y baja con dificultad', 2, 2)
INSERT [dbo].[Preguntas_EvaMoto] ([IdPregunta], [Pregunta], [IdRangoEdad], [IdHabilidad]) VALUES (8, N'Patea la pelota usa la pierna con leve flexión de la cadera.', 2, 3)
INSERT [dbo].[Preguntas_EvaMoto] ([IdPregunta], [Pregunta], [IdRangoEdad], [IdHabilidad]) VALUES (9, N'Lanza pelota por encima de la cabeza', 2, 4)
INSERT [dbo].[Preguntas_EvaMoto] ([IdPregunta], [Pregunta], [IdRangoEdad], [IdHabilidad]) VALUES (10, N'Agarra la pelota que se le tira con ambas manos.', 2, 5)
INSERT [dbo].[Preguntas_EvaMoto] ([IdPregunta], [Pregunta], [IdRangoEdad], [IdHabilidad]) VALUES (11, N'Salta en patasola y controla el equilibrio al caer.', 2, 6)
INSERT [dbo].[Preguntas_EvaMoto] ([IdPregunta], [Pregunta], [IdRangoEdad], [IdHabilidad]) VALUES (12, N'Corre coordinado en línea recta con extremidades superiores en oposición a las inferiores', 3, 1)
INSERT [dbo].[Preguntas_EvaMoto] ([IdPregunta], [Pregunta], [IdRangoEdad], [IdHabilidad]) VALUES (13, N'Sube y baja escaleras rápido', 3, 2)
INSERT [dbo].[Preguntas_EvaMoto] ([IdPregunta], [Pregunta], [IdRangoEdad], [IdHabilidad]) VALUES (14, N'Extremidad inferiror que patea en péndulo, hay flexión de rodilla y rotación de tronco, mantiene equilibrio después de patear', 3, 3)
INSERT [dbo].[Preguntas_EvaMoto] ([IdPregunta], [Pregunta], [IdRangoEdad], [IdHabilidad]) VALUES (15, N'Lanza pelota con dirección definida, rota el tronco y extremidad superior que lanza se va hacia atrás.', 3, 4)
INSERT [dbo].[Preguntas_EvaMoto] ([IdPregunta], [Pregunta], [IdRangoEdad], [IdHabilidad]) VALUES (16, N'atrapa la pelota lamzada por el mismo con una sola mano', 3, 5)
INSERT [dbo].[Preguntas_EvaMoto] ([IdPregunta], [Pregunta], [IdRangoEdad], [IdHabilidad]) VALUES (17, N'Salta adelante, atrás y a los lados.', 3, 6)
GO
INSERT [dbo].[Preguntas_Psicosocial] ([IdPregunta], [Pregunta]) VALUES (1, N'¿Estudia actualmente?')
INSERT [dbo].[Preguntas_Psicosocial] ([IdPregunta], [Pregunta]) VALUES (2, N'Último año cursado')
INSERT [dbo].[Preguntas_Psicosocial] ([IdPregunta], [Pregunta]) VALUES (3, N'Vive con')
INSERT [dbo].[Preguntas_Psicosocial] ([IdPregunta], [Pregunta]) VALUES (4, N'Número de personas que viven en su casa (inclúyase usted)')
INSERT [dbo].[Preguntas_Psicosocial] ([IdPregunta], [Pregunta]) VALUES (5, N'Durante los últimos 30 días, ¿con qué frecuencia sentiste hambre porque no había sufiencientes alimentos en su hogar?')
INSERT [dbo].[Preguntas_Psicosocial] ([IdPregunta], [Pregunta]) VALUES (6, N'Durante los últimos 30 días, ¿cuantas veces al día comistes habitualmente frutas como manzanas, bananas, naranjas o mandarinas?')
INSERT [dbo].[Preguntas_Psicosocial] ([IdPregunta], [Pregunta]) VALUES (7, N'Durante los últimos 30 días, ¿cuantes veces al día comiste habitualmente verduras como lechuga, tomate, zanahorias y zapallo?')
INSERT [dbo].[Preguntas_Psicosocial] ([IdPregunta], [Pregunta]) VALUES (8, N'Durante los últimos 30 días, ¿cuantas veces por día habitualmente te lavaste o cepillaste los dientes?')
INSERT [dbo].[Preguntas_Psicosocial] ([IdPregunta], [Pregunta]) VALUES (9, N'¿Cuándo ue la última vez que viste a un dentistapara control, examen, limpieza de dientes u otro arreglo dental? ')
INSERT [dbo].[Preguntas_Psicosocial] ([IdPregunta], [Pregunta]) VALUES (10, N'Duante los últimos 30 días, ¿con qúe frecuencia te lavaste las manos antes de comer?')
INSERT [dbo].[Preguntas_Psicosocial] ([IdPregunta], [Pregunta]) VALUES (11, N'Duante los últimos 30 días, ¿con qúe frecuencia te lavaste las manos después de usar el inodoro o la letrina?')
INSERT [dbo].[Preguntas_Psicosocial] ([IdPregunta], [Pregunta]) VALUES (12, N'Duante los últimos 30 días, ¿con qúe frecuencia usaste el jabón al lavarte las manos?')
INSERT [dbo].[Preguntas_Psicosocial] ([IdPregunta], [Pregunta]) VALUES (13, N'¿Cuáles de tus padres o cuidadores consume alguna forma tabaco?')
INSERT [dbo].[Preguntas_Psicosocial] ([IdPregunta], [Pregunta]) VALUES (14, N'¿Ha transportado usted algunas veces un arma como cuchilla, revolver, pistola u otro?')
INSERT [dbo].[Preguntas_Psicosocial] ([IdPregunta], [Pregunta]) VALUES (15, N'¿Ha estado usted alguna vez en una pelea?')
INSERT [dbo].[Preguntas_Psicosocial] ([IdPregunta], [Pregunta]) VALUES (16, N'¿Ha estado usted alguna vez en una pelea donde lo aporrearon, hirieron o lo hayan tenido que llevar al médco, hospital o alguna enfermera?')
INSERT [dbo].[Preguntas_Psicosocial] ([IdPregunta], [Pregunta]) VALUES (17, N'¿Alguna vez ha tomado una bebida alcohólica?')
INSERT [dbo].[Preguntas_Psicosocial] ([IdPregunta], [Pregunta]) VALUES (18, N'¿Qué edad tenía cuando tomo por primera vez una bebida alcohólica')
GO
INSERT [dbo].[Pruebas] ([IdPrueba], [NombrePrueba]) VALUES (1, N'Presion arterial')
INSERT [dbo].[Pruebas] ([IdPrueba], [NombrePrueba]) VALUES (2, N'Maduracion sexual')
INSERT [dbo].[Pruebas] ([IdPrueba], [NombrePrueba]) VALUES (3, N'Antropometrica')
INSERT [dbo].[Pruebas] ([IdPrueba], [NombrePrueba]) VALUES (4, N'Fisica')
GO
INSERT [dbo].[Rangos_edades] ([IdRangoEdad], [RangoEdad]) VALUES (1, N'24 a 36 meses ')
INSERT [dbo].[Rangos_edades] ([IdRangoEdad], [RangoEdad]) VALUES (2, N'37 a 48 meses')
INSERT [dbo].[Rangos_edades] ([IdRangoEdad], [RangoEdad]) VALUES (3, N'49 a 60 meses')
INSERT [dbo].[Rangos_edades] ([IdRangoEdad], [RangoEdad]) VALUES (4, N'6 a 14 años')
INSERT [dbo].[Rangos_edades] ([IdRangoEdad], [RangoEdad]) VALUES (5, N'9 a 16 años')
INSERT [dbo].[Rangos_edades] ([IdRangoEdad], [RangoEdad]) VALUES (6, N'6 a 21 años')
INSERT [dbo].[Rangos_edades] ([IdRangoEdad], [RangoEdad]) VALUES (7, N'15 a 21 años')
INSERT [dbo].[Rangos_edades] ([IdRangoEdad], [RangoEdad]) VALUES (8, N'15 a 59 años')
INSERT [dbo].[Rangos_edades] ([IdRangoEdad], [RangoEdad]) VALUES (9, N'6 a 59 años')
GO
INSERT [dbo].[Respuestas_EvaMoto] ([IdRespuesta], [Respuesta]) VALUES (1, 1)
INSERT [dbo].[Respuestas_EvaMoto] ([IdRespuesta], [Respuesta]) VALUES (2, 0)
GO
INSERT [dbo].[Respuestas_Psicosocial] ([IdRespuesta], [Respuesta]) VALUES (1, N'Si')
INSERT [dbo].[Respuestas_Psicosocial] ([IdRespuesta], [Respuesta]) VALUES (2, N'No')
INSERT [dbo].[Respuestas_Psicosocial] ([IdRespuesta], [Respuesta]) VALUES (3, N'Ambos padres')
INSERT [dbo].[Respuestas_Psicosocial] ([IdRespuesta], [Respuesta]) VALUES (4, N'Solo con el padre')
INSERT [dbo].[Respuestas_Psicosocial] ([IdRespuesta], [Respuesta]) VALUES (5, N'Solo con la madre')
INSERT [dbo].[Respuestas_Psicosocial] ([IdRespuesta], [Respuesta]) VALUES (6, N'Otro pariente')
INSERT [dbo].[Respuestas_Psicosocial] ([IdRespuesta], [Respuesta]) VALUES (7, N'2')
INSERT [dbo].[Respuestas_Psicosocial] ([IdRespuesta], [Respuesta]) VALUES (8, N'3')
INSERT [dbo].[Respuestas_Psicosocial] ([IdRespuesta], [Respuesta]) VALUES (9, N'4')
INSERT [dbo].[Respuestas_Psicosocial] ([IdRespuesta], [Respuesta]) VALUES (10, N'6 o más')
INSERT [dbo].[Respuestas_Psicosocial] ([IdRespuesta], [Respuesta]) VALUES (11, N'Nunca')
INSERT [dbo].[Respuestas_Psicosocial] ([IdRespuesta], [Respuesta]) VALUES (12, N'Rara vez')
INSERT [dbo].[Respuestas_Psicosocial] ([IdRespuesta], [Respuesta]) VALUES (13, N'A veces')
INSERT [dbo].[Respuestas_Psicosocial] ([IdRespuesta], [Respuesta]) VALUES (14, N'Casi siempre')
INSERT [dbo].[Respuestas_Psicosocial] ([IdRespuesta], [Respuesta]) VALUES (15, N'Siempre')
INSERT [dbo].[Respuestas_Psicosocial] ([IdRespuesta], [Respuesta]) VALUES (16, N'No comí frutas durante los últimos 30 días')
INSERT [dbo].[Respuestas_Psicosocial] ([IdRespuesta], [Respuesta]) VALUES (17, N'Menos de una vez al día')
INSERT [dbo].[Respuestas_Psicosocial] ([IdRespuesta], [Respuesta]) VALUES (18, N'1 vez al día ')
INSERT [dbo].[Respuestas_Psicosocial] ([IdRespuesta], [Respuesta]) VALUES (19, N'2 veces al día')
INSERT [dbo].[Respuestas_Psicosocial] ([IdRespuesta], [Respuesta]) VALUES (20, N'3 veces al día')
INSERT [dbo].[Respuestas_Psicosocial] ([IdRespuesta], [Respuesta]) VALUES (21, N'4 veces al día')
INSERT [dbo].[Respuestas_Psicosocial] ([IdRespuesta], [Respuesta]) VALUES (22, N'5 o más veces al día')
INSERT [dbo].[Respuestas_Psicosocial] ([IdRespuesta], [Respuesta]) VALUES (23, N'No comí verduras durante los últimos 30 días')
INSERT [dbo].[Respuestas_Psicosocial] ([IdRespuesta], [Respuesta]) VALUES (24, N'4 o más veces al día')
INSERT [dbo].[Respuestas_Psicosocial] ([IdRespuesta], [Respuesta]) VALUES (25, N'Durante los últimos 12 meses')
INSERT [dbo].[Respuestas_Psicosocial] ([IdRespuesta], [Respuesta]) VALUES (26, N'Entre 12 y 24 meses')
INSERT [dbo].[Respuestas_Psicosocial] ([IdRespuesta], [Respuesta]) VALUES (27, N'Hace más de 24 meses')
INSERT [dbo].[Respuestas_Psicosocial] ([IdRespuesta], [Respuesta]) VALUES (28, N'No sé')
INSERT [dbo].[Respuestas_Psicosocial] ([IdRespuesta], [Respuesta]) VALUES (29, N'Ninguno')
INSERT [dbo].[Respuestas_Psicosocial] ([IdRespuesta], [Respuesta]) VALUES (30, N'Mi padre o cuidador')
INSERT [dbo].[Respuestas_Psicosocial] ([IdRespuesta], [Respuesta]) VALUES (31, N'Mi madre o cuidadora')
INSERT [dbo].[Respuestas_Psicosocial] ([IdRespuesta], [Respuesta]) VALUES (32, N'Ambos')
INSERT [dbo].[Respuestas_Psicosocial] ([IdRespuesta], [Respuesta]) VALUES (33, N'Ninguno de los de arriba')
INSERT [dbo].[Respuestas_Psicosocial] ([IdRespuesta], [Respuesta]) VALUES (34, N'años')
GO
INSERT [dbo].[Resultados_EncuestaPsicosocial] ([IdResultados_Psicosocial], [IdEncuestaPsicosocial], [IdPregunta], [IdRespuesta], [RespuestaNumerica], [RespuestaTexto]) VALUES (1, 1, 1, 1, 0, N'')
INSERT [dbo].[Resultados_EncuestaPsicosocial] ([IdResultados_Psicosocial], [IdEncuestaPsicosocial], [IdPregunta], [IdRespuesta], [RespuestaNumerica], [RespuestaTexto]) VALUES (2, 1, 3, 5, 0, N'')
INSERT [dbo].[Resultados_EncuestaPsicosocial] ([IdResultados_Psicosocial], [IdEncuestaPsicosocial], [IdPregunta], [IdRespuesta], [RespuestaNumerica], [RespuestaTexto]) VALUES (3, 1, 4, 7, 2, N'')
INSERT [dbo].[Resultados_EncuestaPsicosocial] ([IdResultados_Psicosocial], [IdEncuestaPsicosocial], [IdPregunta], [IdRespuesta], [RespuestaNumerica], [RespuestaTexto]) VALUES (4, 1, 5, 11, 0, N'')
INSERT [dbo].[Resultados_EncuestaPsicosocial] ([IdResultados_Psicosocial], [IdEncuestaPsicosocial], [IdPregunta], [IdRespuesta], [RespuestaNumerica], [RespuestaTexto]) VALUES (5, 1, 6, 18, 0, N'')
INSERT [dbo].[Resultados_EncuestaPsicosocial] ([IdResultados_Psicosocial], [IdEncuestaPsicosocial], [IdPregunta], [IdRespuesta], [RespuestaNumerica], [RespuestaTexto]) VALUES (6, 1, 7, 18, 0, N'')
INSERT [dbo].[Resultados_EncuestaPsicosocial] ([IdResultados_Psicosocial], [IdEncuestaPsicosocial], [IdPregunta], [IdRespuesta], [RespuestaNumerica], [RespuestaTexto]) VALUES (7, 1, 8, 20, 0, N'')
INSERT [dbo].[Resultados_EncuestaPsicosocial] ([IdResultados_Psicosocial], [IdEncuestaPsicosocial], [IdPregunta], [IdRespuesta], [RespuestaNumerica], [RespuestaTexto]) VALUES (8, 1, 9, 26, 0, N'')
INSERT [dbo].[Resultados_EncuestaPsicosocial] ([IdResultados_Psicosocial], [IdEncuestaPsicosocial], [IdPregunta], [IdRespuesta], [RespuestaNumerica], [RespuestaTexto]) VALUES (9, 1, 10, 12, 0, N'')
INSERT [dbo].[Resultados_EncuestaPsicosocial] ([IdResultados_Psicosocial], [IdEncuestaPsicosocial], [IdPregunta], [IdRespuesta], [RespuestaNumerica], [RespuestaTexto]) VALUES (10, 1, 11, 12, 0, N'')
INSERT [dbo].[Resultados_EncuestaPsicosocial] ([IdResultados_Psicosocial], [IdEncuestaPsicosocial], [IdPregunta], [IdRespuesta], [RespuestaNumerica], [RespuestaTexto]) VALUES (11, 1, 12, 13, 0, N'')
INSERT [dbo].[Resultados_EncuestaPsicosocial] ([IdResultados_Psicosocial], [IdEncuestaPsicosocial], [IdPregunta], [IdRespuesta], [RespuestaNumerica], [RespuestaTexto]) VALUES (12, 1, 14, 11, 0, N'')
INSERT [dbo].[Resultados_EncuestaPsicosocial] ([IdResultados_Psicosocial], [IdEncuestaPsicosocial], [IdPregunta], [IdRespuesta], [RespuestaNumerica], [RespuestaTexto]) VALUES (13, 1, 15, 11, 0, N'')
INSERT [dbo].[Resultados_EncuestaPsicosocial] ([IdResultados_Psicosocial], [IdEncuestaPsicosocial], [IdPregunta], [IdRespuesta], [RespuestaNumerica], [RespuestaTexto]) VALUES (14, 1, 16, 11, 0, N'')
INSERT [dbo].[Resultados_EncuestaPsicosocial] ([IdResultados_Psicosocial], [IdEncuestaPsicosocial], [IdPregunta], [IdRespuesta], [RespuestaNumerica], [RespuestaTexto]) VALUES (15, 1, 17, 1, 0, N'')
INSERT [dbo].[Resultados_EncuestaPsicosocial] ([IdResultados_Psicosocial], [IdEncuestaPsicosocial], [IdPregunta], [IdRespuesta], [RespuestaNumerica], [RespuestaTexto]) VALUES (16, 1, 18, 34, 17, N'')
INSERT [dbo].[Resultados_EncuestaPsicosocial] ([IdResultados_Psicosocial], [IdEncuestaPsicosocial], [IdPregunta], [IdRespuesta], [RespuestaNumerica], [RespuestaTexto]) VALUES (17, 2, 1, 1, 0, N'')
INSERT [dbo].[Resultados_EncuestaPsicosocial] ([IdResultados_Psicosocial], [IdEncuestaPsicosocial], [IdPregunta], [IdRespuesta], [RespuestaNumerica], [RespuestaTexto]) VALUES (18, 2, 2, 33, 11, N'')
INSERT [dbo].[Resultados_EncuestaPsicosocial] ([IdResultados_Psicosocial], [IdEncuestaPsicosocial], [IdPregunta], [IdRespuesta], [RespuestaNumerica], [RespuestaTexto]) VALUES (19, 2, 3, 3, 0, N'')
INSERT [dbo].[Resultados_EncuestaPsicosocial] ([IdResultados_Psicosocial], [IdEncuestaPsicosocial], [IdPregunta], [IdRespuesta], [RespuestaNumerica], [RespuestaTexto]) VALUES (20, 2, 4, 8, 0, N'')
INSERT [dbo].[Resultados_EncuestaPsicosocial] ([IdResultados_Psicosocial], [IdEncuestaPsicosocial], [IdPregunta], [IdRespuesta], [RespuestaNumerica], [RespuestaTexto]) VALUES (21, 2, 5, 14, 0, N'')
INSERT [dbo].[Resultados_EncuestaPsicosocial] ([IdResultados_Psicosocial], [IdEncuestaPsicosocial], [IdPregunta], [IdRespuesta], [RespuestaNumerica], [RespuestaTexto]) VALUES (22, 2, 6, 14, 0, N'')
INSERT [dbo].[Resultados_EncuestaPsicosocial] ([IdResultados_Psicosocial], [IdEncuestaPsicosocial], [IdPregunta], [IdRespuesta], [RespuestaNumerica], [RespuestaTexto]) VALUES (23, 2, 7, 14, 0, N'')
INSERT [dbo].[Resultados_EncuestaPsicosocial] ([IdResultados_Psicosocial], [IdEncuestaPsicosocial], [IdPregunta], [IdRespuesta], [RespuestaNumerica], [RespuestaTexto]) VALUES (24, 2, 8, 14, 0, N'')
INSERT [dbo].[Resultados_EncuestaPsicosocial] ([IdResultados_Psicosocial], [IdEncuestaPsicosocial], [IdPregunta], [IdRespuesta], [RespuestaNumerica], [RespuestaTexto]) VALUES (25, 2, 13, 4, 0, N'')
INSERT [dbo].[Resultados_EncuestaPsicosocial] ([IdResultados_Psicosocial], [IdEncuestaPsicosocial], [IdPregunta], [IdRespuesta], [RespuestaNumerica], [RespuestaTexto]) VALUES (26, 2, 17, 1, 0, N'')
INSERT [dbo].[Resultados_EncuestaPsicosocial] ([IdResultados_Psicosocial], [IdEncuestaPsicosocial], [IdPregunta], [IdRespuesta], [RespuestaNumerica], [RespuestaTexto]) VALUES (27, 2, 18, 34, 16, N'')
INSERT [dbo].[Resultados_EncuestaPsicosocial] ([IdResultados_Psicosocial], [IdEncuestaPsicosocial], [IdPregunta], [IdRespuesta], [RespuestaNumerica], [RespuestaTexto]) VALUES (28, 3, 1, 2, 0, N'')
INSERT [dbo].[Resultados_EncuestaPsicosocial] ([IdResultados_Psicosocial], [IdEncuestaPsicosocial], [IdPregunta], [IdRespuesta], [RespuestaNumerica], [RespuestaTexto]) VALUES (29, 3, 3, 33, 0, N'')
INSERT [dbo].[Resultados_EncuestaPsicosocial] ([IdResultados_Psicosocial], [IdEncuestaPsicosocial], [IdPregunta], [IdRespuesta], [RespuestaNumerica], [RespuestaTexto]) VALUES (30, 3, 4, 7, 0, N'')
INSERT [dbo].[Resultados_EncuestaPsicosocial] ([IdResultados_Psicosocial], [IdEncuestaPsicosocial], [IdPregunta], [IdRespuesta], [RespuestaNumerica], [RespuestaTexto]) VALUES (31, 3, 5, 18, 0, N'')
INSERT [dbo].[Resultados_EncuestaPsicosocial] ([IdResultados_Psicosocial], [IdEncuestaPsicosocial], [IdPregunta], [IdRespuesta], [RespuestaNumerica], [RespuestaTexto]) VALUES (32, 3, 6, 18, 0, N'')
INSERT [dbo].[Resultados_EncuestaPsicosocial] ([IdResultados_Psicosocial], [IdEncuestaPsicosocial], [IdPregunta], [IdRespuesta], [RespuestaNumerica], [RespuestaTexto]) VALUES (33, 3, 7, 18, 0, N'')
INSERT [dbo].[Resultados_EncuestaPsicosocial] ([IdResultados_Psicosocial], [IdEncuestaPsicosocial], [IdPregunta], [IdRespuesta], [RespuestaNumerica], [RespuestaTexto]) VALUES (34, 3, 8, 18, 0, N'')
INSERT [dbo].[Resultados_EncuestaPsicosocial] ([IdResultados_Psicosocial], [IdEncuestaPsicosocial], [IdPregunta], [IdRespuesta], [RespuestaNumerica], [RespuestaTexto]) VALUES (35, 3, 9, 25, 0, N'')
INSERT [dbo].[Resultados_EncuestaPsicosocial] ([IdResultados_Psicosocial], [IdEncuestaPsicosocial], [IdPregunta], [IdRespuesta], [RespuestaNumerica], [RespuestaTexto]) VALUES (36, 3, 10, 15, 0, N'')
INSERT [dbo].[Resultados_EncuestaPsicosocial] ([IdResultados_Psicosocial], [IdEncuestaPsicosocial], [IdPregunta], [IdRespuesta], [RespuestaNumerica], [RespuestaTexto]) VALUES (37, 3, 11, 15, 0, N'')
INSERT [dbo].[Resultados_EncuestaPsicosocial] ([IdResultados_Psicosocial], [IdEncuestaPsicosocial], [IdPregunta], [IdRespuesta], [RespuestaNumerica], [RespuestaTexto]) VALUES (38, 3, 12, 15, 0, N'')
INSERT [dbo].[Resultados_EncuestaPsicosocial] ([IdResultados_Psicosocial], [IdEncuestaPsicosocial], [IdPregunta], [IdRespuesta], [RespuestaNumerica], [RespuestaTexto]) VALUES (39, 3, 14, 1, 0, N'')
INSERT [dbo].[Resultados_EncuestaPsicosocial] ([IdResultados_Psicosocial], [IdEncuestaPsicosocial], [IdPregunta], [IdRespuesta], [RespuestaNumerica], [RespuestaTexto]) VALUES (40, 3, 15, 2, 0, N'')
INSERT [dbo].[Resultados_EncuestaPsicosocial] ([IdResultados_Psicosocial], [IdEncuestaPsicosocial], [IdPregunta], [IdRespuesta], [RespuestaNumerica], [RespuestaTexto]) VALUES (41, 3, 16, 2, 0, N'')
INSERT [dbo].[Resultados_EncuestaPsicosocial] ([IdResultados_Psicosocial], [IdEncuestaPsicosocial], [IdPregunta], [IdRespuesta], [RespuestaNumerica], [RespuestaTexto]) VALUES (42, 3, 17, 1, 0, N'')
INSERT [dbo].[Resultados_EncuestaPsicosocial] ([IdResultados_Psicosocial], [IdEncuestaPsicosocial], [IdPregunta], [IdRespuesta], [RespuestaNumerica], [RespuestaTexto]) VALUES (43, 3, 18, 34, 22, N'')
INSERT [dbo].[Resultados_EncuestaPsicosocial] ([IdResultados_Psicosocial], [IdEncuestaPsicosocial], [IdPregunta], [IdRespuesta], [RespuestaNumerica], [RespuestaTexto]) VALUES (44, 4, 3, 5, 0, N'')
INSERT [dbo].[Resultados_EncuestaPsicosocial] ([IdResultados_Psicosocial], [IdEncuestaPsicosocial], [IdPregunta], [IdRespuesta], [RespuestaNumerica], [RespuestaTexto]) VALUES (45, 4, 5, 11, 0, N'')
INSERT [dbo].[Resultados_EncuestaPsicosocial] ([IdResultados_Psicosocial], [IdEncuestaPsicosocial], [IdPregunta], [IdRespuesta], [RespuestaNumerica], [RespuestaTexto]) VALUES (46, 4, 9, 25, 0, N'')
INSERT [dbo].[Resultados_EncuestaPsicosocial] ([IdResultados_Psicosocial], [IdEncuestaPsicosocial], [IdPregunta], [IdRespuesta], [RespuestaNumerica], [RespuestaTexto]) VALUES (47, 4, 13, 31, 0, N'')
INSERT [dbo].[Resultados_EncuestaPsicosocial] ([IdResultados_Psicosocial], [IdEncuestaPsicosocial], [IdPregunta], [IdRespuesta], [RespuestaNumerica], [RespuestaTexto]) VALUES (48, 5, 1, 2, 0, N'')
INSERT [dbo].[Resultados_EncuestaPsicosocial] ([IdResultados_Psicosocial], [IdEncuestaPsicosocial], [IdPregunta], [IdRespuesta], [RespuestaNumerica], [RespuestaTexto]) VALUES (49, 5, 2, 33, 11, N'')
INSERT [dbo].[Resultados_EncuestaPsicosocial] ([IdResultados_Psicosocial], [IdEncuestaPsicosocial], [IdPregunta], [IdRespuesta], [RespuestaNumerica], [RespuestaTexto]) VALUES (50, 5, 3, 4, 0, N'')
INSERT [dbo].[Resultados_EncuestaPsicosocial] ([IdResultados_Psicosocial], [IdEncuestaPsicosocial], [IdPregunta], [IdRespuesta], [RespuestaNumerica], [RespuestaTexto]) VALUES (51, 5, 4, 7, 0, N'')
INSERT [dbo].[Resultados_EncuestaPsicosocial] ([IdResultados_Psicosocial], [IdEncuestaPsicosocial], [IdPregunta], [IdRespuesta], [RespuestaNumerica], [RespuestaTexto]) VALUES (52, 5, 5, 12, 0, N'')
INSERT [dbo].[Resultados_EncuestaPsicosocial] ([IdResultados_Psicosocial], [IdEncuestaPsicosocial], [IdPregunta], [IdRespuesta], [RespuestaNumerica], [RespuestaTexto]) VALUES (53, 5, 6, 13, 0, N'')
INSERT [dbo].[Resultados_EncuestaPsicosocial] ([IdResultados_Psicosocial], [IdEncuestaPsicosocial], [IdPregunta], [IdRespuesta], [RespuestaNumerica], [RespuestaTexto]) VALUES (54, 5, 7, 13, 0, N'')
INSERT [dbo].[Resultados_EncuestaPsicosocial] ([IdResultados_Psicosocial], [IdEncuestaPsicosocial], [IdPregunta], [IdRespuesta], [RespuestaNumerica], [RespuestaTexto]) VALUES (55, 5, 8, 19, 0, N'')
INSERT [dbo].[Resultados_EncuestaPsicosocial] ([IdResultados_Psicosocial], [IdEncuestaPsicosocial], [IdPregunta], [IdRespuesta], [RespuestaNumerica], [RespuestaTexto]) VALUES (56, 5, 9, 27, 0, N'')
INSERT [dbo].[Resultados_EncuestaPsicosocial] ([IdResultados_Psicosocial], [IdEncuestaPsicosocial], [IdPregunta], [IdRespuesta], [RespuestaNumerica], [RespuestaTexto]) VALUES (57, 5, 10, 13, 0, N'')
INSERT [dbo].[Resultados_EncuestaPsicosocial] ([IdResultados_Psicosocial], [IdEncuestaPsicosocial], [IdPregunta], [IdRespuesta], [RespuestaNumerica], [RespuestaTexto]) VALUES (58, 5, 11, 13, 0, N'')
INSERT [dbo].[Resultados_EncuestaPsicosocial] ([IdResultados_Psicosocial], [IdEncuestaPsicosocial], [IdPregunta], [IdRespuesta], [RespuestaNumerica], [RespuestaTexto]) VALUES (59, 5, 12, 13, 0, N'')
INSERT [dbo].[Resultados_EncuestaPsicosocial] ([IdResultados_Psicosocial], [IdEncuestaPsicosocial], [IdPregunta], [IdRespuesta], [RespuestaNumerica], [RespuestaTexto]) VALUES (60, 5, 13, 29, 0, N'')
INSERT [dbo].[Resultados_EncuestaPsicosocial] ([IdResultados_Psicosocial], [IdEncuestaPsicosocial], [IdPregunta], [IdRespuesta], [RespuestaNumerica], [RespuestaTexto]) VALUES (61, 5, 14, 2, 0, N'')
INSERT [dbo].[Resultados_EncuestaPsicosocial] ([IdResultados_Psicosocial], [IdEncuestaPsicosocial], [IdPregunta], [IdRespuesta], [RespuestaNumerica], [RespuestaTexto]) VALUES (62, 5, 15, 2, 0, N'')
INSERT [dbo].[Resultados_EncuestaPsicosocial] ([IdResultados_Psicosocial], [IdEncuestaPsicosocial], [IdPregunta], [IdRespuesta], [RespuestaNumerica], [RespuestaTexto]) VALUES (63, 5, 16, 2, 0, N'')
INSERT [dbo].[Resultados_EncuestaPsicosocial] ([IdResultados_Psicosocial], [IdEncuestaPsicosocial], [IdPregunta], [IdRespuesta], [RespuestaNumerica], [RespuestaTexto]) VALUES (64, 5, 17, 1, 0, N'')
INSERT [dbo].[Resultados_EncuestaPsicosocial] ([IdResultados_Psicosocial], [IdEncuestaPsicosocial], [IdPregunta], [IdRespuesta], [RespuestaNumerica], [RespuestaTexto]) VALUES (65, 5, 18, 34, 12, N'')
INSERT [dbo].[Resultados_EncuestaPsicosocial] ([IdResultados_Psicosocial], [IdEncuestaPsicosocial], [IdPregunta], [IdRespuesta], [RespuestaNumerica], [RespuestaTexto]) VALUES (66, 6, 1, 1, 0, N'')
INSERT [dbo].[Resultados_EncuestaPsicosocial] ([IdResultados_Psicosocial], [IdEncuestaPsicosocial], [IdPregunta], [IdRespuesta], [RespuestaNumerica], [RespuestaTexto]) VALUES (67, 6, 2, 33, 5, N'')
INSERT [dbo].[Resultados_EncuestaPsicosocial] ([IdResultados_Psicosocial], [IdEncuestaPsicosocial], [IdPregunta], [IdRespuesta], [RespuestaNumerica], [RespuestaTexto]) VALUES (68, 6, 3, 3, 0, N'')
INSERT [dbo].[Resultados_EncuestaPsicosocial] ([IdResultados_Psicosocial], [IdEncuestaPsicosocial], [IdPregunta], [IdRespuesta], [RespuestaNumerica], [RespuestaTexto]) VALUES (69, 6, 5, 11, 0, N'')
INSERT [dbo].[Resultados_EncuestaPsicosocial] ([IdResultados_Psicosocial], [IdEncuestaPsicosocial], [IdPregunta], [IdRespuesta], [RespuestaNumerica], [RespuestaTexto]) VALUES (70, 6, 6, 19, 0, N'')
INSERT [dbo].[Resultados_EncuestaPsicosocial] ([IdResultados_Psicosocial], [IdEncuestaPsicosocial], [IdPregunta], [IdRespuesta], [RespuestaNumerica], [RespuestaTexto]) VALUES (71, 6, 7, 19, 0, N'')
INSERT [dbo].[Resultados_EncuestaPsicosocial] ([IdResultados_Psicosocial], [IdEncuestaPsicosocial], [IdPregunta], [IdRespuesta], [RespuestaNumerica], [RespuestaTexto]) VALUES (72, 6, 9, 25, 0, N'')
INSERT [dbo].[Resultados_EncuestaPsicosocial] ([IdResultados_Psicosocial], [IdEncuestaPsicosocial], [IdPregunta], [IdRespuesta], [RespuestaNumerica], [RespuestaTexto]) VALUES (73, 7, 3, 5, 0, N'')
INSERT [dbo].[Resultados_EncuestaPsicosocial] ([IdResultados_Psicosocial], [IdEncuestaPsicosocial], [IdPregunta], [IdRespuesta], [RespuestaNumerica], [RespuestaTexto]) VALUES (74, 7, 5, 11, 0, N'')
INSERT [dbo].[Resultados_EncuestaPsicosocial] ([IdResultados_Psicosocial], [IdEncuestaPsicosocial], [IdPregunta], [IdRespuesta], [RespuestaNumerica], [RespuestaTexto]) VALUES (75, 7, 9, 25, 0, N'')
INSERT [dbo].[Resultados_EncuestaPsicosocial] ([IdResultados_Psicosocial], [IdEncuestaPsicosocial], [IdPregunta], [IdRespuesta], [RespuestaNumerica], [RespuestaTexto]) VALUES (76, 7, 13, 31, 0, N'')
GO
INSERT [dbo].[Resultados_Evaniños] ([IdResultados_pacientes], [IdEvaluacion], [IdPregunta], [IdRespuesta]) VALUES (1, 4, 1, 1)
INSERT [dbo].[Resultados_Evaniños] ([IdResultados_pacientes], [IdEvaluacion], [IdPregunta], [IdRespuesta]) VALUES (2, 4, 2, 2)
INSERT [dbo].[Resultados_Evaniños] ([IdResultados_pacientes], [IdEvaluacion], [IdPregunta], [IdRespuesta]) VALUES (3, 4, 3, 2)
INSERT [dbo].[Resultados_Evaniños] ([IdResultados_pacientes], [IdEvaluacion], [IdPregunta], [IdRespuesta]) VALUES (4, 4, 4, 2)
INSERT [dbo].[Resultados_Evaniños] ([IdResultados_pacientes], [IdEvaluacion], [IdPregunta], [IdRespuesta]) VALUES (5, 4, 5, 2)
INSERT [dbo].[Resultados_Evaniños] ([IdResultados_pacientes], [IdEvaluacion], [IdPregunta], [IdRespuesta]) VALUES (6, 7, 1, 1)
INSERT [dbo].[Resultados_Evaniños] ([IdResultados_pacientes], [IdEvaluacion], [IdPregunta], [IdRespuesta]) VALUES (7, 7, 2, 2)
INSERT [dbo].[Resultados_Evaniños] ([IdResultados_pacientes], [IdEvaluacion], [IdPregunta], [IdRespuesta]) VALUES (8, 7, 3, 1)
INSERT [dbo].[Resultados_Evaniños] ([IdResultados_pacientes], [IdEvaluacion], [IdPregunta], [IdRespuesta]) VALUES (9, 7, 4, 2)
INSERT [dbo].[Resultados_Evaniños] ([IdResultados_pacientes], [IdEvaluacion], [IdPregunta], [IdRespuesta]) VALUES (10, 7, 5, 2)
GO
INSERT [dbo].[Resultados_MedidasTomadas] ([IdResultadosMT], [IdEvaluacion], [IdMedida], [RespuestaNumerica], [IdUnidadMedida]) VALUES (1, 1, 1, CAST(112.00 AS Decimal(5, 2)), 1)
INSERT [dbo].[Resultados_MedidasTomadas] ([IdResultadosMT], [IdEvaluacion], [IdMedida], [RespuestaNumerica], [IdUnidadMedida]) VALUES (2, 1, 2, CAST(74.00 AS Decimal(5, 2)), 1)
INSERT [dbo].[Resultados_MedidasTomadas] ([IdResultadosMT], [IdEvaluacion], [IdMedida], [RespuestaNumerica], [IdUnidadMedida]) VALUES (3, 1, 3, CAST(28.10 AS Decimal(5, 2)), 3)
INSERT [dbo].[Resultados_MedidasTomadas] ([IdResultadosMT], [IdEvaluacion], [IdMedida], [RespuestaNumerica], [IdUnidadMedida]) VALUES (4, 1, 4, CAST(98.12 AS Decimal(5, 2)), 3)
INSERT [dbo].[Resultados_MedidasTomadas] ([IdResultadosMT], [IdEvaluacion], [IdMedida], [RespuestaNumerica], [IdUnidadMedida]) VALUES (5, 1, 5, CAST(60.69 AS Decimal(5, 2)), 3)
INSERT [dbo].[Resultados_MedidasTomadas] ([IdResultadosMT], [IdEvaluacion], [IdMedida], [RespuestaNumerica], [IdUnidadMedida]) VALUES (6, 1, 6, CAST(98.99 AS Decimal(5, 2)), 3)
INSERT [dbo].[Resultados_MedidasTomadas] ([IdResultadosMT], [IdEvaluacion], [IdMedida], [RespuestaNumerica], [IdUnidadMedida]) VALUES (7, 2, 7, CAST(5.68 AS Decimal(5, 2)), 3)
INSERT [dbo].[Resultados_MedidasTomadas] ([IdResultadosMT], [IdEvaluacion], [IdMedida], [RespuestaNumerica], [IdUnidadMedida]) VALUES (8, 2, 8, CAST(5.98 AS Decimal(5, 2)), 3)
INSERT [dbo].[Resultados_MedidasTomadas] ([IdResultadosMT], [IdEvaluacion], [IdMedida], [RespuestaNumerica], [IdUnidadMedida]) VALUES (9, 2, 9, CAST(9.25 AS Decimal(5, 2)), 3)
INSERT [dbo].[Resultados_MedidasTomadas] ([IdResultadosMT], [IdEvaluacion], [IdMedida], [RespuestaNumerica], [IdUnidadMedida]) VALUES (10, 2, 10, CAST(7.80 AS Decimal(5, 2)), 2)
INSERT [dbo].[Resultados_MedidasTomadas] ([IdResultadosMT], [IdEvaluacion], [IdMedida], [RespuestaNumerica], [IdUnidadMedida]) VALUES (11, 2, 11, CAST(6.42 AS Decimal(5, 2)), 2)
INSERT [dbo].[Resultados_MedidasTomadas] ([IdResultadosMT], [IdEvaluacion], [IdMedida], [RespuestaNumerica], [IdUnidadMedida]) VALUES (12, 2, 12, CAST(8.24 AS Decimal(5, 2)), 2)
INSERT [dbo].[Resultados_MedidasTomadas] ([IdResultadosMT], [IdEvaluacion], [IdMedida], [RespuestaNumerica], [IdUnidadMedida]) VALUES (13, 2, 13, CAST(14.80 AS Decimal(5, 2)), 2)
INSERT [dbo].[Resultados_MedidasTomadas] ([IdResultadosMT], [IdEvaluacion], [IdMedida], [RespuestaNumerica], [IdUnidadMedida]) VALUES (14, 2, 14, CAST(14.96 AS Decimal(5, 2)), 2)
INSERT [dbo].[Resultados_MedidasTomadas] ([IdResultadosMT], [IdEvaluacion], [IdMedida], [RespuestaNumerica], [IdUnidadMedida]) VALUES (15, 2, 15, CAST(4.23 AS Decimal(5, 2)), 2)
INSERT [dbo].[Resultados_MedidasTomadas] ([IdResultadosMT], [IdEvaluacion], [IdMedida], [RespuestaNumerica], [IdUnidadMedida]) VALUES (16, 3, 16, CAST(18.41 AS Decimal(5, 2)), 2)
INSERT [dbo].[Resultados_MedidasTomadas] ([IdResultadosMT], [IdEvaluacion], [IdMedida], [RespuestaNumerica], [IdUnidadMedida]) VALUES (17, 3, 17, CAST(-7.00 AS Decimal(5, 2)), NULL)
INSERT [dbo].[Resultados_MedidasTomadas] ([IdResultadosMT], [IdEvaluacion], [IdMedida], [RespuestaNumerica], [IdUnidadMedida]) VALUES (18, 3, 18, CAST(18.20 AS Decimal(5, 2)), 4)
INSERT [dbo].[Resultados_MedidasTomadas] ([IdResultadosMT], [IdEvaluacion], [IdMedida], [RespuestaNumerica], [IdUnidadMedida]) VALUES (19, 2, 19, CAST(210.34 AS Decimal(5, 2)), 3)
INSERT [dbo].[Resultados_MedidasTomadas] ([IdResultadosMT], [IdEvaluacion], [IdMedida], [RespuestaNumerica], [IdUnidadMedida]) VALUES (20, 3, 20, CAST(10.29 AS Decimal(5, 2)), 5)
INSERT [dbo].[Resultados_MedidasTomadas] ([IdResultadosMT], [IdEvaluacion], [IdMedida], [RespuestaNumerica], [IdUnidadMedida]) VALUES (21, 1, 28, CAST(20.00 AS Decimal(5, 2)), 6)
GO
INSERT [dbo].[Sexos] ([IdSexo], [Nombre]) VALUES (1, N'Masculino')
INSERT [dbo].[Sexos] ([IdSexo], [Nombre]) VALUES (2, N'Femenino')
GO
INSERT [dbo].[Tipos_DocumentosIdentidad] ([IdTipoDocumento], [TipoDocumento], [Descripción]) VALUES (1, N'RC', N'Registro Civil')
INSERT [dbo].[Tipos_DocumentosIdentidad] ([IdTipoDocumento], [TipoDocumento], [Descripción]) VALUES (2, N'TI', N'Tarjeta de Identidad')
INSERT [dbo].[Tipos_DocumentosIdentidad] ([IdTipoDocumento], [TipoDocumento], [Descripción]) VALUES (3, N'CC', N'Cédula de Ciudadanía')
INSERT [dbo].[Tipos_DocumentosIdentidad] ([IdTipoDocumento], [TipoDocumento], [Descripción]) VALUES (4, N'CE', N'Cédula de Extranjeria')
INSERT [dbo].[Tipos_DocumentosIdentidad] ([IdTipoDocumento], [TipoDocumento], [Descripción]) VALUES (5, N'PAP', N'Pasaporte')
GO
INSERT [dbo].[Tipos_evaluaciones] ([IdTipoEvaluacion], [TipoEvaluacion]) VALUES (1, N'Niños 2 a 5 años')
INSERT [dbo].[Tipos_evaluaciones] ([IdTipoEvaluacion], [TipoEvaluacion]) VALUES (2, N'Adolescente 6 a 14 años')
INSERT [dbo].[Tipos_evaluaciones] ([IdTipoEvaluacion], [TipoEvaluacion]) VALUES (3, N'Adulto joven 15 a 21 años')
INSERT [dbo].[Tipos_evaluaciones] ([IdTipoEvaluacion], [TipoEvaluacion]) VALUES (4, N'Adulto 22 a 59 años')
GO
INSERT [dbo].[Unidad_medidas] ([IdUnidadMedida], [NombreUMedida], [AbreviaciónUMedida]) VALUES (1, N'milimetro de mercurio', N'mm Hg')
INSERT [dbo].[Unidad_medidas] ([IdUnidadMedida], [NombreUMedida], [AbreviaciónUMedida]) VALUES (2, N'milimetro', N'mm')
INSERT [dbo].[Unidad_medidas] ([IdUnidadMedida], [NombreUMedida], [AbreviaciónUMedida]) VALUES (3, N'centimetro', N'cm')
INSERT [dbo].[Unidad_medidas] ([IdUnidadMedida], [NombreUMedida], [AbreviaciónUMedida]) VALUES (4, N'kilogramo', N'kg')
INSERT [dbo].[Unidad_medidas] ([IdUnidadMedida], [NombreUMedida], [AbreviaciónUMedida]) VALUES (5, N'segundos', N'seg')
INSERT [dbo].[Unidad_medidas] ([IdUnidadMedida], [NombreUMedida], [AbreviaciónUMedida]) VALUES (6, N'repeticiones', N'rep')
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [INDEX_DocumentoIdentidad]    Script Date: 15/10/2022 12:43:12 a. m. ******/
CREATE NONCLUSTERED INDEX [INDEX_DocumentoIdentidad] ON [dbo].[Datos_Pacientes]
(
	[DocumentoIdentidad] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [INDEX_FechaEvaluacion]    Script Date: 15/10/2022 12:43:12 a. m. ******/
CREATE NONCLUSTERED INDEX [INDEX_FechaEvaluacion] ON [dbo].[Evaluaciones]
(
	[FechaEvaluacion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Datos_Pacientes]  WITH CHECK ADD  CONSTRAINT [FK_Datos_Pacientes_Sexos] FOREIGN KEY([IdSexo])
REFERENCES [dbo].[Sexos] ([IdSexo])
GO
ALTER TABLE [dbo].[Datos_Pacientes] CHECK CONSTRAINT [FK_Datos_Pacientes_Sexos]
GO
ALTER TABLE [dbo].[Datos_Pacientes]  WITH CHECK ADD  CONSTRAINT [FK_Datos_Pacientes_Tipos_DocumentosIdentidad] FOREIGN KEY([IdTipoDocumento])
REFERENCES [dbo].[Tipos_DocumentosIdentidad] ([IdTipoDocumento])
GO
ALTER TABLE [dbo].[Datos_Pacientes] CHECK CONSTRAINT [FK_Datos_Pacientes_Tipos_DocumentosIdentidad]
GO
ALTER TABLE [dbo].[Encuestas_Psicosociales]  WITH CHECK ADD  CONSTRAINT [FK_Encuestas_Psicosociales_Evaluaciones] FOREIGN KEY([IdEvaluacion])
REFERENCES [dbo].[Evaluaciones] ([IdEvaluacion])
GO
ALTER TABLE [dbo].[Encuestas_Psicosociales] CHECK CONSTRAINT [FK_Encuestas_Psicosociales_Evaluaciones]
GO
ALTER TABLE [dbo].[Evaluaciones]  WITH CHECK ADD  CONSTRAINT [FK_Evaluaciones_Datos_Pacientes] FOREIGN KEY([IdPaciente])
REFERENCES [dbo].[Datos_Pacientes] ([IdPaciente])
GO
ALTER TABLE [dbo].[Evaluaciones] CHECK CONSTRAINT [FK_Evaluaciones_Datos_Pacientes]
GO
ALTER TABLE [dbo].[Evaluaciones]  WITH CHECK ADD  CONSTRAINT [FK_Evaluaciones_Tipos_evaluaciones] FOREIGN KEY([IdTipoEvaluacion])
REFERENCES [dbo].[Tipos_evaluaciones] ([IdTipoEvaluacion])
GO
ALTER TABLE [dbo].[Evaluaciones] CHECK CONSTRAINT [FK_Evaluaciones_Tipos_evaluaciones]
GO
ALTER TABLE [dbo].[Medidas]  WITH CHECK ADD  CONSTRAINT [FK_Medidas_Rangos_edades] FOREIGN KEY([IdRangoEdad])
REFERENCES [dbo].[Rangos_edades] ([IdRangoEdad])
GO
ALTER TABLE [dbo].[Medidas] CHECK CONSTRAINT [FK_Medidas_Rangos_edades]
GO
ALTER TABLE [dbo].[Medidas]  WITH CHECK ADD  CONSTRAINT [FK_Medidas_Tipo_Medidas] FOREIGN KEY([IdPrueba])
REFERENCES [dbo].[Pruebas] ([IdPrueba])
GO
ALTER TABLE [dbo].[Medidas] CHECK CONSTRAINT [FK_Medidas_Tipo_Medidas]
GO
ALTER TABLE [dbo].[Preguntas_EvaMoto]  WITH CHECK ADD  CONSTRAINT [FK_Preguntas_EvaMoto_Habilidades] FOREIGN KEY([IdHabilidad])
REFERENCES [dbo].[Habilidades] ([IdHabilidad])
GO
ALTER TABLE [dbo].[Preguntas_EvaMoto] CHECK CONSTRAINT [FK_Preguntas_EvaMoto_Habilidades]
GO
ALTER TABLE [dbo].[Preguntas_EvaMoto]  WITH CHECK ADD  CONSTRAINT [FK_Preguntas_EvaMoto_Rangos_edades] FOREIGN KEY([IdRangoEdad])
REFERENCES [dbo].[Rangos_edades] ([IdRangoEdad])
GO
ALTER TABLE [dbo].[Preguntas_EvaMoto] CHECK CONSTRAINT [FK_Preguntas_EvaMoto_Rangos_edades]
GO
ALTER TABLE [dbo].[Resultados_EncuestaPsicosocial]  WITH CHECK ADD  CONSTRAINT [FK_Resultados_EncuestaPsicosocial_Encuestas_Psicosociales] FOREIGN KEY([IdEncuestaPsicosocial])
REFERENCES [dbo].[Encuestas_Psicosociales] ([IdEncuestaPsicosocial])
GO
ALTER TABLE [dbo].[Resultados_EncuestaPsicosocial] CHECK CONSTRAINT [FK_Resultados_EncuestaPsicosocial_Encuestas_Psicosociales]
GO
ALTER TABLE [dbo].[Resultados_EncuestaPsicosocial]  WITH CHECK ADD  CONSTRAINT [FK_Resultados_EncuestaPsicosocial_Preguntas_Psicosocial] FOREIGN KEY([IdPregunta])
REFERENCES [dbo].[Preguntas_Psicosocial] ([IdPregunta])
GO
ALTER TABLE [dbo].[Resultados_EncuestaPsicosocial] CHECK CONSTRAINT [FK_Resultados_EncuestaPsicosocial_Preguntas_Psicosocial]
GO
ALTER TABLE [dbo].[Resultados_EncuestaPsicosocial]  WITH CHECK ADD  CONSTRAINT [FK_Resultados_EncuestaPsicosocial_Respuestas_preguntasPsicosocial] FOREIGN KEY([IdRespuesta])
REFERENCES [dbo].[Respuestas_Psicosocial] ([IdRespuesta])
GO
ALTER TABLE [dbo].[Resultados_EncuestaPsicosocial] CHECK CONSTRAINT [FK_Resultados_EncuestaPsicosocial_Respuestas_preguntasPsicosocial]
GO
ALTER TABLE [dbo].[Resultados_Evaniños]  WITH CHECK ADD  CONSTRAINT [FK_Evaluciones_niños_Preguntas_EvaMoto] FOREIGN KEY([IdPregunta])
REFERENCES [dbo].[Preguntas_EvaMoto] ([IdPregunta])
GO
ALTER TABLE [dbo].[Resultados_Evaniños] CHECK CONSTRAINT [FK_Evaluciones_niños_Preguntas_EvaMoto]
GO
ALTER TABLE [dbo].[Resultados_Evaniños]  WITH CHECK ADD  CONSTRAINT [FK_Evaluciones_niños_Respuestas_EvaMoto] FOREIGN KEY([IdRespuesta])
REFERENCES [dbo].[Respuestas_EvaMoto] ([IdRespuesta])
GO
ALTER TABLE [dbo].[Resultados_Evaniños] CHECK CONSTRAINT [FK_Evaluciones_niños_Respuestas_EvaMoto]
GO
ALTER TABLE [dbo].[Resultados_Evaniños]  WITH CHECK ADD  CONSTRAINT [FK_Resultados_Evaniños_Evaluaciones] FOREIGN KEY([IdEvaluacion])
REFERENCES [dbo].[Evaluaciones] ([IdEvaluacion])
GO
ALTER TABLE [dbo].[Resultados_Evaniños] CHECK CONSTRAINT [FK_Resultados_Evaniños_Evaluaciones]
GO
ALTER TABLE [dbo].[Resultados_MedidasTomadas]  WITH CHECK ADD  CONSTRAINT [FK_Resultados_MedidasTomadas_Evaluaciones] FOREIGN KEY([IdEvaluacion])
REFERENCES [dbo].[Evaluaciones] ([IdEvaluacion])
GO
ALTER TABLE [dbo].[Resultados_MedidasTomadas] CHECK CONSTRAINT [FK_Resultados_MedidasTomadas_Evaluaciones]
GO
ALTER TABLE [dbo].[Resultados_MedidasTomadas]  WITH CHECK ADD  CONSTRAINT [FK_Resultados_MedidasTomadas_Unidad_medidas] FOREIGN KEY([IdUnidadMedida])
REFERENCES [dbo].[Unidad_medidas] ([IdUnidadMedida])
GO
ALTER TABLE [dbo].[Resultados_MedidasTomadas] CHECK CONSTRAINT [FK_Resultados_MedidasTomadas_Unidad_medidas]
GO
ALTER TABLE [dbo].[Evaluaciones]  WITH CHECK ADD  CONSTRAINT [CK_FechaN] CHECK  (([FechaEvaluacion]<getdate()))
GO
ALTER TABLE [dbo].[Evaluaciones] CHECK CONSTRAINT [CK_FechaN]
GO
ALTER TABLE [dbo].[Evaluaciones]  WITH CHECK ADD  CONSTRAINT [CK_TipoEva] CHECK  (([IdTipoEvaluacion]>=(1)))
GO
ALTER TABLE [dbo].[Evaluaciones] CHECK CONSTRAINT [CK_TipoEva]
GO
/****** Object:  StoredProcedure [dbo].[Actividadmotoracumple]    Script Date: 15/10/2022 12:43:12 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:        Mauricio Arango
-- Create date:   14/10/2022 
/* Description:   Punto 7 : Obtener la actividad motora que más se cumple.
más alto salto horizontal. Mostrar los datos del paciente y el valor del
salto horizontal.*/
-- =============================================

CREATE PROCEDURE [dbo].[Actividadmotoracumple]  
    
AS
BEGIN
    
    SET NOCOUNT ON;

    SELECT TOP 1 peg.[Pregunta], COUNT(peg.Pregunta) AS 'Conteo' FROM [dbo].[Preguntas_EvaMoto] peg
    JOIN [dbo].[Resultados_Evaniños] nin ON peg.IdPregunta=nin.IdPregunta
    
    WHERE nin.[IdRespuesta]=1

    GROUP BY peg.[Pregunta] 
    ORDER BY 'Conteo' DESC

--Para evaluar 1 es que cumple y 2 no cumple
   
END


GO
/****** Object:  StoredProcedure [dbo].[ObtenerListadoPaciente15a59]    Script Date: 15/10/2022 12:43:12 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:        Mauricio Arango
-- Create date:   14/10/2022 
/* Description:    Obtener el listado de pacientes entre 15 y 59 años que tienen el
más alto salto horizontal. Mostrar los datos del paciente y el valor del
salto horizontal.*/
-- =============================================

CREATE PROCEDURE [dbo].[ObtenerListadoPaciente15a59]

AS
    
BEGIN
    -- SET NOCOUNT ON added to prevent extra result sets from
    -- interfering with SELECT statements.
    SET NOCOUNT ON;

    -- Insert statements for procedure here
    SELECT pac.*,res.RespuestaNumerica FROM [dbo].[Datos_Pacientes] pac 
    JOIN [dbo].[Evaluaciones] eva ON pac.IdPaciente=eva.IdPaciente 
    JOIN [dbo].[Resultados_MedidasTomadas] res ON eva.IdEvaluacion=res.IdEvaluacion

    WHERE DATEDIFF(DAY,[FechaNacimiento],GETDATE())/365 >15 
    AND DATEDIFF(DAY,[FechaNacimiento],GETDATE())/365 <=59
    AND res.IdMedida=20;
    
       

END

GO
/****** Object:  StoredProcedure [dbo].[ObtenerListadoPacientes6a14]    Script Date: 15/10/2022 12:43:12 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:       Katerine Cortes
-- Create date: 14/10/2022
/*-- Description: Obtener el listado de pacientes entre 6 y 14 años que tienen más baja
talla. Mostrar los datos del paciente y el valor de la talla.*/
-- =============================================
CREATE PROCEDURE [dbo].[ObtenerListadoPacientes6a14]

AS
BEGIN
    
    SET NOCOUNT ON;
    SELECT pac.*,eva.[Talla(cms)] FROM [dbo].[Datos_Pacientes] pac 
    JOIN [dbo].[Evaluaciones] eva ON pac.IdPaciente=eva.IdPaciente 
    
    WHERE DATEDIFF(DAY,[FechaNacimiento],GETDATE())/365 >=6 
    AND DATEDIFF(DAY,[FechaNacimiento],GETDATE())/365 <=14

    ORDER BY eva.[Talla(cms)] ASC
END

GO
/****** Object:  StoredProcedure [dbo].[SP_BUSCAR_consumo_alcohol]    Script Date: 15/10/2022 12:43:12 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*	Autor: Eduardo Bustamante
	Fecha:13/10/2022 
*/

--Para probar el procedimiento almacenado
--EXEC SP_BUSCAR_consumo_alcohol VerTabla

/*Procedimiento almacenado para obtener la tabla con los datos del paciente 
de usuarios que han consumido alcohol ordenada por la edad (menor a mayor)*/

CREATE PROC [dbo].[SP_BUSCAR_consumo_alcohol] (
	@Buscar nvarchar (50)
	)
AS

SET NOCOUNT ON

SELECT Y.IdPaciente, Z.Nombre, Z.Apellidos, Z.FechaNacimiento, [RespuestaNumerica] , Z.IdTipoDocumento, Z.DocumentoIdentidad, Z.IdSexo 
FROM [Taller].[dbo].[Resultados_EncuestaPsicosocial] X
LEFT JOIN (SELECT IdEvaluacion,IdPaciente FROM [Taller].[dbo].[Evaluaciones]) Y 
ON X.IdEncuestaPsicosocial = Y.IdEvaluacion
LEFT JOIN (SELECT IdPaciente, Nombre, Apellidos, DocumentoIdentidad, FechaNacimiento, IdTipoDocumento, IdSexo FROM [Taller_CondicionFisica].[dbo].[Datos_Pacientes]) Z 
ON Z.IdPaciente = Y.IdPaciente
WHERE IdRespuesta = 34 ORDER BY [RespuestaNumerica] ASC;

GO
/****** Object:  StoredProcedure [dbo].[SP_DELETE_FormAdolescentes]    Script Date: 15/10/2022 12:43:12 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*	Autor: Katerine Cortes
	Fecha:14/10/2022 
*/


/*
SELECT * FROM Datos_pacientes
SELECT * FROM Evaluaciones
SELECT * FROM Resultados_MedidasTomadas
*/


--Para probar el procedimeinto almacenado
--EXEC SP_DELETE_FormAdolescentes 7, 2


/*Procedimiento almacenado para eliminar el formulario 
de la evaluación motora de los adolescentes de 6 a 14 años*/

CREATE PROC [dbo].[SP_DELETE_FormAdolescentes] (
	@IdPaciente int,
	@IdEvaluacion int )
	
AS

SET NOCOUNT ON

IF EXISTS (SELECT * FROM [dbo].[Datos_Pacientes] WHERE @IdPaciente = IdPaciente)

BEGIN
	DELETE FROM Evaluaciones WHERE @IdEvaluacion = IdEvaluacion
	DELETE FROM Datos_Pacientes WHERE @IdPaciente = IdPaciente
	DELETE FROM Resultados_MedidasTomadas WHERE @IdEvaluacion = IdEvaluacion
	DELETE FROM Encuestas_Psicosociales WHERE @IdEvaluacion = IdEvaluacion

END
ELSE 
	Print 'No se eliminó ningun registro'
GO
/****** Object:  StoredProcedure [dbo].[SP_INSERTAR_Encuesta]    Script Date: 15/10/2022 12:43:12 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*	Autor: Eduardo Bustamante
	Fecha:13/10/2022 
*/

/*
INSERT INTO [Taller].[dbo].[Encuestas_Psicosociales] ([IdEncuestaPsicosocial],[IdEvaluacion]) SELECT [IdEvaluacion],[IdEvaluacion] FROM [Taller].[dbo].[Evaluaciones];
*/

--Para probar el procedimiento almacenado
--EXEC SP_INSERTAR_encuesta 8


/*Procedimiento almacenado para insertar la encuesta relacionada al id de la evaluación*/

CREATE PROC [dbo].[SP_INSERTAR_Encuesta] (
	@IdEncuestaPsicosocial int
	)
AS

SET NOCOUNT ON

IF NOT EXISTS (SELECT * FROM [dbo].[Encuestas_Psicosociales] WHERE IdEvaluacion=@IdEncuestaPsicosocial)
BEGIN
	INSERT INTO Encuestas_Psicosociales (IdEncuestaPsicosocial,IdEvaluacion)
	values (@IdEncuestaPsicosocial, @IdEncuestaPsicosocial)
	Print 'La evaluación fue agregada a la tabla de encuestas correctamente'
END
ELSE
	Print 'La evaluación ya existe en la tabla de encuestas'
GO
/****** Object:  StoredProcedure [dbo].[SP_INSERTAR_FormNiños]    Script Date: 15/10/2022 12:43:12 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*	Autor: Yuly Mosquera
	Fecha:12/10/2022 
*/


/*
SELECT * FROM Datos_Pacientes
SELECT * FROM Evaluaciones
SELECT * FROM Resultados_Evaniños
*/


--Para probar el procedimeinto almacenado
--EXEC SP_INSERTAR_FormNiños 5, 'Marcela', 'Torres', '08/08/2019', 1, '1022758472', 2, 8, '2022-10-06', 'Comfama centro', 14.4, 95, 3, 1, 11, 1, 1


/*Procedimiento almacenado para insertar el formulario 
de la evaluación motora de los niños de 2 a 5 años*/

CREATE PROC [dbo].[SP_INSERTAR_FormNiños] (
	@IdPaciente int,
	@Nombre nvarchar (50),
	@Apellidos nvarchar (50),
	@FechaNacimiento date,
	@IdTipoDocumento int,
	@DocumentoIdentidad varchar(50),
	@IdSexo int,
	@IdEvaluacion int,
	@FechaEvaluacion date,
	@SitioEvaluacion nvarchar(50),
	@Peso decimal(4,1),
	@Talla decimal(4,1),
	@Edad tinyint,
	@IdTipoEvaluacion int,
	@IdResultados_pacientes int,
	@IdPregunta int,
	@IdRespuesta int
	)

AS

SET NOCOUNT ON

IF NOT EXISTS (SELECT * FROM [dbo].[Datos_Pacientes] WHERE IdPaciente=@IdPaciente AND DocumentoIdentidad=@DocumentoIdentidad )
BEGIN
	INSERT INTO Datos_Pacientes (IdPaciente,Nombre,Apellidos,FechaNacimiento,IdTipoDocumento,DocumentoIdentidad,IdSexo)
	values (@IdPaciente,@Nombre,@Apellidos,@FechaNacimiento,@IdTipoDocumento, @DocumentoIdentidad,@IdSexo)
	Print 'Los datos del paciente se agregaron correctamente'
END
ELSE
	Print 'El paciente ya existe'

IF NOT EXISTS (SELECT * FROM [dbo].[Evaluaciones] WHERE IdEvaluacion=@IdEvaluacion)
BEGIN
	INSERT INTO Evaluaciones (IdEvaluacion, IdPaciente,FechaEvaluacion,SitioEvaluacion,[Peso(kg)],[Talla(cms)],Edad,IdTipoEvaluacion)
	values (@IdEvaluacion, @IdPaciente, @FechaEvaluacion,@SitioEvaluacion,@Peso,@Talla,@Edad,@IdTipoEvaluacion)
	Print 'La evaluación se agregó correctamente'
END
ELSE
	Print 'La evaluación ya existe'

IF NOT EXISTS (SELECT * FROM [dbo].[Resultados_Evaniños] WHERE IdResultados_pacientes=@IdResultados_pacientes )
BEGIN
	INSERT INTO [dbo].[Resultados_Evaniños] (IdResultados_pacientes,IdEvaluacion,IdPregunta,IdRespuesta) 
	values (@IdResultados_pacientes,@IdEvaluacion,@IdPregunta, @IdRespuesta)
	Print 'Los resultados se agregaron correctamente'
END
ELSE
	Print 'Los resultados ya existe'
	
GO
/****** Object:  StoredProcedure [dbo].[SP_SELECT_FormNiños]    Script Date: 15/10/2022 12:43:12 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*	Autor: Yuly Mosquera
	Fecha:12/10/2022 
*/


/*
SELECT * FROM Datos_Pacientes
SELECT * FROM Evaluaciones
SELECT * FROM Resultados_Evaniños
*/

--¨Para probar el procedimiento almacenado
--EXEC SP_SELECT_FormNiños '1047747384', '2022'


/*Procedimiento almacenado para obtener el formulario 
de la evaluación motora de los niños de 2 a 5 años*/


CREATE PROC [dbo].[SP_SELECT_FormNiños] (
	@DocumentoIdentidad varchar(50),
	@FechaEvaluacion date
	)

AS

SELECT * FROM Datos_Pacientes dp
INNER JOIN  Evaluaciones ev
ON ev.IdPaciente= dp.IdPaciente
INNER JOIN Resultados_Evaniños rs
ON rs.IdEvaluacion = ev.IdEvaluacion
and ev.IdPaciente= dp.IdPaciente
WHERE DocumentoIdentidad= @DocumentoIdentidad OR FechaEvaluacion=@FechaEvaluacion




GO
/****** Object:  StoredProcedure [dbo].[SP_UPDATE_FormAdultos]    Script Date: 15/10/2022 12:43:12 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*	Autor: Katerine Cortes
	Fecha:14/10/2022 
*/


/*
SELECT * FROM Datos_Pacientes
SELECT * FROM Evaluaciones
SELECT * FROM Resultados_MedidasTomadas
*/

--EXEC SP_UPDATE_FormAdultos 5, 'Camilo', 'Torres', 3, 1, 8, '12-10-1982', 'FNSP', 14.4, 95, 3, 1, 1, 2


/*Procedimiento almacenado para actualizar el formulario 
de la evaluación motora de los adultos de 15 a 59 años*/

CREATE PROC [dbo].[SP_UPDATE_FormAdultos] (
	@IdPaciente int,
	@Nombre nvarchar (50),
	@Apellidos nvarchar (50),
	@IdTipoDocumento int,
	@IdSexo int,
	@IdEvaluacion int,
	@FechaEvaluacion date,
	@SitioEvaluacion nvarchar(50),
	@Peso decimal(4,1),
	@Talla decimal(4,1),
	@Edad tinyint,
	@IdTipoEvaluacion int,
	@RespuestaNumerica int
)

AS

SET NOCOUNT ON

IF EXISTS(SELECT * FROM Datos_Pacientes WHERE IdPaciente = @IdPaciente)
BEGIN
UPDATE [dbo].[Datos_Pacientes]
	SET
	Nombre= @Nombre,
	Apellidos= @Apellidos,
	IdTipoDocumento=@IdTipoDocumento,
	IdSexo= @IdSexo
	
WHERE 
	IdPaciente = @IdPaciente
END
ELSE
	Print 'Se realizaron 0 actulizaciones en la tabla pacientes'

IF EXISTS(SELECT * FROM Evaluaciones WHERE IdPaciente = @IdPaciente)
BEGIN
UPDATE [dbo].[Evaluaciones] 
	SET
	FechaEvaluacion= @FechaEvaluacion,
	SitioEvaluacion= @SitioEvaluacion,
	[Peso(kg)]= @Peso,
	[Talla(cms)]= @Talla,
	Edad= @Edad,
	IdTipoEvaluacion= @IdTipoEvaluacion
	
WHERE 
	IdPaciente = @IdPaciente
END
ELSE
	Print 'Se realizaron 0 actulizaciones en la tabla evaluaciones'

IF EXISTS(SELECT * FROM Resultados_MedidasTomadas WHERE IdEvaluacion = @IdEvaluacion)
BEGIN
UPDATE [dbo].[Resultados_MedidasTomadas] 
	SET 
	RespuestaNumerica= @RespuestaNumerica
WHERE 
	IdEvaluacion=@IdEvaluacion
END
ELSE
	Print 'Se realizaron 0 actulizaciones en la tabla resultados'
GO
USE [master]
GO
ALTER DATABASE [Taller_CondicionFisica] SET  READ_WRITE 
GO
