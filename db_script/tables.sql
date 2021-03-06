USE [master]
GO
/****** Object:  Database [zx_data]    Script Date: 2020/10/13 8:50:30 ******/
CREATE DATABASE [zx_data]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'zx_data', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\zx_data.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'zx_data_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\zx_data_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [zx_data].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [zx_data] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [zx_data] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [zx_data] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [zx_data] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [zx_data] SET ARITHABORT OFF 
GO
ALTER DATABASE [zx_data] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [zx_data] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [zx_data] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [zx_data] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [zx_data] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [zx_data] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [zx_data] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [zx_data] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [zx_data] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [zx_data] SET  DISABLE_BROKER 
GO
ALTER DATABASE [zx_data] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [zx_data] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [zx_data] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [zx_data] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [zx_data] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [zx_data] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [zx_data] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [zx_data] SET RECOVERY FULL 
GO
ALTER DATABASE [zx_data] SET  MULTI_USER 
GO
ALTER DATABASE [zx_data] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [zx_data] SET DB_CHAINING OFF 
GO
ALTER DATABASE [zx_data] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [zx_data] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
EXEC sys.sp_db_vardecimal_storage_format N'zx_data', N'ON'
GO
USE [zx_data]
GO
/****** Object:  Table [dbo].[course_teacher_relation]    Script Date: 2020/10/13 8:50:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[course_teacher_relation](
	[course_id] [varchar](20) NOT NULL,
	[teacher_id] [varchar](20) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[courses]    Script Date: 2020/10/13 8:50:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[courses](
	[course_id] [varchar](20) NOT NULL,
	[course_name] [varchar](150) NOT NULL,
	[description] [varchar](500) NULL,
	[is_publish] [int] NOT NULL,
	[course_cover] [varchar](200) NOT NULL,
	[course_url] [varchar](200) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[platforms]    Script Date: 2020/10/13 8:50:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[platforms](
	[platform_id] [varchar](20) NOT NULL,
	[platform_name] [varchar](50) NOT NULL,
	[is_validation] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[play_record]    Script Date: 2020/10/13 8:50:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[play_record](
	[course_id] [varchar](20) NOT NULL,
	[platform_id] [varchar](20) NOT NULL,
	[play_count] [decimal](18, 0) NOT NULL,
	[is_growing] [int] NOT NULL,
	[growing_rate] [decimal](18, 0) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[users]    Script Date: 2020/10/13 8:50:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[users](
	[user_id] [varchar](20) NOT NULL,
	[user_name] [varchar](20) NOT NULL,
	[real_name] [varchar](20) NOT NULL,
	[password] [varchar](40) NULL,
	[is_validation] [int] NOT NULL,
	[is_can_login] [int] NOT NULL,
	[is_teacher] [int] NOT NULL,
	[avatar] [varchar](200) NULL,
	[gender] [int] NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[courses] ADD  DEFAULT ('') FOR [course_cover]
GO
ALTER TABLE [dbo].[courses] ADD  DEFAULT ('') FOR [course_url]
GO
USE [master]
GO
ALTER DATABASE [zx_data] SET  READ_WRITE 
GO
