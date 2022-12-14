USE [master]
GO
/****** Object:  Database [Condicion_Fisica]    Script Date: 20/08/2022 10:29:14 p. m. ******/
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
/****** Object:  Table [dbo].[abdominales30Seg]    Script Date: 20/08/2022 10:29:14 p. m. ******/
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
/****** Object:  Table [dbo].[Datos_pacientes]    Script Date: 20/08/2022 10:29:14 p. m. ******/
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
/****** Object:  Table [dbo].[dinanometriaManual]    Script Date: 20/08/2022 10:29:14 p. m. ******/
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
/****** Object:  Table [dbo].[EncuestaPsicosocial]    Script Date: 20/08/2022 10:29:14 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EncuestaPsicosocial](
	[Id_EncuestaPsicosocial] [nvarchar](50) NOT NULL,
	[Id_Paciente] [int] NOT NULL,
	[Documento] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_EncuestaPsicosocial] PRIMARY KEY CLUSTERED 
(
	[Id_EncuestaPsicosocial] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Encuestas]    Script Date: 20/08/2022 10:29:14 p. m. ******/
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
/****** Object:  Table [dbo].[Habilidades]    Script Date: 20/08/2022 10:29:14 p. m. ******/
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
/****** Object:  Table [dbo].[maduracionSexual]    Script Date: 20/08/2022 10:29:14 p. m. ******/
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
/****** Object:  Table [dbo].[Medicion_diametroCodo]    Script Date: 20/08/2022 10:29:14 p. m. ******/
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
/****** Object:  Table [dbo].[Medicion_diametroRodilla]    Script Date: 20/08/2022 10:29:14 p. m. ******/
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
/****** Object:  Table [dbo].[Medicion_perimetroBrazo]    Script Date: 20/08/2022 10:29:14 p. m. ******/
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
/****** Object:  Table [dbo].[Medicion_perimetroCadera]    Script Date: 20/08/2022 10:29:14 p. m. ******/
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
/****** Object:  Table [dbo].[Medicion_perimetroCintura]    Script Date: 20/08/2022 10:29:14 p. m. ******/
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
/****** Object:  Table [dbo].[Medicion_perimetroPierna]    Script Date: 20/08/2022 10:29:14 p. m. ******/
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
/****** Object:  Table [dbo].[Medicion_peso]    Script Date: 20/08/2022 10:29:14 p. m. ******/
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
/****** Object:  Table [dbo].[Medicion_pliegueAbdominal]    Script Date: 20/08/2022 10:29:14 p. m. ******/
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
/****** Object:  Table [dbo].[Medicion_pliegueBiceps]    Script Date: 20/08/2022 10:29:14 p. m. ******/
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
/****** Object:  Table [dbo].[Medicion_pliegueCrestaIliaca]    Script Date: 20/08/2022 10:29:14 p. m. ******/
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
/****** Object:  Table [dbo].[Medicion_pliegueMuslo]    Script Date: 20/08/2022 10:29:14 p. m. ******/
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
/****** Object:  Table [dbo].[Medicion_plieguePierna]    Script Date: 20/08/2022 10:29:14 p. m. ******/
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
/****** Object:  Table [dbo].[Medicion_pliegueSubescapular]    Script Date: 20/08/2022 10:29:14 p. m. ******/
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
/****** Object:  Table [dbo].[Medicion_pliegueSupraespinal]    Script Date: 20/08/2022 10:29:14 p. m. ******/
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
/****** Object:  Table [dbo].[Medicion_pliegueTriceps]    Script Date: 20/08/2022 10:29:14 p. m. ******/
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
/****** Object:  Table [dbo].[Medicion_talla]    Script Date: 20/08/2022 10:29:14 p. m. ******/
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
/****** Object:  Table [dbo].[Preguntas]    Script Date: 20/08/2022 10:29:14 p. m. ******/
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
/****** Object:  Table [dbo].[Preguntas_EvaMoto]    Script Date: 20/08/2022 10:29:14 p. m. ******/
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
/****** Object:  Table [dbo].[presionArterial]    Script Date: 20/08/2022 10:29:14 p. m. ******/
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
/****** Object:  Table [dbo].[pressBanca]    Script Date: 20/08/2022 10:29:14 p. m. ******/
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
/****** Object:  Table [dbo].[pushUp]    Script Date: 20/08/2022 10:29:14 p. m. ******/
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
/****** Object:  Table [dbo].[Rangos_edades]    Script Date: 20/08/2022 10:29:14 p. m. ******/
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
/****** Object:  Table [dbo].[RespuestaPregunta]    Script Date: 20/08/2022 10:29:14 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RespuestaPregunta](
	[IdRespuesta] [nvarchar](50) NOT NULL,
	[Respuesta] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Table_1] PRIMARY KEY CLUSTERED 
(
	[IdRespuesta] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Respuestas_EvaMoto]    Script Date: 20/08/2022 10:29:14 p. m. ******/
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
/****** Object:  Table [dbo].[Respuestas_pacientes]    Script Date: 20/08/2022 10:29:14 p. m. ******/
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
/****** Object:  Table [dbo].[Resultados]    Script Date: 20/08/2022 10:29:14 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Resultados](
	[Id_Resultados] [int] IDENTITY(1,1) NOT NULL,
	[IdPreguntas] [int] NOT NULL,
	[IdRespuestas] [nvarchar](50) NOT NULL,
	[ObservacionRespuesta] [nvarchar](50) NULL,
	[Id_EncuestaPsicosocial] [int] NOT NULL,
 CONSTRAINT [PK_Resultados] PRIMARY KEY CLUSTERED 
(
	[Id_Resultados] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[saltoHorizontal]    Script Date: 20/08/2022 10:29:14 p. m. ******/
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
/****** Object:  Table [dbo].[saltoVertical]    Script Date: 20/08/2022 10:29:14 p. m. ******/
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
/****** Object:  Table [dbo].[sentadillaProfunda]    Script Date: 20/08/2022 10:29:14 p. m. ******/
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
/****** Object:  Table [dbo].[Test_agilidadCoordinacion]    Script Date: 20/08/2022 10:29:14 p. m. ******/
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
/****** Object:  Table [dbo].[Test_resistenciaGeneral]    Script Date: 20/08/2022 10:29:14 p. m. ******/
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
/****** Object:  Table [dbo].[Test_velocidad20metros]    Script Date: 20/08/2022 10:29:14 p. m. ******/
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
/****** Object:  Table [dbo].[Test_wells]    Script Date: 20/08/2022 10:29:14 p. m. ******/
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
INSERT [dbo].[abdominales30Seg] ([Id_abdominales30seg], [ID_Paciente], [numeroRepeticiones]) VALUES (1, 1, 17)
INSERT [dbo].[abdominales30Seg] ([Id_abdominales30seg], [ID_Paciente], [numeroRepeticiones]) VALUES (2, 4, 12)
INSERT [dbo].[abdominales30Seg] ([Id_abdominales30seg], [ID_Paciente], [numeroRepeticiones]) VALUES (3, 7, 29)
INSERT [dbo].[abdominales30Seg] ([Id_abdominales30seg], [ID_Paciente], [numeroRepeticiones]) VALUES (4, 8, 8)
GO
SET IDENTITY_INSERT [dbo].[Datos_pacientes] ON 

