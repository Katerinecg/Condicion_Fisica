USE [master]
GO
/****** Object:  Database [Condicion_Fisica]    Script Date: 12/08/2022 06:16:24 p. m. ******/
CREATE DATABASE [Condicion_Fisica]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'BD_Condicion_Fisica', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\BD_Condicion_Fisica.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'BD_Condicion_Fisica_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\BD_Condicion_Fisica_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [Condicion_Fisica] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Condicion_Fisica].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Condicion_Fisica] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Condicion_Fisica] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Condicion_Fisica] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Condicion_Fisica] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Condicion_Fisica] SET ARITHABORT OFF 
GO
ALTER DATABASE [Condicion_Fisica] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Condicion_Fisica] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Condicion_Fisica] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Condicion_Fisica] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Condicion_Fisica] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Condicion_Fisica] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Condicion_Fisica] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Condicion_Fisica] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Condicion_Fisica] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Condicion_Fisica] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Condicion_Fisica] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Condicion_Fisica] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Condicion_Fisica] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Condicion_Fisica] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Condicion_Fisica] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Condicion_Fisica] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Condicion_Fisica] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Condicion_Fisica] SET RECOVERY FULL 
GO
ALTER DATABASE [Condicion_Fisica] SET  MULTI_USER 
GO
ALTER DATABASE [Condicion_Fisica] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Condicion_Fisica] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Condicion_Fisica] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Condicion_Fisica] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Condicion_Fisica] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Condicion_Fisica] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'Condicion_Fisica', N'ON'
GO
ALTER DATABASE [Condicion_Fisica] SET QUERY_STORE = OFF
GO
USE [Condicion_Fisica]
GO
/****** Object:  Table [dbo].[abdominales30Seg]    Script Date: 12/08/2022 06:16:24 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[abdominales30Seg](
	[Id_abdominales30seg] [int] NOT NULL,
	[ID_Paciente] [int] NOT NULL,
	[numeroRepeticiones] [tinyint] NOT NULL,
 CONSTRAINT [PK_abdominales30Seg] PRIMARY KEY CLUSTERED 
(
	[Id_abdominales30seg] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Datos_pacientes]    Script Date: 12/08/2022 06:16:24 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Datos_pacientes](
	[IDPaciente] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [nvarchar](50) NOT NULL,
	[Apellidos] [nvarchar](50) NOT NULL,
	[FechaNacimiento] [date] NOT NULL,
	[EdadenMeses]  AS (datediff(month,[FechaNacimiento],getdate())),
	[EdadenAños]  AS (datediff(year,[FechaNacimiento],getdate())),
 CONSTRAINT [PK_Datos_pacientes] PRIMARY KEY CLUSTERED 
(
	[IDPaciente] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[dinanometriaManual]    Script Date: 12/08/2022 06:16:24 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[dinanometriaManual](
	[Id_dinanometriaManual] [int] NOT NULL,
	[ID_Paciente] [int] NOT NULL,
	[FuerzaIsometrica(kg)] [decimal](4, 2) NOT NULL,
 CONSTRAINT [PK_dinanometriaManual] PRIMARY KEY CLUSTERED 
(
	[Id_dinanometriaManual] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EncuestaPsicosocial]    Script Date: 12/08/2022 06:16:24 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EncuestaPsicosocial](
	[Id_EncuestaPsicosocial] [int] NOT NULL,
	[Id_Paciente] [int] NOT NULL,
	[Documento] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_EncuestaPsicosocial] PRIMARY KEY CLUSTERED 
(
	[Id_EncuestaPsicosocial] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Encuestas]    Script Date: 12/08/2022 06:16:24 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Encuestas](
	[IDEncuesta] [int] IDENTITY(1,1) NOT NULL,
	[IDPaciente] [int] NULL,
	[FechaEncuesta] [datetime2](7) NOT NULL,
	[SitioEvaluacion] [nvarchar](50) NULL,
	[Peso(kg)] [decimal](4, 2) NOT NULL,
	[Talla(cms)] [decimal](4, 2) NOT NULL,
 CONSTRAINT [PK_Encuestas] PRIMARY KEY CLUSTERED 
(
	[IDEncuesta] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Habilidades]    Script Date: 12/08/2022 06:16:24 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Habilidades](
	[IDHabilidad] [int] IDENTITY(1,1) NOT NULL,
	[Habilidad] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Habilidades] PRIMARY KEY CLUSTERED 
(
	[IDHabilidad] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[maduracionSexual]    Script Date: 12/08/2022 06:16:24 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[maduracionSexual](
	[Id_maduracionSexual] [int] NOT NULL,
	[ID_Paciente] [int] NOT NULL,
	[Genero] [char](1) NOT NULL,
	[VelloPubico] [tinyint] NOT NULL,
	[Tamaño_y_Forma] [tinyint] NOT NULL,
 CONSTRAINT [PK_maduracionSexual] PRIMARY KEY CLUSTERED 
(
	[Id_maduracionSexual] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Medicion_diametroCodo]    Script Date: 12/08/2022 06:16:24 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Medicion_diametroCodo](
	[Id_diametroCodo] [int] NOT NULL,
	[ID_Paciente] [int] NOT NULL,
	[diametroCodo(cm)] [decimal](4, 2) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Medicion_diametroRodilla]    Script Date: 12/08/2022 06:16:24 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Medicion_diametroRodilla](
	[Id_diametroRodilla] [int] NOT NULL,
	[ID_Paciente] [int] NOT NULL,
	[diametroRodilla(cm)] [decimal](4, 2) NOT NULL,
 CONSTRAINT [PK_Medicion_diametroRodilla] PRIMARY KEY CLUSTERED 
(
	[Id_diametroRodilla] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Medicion_perimetroBrazo]    Script Date: 12/08/2022 06:16:24 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Medicion_perimetroBrazo](
	[Id_perimetroBrazo] [int] NOT NULL,
	[ID_Paciente] [int] NOT NULL,
	[perimetroBrazo(cm)] [decimal](4, 2) NOT NULL,
 CONSTRAINT [PK_Medicion_perimetroBrazo] PRIMARY KEY CLUSTERED 
(
	[Id_perimetroBrazo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Medicion_perimetroCadera]    Script Date: 12/08/2022 06:16:24 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Medicion_perimetroCadera](
	[Id_perimetroCadera] [int] NOT NULL,
	[ID_Paciente] [int] NOT NULL,
	[perimetroCadera(cm)] [decimal](4, 2) NOT NULL,
 CONSTRAINT [PK_Medicion_perimetroCadera] PRIMARY KEY CLUSTERED 
(
	[Id_perimetroCadera] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Medicion_perimetroCintura]    Script Date: 12/08/2022 06:16:24 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Medicion_perimetroCintura](
	[Id_perimetroCintura] [int] NOT NULL,
	[ID_Paciente] [int] NOT NULL,
	[perimetroCintura(cm)] [decimal](4, 2) NOT NULL,
 CONSTRAINT [PK_Medicion_perimetroCintura] PRIMARY KEY CLUSTERED 
(
	[Id_perimetroCintura] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Medicion_perimetroPierna]    Script Date: 12/08/2022 06:16:24 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Medicion_perimetroPierna](
	[Id_perimetroPierna] [int] NOT NULL,
	[ID_Paciente] [int] NOT NULL,
	[perimetroPierna(cm)] [decimal](4, 2) NOT NULL,
 CONSTRAINT [PK_Medicion_perimetroPierna] PRIMARY KEY CLUSTERED 
(
	[Id_perimetroPierna] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Medicion_peso]    Script Date: 12/08/2022 06:16:24 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Medicion_peso](
	[Id_peso] [int] NOT NULL,
	[ID_Paciente] [int] NOT NULL,
	[Peso] [decimal](5, 2) NOT NULL,
 CONSTRAINT [PK_Medicion_peso] PRIMARY KEY CLUSTERED 
(
	[Id_peso] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Medicion_pliegueAbdominal]    Script Date: 12/08/2022 06:16:24 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Medicion_pliegueAbdominal](
	[Id_pliegueAbdominal] [int] NOT NULL,
	[ID_Paciente] [int] NOT NULL,
	[pliegueAbdominal(mm)] [decimal](4, 2) NOT NULL,
 CONSTRAINT [PK_Medicion_pliegueAbdominal] PRIMARY KEY CLUSTERED 
(
	[Id_pliegueAbdominal] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Medicion_pliegueBiceps]    Script Date: 12/08/2022 06:16:24 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Medicion_pliegueBiceps](
	[Id_pliegueBiceps] [int] NOT NULL,
	[ID_Paciente] [int] NOT NULL,
	[pliegueBiceps(mm)] [decimal](4, 2) NOT NULL,
 CONSTRAINT [PK_Medicion_pliegueBiceps] PRIMARY KEY CLUSTERED 
(
	[Id_pliegueBiceps] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Medicion_pliegueCrestaIliaca]    Script Date: 12/08/2022 06:16:24 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Medicion_pliegueCrestaIliaca](
	[Id_pliegueCrestaIliaca] [int] NOT NULL,
	[ID_Paciente] [int] NOT NULL,
	[pliegueCrestaIliaca(mm)] [decimal](4, 2) NOT NULL,
 CONSTRAINT [PK_Medicion_pliegueCrestaIliacca] PRIMARY KEY CLUSTERED 
(
	[Id_pliegueCrestaIliaca] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Medicion_pliegueMuslo]    Script Date: 12/08/2022 06:16:24 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Medicion_pliegueMuslo](
	[Id_pliegueMuslo] [int] NOT NULL,
	[ID_Paciente] [int] NOT NULL,
	[pliegueMuslo(mm)] [decimal](4, 2) NOT NULL,
 CONSTRAINT [PK_Medicion_pliegueMuslo] PRIMARY KEY CLUSTERED 
(
	[Id_pliegueMuslo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Medicion_plieguePierna]    Script Date: 12/08/2022 06:16:24 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Medicion_plieguePierna](
	[Id_pliegueMuslo] [int] NOT NULL,
	[ID_Paciente] [int] NOT NULL,
	[plieguePierna(mm)] [decimal](4, 2) NOT NULL,
 CONSTRAINT [PK_Medicion_plieguePierna] PRIMARY KEY CLUSTERED 
(
	[Id_pliegueMuslo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Medicion_pliegueSubescapular]    Script Date: 12/08/2022 06:16:24 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Medicion_pliegueSubescapular](
	[Id_pliegueSubescapular] [int] NOT NULL,
	[ID_Paciente] [int] NOT NULL,
	[pliegueSubescapular(mm)] [decimal](4, 2) NOT NULL,
 CONSTRAINT [PK_Medicion_pliegueSubescapular] PRIMARY KEY CLUSTERED 
(
	[Id_pliegueSubescapular] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Medicion_pliegueSupraespinal]    Script Date: 12/08/2022 06:16:24 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Medicion_pliegueSupraespinal](
	[Id_pliegueSupraespinal] [int] NOT NULL,
	[ID_Paciente] [int] NOT NULL,
	[pliegueSupraespinal(mm)] [decimal](4, 2) NOT NULL,
 CONSTRAINT [PK_Medicion_pliegueSupraespinal] PRIMARY KEY CLUSTERED 
(
	[Id_pliegueSupraespinal] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Medicion_pliegueTriceps]    Script Date: 12/08/2022 06:16:24 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Medicion_pliegueTriceps](
	[Id_pliegueTriceps] [int] NOT NULL,
	[ID_Paciente] [int] NOT NULL,
	[pliegueTriceps(mm)] [decimal](4, 2) NOT NULL,
 CONSTRAINT [PK_Medicion_pliegueTriceps] PRIMARY KEY CLUSTERED 
(
	[Id_pliegueTriceps] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Medicion_talla]    Script Date: 12/08/2022 06:16:24 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Medicion_talla](
	[Id_talla] [int] NOT NULL,
	[ID_Paciente] [int] NOT NULL,
	[Talla] [decimal](5, 2) NOT NULL,
 CONSTRAINT [PK_Medicion_talla] PRIMARY KEY CLUSTERED 
(
	[Id_talla] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Preguntas]    Script Date: 12/08/2022 06:16:24 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Preguntas](
	[IdPreguntas] [int] NOT NULL,
	[Pregunta] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_Preguntas] PRIMARY KEY CLUSTERED 
(
	[IdPreguntas] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Preguntas_EvaMoto]    Script Date: 12/08/2022 06:16:24 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Preguntas_EvaMoto](
	[IDPregunta] [int] IDENTITY(1,1) NOT NULL,
	[Pregunta] [nvarchar](max) NULL,
	[IDRangoEdad] [int] NOT NULL,
	[IDHabilidad] [int] NOT NULL,
 CONSTRAINT [PK_Preguntas_EvaMoto] PRIMARY KEY CLUSTERED 
(
	[IDPregunta] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[presionArterial]    Script Date: 12/08/2022 06:16:24 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[presionArterial](
	[Id_presionArterial] [int] IDENTITY(1,1) NOT NULL,
	[ID_Paciente] [int] NOT NULL,
	[Sistolica] [tinyint] NOT NULL,
	[Diastolica] [tinyint] NOT NULL,
 CONSTRAINT [PK_presionArterial] PRIMARY KEY CLUSTERED 
(
	[Id_presionArterial] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[pressBanca]    Script Date: 12/08/2022 06:16:24 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[pressBanca](
	[Id_pressBanca] [int] NOT NULL,
	[ID_Paciente] [int] NOT NULL,
	[numeroRepeticiones] [tinyint] NOT NULL,
	[pesoMaximo(kg)] [tinyint] NOT NULL,
 CONSTRAINT [PK_pressBanca] PRIMARY KEY CLUSTERED 
(
	[Id_pressBanca] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[pushUp]    Script Date: 12/08/2022 06:16:24 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[pushUp](
	[Id_pushUp] [int] NOT NULL,
	[ID_Paciente] [int] NOT NULL,
	[numeroRepeticiones] [tinyint] NOT NULL,
 CONSTRAINT [PK_pushUp] PRIMARY KEY CLUSTERED 
(
	[Id_pushUp] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Rangos_edades]    Script Date: 12/08/2022 06:16:24 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Rangos_edades](
	[IDRangoEdad] [int] IDENTITY(1,1) NOT NULL,
	[RangoEdad] [nvarchar](30) NOT NULL,
 CONSTRAINT [PK_Rangos_edades] PRIMARY KEY CLUSTERED 
(
	[IDRangoEdad] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RespuestaPregunta]    Script Date: 12/08/2022 06:16:24 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RespuestaPregunta](
	[IdRespuesta] [nvarchar](50) NOT NULL,
	[Respuesta] [nvarchar](50) NOT NULL,
	[Observación] [nvarchar](50) NULL,
 CONSTRAINT [PK_Table_1] PRIMARY KEY CLUSTERED 
(
	[IdRespuesta] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Respuestas_EvaMoto]    Script Date: 12/08/2022 06:16:24 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Respuestas_EvaMoto](
	[IDRespuesta] [int] IDENTITY(1,1) NOT NULL,
	[Respuesta] [bit] NULL,
 CONSTRAINT [PK_Resuestas_EvaMoto] PRIMARY KEY CLUSTERED 
(
	[IDRespuesta] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Respuestas_pacientes]    Script Date: 12/08/2022 06:16:24 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Respuestas_pacientes](
	[IDRespuestas_pacientes] [int] IDENTITY(1,1) NOT NULL,
	[IDEncuesta] [int] NOT NULL,
	[IDPregunta] [int] NOT NULL,
	[IDRespuesta] [int] NOT NULL,
 CONSTRAINT [PK_Respuestas_pacientes] PRIMARY KEY CLUSTERED 
(
	[IDRespuestas_pacientes] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Resultados]    Script Date: 12/08/2022 06:16:24 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Resultados](
	[Id_Resultados] [int] NOT NULL,
	[IdPreguntas] [int] NOT NULL,
	[IdRespuestas] [nvarchar](50) NOT NULL,
	[Id_EncuestaPsicosocial] [int] NOT NULL,
 CONSTRAINT [PK_Resultados] PRIMARY KEY CLUSTERED 
(
	[Id_Resultados] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[saltoHorizontal]    Script Date: 12/08/2022 06:16:24 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[saltoHorizontal](
	[Id_saltoHorizontal] [int] NOT NULL,
	[ID_Paciente] [int] NOT NULL,
	[distanciaSalto(cm)] [decimal](5, 2) NOT NULL,
 CONSTRAINT [PK_saltoHorizontal] PRIMARY KEY CLUSTERED 
(
	[Id_saltoHorizontal] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[saltoVertical]    Script Date: 12/08/2022 06:16:24 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[saltoVertical](
	[Id_saltoVertical] [int] NOT NULL,
	[ID_Paciente] [int] NOT NULL,
	[distanciaSalto(cm)] [decimal](5, 2) NOT NULL,
 CONSTRAINT [PK_saltoVertical] PRIMARY KEY CLUSTERED 
(
	[Id_saltoVertical] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[sentadillaProfunda]    Script Date: 12/08/2022 06:16:24 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sentadillaProfunda](
	[Id_sentadillaProfunda] [int] NOT NULL,
	[ID_Paciente] [int] NOT NULL,
	[numeroRepeticiones] [tinyint] NOT NULL,
	[pesoMaximo(kg)] [tinyint] NOT NULL,
 CONSTRAINT [PK_sentadillaProfunda] PRIMARY KEY CLUSTERED 
(
	[Id_sentadillaProfunda] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Test_agilidadCoordinacion]    Script Date: 12/08/2022 06:16:24 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Test_agilidadCoordinacion](
	[Id_agilidadCoordinacion] [int] NOT NULL,
	[ID_Paciente] [int] NOT NULL,
	[tiempoGastado(seg)] [decimal](5, 2) NOT NULL,
 CONSTRAINT [PK_Test_agilidadCoordinacion] PRIMARY KEY CLUSTERED 
(
	[Id_agilidadCoordinacion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Test_resistenciaGeneral]    Script Date: 12/08/2022 06:16:24 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Test_resistenciaGeneral](
	[Id_resistenciaGeneral] [int] NOT NULL,
	[ID_Paciente] [int] NOT NULL,
	[tiempoAguantado] [tinyint] NOT NULL,
 CONSTRAINT [PK_Test_resistenciaGeneral] PRIMARY KEY CLUSTERED 
(
	[Id_resistenciaGeneral] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Test_velocidad20metros]    Script Date: 12/08/2022 06:16:24 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Test_velocidad20metros](
	[Id_velocidad20mtrs] [int] NOT NULL,
	[ID_Paciente] [int] NOT NULL,
	[tiempoDesplazamiento(seg)] [decimal](4, 2) NOT NULL,
 CONSTRAINT [PK_Test_velocidad20metros] PRIMARY KEY CLUSTERED 
(
	[Id_velocidad20mtrs] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Test_wells]    Script Date: 12/08/2022 06:16:24 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Test_wells](
	[Id_testWells] [int] NOT NULL,
	[ID_Paciente] [int] NOT NULL,
	[ElongacionArticulacion] [smallint] NOT NULL,
 CONSTRAINT [PK_Test_wells] PRIMARY KEY CLUSTERED 
(
	[Id_testWells] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[abdominales30Seg]  WITH CHECK ADD  CONSTRAINT [FK_abdominales30Seg_Datos_pacientes] FOREIGN KEY([ID_Paciente])
REFERENCES [dbo].[Datos_pacientes] ([IDPaciente])
GO
ALTER TABLE [dbo].[abdominales30Seg] CHECK CONSTRAINT [FK_abdominales30Seg_Datos_pacientes]
GO
ALTER TABLE [dbo].[dinanometriaManual]  WITH CHECK ADD  CONSTRAINT [FK_dinanometriaManual_Datos_pacientes] FOREIGN KEY([ID_Paciente])
REFERENCES [dbo].[Datos_pacientes] ([IDPaciente])
GO
ALTER TABLE [dbo].[dinanometriaManual] CHECK CONSTRAINT [FK_dinanometriaManual_Datos_pacientes]
GO
ALTER TABLE [dbo].[EncuestaPsicosocial]  WITH CHECK ADD  CONSTRAINT [FK_EncuestaPsicosocial_Datos_pacientes] FOREIGN KEY([Id_Paciente])
REFERENCES [dbo].[Datos_pacientes] ([IDPaciente])
GO
ALTER TABLE [dbo].[EncuestaPsicosocial] CHECK CONSTRAINT [FK_EncuestaPsicosocial_Datos_pacientes]
GO
ALTER TABLE [dbo].[Encuestas]  WITH CHECK ADD  CONSTRAINT [FK_Encuestas_Datos_pacientes] FOREIGN KEY([IDPaciente])
REFERENCES [dbo].[Datos_pacientes] ([IDPaciente])
GO
ALTER TABLE [dbo].[Encuestas] CHECK CONSTRAINT [FK_Encuestas_Datos_pacientes]
GO
ALTER TABLE [dbo].[maduracionSexual]  WITH CHECK ADD  CONSTRAINT [FK_maduracionSexual_Datos_pacientes] FOREIGN KEY([ID_Paciente])
REFERENCES [dbo].[Datos_pacientes] ([IDPaciente])
GO
ALTER TABLE [dbo].[maduracionSexual] CHECK CONSTRAINT [FK_maduracionSexual_Datos_pacientes]
GO
ALTER TABLE [dbo].[Medicion_diametroCodo]  WITH CHECK ADD  CONSTRAINT [FK_Medicion_diametroCodo_Datos_pacientes] FOREIGN KEY([ID_Paciente])
REFERENCES [dbo].[Datos_pacientes] ([IDPaciente])
GO
ALTER TABLE [dbo].[Medicion_diametroCodo] CHECK CONSTRAINT [FK_Medicion_diametroCodo_Datos_pacientes]
GO
ALTER TABLE [dbo].[Medicion_diametroRodilla]  WITH CHECK ADD  CONSTRAINT [FK_Medicion_diametroRodilla_Datos_pacientes] FOREIGN KEY([ID_Paciente])
REFERENCES [dbo].[Datos_pacientes] ([IDPaciente])
GO
ALTER TABLE [dbo].[Medicion_diametroRodilla] CHECK CONSTRAINT [FK_Medicion_diametroRodilla_Datos_pacientes]
GO
ALTER TABLE [dbo].[Medicion_perimetroBrazo]  WITH CHECK ADD  CONSTRAINT [FK_Medicion_perimetroBrazo_Datos_pacientes] FOREIGN KEY([ID_Paciente])
REFERENCES [dbo].[Datos_pacientes] ([IDPaciente])
GO
ALTER TABLE [dbo].[Medicion_perimetroBrazo] CHECK CONSTRAINT [FK_Medicion_perimetroBrazo_Datos_pacientes]
GO
ALTER TABLE [dbo].[Medicion_perimetroCadera]  WITH CHECK ADD  CONSTRAINT [FK_Medicion_perimetroCadera_Datos_pacientes] FOREIGN KEY([ID_Paciente])
REFERENCES [dbo].[Datos_pacientes] ([IDPaciente])
GO
ALTER TABLE [dbo].[Medicion_perimetroCadera] CHECK CONSTRAINT [FK_Medicion_perimetroCadera_Datos_pacientes]
GO
ALTER TABLE [dbo].[Medicion_perimetroCintura]  WITH CHECK ADD  CONSTRAINT [FK_Medicion_perimetroCintura_Datos_pacientes] FOREIGN KEY([ID_Paciente])
REFERENCES [dbo].[Datos_pacientes] ([IDPaciente])
GO
ALTER TABLE [dbo].[Medicion_perimetroCintura] CHECK CONSTRAINT [FK_Medicion_perimetroCintura_Datos_pacientes]
GO
ALTER TABLE [dbo].[Medicion_perimetroPierna]  WITH CHECK ADD  CONSTRAINT [FK_Medicion_perimetroPierna_Datos_pacientes] FOREIGN KEY([ID_Paciente])
REFERENCES [dbo].[Datos_pacientes] ([IDPaciente])
GO
ALTER TABLE [dbo].[Medicion_perimetroPierna] CHECK CONSTRAINT [FK_Medicion_perimetroPierna_Datos_pacientes]
GO
ALTER TABLE [dbo].[Medicion_peso]  WITH CHECK ADD  CONSTRAINT [FK_Medicion_peso_Datos_pacientes] FOREIGN KEY([ID_Paciente])
REFERENCES [dbo].[Datos_pacientes] ([IDPaciente])
GO
ALTER TABLE [dbo].[Medicion_peso] CHECK CONSTRAINT [FK_Medicion_peso_Datos_pacientes]
GO
ALTER TABLE [dbo].[Medicion_pliegueAbdominal]  WITH CHECK ADD  CONSTRAINT [FK_Medicion_pliegueAbdominal_Datos_pacientes] FOREIGN KEY([ID_Paciente])
REFERENCES [dbo].[Datos_pacientes] ([IDPaciente])
GO
ALTER TABLE [dbo].[Medicion_pliegueAbdominal] CHECK CONSTRAINT [FK_Medicion_pliegueAbdominal_Datos_pacientes]
GO
ALTER TABLE [dbo].[Medicion_pliegueBiceps]  WITH CHECK ADD  CONSTRAINT [FK_Medicion_pliegueBiceps_Datos_pacientes] FOREIGN KEY([ID_Paciente])
REFERENCES [dbo].[Datos_pacientes] ([IDPaciente])
GO
ALTER TABLE [dbo].[Medicion_pliegueBiceps] CHECK CONSTRAINT [FK_Medicion_pliegueBiceps_Datos_pacientes]
GO
ALTER TABLE [dbo].[Medicion_pliegueCrestaIliaca]  WITH CHECK ADD  CONSTRAINT [FK_Medicion_pliegueCrestaIliaca_Datos_pacientes] FOREIGN KEY([ID_Paciente])
REFERENCES [dbo].[Datos_pacientes] ([IDPaciente])
GO
ALTER TABLE [dbo].[Medicion_pliegueCrestaIliaca] CHECK CONSTRAINT [FK_Medicion_pliegueCrestaIliaca_Datos_pacientes]
GO
ALTER TABLE [dbo].[Medicion_pliegueMuslo]  WITH CHECK ADD  CONSTRAINT [FK_Medicion_pliegueMuslo_Datos_pacientes] FOREIGN KEY([ID_Paciente])
REFERENCES [dbo].[Datos_pacientes] ([IDPaciente])
GO
ALTER TABLE [dbo].[Medicion_pliegueMuslo] CHECK CONSTRAINT [FK_Medicion_pliegueMuslo_Datos_pacientes]
GO
ALTER TABLE [dbo].[Medicion_plieguePierna]  WITH CHECK ADD  CONSTRAINT [FK_Medicion_plieguePierna_Datos_pacientes] FOREIGN KEY([ID_Paciente])
REFERENCES [dbo].[Datos_pacientes] ([IDPaciente])
GO
ALTER TABLE [dbo].[Medicion_plieguePierna] CHECK CONSTRAINT [FK_Medicion_plieguePierna_Datos_pacientes]
GO
ALTER TABLE [dbo].[Medicion_pliegueSubescapular]  WITH CHECK ADD  CONSTRAINT [FK_Medicion_pliegueSubescapular_Datos_pacientes] FOREIGN KEY([ID_Paciente])
REFERENCES [dbo].[Datos_pacientes] ([IDPaciente])
GO
ALTER TABLE [dbo].[Medicion_pliegueSubescapular] CHECK CONSTRAINT [FK_Medicion_pliegueSubescapular_Datos_pacientes]
GO
ALTER TABLE [dbo].[Medicion_pliegueSupraespinal]  WITH CHECK ADD  CONSTRAINT [FK_Medicion_pliegueSupraespinal_Datos_pacientes] FOREIGN KEY([ID_Paciente])
REFERENCES [dbo].[Datos_pacientes] ([IDPaciente])
GO
ALTER TABLE [dbo].[Medicion_pliegueSupraespinal] CHECK CONSTRAINT [FK_Medicion_pliegueSupraespinal_Datos_pacientes]
GO
ALTER TABLE [dbo].[Medicion_pliegueTriceps]  WITH CHECK ADD  CONSTRAINT [FK_Medicion_pliegueTriceps_Datos_pacientes] FOREIGN KEY([ID_Paciente])
REFERENCES [dbo].[Datos_pacientes] ([IDPaciente])
GO
ALTER TABLE [dbo].[Medicion_pliegueTriceps] CHECK CONSTRAINT [FK_Medicion_pliegueTriceps_Datos_pacientes]
GO
ALTER TABLE [dbo].[Medicion_talla]  WITH CHECK ADD  CONSTRAINT [FK_Medicion_talla_Datos_pacientes] FOREIGN KEY([ID_Paciente])
REFERENCES [dbo].[Datos_pacientes] ([IDPaciente])
GO
ALTER TABLE [dbo].[Medicion_talla] CHECK CONSTRAINT [FK_Medicion_talla_Datos_pacientes]
GO
ALTER TABLE [dbo].[Preguntas_EvaMoto]  WITH CHECK ADD  CONSTRAINT [FK_Preguntas_EvaMoto_Habilidades] FOREIGN KEY([IDHabilidad])
REFERENCES [dbo].[Habilidades] ([IDHabilidad])
GO
ALTER TABLE [dbo].[Preguntas_EvaMoto] CHECK CONSTRAINT [FK_Preguntas_EvaMoto_Habilidades]
GO
ALTER TABLE [dbo].[Preguntas_EvaMoto]  WITH CHECK ADD  CONSTRAINT [FK_Preguntas_EvaMoto_Rangos_edades] FOREIGN KEY([IDRangoEdad])
REFERENCES [dbo].[Rangos_edades] ([IDRangoEdad])
GO
ALTER TABLE [dbo].[Preguntas_EvaMoto] CHECK CONSTRAINT [FK_Preguntas_EvaMoto_Rangos_edades]
GO
ALTER TABLE [dbo].[presionArterial]  WITH CHECK ADD  CONSTRAINT [FK_presionArterial_Datos_pacientes] FOREIGN KEY([ID_Paciente])
REFERENCES [dbo].[Datos_pacientes] ([IDPaciente])
GO
ALTER TABLE [dbo].[presionArterial] CHECK CONSTRAINT [FK_presionArterial_Datos_pacientes]
GO
ALTER TABLE [dbo].[pressBanca]  WITH CHECK ADD  CONSTRAINT [FK_pressBanca_Datos_pacientes] FOREIGN KEY([ID_Paciente])
REFERENCES [dbo].[Datos_pacientes] ([IDPaciente])
GO
ALTER TABLE [dbo].[pressBanca] CHECK CONSTRAINT [FK_pressBanca_Datos_pacientes]
GO
ALTER TABLE [dbo].[pushUp]  WITH CHECK ADD  CONSTRAINT [FK_pushUp_Datos_pacientes] FOREIGN KEY([ID_Paciente])
REFERENCES [dbo].[Datos_pacientes] ([IDPaciente])
GO
ALTER TABLE [dbo].[pushUp] CHECK CONSTRAINT [FK_pushUp_Datos_pacientes]
GO
ALTER TABLE [dbo].[Respuestas_pacientes]  WITH CHECK ADD  CONSTRAINT [FK_Respuestas_pacientes_Encuestas1] FOREIGN KEY([IDEncuesta])
REFERENCES [dbo].[Encuestas] ([IDEncuesta])
GO
ALTER TABLE [dbo].[Respuestas_pacientes] CHECK CONSTRAINT [FK_Respuestas_pacientes_Encuestas1]
GO
ALTER TABLE [dbo].[Respuestas_pacientes]  WITH CHECK ADD  CONSTRAINT [FK_Respuestas_pacientes_Preguntas_EvaMoto] FOREIGN KEY([IDPregunta])
REFERENCES [dbo].[Preguntas_EvaMoto] ([IDPregunta])
GO
ALTER TABLE [dbo].[Respuestas_pacientes] CHECK CONSTRAINT [FK_Respuestas_pacientes_Preguntas_EvaMoto]
GO
ALTER TABLE [dbo].[Respuestas_pacientes]  WITH CHECK ADD  CONSTRAINT [FK_Respuestas_pacientes_Respuestas_EvaMoto] FOREIGN KEY([IDRespuesta])
REFERENCES [dbo].[Respuestas_EvaMoto] ([IDRespuesta])
GO
ALTER TABLE [dbo].[Respuestas_pacientes] CHECK CONSTRAINT [FK_Respuestas_pacientes_Respuestas_EvaMoto]
GO
ALTER TABLE [dbo].[Resultados]  WITH CHECK ADD  CONSTRAINT [FK_Resultados_EncuestaPsicosocial] FOREIGN KEY([Id_EncuestaPsicosocial])
REFERENCES [dbo].[EncuestaPsicosocial] ([Id_EncuestaPsicosocial])
GO
ALTER TABLE [dbo].[Resultados] CHECK CONSTRAINT [FK_Resultados_EncuestaPsicosocial]
GO
ALTER TABLE [dbo].[Resultados]  WITH CHECK ADD  CONSTRAINT [FK_Resultados_Preguntas] FOREIGN KEY([IdPreguntas])
REFERENCES [dbo].[Preguntas] ([IdPreguntas])
GO
ALTER TABLE [dbo].[Resultados] CHECK CONSTRAINT [FK_Resultados_Preguntas]
GO
ALTER TABLE [dbo].[Resultados]  WITH CHECK ADD  CONSTRAINT [FK_Resultados_RespuestaPregunta] FOREIGN KEY([IdRespuestas])
REFERENCES [dbo].[RespuestaPregunta] ([IdRespuesta])
GO
ALTER TABLE [dbo].[Resultados] CHECK CONSTRAINT [FK_Resultados_RespuestaPregunta]
GO
ALTER TABLE [dbo].[saltoHorizontal]  WITH CHECK ADD  CONSTRAINT [FK_saltoHorizontal_Datos_pacientes] FOREIGN KEY([ID_Paciente])
REFERENCES [dbo].[Datos_pacientes] ([IDPaciente])
GO
ALTER TABLE [dbo].[saltoHorizontal] CHECK CONSTRAINT [FK_saltoHorizontal_Datos_pacientes]
GO
ALTER TABLE [dbo].[saltoVertical]  WITH CHECK ADD  CONSTRAINT [FK_saltoVertical_Datos_pacientes] FOREIGN KEY([ID_Paciente])
REFERENCES [dbo].[Datos_pacientes] ([IDPaciente])
GO
ALTER TABLE [dbo].[saltoVertical] CHECK CONSTRAINT [FK_saltoVertical_Datos_pacientes]
GO
ALTER TABLE [dbo].[sentadillaProfunda]  WITH CHECK ADD  CONSTRAINT [FK_sentadillaProfunda_Datos_pacientes] FOREIGN KEY([ID_Paciente])
REFERENCES [dbo].[Datos_pacientes] ([IDPaciente])
GO
ALTER TABLE [dbo].[sentadillaProfunda] CHECK CONSTRAINT [FK_sentadillaProfunda_Datos_pacientes]
GO
ALTER TABLE [dbo].[Test_agilidadCoordinacion]  WITH CHECK ADD  CONSTRAINT [FK_Test_agilidadCoordinacion_Datos_pacientes] FOREIGN KEY([ID_Paciente])
REFERENCES [dbo].[Datos_pacientes] ([IDPaciente])
GO
ALTER TABLE [dbo].[Test_agilidadCoordinacion] CHECK CONSTRAINT [FK_Test_agilidadCoordinacion_Datos_pacientes]
GO
ALTER TABLE [dbo].[Test_resistenciaGeneral]  WITH CHECK ADD  CONSTRAINT [FK_Test_resistenciaGeneral_Datos_pacientes] FOREIGN KEY([ID_Paciente])
REFERENCES [dbo].[Datos_pacientes] ([IDPaciente])
GO
ALTER TABLE [dbo].[Test_resistenciaGeneral] CHECK CONSTRAINT [FK_Test_resistenciaGeneral_Datos_pacientes]
GO
ALTER TABLE [dbo].[Test_velocidad20metros]  WITH CHECK ADD  CONSTRAINT [FK_Test_velocidad20metros_Datos_pacientes] FOREIGN KEY([ID_Paciente])
REFERENCES [dbo].[Datos_pacientes] ([IDPaciente])
GO
ALTER TABLE [dbo].[Test_velocidad20metros] CHECK CONSTRAINT [FK_Test_velocidad20metros_Datos_pacientes]
GO
ALTER TABLE [dbo].[Test_wells]  WITH CHECK ADD  CONSTRAINT [FK_Test_wells_Datos_pacientes] FOREIGN KEY([ID_Paciente])
REFERENCES [dbo].[Datos_pacientes] ([IDPaciente])
GO
ALTER TABLE [dbo].[Test_wells] CHECK CONSTRAINT [FK_Test_wells_Datos_pacientes]
GO
ALTER TABLE [dbo].[Datos_pacientes]  WITH CHECK ADD  CONSTRAINT [CK_FechaN] CHECK  (([FechaNacimiento]<getdate()))
GO
ALTER TABLE [dbo].[Datos_pacientes] CHECK CONSTRAINT [CK_FechaN]
GO
ALTER TABLE [dbo].[Encuestas]  WITH CHECK ADD  CONSTRAINT [CK_FechaE] CHECK  (([FechaEncuesta]<getdate()))
GO
ALTER TABLE [dbo].[Encuestas] CHECK CONSTRAINT [CK_FechaE]
GO
ALTER TABLE [dbo].[maduracionSexual]  WITH CHECK ADD  CONSTRAINT [CK_maduracionSexual] CHECK  (([VelloPubico]>=(1) AND [VelloPubico]<=(5)))
GO
ALTER TABLE [dbo].[maduracionSexual] CHECK CONSTRAINT [CK_maduracionSexual]
GO
ALTER TABLE [dbo].[maduracionSexual]  WITH CHECK ADD  CONSTRAINT [CK_maduracionSexual_1] CHECK  (([Tamaño_y_Forma]>=(1) AND [Tamaño_y_Forma]<=(5)))
GO
ALTER TABLE [dbo].[maduracionSexual] CHECK CONSTRAINT [CK_maduracionSexual_1]
GO
USE [master]
GO
ALTER DATABASE [Condicion_Fisica] SET  READ_WRITE 
GO
