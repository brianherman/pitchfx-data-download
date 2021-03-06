USE [master]
GO
/****** Object:  Database [PitchFxTest] ******/
CREATE DATABASE [PitchFxTest]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'PitchFxTest', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.SQLEXPRESS\MSSQL\DATA\PitchFxTest.mdf' , SIZE = 127936KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'PitchFxTest_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.SQLEXPRESS\MSSQL\DATA\PitchFxTest_log.LDF' , SIZE = 768KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [PitchFxTest] SET COMPATIBILITY_LEVEL = 100
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [PitchFxTest].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [PitchFxTest] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [PitchFxTest] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [PitchFxTest] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [PitchFxTest] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [PitchFxTest] SET ARITHABORT OFF 
GO
ALTER DATABASE [PitchFxTest] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [PitchFxTest] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [PitchFxTest] SET AUTO_SHRINK ON 
GO
ALTER DATABASE [PitchFxTest] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [PitchFxTest] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [PitchFxTest] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [PitchFxTest] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [PitchFxTest] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [PitchFxTest] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [PitchFxTest] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [PitchFxTest] SET  DISABLE_BROKER 
GO
ALTER DATABASE [PitchFxTest] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [PitchFxTest] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [PitchFxTest] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [PitchFxTest] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [PitchFxTest] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [PitchFxTest] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [PitchFxTest] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [PitchFxTest] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [PitchFxTest] SET  MULTI_USER 
GO
ALTER DATABASE [PitchFxTest] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [PitchFxTest] SET DB_CHAINING OFF 
GO
ALTER DATABASE [PitchFxTest] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [PitchFxTest] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
USE [PitchFxTest]
GO
/****** Object:  User [pitchfxuser] ******/
CREATE USER [pitchfxuser] FOR LOGIN [pitchfxuser] WITH DEFAULT_SCHEMA=[dbo]
GO
ALTER ROLE [db_owner] ADD MEMBER [pitchfxuser]
GO
/****** Object:  Table [dbo].[AtBats] ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[AtBats](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Strikes] [smallint] NOT NULL,
	[Balls] [smallint] NOT NULL,
	[Outs] [smallint] NOT NULL,
	[start_tfs] [nvarchar](max) NULL,
	[start_tfs_zulu] [nvarchar](max) NULL,
	[batter] [int] NOT NULL,
	[stand] [nvarchar](max) NOT NULL,
	[b_height] [nvarchar](max) NULL,
	[pitcher] [int] NOT NULL,
	[p_throws] [nvarchar](max) NULL,
	[atbat_des] [nvarchar](max) NOT NULL,
	[atbat_event] [nvarchar](max) NOT NULL,
	[Inning] [smallint] NOT NULL,
	[InningHalf] [varchar](50) NOT NULL,
	[atbat_num] [smallint] NOT NULL,
	[GameId] [int] NOT NULL,
	[play_guid] [uniqueidentifier] NULL,
 CONSTRAINT [PK_AtBats] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Games] ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Games](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Description] [nvarchar](max) NOT NULL,
	[GameDate] [datetime] NOT NULL,
	[HomeTeam] [nvarchar](max) NULL,
	[AwayTeam] [nvarchar](max) NULL,
 CONSTRAINT [PK_Games] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Pitches] ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Pitches](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[des] [nvarchar](max) NOT NULL,
	[pitch_id] [int] NOT NULL,
	[type] [nvarchar](max) NULL,
	[tfs] [nvarchar](max) NULL,
	[tfs_zulu] [nvarchar](max) NULL,
	[x] [decimal](18, 2) NULL,
	[y] [decimal](18, 2) NULL,
	[sv_id] [nvarchar](max) NULL,
	[start_speed] [decimal](18, 2) NULL,
	[end_speed] [decimal](18, 2) NULL,
	[sz_top] [decimal](18, 2) NULL,
	[sz_bot] [decimal](18, 2) NULL,
	[pfx_x] [decimal](18, 2) NULL,
	[pfx_z] [decimal](18, 2) NULL,
	[px] [decimal](18, 3) NULL,
	[pz] [decimal](18, 3) NULL,
	[x0] [decimal](18, 3) NULL,
	[y0] [decimal](18, 3) NULL,
	[z0] [decimal](18, 3) NULL,
	[vx0] [decimal](18, 3) NULL,
	[vy0] [decimal](18, 3) NULL,
	[vz0] [decimal](18, 3) NULL,
	[ax] [decimal](18, 3) NULL,
	[ay] [decimal](18, 3) NULL,
	[az] [decimal](18, 3) NULL,
	[break_y] [decimal](18, 2) NULL,
	[break_angle] [decimal](18, 2) NULL,
	[break_length] [decimal](18, 2) NULL,
	[pitch_type] [nvarchar](max) NULL,
	[type_confidence] [decimal](18, 3) NULL,
	[zone] [int] NULL,
	[nasty] [int] NULL,
	[spin_dir] [decimal](18, 3) NULL,
	[spin_rate] [decimal](18, 3) NULL,
	[cc] [nvarchar](max) NULL,
	[mt] [nvarchar](max) NULL,
	[AtBatId] [int] NOT NULL,
	[play_guid] [uniqueidentifier] NULL,
 CONSTRAINT [PK_Pitches] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[PlayerMaster] ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[PlayerMaster](
	[id] [int] NOT NULL,
	[first] [varchar](255) NULL,
	[last] [varchar](255) NULL,
	[rl] [varchar](10) NULL,
	[HasPitcherStats] [bit] NULL,
	[HasHitterStats] [bit] NULL,
 CONSTRAINT [PK_PlayerMaster] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[PlayerStaging] ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[PlayerStaging](
	[id] [int] NOT NULL,
	[first] [varchar](255) NOT NULL,
	[last] [varchar](255) NOT NULL,
	[num] [int] NULL,
	[boxname] [varchar](255) NULL,
	[rl] [varchar](10) NULL,
	[position] [varchar](10) NULL,
	[status] [varchar](10) NULL,
	[bat_order] [int] NULL,
	[game_position] [varchar](10) NULL,
	[avg] [decimal](18, 3) NULL,
	[hr] [int] NULL,
	[rbi] [int] NULL,
	[wins] [int] NULL,
	[losses] [int] NULL,
	[era] [decimal](18, 2) NULL,
	[row_id] [int] IDENTITY(1,1) NOT NULL,
 CONSTRAINT [PK_PlayerStaging] PRIMARY KEY CLUSTERED 
(
	[row_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
ALTER TABLE [dbo].[AtBats]  WITH CHECK ADD  CONSTRAINT [FK_GameAtBat] FOREIGN KEY([GameId])
REFERENCES [dbo].[Games] ([Id])
GO
ALTER TABLE [dbo].[AtBats] CHECK CONSTRAINT [FK_GameAtBat]
GO
ALTER TABLE [dbo].[Pitches]  WITH CHECK ADD  CONSTRAINT [FK_AtBatPitch] FOREIGN KEY([AtBatId])
REFERENCES [dbo].[AtBats] ([Id])
GO
ALTER TABLE [dbo].[Pitches] CHECK CONSTRAINT [FK_AtBatPitch]
GO
USE [master]
GO
ALTER DATABASE [PitchFxTest] SET  READ_WRITE 
GO