INSERT [dbo].[Datos_pacientes] ([IDPaciente], [Nombre], [Apellidos], [FechaNacimiento]) VALUES (1, N'Yuly', N'Mosquera', CAST(N'1994-06-24' AS Date))
INSERT [dbo].[Datos_pacientes] ([IDPaciente], [Nombre], [Apellidos], [FechaNacimiento]) VALUES (2, N'Katerine', N'Cortes', CAST(N'2021-06-01' AS Date))
INSERT [dbo].[Datos_pacientes] ([IDPaciente], [Nombre], [Apellidos], [FechaNacimiento]) VALUES (3, N'Mauricio', N'Arango', CAST(N'2020-06-10' AS Date))
INSERT [dbo].[Datos_pacientes] ([IDPaciente], [Nombre], [Apellidos], [FechaNacimiento]) VALUES (4, N'Eduardo', N'Bustamante', CAST(N'1992-11-05' AS Date))
INSERT [dbo].[Datos_pacientes] ([IDPaciente], [Nombre], [Apellidos], [FechaNacimiento]) VALUES (5, N'Marcela', N'Torres', CAST(N'2019-08-08' AS Date))
INSERT [dbo].[Datos_pacientes] ([IDPaciente], [Nombre], [Apellidos], [FechaNacimiento]) VALUES (6, N'Pablo', N'Ramirez', CAST(N'2015-12-25' AS Date))
INSERT [dbo].[Datos_pacientes] ([IDPaciente], [Nombre], [Apellidos], [FechaNacimiento]) VALUES (7, N'Sebastian ', N'Perez', CAST(N'2006-05-11' AS Date))
INSERT [dbo].[Datos_pacientes] ([IDPaciente], [Nombre], [Apellidos], [FechaNacimiento]) VALUES (8, N'Abigail', N'Lopera', CAST(N'1963-01-14' AS Date))
INSERT [dbo].[Datos_pacientes] ([IDPaciente], [Nombre], [Apellidos], [FechaNacimiento]) VALUES (9, N'Andrea', N'Gomez', CAST(N'2013-10-04' AS Date))
SET IDENTITY_INSERT [dbo].[Datos_pacientes] OFF
GO
INSERT [dbo].[dinanometriaManual] ([Id_dinanometriaManual], [ID_Paciente], [FuerzaIsometrica(kg)]) VALUES (1, 6, CAST(18.20 AS Decimal(4, 2)))
INSERT [dbo].[dinanometriaManual] ([Id_dinanometriaManual], [ID_Paciente], [FuerzaIsometrica(kg)]) VALUES (2, 8, CAST(26.40 AS Decimal(4, 2)))
INSERT [dbo].[dinanometriaManual] ([Id_dinanometriaManual], [ID_Paciente], [FuerzaIsometrica(kg)]) VALUES (3, 1, CAST(28.12 AS Decimal(4, 2)))
INSERT [dbo].[dinanometriaManual] ([Id_dinanometriaManual], [ID_Paciente], [FuerzaIsometrica(kg)]) VALUES (4, 4, CAST(38.50 AS Decimal(4, 2)))
GO
INSERT [dbo].[EncuestaPsicosocial] ([Id_EncuestaPsicosocial], [Id_Paciente], [Documento]) VALUES (N'1', 8, N'1077493456')
INSERT [dbo].[EncuestaPsicosocial] ([Id_EncuestaPsicosocial], [Id_Paciente], [Documento]) VALUES (N'2', 5, N'1033985080')
GO
SET IDENTITY_INSERT [dbo].[Encuestas] ON 

