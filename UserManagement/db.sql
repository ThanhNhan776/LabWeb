USE [master]
GO
/****** Object:  Database [Lab_UserManagement]    Script Date: 5/3/2020 14:51:11 ******/
CREATE DATABASE [Lab_UserManagement]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Lab_UserManagement', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\Lab_UserManagement.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Lab_UserManagement_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\Lab_UserManagement_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [Lab_UserManagement] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Lab_UserManagement].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Lab_UserManagement] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Lab_UserManagement] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Lab_UserManagement] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Lab_UserManagement] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Lab_UserManagement] SET ARITHABORT OFF 
GO
ALTER DATABASE [Lab_UserManagement] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Lab_UserManagement] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Lab_UserManagement] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Lab_UserManagement] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Lab_UserManagement] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Lab_UserManagement] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Lab_UserManagement] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Lab_UserManagement] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Lab_UserManagement] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Lab_UserManagement] SET  ENABLE_BROKER 
GO
ALTER DATABASE [Lab_UserManagement] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Lab_UserManagement] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Lab_UserManagement] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Lab_UserManagement] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Lab_UserManagement] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Lab_UserManagement] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Lab_UserManagement] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Lab_UserManagement] SET RECOVERY FULL 
GO
ALTER DATABASE [Lab_UserManagement] SET  MULTI_USER 
GO
ALTER DATABASE [Lab_UserManagement] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Lab_UserManagement] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Lab_UserManagement] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Lab_UserManagement] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Lab_UserManagement] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'Lab_UserManagement', N'ON'
GO
ALTER DATABASE [Lab_UserManagement] SET QUERY_STORE = OFF
GO
USE [Lab_UserManagement]
GO
/****** Object:  Table [dbo].[tbl_PromotionList]    Script Date: 5/3/2020 14:51:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_PromotionList](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Username] [varchar](100) NULL,
	[Rank] [int] NULL,
	[CreatedDate] [datetime] NULL,
	[Action] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_User]    Script Date: 5/3/2020 14:51:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_User](
	[Username] [varchar](100) NOT NULL,
	[Password] [varchar](100) NOT NULL,
	[Name] [nvarchar](500) NULL,
	[Email] [varchar](100) NULL,
	[Phone] [varchar](15) NULL,
	[Photo] [nvarchar](200) NULL,
	[Status] [varchar](20) NULL,
	[GroupId] [int] NULL,
 CONSTRAINT [PK__tbl_User__536C85E5D57CD72F] PRIMARY KEY CLUSTERED 
(
	[Username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_UserGroup]    Script Date: 5/3/2020 14:51:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_UserGroup](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[tbl_User] ([Username], [Password], [Name], [Email], [Phone], [Photo], [Status], [GroupId]) VALUES (N'admin', N'8c6976e5b5410415bde908bd4dee15dfb167a9c873fc4bb8a81f6f2ab448a918', N'Admin', N'admin@gmail.com', N'123456789', N'img/admin.png', N'active', 1)
INSERT [dbo].[tbl_User] ([Username], [Password], [Name], [Email], [Phone], [Photo], [Status], [GroupId]) VALUES (N'user01', N'aad415a73c4cef1ef94a5c00b2642b571a3e5494536328ad960db61889bd9368', N'User 01', N'user01@gmaill.com', N'111111111', N'img/user01.jpg', N'active', 2)
INSERT [dbo].[tbl_User] ([Username], [Password], [Name], [Email], [Phone], [Photo], [Status], [GroupId]) VALUES (N'user02', N'76431fac8a187241af8f3f37156deb94732f52fb45eb07ec4f462051bd82f183', N'User 02', N'user02@gmail.com', N'111000111', N'img/user02.jpg', N'active', 3)
INSERT [dbo].[tbl_User] ([Username], [Password], [Name], [Email], [Phone], [Photo], [Status], [GroupId]) VALUES (N'user03', N'd64243e8519cce2304fffb92d31acaca622585011b40439c97e9274fae146189', N'User 03', N'user03@gmail.com', N'333333333', N'img/user03.jpg', N'active', 2)
INSERT [dbo].[tbl_User] ([Username], [Password], [Name], [Email], [Phone], [Photo], [Status], [GroupId]) VALUES (N'user04', N'e12f9df2347fbce1fde80e9034e96b90eb3a593de0e02f348e40a932e15ffb17', N'User 04', N'user04@gmail.com', N'444444444', N'img/user04.jpg', N'active', 3)
INSERT [dbo].[tbl_User] ([Username], [Password], [Name], [Email], [Phone], [Photo], [Status], [GroupId]) VALUES (N'user05', N'f9aa410bd55688704f331d5c2e4e7266a979a345d930715b2626acecf0c7feef', N'User 05', N'user05@gmail.com', N'555555555', N'img/user05.jpg', N'active', 2)
SET IDENTITY_INSERT [dbo].[tbl_UserGroup] ON 

INSERT [dbo].[tbl_UserGroup] ([Id], [Name]) VALUES (1, N'Admin')
INSERT [dbo].[tbl_UserGroup] ([Id], [Name]) VALUES (2, N'Gold')
INSERT [dbo].[tbl_UserGroup] ([Id], [Name]) VALUES (3, N'Silver')
SET IDENTITY_INSERT [dbo].[tbl_UserGroup] OFF
ALTER TABLE [dbo].[tbl_PromotionList]  WITH CHECK ADD  CONSTRAINT [FK__tbl_Promo__Usern__3C69FB99] FOREIGN KEY([Username])
REFERENCES [dbo].[tbl_User] ([Username])
GO
ALTER TABLE [dbo].[tbl_PromotionList] CHECK CONSTRAINT [FK__tbl_Promo__Usern__3C69FB99]
GO
ALTER TABLE [dbo].[tbl_User]  WITH CHECK ADD  CONSTRAINT [FK__tbl_User__GroupI__398D8EEE] FOREIGN KEY([GroupId])
REFERENCES [dbo].[tbl_UserGroup] ([Id])
GO
ALTER TABLE [dbo].[tbl_User] CHECK CONSTRAINT [FK__tbl_User__GroupI__398D8EEE]
GO
USE [master]
GO
ALTER DATABASE [Lab_UserManagement] SET  READ_WRITE 
GO