INSERT [dbo].[Encuestas] ([IDEncuesta], [IDPaciente], [FechaEncuesta], [SitioEvaluacion], [Peso(kg)], [Talla(cms)]) VALUES (1, 6, CAST(N'2022-07-20T12:40:00.0000000' AS DateTime2), N'Instituto', CAST(32.00 AS Decimal(4, 2)), CAST(1.34 AS Decimal(4, 2)))
INSERT [dbo].[Encuestas] ([IDEncuesta], [IDPaciente], [FechaEncuesta], [SitioEvaluacion], [Peso(kg)], [Talla(cms)]) VALUES (2, 2, CAST(N'2022-06-20T00:00:00.0000000' AS DateTime2), N'Facultad Nacional de Salud Publica', CAST(57.00 AS Decimal(4, 2)), CAST(1.70 AS Decimal(4, 2)))
INSERT [dbo].[Encuestas] ([IDEncuesta], [IDPaciente], [FechaEncuesta], [SitioEvaluacion], [Peso(kg)], [Talla(cms)]) VALUES (3, 4, CAST(N'2022-02-14T00:00:00.0000000' AS DateTime2), N'Cancha deportiva René Higuita', CAST(60.00 AS Decimal(4, 2)), CAST(1.77 AS Decimal(4, 2)))
SET IDENTITY_INSERT [dbo].[Encuestas] OFF
GO
SET IDENTITY_INSERT [dbo].[Habilidades] ON 

INSERT [dbo].[Habilidades] ([IDHabilidad], [Habilidad]) VALUES (1, N'Correr')
INSERT [dbo].[Habilidades] ([IDHabilidad], [Habilidad]) VALUES (2, N'Subir escaleras')
INSERT [dbo].[Habilidades] ([IDHabilidad], [Habilidad]) VALUES (3, N'Patear')
INSERT [dbo].[Habilidades] ([IDHabilidad], [Habilidad]) VALUES (4, N'Lanzar')
INSERT [dbo].[Habilidades] ([IDHabilidad], [Habilidad]) VALUES (5, N'Atrapar')
INSERT [dbo].[Habilidades] ([IDHabilidad], [Habilidad]) VALUES (6, N'Saltar')
SET IDENTITY_INSERT [dbo].[Habilidades] OFF
GO
INSERT [dbo].[maduracionSexual] ([Id_maduracionSexual], [ID_Paciente], [Genero], [VelloPubico], [Tamaño_y_Forma]) VALUES (1, 7, N'M', 3, 3)
INSERT [dbo].[maduracionSexual] ([Id_maduracionSexual], [ID_Paciente], [Genero], [VelloPubico], [Tamaño_y_Forma]) VALUES (2, 9, N'F', 1, 1)
GO
INSERT [dbo].[Medicion_diametroCodo] ([Id_diametroCodo], [ID_Paciente], [diametroCodo(cm)]) VALUES (1, 7, CAST(5.98 AS Decimal(4, 2)))
INSERT [dbo].[Medicion_diametroCodo] ([Id_diametroCodo], [ID_Paciente], [diametroCodo(cm)]) VALUES (2, 4, CAST(7.29 AS Decimal(4, 2)))
INSERT [dbo].[Medicion_diametroCodo] ([Id_diametroCodo], [ID_Paciente], [diametroCodo(cm)]) VALUES (3, 8, CAST(5.20 AS Decimal(4, 2)))
GO
INSERT [dbo].[Medicion_diametroRodilla] ([Id_diametroRodilla], [ID_Paciente], [diametroRodilla(cm)]) VALUES (1, 7, CAST(5.68 AS Decimal(4, 2)))
INSERT [dbo].[Medicion_diametroRodilla] ([Id_diametroRodilla], [ID_Paciente], [diametroRodilla(cm)]) VALUES (2, 4, CAST(7.32 AS Decimal(4, 2)))
INSERT [dbo].[Medicion_diametroRodilla] ([Id_diametroRodilla], [ID_Paciente], [diametroRodilla(cm)]) VALUES (3, 8, CAST(6.45 AS Decimal(4, 2)))
GO
INSERT [dbo].[Medicion_perimetroBrazo] ([Id_perimetroBrazo], [ID_Paciente], [perimetroBrazo(cm)]) VALUES (1, 7, CAST(24.69 AS Decimal(4, 2)))
INSERT [dbo].[Medicion_perimetroBrazo] ([Id_perimetroBrazo], [ID_Paciente], [perimetroBrazo(cm)]) VALUES (2, 4, CAST(28.10 AS Decimal(4, 2)))
INSERT [dbo].[Medicion_perimetroBrazo] ([Id_perimetroBrazo], [ID_Paciente], [perimetroBrazo(cm)]) VALUES (3, 8, CAST(32.46 AS Decimal(4, 2)))
GO
INSERT [dbo].[Medicion_perimetroCadera] ([Id_perimetroCadera], [ID_Paciente], [perimetroCadera(cm)]) VALUES (1, 7, CAST(80.14 AS Decimal(4, 2)))
INSERT [dbo].[Medicion_perimetroCadera] ([Id_perimetroCadera], [ID_Paciente], [perimetroCadera(cm)]) VALUES (2, 4, CAST(98.12 AS Decimal(4, 2)))
INSERT [dbo].[Medicion_perimetroCadera] ([Id_perimetroCadera], [ID_Paciente], [perimetroCadera(cm)]) VALUES (3, 8, CAST(95.42 AS Decimal(4, 2)))
GO
INSERT [dbo].[Medicion_perimetroCintura] ([Id_perimetroCintura], [ID_Paciente], [perimetroCintura(cm)]) VALUES (1, 7, CAST(60.78 AS Decimal(4, 2)))
INSERT [dbo].[Medicion_perimetroCintura] ([Id_perimetroCintura], [ID_Paciente], [perimetroCintura(cm)]) VALUES (4, 4, CAST(98.99 AS Decimal(4, 2)))
INSERT [dbo].[Medicion_perimetroCintura] ([Id_perimetroCintura], [ID_Paciente], [perimetroCintura(cm)]) VALUES (8, 8, CAST(73.68 AS Decimal(4, 2)))
GO
INSERT [dbo].[Medicion_perimetroPierna] ([Id_perimetroPierna], [ID_Paciente], [perimetroPierna(cm)]) VALUES (1, 7, CAST(59.25 AS Decimal(4, 2)))
INSERT [dbo].[Medicion_perimetroPierna] ([Id_perimetroPierna], [ID_Paciente], [perimetroPierna(cm)]) VALUES (2, 4, CAST(60.69 AS Decimal(4, 2)))
INSERT [dbo].[Medicion_perimetroPierna] ([Id_perimetroPierna], [ID_Paciente], [perimetroPierna(cm)]) VALUES (3, 8, CAST(52.45 AS Decimal(4, 2)))
GO
INSERT [dbo].[Medicion_peso] ([Id_peso], [ID_Paciente], [Peso]) VALUES (1, 7, CAST(68.33 AS Decimal(5, 2)))
INSERT [dbo].[Medicion_peso] ([Id_peso], [ID_Paciente], [Peso]) VALUES (2, 4, CAST(76.49 AS Decimal(5, 2)))
INSERT [dbo].[Medicion_peso] ([Id_peso], [ID_Paciente], [Peso]) VALUES (3, 8, CAST(58.92 AS Decimal(5, 2)))
GO
INSERT [dbo].[Medicion_pliegueAbdominal] ([Id_pliegueAbdominal], [ID_Paciente], [pliegueAbdominal(mm)]) VALUES (1, 7, CAST(9.25 AS Decimal(4, 2)))
INSERT [dbo].[Medicion_pliegueAbdominal] ([Id_pliegueAbdominal], [ID_Paciente], [pliegueAbdominal(mm)]) VALUES (2, 4, CAST(14.26 AS Decimal(4, 2)))
INSERT [dbo].[Medicion_pliegueAbdominal] ([Id_pliegueAbdominal], [ID_Paciente], [pliegueAbdominal(mm)]) VALUES (3, 8, CAST(10.21 AS Decimal(4, 2)))
GO
INSERT [dbo].[Medicion_pliegueBiceps] ([Id_pliegueBiceps], [ID_Paciente], [pliegueBiceps(mm)]) VALUES (1, 7, CAST(4.23 AS Decimal(4, 2)))
INSERT [dbo].[Medicion_pliegueBiceps] ([Id_pliegueBiceps], [ID_Paciente], [pliegueBiceps(mm)]) VALUES (2, 4, CAST(5.23 AS Decimal(4, 2)))
INSERT [dbo].[Medicion_pliegueBiceps] ([Id_pliegueBiceps], [ID_Paciente], [pliegueBiceps(mm)]) VALUES (3, 8, CAST(11.47 AS Decimal(4, 2)))
GO
INSERT [dbo].[Medicion_pliegueCrestaIliaca] ([Id_pliegueCrestaIliaca], [ID_Paciente], [pliegueCrestaIliaca(mm)]) VALUES (1, 7, CAST(6.42 AS Decimal(4, 2)))
INSERT [dbo].[Medicion_pliegueCrestaIliaca] ([Id_pliegueCrestaIliaca], [ID_Paciente], [pliegueCrestaIliaca(mm)]) VALUES (2, 4, CAST(8.65 AS Decimal(4, 2)))
INSERT [dbo].[Medicion_pliegueCrestaIliaca] ([Id_pliegueCrestaIliaca], [ID_Paciente], [pliegueCrestaIliaca(mm)]) VALUES (3, 8, CAST(20.14 AS Decimal(4, 2)))
GO
INSERT [dbo].[Medicion_pliegueMuslo] ([Id_pliegueMuslo], [ID_Paciente], [pliegueMuslo(mm)]) VALUES (1, 7, CAST(14.80 AS Decimal(4, 2)))
INSERT [dbo].[Medicion_pliegueMuslo] ([Id_pliegueMuslo], [ID_Paciente], [pliegueMuslo(mm)]) VALUES (2, 4, CAST(20.47 AS Decimal(4, 2)))
INSERT [dbo].[Medicion_pliegueMuslo] ([Id_pliegueMuslo], [ID_Paciente], [pliegueMuslo(mm)]) VALUES (3, 8, CAST(18.32 AS Decimal(4, 2)))
GO
INSERT [dbo].[Medicion_plieguePierna] ([Id_pliegueMuslo], [ID_Paciente], [plieguePierna(mm)]) VALUES (1, 7, CAST(14.96 AS Decimal(4, 2)))
INSERT [dbo].[Medicion_plieguePierna] ([Id_pliegueMuslo], [ID_Paciente], [plieguePierna(mm)]) VALUES (2, 4, CAST(19.63 AS Decimal(4, 2)))
INSERT [dbo].[Medicion_plieguePierna] ([Id_pliegueMuslo], [ID_Paciente], [plieguePierna(mm)]) VALUES (3, 8, CAST(18.41 AS Decimal(4, 2)))
GO
INSERT [dbo].[Medicion_pliegueSubescapular] ([Id_pliegueSubescapular], [ID_Paciente], [pliegueSubescapular(mm)]) VALUES (1, 7, CAST(7.80 AS Decimal(4, 2)))
INSERT [dbo].[Medicion_pliegueSubescapular] ([Id_pliegueSubescapular], [ID_Paciente], [pliegueSubescapular(mm)]) VALUES (2, 4, CAST(10.24 AS Decimal(4, 2)))
INSERT [dbo].[Medicion_pliegueSubescapular] ([Id_pliegueSubescapular], [ID_Paciente], [pliegueSubescapular(mm)]) VALUES (3, 8, CAST(13.42 AS Decimal(4, 2)))
GO
INSERT [dbo].[Medicion_pliegueSupraespinal] ([Id_pliegueSupraespinal], [ID_Paciente], [pliegueSupraespinal(mm)]) VALUES (1, 7, CAST(8.24 AS Decimal(4, 2)))
INSERT [dbo].[Medicion_pliegueSupraespinal] ([Id_pliegueSupraespinal], [ID_Paciente], [pliegueSupraespinal(mm)]) VALUES (2, 4, CAST(14.68 AS Decimal(4, 2)))
INSERT [dbo].[Medicion_pliegueSupraespinal] ([Id_pliegueSupraespinal], [ID_Paciente], [pliegueSupraespinal(mm)]) VALUES (3, 8, CAST(15.20 AS Decimal(4, 2)))
GO
INSERT [dbo].[Medicion_pliegueTriceps] ([Id_pliegueTriceps], [ID_Paciente], [pliegueTriceps(mm)]) VALUES (1, 7, CAST(8.60 AS Decimal(4, 2)))
INSERT [dbo].[Medicion_pliegueTriceps] ([Id_pliegueTriceps], [ID_Paciente], [pliegueTriceps(mm)]) VALUES (2, 4, CAST(10.43 AS Decimal(4, 2)))
INSERT [dbo].[Medicion_pliegueTriceps] ([Id_pliegueTriceps], [ID_Paciente], [pliegueTriceps(mm)]) VALUES (3, 9, CAST(18.41 AS Decimal(4, 2)))
GO
INSERT [dbo].[Medicion_talla] ([Id_talla], [ID_Paciente], [Talla]) VALUES (1, 7, CAST(1.76 AS Decimal(5, 2)))
INSERT [dbo].[Medicion_talla] ([Id_talla], [ID_Paciente], [Talla]) VALUES (2, 4, CAST(1.70 AS Decimal(5, 2)))
INSERT [dbo].[Medicion_talla] ([Id_talla], [ID_Paciente], [Talla]) VALUES (3, 8, CAST(1.63 AS Decimal(5, 2)))
GO
INSERT [dbo].[Preguntas] ([IdPreguntas], [Pregunta]) VALUES (1, N'¿Estudia actualmente?')
INSERT [dbo].[Preguntas] ([IdPreguntas], [Pregunta]) VALUES (2, N'Último año cursado')
INSERT [dbo].[Preguntas] ([IdPreguntas], [Pregunta]) VALUES (3, N'Vive con')
INSERT [dbo].[Preguntas] ([IdPreguntas], [Pregunta]) VALUES (4, N'Número de personas que viven en su casa (inclúyase usted)')
INSERT [dbo].[Preguntas] ([IdPreguntas], [Pregunta]) VALUES (5, N'Durante los últimos 30 días, ¿con qué frecuencia sentiste hambre porque no había sufiencientes alimentos en su hogar?')
INSERT [dbo].[Preguntas] ([IdPreguntas], [Pregunta]) VALUES (6, N'Durante los últimos 30 días, ¿cuantas veces al día comistes habitualmente frutas como manzanas, bananas, naranjas o mandarinas?')
INSERT [dbo].[Preguntas] ([IdPreguntas], [Pregunta]) VALUES (7, N'Durante los últimos 30 días, ¿cuantes veces al día comiste habitualmente verduras como lechuga, tomate, zanahorias y zapallo?')
INSERT [dbo].[Preguntas] ([IdPreguntas], [Pregunta]) VALUES (8, N'Durante los últimos 30 días, ¿cuantas veces por día habitualmente te lavaste o cepillaste los dientes?')
INSERT [dbo].[Preguntas] ([IdPreguntas], [Pregunta]) VALUES (9, N'¿Cuándo ue la última vez que viste a un dentistapara control, examen, limpieza de dientes u otro arreglo dental? ')
INSERT [dbo].[Preguntas] ([IdPreguntas], [Pregunta]) VALUES (10, N'Duante los últimos 30 días, ¿con qúe frecuencia te lavaste las manos antes de comer?')
INSERT [dbo].[Preguntas] ([IdPreguntas], [Pregunta]) VALUES (11, N'Duante los últimos 30 días, ¿con qúe frecuencia te lavaste las manos después de usar el inodoro o la letrina?')
INSERT [dbo].[Preguntas] ([IdPreguntas], [Pregunta]) VALUES (12, N'Duante los últimos 30 días, ¿con qúe frecuencia usaste el jabón al lavarte las manos?')
INSERT [dbo].[Preguntas] ([IdPreguntas], [Pregunta]) VALUES (13, N'¿Cuáles de tus padres o cuidadores consume alguna forma tabaco?')
INSERT [dbo].[Preguntas] ([IdPreguntas], [Pregunta]) VALUES (14, N'¿Ha transportado usted algunas veces un arma como cuchilla, revolver, pistola u otro?')
INSERT [dbo].[Preguntas] ([IdPreguntas], [Pregunta]) VALUES (15, N'¿Ha estado usted alguna vez en una pelea?')
INSERT [dbo].[Preguntas] ([IdPreguntas], [Pregunta]) VALUES (16, N'¿Ha estado usted alguna vez en una pelea donde lo aporrearon, hirieron o lo hayan tenido que llevar al médco, hospital o alguna enfermera?')
INSERT [dbo].[Preguntas] ([IdPreguntas], [Pregunta]) VALUES (17, N'¿Alguna vez ha tomado una bebida alcohólica?')
INSERT [dbo].[Preguntas] ([IdPreguntas], [Pregunta]) VALUES (18, N'¿Qué edad tenía cuando tomo por primera vez una bebida alcohólica')
GO
SET IDENTITY_INSERT [dbo].[Preguntas_EvaMoto] ON 

INSERT [dbo].[Preguntas_EvaMoto] ([IDPregunta], [Pregunta], [IDRangoEdad], [IDHabilidad]) VALUES (1, N'Corre descoordinado, pero no se cae, no cambia de dirección sin detenerse.', 1, 1)
INSERT [dbo].[Preguntas_EvaMoto] ([IDPregunta], [Pregunta], [IDRangoEdad], [IDHabilidad]) VALUES (2, N'Sube escaleras despacio solo pie por pie, sin apoyo de manos', 1, 2)
INSERT [dbo].[Preguntas_EvaMoto] ([IDPregunta], [Pregunta], [IDRangoEdad], [IDHabilidad]) VALUES (3, N'Intenta patear en bloque o que se desplace el balón', 1, 3)
INSERT [dbo].[Preguntas_EvaMoto] ([IDPregunta], [Pregunta], [IDRangoEdad], [IDHabilidad]) VALUES (4, N'Lanza una pelota de abajo hacia arriba', 1, 4)
INSERT [dbo].[Preguntas_EvaMoto] ([IDPregunta], [Pregunta], [IDRangoEdad], [IDHabilidad]) VALUES (5, N'Salta hacia arriba con los dos pies, no controla equilibrio al caer, no flexiona al caer.', 1, 6)
INSERT [dbo].[Preguntas_EvaMoto] ([IDPregunta], [Pregunta], [IDRangoEdad], [IDHabilidad]) VALUES (6, N'Corre sin dominio completo, pero no está descoordinado, cambia dirección sin detenerse.', 2, 1)
INSERT [dbo].[Preguntas_EvaMoto] ([IDPregunta], [Pregunta], [IDRangoEdad], [IDHabilidad]) VALUES (7, N'Sube escaleras alternando pies y baja con dificultad', 2, 2)
INSERT [dbo].[Preguntas_EvaMoto] ([IDPregunta], [Pregunta], [IDRangoEdad], [IDHabilidad]) VALUES (8, N'Patea la pelota usa la pierna con leve flexión de la cadera.', 2, 3)
INSERT [dbo].[Preguntas_EvaMoto] ([IDPregunta], [Pregunta], [IDRangoEdad], [IDHabilidad]) VALUES (9, N'Lanza pelota por encima de la cabeza', 2, 4)
INSERT [dbo].[Preguntas_EvaMoto] ([IDPregunta], [Pregunta], [IDRangoEdad], [IDHabilidad]) VALUES (10, N'Agarra la pelota que se le tira con ambas manos.', 2, 5)
INSERT [dbo].[Preguntas_EvaMoto] ([IDPregunta], [Pregunta], [IDRangoEdad], [IDHabilidad]) VALUES (11, N'Salta en patasola y controla el equilibrio al caer.', 2, 6)
INSERT [dbo].[Preguntas_EvaMoto] ([IDPregunta], [Pregunta], [IDRangoEdad], [IDHabilidad]) VALUES (12, N'Corre coordinado en línea recta con extremidades superiores en oposición a las inferiores', 3, 1)
INSERT [dbo].[Preguntas_EvaMoto] ([IDPregunta], [Pregunta], [IDRangoEdad], [IDHabilidad]) VALUES (13, N'Sube y baja escaleras rápido', 3, 2)
INSERT [dbo].[Preguntas_EvaMoto] ([IDPregunta], [Pregunta], [IDRangoEdad], [IDHabilidad]) VALUES (14, N'Extremidad inferiror que patea en péndulo, hay flexión de rodilla y rotación de tronco, mantiene equilibrio después de patear', 3, 3)
INSERT [dbo].[Preguntas_EvaMoto] ([IDPregunta], [Pregunta], [IDRangoEdad], [IDHabilidad]) VALUES (15, N'Lanza pelota con dirección definida, rota el tronco y extremidad superior que lanza se va hacia atrás.', 3, 4)
INSERT [dbo].[Preguntas_EvaMoto] ([IDPregunta], [Pregunta], [IDRangoEdad], [IDHabilidad]) VALUES (16, N'atrapa la pelota lamzada por el mismo con una sola mano', 3, 5)
INSERT [dbo].[Preguntas_EvaMoto] ([IDPregunta], [Pregunta], [IDRangoEdad], [IDHabilidad]) VALUES (17, N'Salta adelante, atrás y a los lados.', 3, 6)
SET IDENTITY_INSERT [dbo].[Preguntas_EvaMoto] OFF
GO
SET IDENTITY_INSERT [dbo].[presionArterial] ON 

INSERT [dbo].[presionArterial] ([Id_presionArterial], [ID_Paciente], [Sistolica], [Diastolica]) VALUES (1, 1, 112, 74)
INSERT [dbo].[presionArterial] ([Id_presionArterial], [ID_Paciente], [Sistolica], [Diastolica]) VALUES (2, 6, 120, 80)
INSERT [dbo].[presionArterial] ([Id_presionArterial], [ID_Paciente], [Sistolica], [Diastolica]) VALUES (3, 8, 138, 87)
SET IDENTITY_INSERT [dbo].[presionArterial] OFF
GO
INSERT [dbo].[pressBanca] ([Id_pressBanca], [ID_Paciente], [numeroRepeticiones], [pesoMaximo(kg)]) VALUES (1, 7, 8, 25)
INSERT [dbo].[pressBanca] ([Id_pressBanca], [ID_Paciente], [numeroRepeticiones], [pesoMaximo(kg)]) VALUES (2, 4, 8, 20)
GO
INSERT [dbo].[pushUp] ([Id_pushUp], [ID_Paciente], [numeroRepeticiones]) VALUES (1, 7, 45)
INSERT [dbo].[pushUp] ([Id_pushUp], [ID_Paciente], [numeroRepeticiones]) VALUES (2, 4, 20)
INSERT [dbo].[pushUp] ([Id_pushUp], [ID_Paciente], [numeroRepeticiones]) VALUES (3, 8, 3)
GO
SET IDENTITY_INSERT [dbo].[Rangos_edades] ON 

INSERT [dbo].[Rangos_edades] ([IDRangoEdad], [RangoEdad]) VALUES (1, N'24 a 36 meses ')
INSERT [dbo].[Rangos_edades] ([IDRangoEdad], [RangoEdad]) VALUES (2, N'37 a 48 meses')
INSERT [dbo].[Rangos_edades] ([IDRangoEdad], [RangoEdad]) VALUES (3, N'49 a 60 meses')
SET IDENTITY_INSERT [dbo].[Rangos_edades] OFF
GO
INSERT [dbo].[RespuestaPregunta] ([IdRespuesta], [Respuesta]) VALUES (N'1', N'Si')
INSERT [dbo].[RespuestaPregunta] ([IdRespuesta], [Respuesta]) VALUES (N'10', N'6 o más')
INSERT [dbo].[RespuestaPregunta] ([IdRespuesta], [Respuesta]) VALUES (N'11', N'Nunca')
INSERT [dbo].[RespuestaPregunta] ([IdRespuesta], [Respuesta]) VALUES (N'12', N'Rara vez')
INSERT [dbo].[RespuestaPregunta] ([IdRespuesta], [Respuesta]) VALUES (N'13', N'A veces')
INSERT [dbo].[RespuestaPregunta] ([IdRespuesta], [Respuesta]) VALUES (N'14', N'Casi siempre')
INSERT [dbo].[RespuestaPregunta] ([IdRespuesta], [Respuesta]) VALUES (N'15', N'Siempre')
INSERT [dbo].[RespuestaPregunta] ([IdRespuesta], [Respuesta]) VALUES (N'16', N'No comí frutas durante los últimos 30 días')
INSERT [dbo].[RespuestaPregunta] ([IdRespuesta], [Respuesta]) VALUES (N'17', N'Menos de una vez al día')
INSERT [dbo].[RespuestaPregunta] ([IdRespuesta], [Respuesta]) VALUES (N'18', N'1 vez al día ')
INSERT [dbo].[RespuestaPregunta] ([IdRespuesta], [Respuesta]) VALUES (N'19', N'2 veces al día')
INSERT [dbo].[RespuestaPregunta] ([IdRespuesta], [Respuesta]) VALUES (N'2', N'No')
INSERT [dbo].[RespuestaPregunta] ([IdRespuesta], [Respuesta]) VALUES (N'20', N'3 veces al día')
INSERT [dbo].[RespuestaPregunta] ([IdRespuesta], [Respuesta]) VALUES (N'21', N'4 veces al día')
INSERT [dbo].[RespuestaPregunta] ([IdRespuesta], [Respuesta]) VALUES (N'22', N'5 o más veces al día')
INSERT [dbo].[RespuestaPregunta] ([IdRespuesta], [Respuesta]) VALUES (N'23', N'No comí verduras durante los últimos 30 días')
INSERT [dbo].[RespuestaPregunta] ([IdRespuesta], [Respuesta]) VALUES (N'24', N'4 o más veces al día')
INSERT [dbo].[RespuestaPregunta] ([IdRespuesta], [Respuesta]) VALUES (N'25', N'Durante los últimos 12 meses')
INSERT [dbo].[RespuestaPregunta] ([IdRespuesta], [Respuesta]) VALUES (N'26', N'Entre 12 y 24 meses')
INSERT [dbo].[RespuestaPregunta] ([IdRespuesta], [Respuesta]) VALUES (N'27', N'Hace más de 24 meses')
INSERT [dbo].[RespuestaPregunta] ([IdRespuesta], [Respuesta]) VALUES (N'28', N'No sé')
INSERT [dbo].[RespuestaPregunta] ([IdRespuesta], [Respuesta]) VALUES (N'29', N'Ninguno')
INSERT [dbo].[RespuestaPregunta] ([IdRespuesta], [Respuesta]) VALUES (N'3', N'Ambos padres')
INSERT [dbo].[RespuestaPregunta] ([IdRespuesta], [Respuesta]) VALUES (N'30', N'Mi padre o cuidador')
INSERT [dbo].[RespuestaPregunta] ([IdRespuesta], [Respuesta]) VALUES (N'31', N'Mi madre o cuidadora')
INSERT [dbo].[RespuestaPregunta] ([IdRespuesta], [Respuesta]) VALUES (N'32', N'Ambos')
INSERT [dbo].[RespuestaPregunta] ([IdRespuesta], [Respuesta]) VALUES (N'33', N'Ninguno de los de arriba')
INSERT [dbo].[RespuestaPregunta] ([IdRespuesta], [Respuesta]) VALUES (N'34', N'años')
INSERT [dbo].[RespuestaPregunta] ([IdRespuesta], [Respuesta]) VALUES (N'4', N'Solo con el padre')
INSERT [dbo].[RespuestaPregunta] ([IdRespuesta], [Respuesta]) VALUES (N'5', N'Solo con la madre')
INSERT [dbo].[RespuestaPregunta] ([IdRespuesta], [Respuesta]) VALUES (N'6', N'Otro pariente')
INSERT [dbo].[RespuestaPregunta] ([IdRespuesta], [Respuesta]) VALUES (N'7', N'2')
INSERT [dbo].[RespuestaPregunta] ([IdRespuesta], [Respuesta]) VALUES (N'8', N'3')
INSERT [dbo].[RespuestaPregunta] ([IdRespuesta], [Respuesta]) VALUES (N'9', N'4')
GO
SET IDENTITY_INSERT [dbo].[Respuestas_EvaMoto] ON 

INSERT [dbo].[Respuestas_EvaMoto] ([IDRespuesta], [Respuesta]) VALUES (1, 1)
INSERT [dbo].[Respuestas_EvaMoto] ([IDRespuesta], [Respuesta]) VALUES (2, 0)
SET IDENTITY_INSERT [dbo].[Respuestas_EvaMoto] OFF
GO
SET IDENTITY_INSERT [dbo].[Respuestas_pacientes] ON 

INSERT [dbo].[Respuestas_pacientes] ([IDRespuestas_pacientes], [IDEncuesta], [IDPregunta], [IDRespuesta]) VALUES (1, 2, 17, 1)
INSERT [dbo].[Respuestas_pacientes] ([IDRespuestas_pacientes], [IDEncuesta], [IDPregunta], [IDRespuesta]) VALUES (2, 2, 12, 1)
INSERT [dbo].[Respuestas_pacientes] ([IDRespuestas_pacientes], [IDEncuesta], [IDPregunta], [IDRespuesta]) VALUES (3, 2, 14, 2)
SET IDENTITY_INSERT [dbo].[Respuestas_pacientes] OFF
GO
SET IDENTITY_INSERT [dbo].[Resultados] ON 

INSERT [dbo].[Resultados] ([Id_Resultados], [IdPreguntas], [IdRespuestas], [ObservacionRespuesta], [Id_EncuestaPsicosocial]) VALUES (1, 1, N'1', NULL, 1)
INSERT [dbo].[Resultados] ([Id_Resultados], [IdPreguntas], [IdRespuestas], [ObservacionRespuesta], [Id_EncuestaPsicosocial]) VALUES (2, 2, N'34', NULL, 1)
INSERT [dbo].[Resultados] ([Id_Resultados], [IdPreguntas], [IdRespuestas], [ObservacionRespuesta], [Id_EncuestaPsicosocial]) VALUES (3, 3, N'3', NULL, 1)
SET IDENTITY_INSERT [dbo].[Resultados] OFF
GO
INSERT [dbo].[saltoHorizontal] ([Id_saltoHorizontal], [ID_Paciente], [distanciaSalto(cm)]) VALUES (1, 7, CAST(210.34 AS Decimal(5, 2)))
INSERT [dbo].[saltoHorizontal] ([Id_saltoHorizontal], [ID_Paciente], [distanciaSalto(cm)]) VALUES (2, 4, CAST(123.52 AS Decimal(5, 2)))
GO
INSERT [dbo].[saltoVertical] ([Id_saltoVertical], [ID_Paciente], [distanciaSalto(cm)]) VALUES (1, 7, CAST(64.80 AS Decimal(5, 2)))
INSERT [dbo].[saltoVertical] ([Id_saltoVertical], [ID_Paciente], [distanciaSalto(cm)]) VALUES (2, 4, CAST(36.49 AS Decimal(5, 2)))
GO
INSERT [dbo].[sentadillaProfunda] ([Id_sentadillaProfunda], [ID_Paciente], [numeroRepeticiones], [pesoMaximo(kg)]) VALUES (1, 7, 10, 68)
INSERT [dbo].[sentadillaProfunda] ([Id_sentadillaProfunda], [ID_Paciente], [numeroRepeticiones], [pesoMaximo(kg)]) VALUES (2, 4, 8, 35)
GO
INSERT [dbo].[Test_agilidadCoordinacion] ([Id_agilidadCoordinacion], [ID_Paciente], [tiempoGastado(seg)]) VALUES (1, 7, CAST(5.25 AS Decimal(5, 2)))
INSERT [dbo].[Test_agilidadCoordinacion] ([Id_agilidadCoordinacion], [ID_Paciente], [tiempoGastado(seg)]) VALUES (2, 4, CAST(7.41 AS Decimal(5, 2)))
INSERT [dbo].[Test_agilidadCoordinacion] ([Id_agilidadCoordinacion], [ID_Paciente], [tiempoGastado(seg)]) VALUES (3, 8, CAST(9.24 AS Decimal(5, 2)))
GO
INSERT [dbo].[Test_resistenciaGeneral] ([Id_resistenciaGeneral], [ID_Paciente], [tiempoAguantado]) VALUES (1, 7, 10)
INSERT [dbo].[Test_resistenciaGeneral] ([Id_resistenciaGeneral], [ID_Paciente], [tiempoAguantado]) VALUES (2, 4, 5)
INSERT [dbo].[Test_resistenciaGeneral] ([Id_resistenciaGeneral], [ID_Paciente], [tiempoAguantado]) VALUES (3, 8, 4)
GO
INSERT [dbo].[Test_velocidad20metros] ([Id_velocidad20mtrs], [ID_Paciente], [tiempoDesplazamiento(seg)]) VALUES (1, 7, CAST(5.24 AS Decimal(4, 2)))
INSERT [dbo].[Test_velocidad20metros] ([Id_velocidad20mtrs], [ID_Paciente], [tiempoDesplazamiento(seg)]) VALUES (2, 4, CAST(7.21 AS Decimal(4, 2)))
INSERT [dbo].[Test_velocidad20metros] ([Id_velocidad20mtrs], [ID_Paciente], [tiempoDesplazamiento(seg)]) VALUES (3, 8, CAST(10.29 AS Decimal(4, 2)))
GO
INSERT [dbo].[Test_wells] ([Id_testWells], [ID_Paciente], [ElongacionArticulacion]) VALUES (1, 7, 17)
INSERT [dbo].[Test_wells] ([Id_testWells], [ID_Paciente], [ElongacionArticulacion]) VALUES (2, 4, 6)
INSERT [dbo].[Test_wells] ([Id_testWells], [ID_Paciente], [ElongacionArticulacion]) VALUES (3, 8, -7)
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
ALTER TABLE [dbo].[Resultados]  WITH CHECK ADD  CONSTRAINT [FK_Resultados_EncuestaPsicosocial] FOREIGN KEY([ObservacionRespuesta])
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
