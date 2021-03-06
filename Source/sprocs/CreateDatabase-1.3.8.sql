USE [master]
GO
/****** Object:  Database [InterwayDocs]    Script Date: 16/05/2018 17:12:06 ******/
CREATE DATABASE [InterwayDocs] ON  PRIMARY 
( NAME = N'InterwayDocs', FILENAME = N'C:\MYDB\InterwayDocs.mdf' , SIZE = 3072KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'InterwayDocs_log', FILENAME = N'C:\MYDB\InterwayDocs_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [InterwayDocs] SET COMPATIBILITY_LEVEL = 100
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [InterwayDocs].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [InterwayDocs] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [InterwayDocs] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [InterwayDocs] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [InterwayDocs] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [InterwayDocs] SET ARITHABORT OFF 
GO
ALTER DATABASE [InterwayDocs] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [InterwayDocs] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [InterwayDocs] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [InterwayDocs] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [InterwayDocs] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [InterwayDocs] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [InterwayDocs] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [InterwayDocs] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [InterwayDocs] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [InterwayDocs] SET  DISABLE_BROKER 
GO
ALTER DATABASE [InterwayDocs] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [InterwayDocs] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [InterwayDocs] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [InterwayDocs] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [InterwayDocs] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [InterwayDocs] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [InterwayDocs] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [InterwayDocs] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [InterwayDocs] SET  MULTI_USER 
GO
ALTER DATABASE [InterwayDocs] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [InterwayDocs] SET DB_CHAINING OFF 
GO
EXEC sys.sp_db_vardecimal_storage_format N'InterwayDocs', N'ON'
GO
USE [InterwayDocs]
GO
/****** Object:  Table [dbo].[Configuration]    Script Date: 16/05/2018 17:12:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Configuration](
	[ConfigKey] [varchar](20) NOT NULL,
	[ConfigValue] [varchar](max) NOT NULL,
 CONSTRAINT [PK_Configuration] PRIMARY KEY CLUSTERED 
(
	[ConfigKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[DeliveryRegisters]    Script Date: 16/05/2018 17:12:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DeliveryRegisters](
	[RegisterId] [int] IDENTITY(1,1) NOT NULL,
	[RegisterDate] [date] NOT NULL,
	[DocumentType] [varchar](25) NOT NULL,
	[DocumentReference] [varchar](20) NOT NULL,
	[DocumentEntity] [varchar](150) NOT NULL,
	[DocumentDept] [varchar](150) NOT NULL,
	[DocumentClass] [varchar](50) NOT NULL,
	[DocumentDate] [date] NOT NULL,
	[RecipientName] [varchar](150) NOT NULL,
	[ExpeditorName] [varchar](50) NULL,
	[ReceptionName] [varchar](50) NULL,
	[ReceptionDate] [date] NULL,
	[CreateDate] [datetime2](7) NOT NULL,
	[ChangeDate] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_DeliveryRegisters] PRIMARY KEY CLUSTERED 
(
	[RegisterId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[IncomingRegisters]    Script Date: 16/05/2018 17:12:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[IncomingRegisters](
	[RegisterId] [int] IDENTITY(1,1) NOT NULL,
	[RegisterDate] [date] NOT NULL,
	[DocumentType] [varchar](25) NOT NULL,
	[DocumentReference] [varchar](20) NOT NULL,
	[DocumentEntity] [varchar](150) NOT NULL,
	[DocumentDept] [varchar](150) NOT NULL,
	[DocumentClass] [varchar](50) NOT NULL,
	[DocumentDate] [date] NOT NULL,
	[Subject] [varchar](500) NOT NULL,
	[SenderName] [varchar](150) NOT NULL,
	[ReceptionDate] [date] NOT NULL,
	[RoutedTo] [varchar](50) NOT NULL,
	[Notes] [varchar](500) NOT NULL,
	[ArchiveLocation] [varchar](50) NOT NULL,
	[CreateDate] [datetime2](7) NOT NULL,
	[ChangeDate] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_IncomingRegisters] PRIMARY KEY CLUSTERED 
(
	[RegisterId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Languages]    Script Date: 16/05/2018 17:12:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Languages](
	[UICulture] [varchar](5) NOT NULL,
	[Name] [nchar](20) NOT NULL,
 CONSTRAINT [PK_Languages] PRIMARY KEY CLUSTERED 
(
	[UICulture] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[OutgoingRegisters]    Script Date: 16/05/2018 17:12:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OutgoingRegisters](
	[RegisterId] [int] IDENTITY(1,1) NOT NULL,
	[RegisterDate] [date] NOT NULL,
	[DocumentType] [varchar](25) NOT NULL,
	[DocumentReference] [varchar](20) NOT NULL,
	[DocumentEntity] [varchar](150) NOT NULL,
	[DocumentDept] [varchar](150) NOT NULL,
	[DocumentClass] [varchar](50) NOT NULL,
	[DocumentDate] [date] NOT NULL,
	[Subject] [varchar](500) NOT NULL,
	[SendDate] [date] NOT NULL,
	[RecipientName] [varchar](150) NOT NULL,
	[RecipientTown] [varchar](50) NOT NULL,
	[Notes] [varchar](500) NOT NULL,
	[ArchiveLocation] [varchar](50) NOT NULL,
	[CreateDate] [datetime2](7) NOT NULL,
	[ChangeDate] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_OutgoingRegisters] PRIMARY KEY CLUSTERED 
(
	[RegisterId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[PropertyConfiguration]    Script Date: 16/05/2018 17:12:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PropertyConfiguration](
	[ConfigurationId] [int] IDENTITY(1,1) NOT NULL,
	[ObjectName] [varchar](50) NOT NULL,
	[Name] [varchar](50) NOT NULL,
	[IsRequired] [bit] NOT NULL,
	[IsReadOnly] [bit] NOT NULL,
	[IsVisible] [bit] NOT NULL,
	[ListOrder] [int] NOT NULL,
 CONSTRAINT [PK_PropertyConfiguration] PRIMARY KEY CLUSTERED 
(
	[ConfigurationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[PropertyFriendyName]    Script Date: 16/05/2018 17:12:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PropertyFriendyName](
	[ConfigurationId] [int] NOT NULL,
	[UICulture] [varchar](5) NOT NULL,
	[FriendlyName] [varchar](50) NOT NULL,
 CONSTRAINT [PK_PropertyFriendyName] PRIMARY KEY CLUSTERED 
(
	[ConfigurationId] ASC,
	[UICulture] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Resources]    Script Date: 16/05/2018 17:12:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Resources](
	[ResourceId] [int] IDENTITY(1,1) NOT NULL,
	[ResourceType] [varchar](50) NOT NULL,
	[ResourceName] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Resources] PRIMARY KEY CLUSTERED 
(
	[ResourceId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ResourceTranslations]    Script Date: 16/05/2018 17:12:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ResourceTranslations](
	[ResourceId] [int] NOT NULL,
	[UICulture] [varchar](5) NOT NULL,
	[Translation] [varchar](500) NOT NULL,
 CONSTRAINT [PK_ResourceTranslations] PRIMARY KEY CLUSTERED 
(
	[ResourceId] ASC,
	[UICulture] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  View [dbo].[DeliveryView]    Script Date: 16/05/2018 17:12:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[DeliveryView]
AS
SELECT     RegisterId, CAST(RegisterId AS VARCHAR(max)) + DocumentType + DocumentReference + DocumentEntity + DocumentDept + DocumentClass + RecipientName + ExpeditorName + ReceptionName AS FullText
FROM       dbo.DeliveryRegisters


GO
/****** Object:  View [dbo].[IncomingView]    Script Date: 16/05/2018 17:12:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[IncomingView]
AS
SELECT     RegisterId, CAST(RegisterId AS VARCHAR(max)) + DocumentType + DocumentReference + DocumentEntity + DocumentDept + DocumentClass + Subject + SenderName + RoutedTo + Notes AS FullText
FROM       dbo.IncomingRegisters


GO
/****** Object:  View [dbo].[OutgoingView]    Script Date: 16/05/2018 17:12:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[OutgoingView]
AS
SELECT     RegisterId, CAST(RegisterId AS VARCHAR(max)) + DocumentType + DocumentReference + DocumentEntity + DocumentDept + DocumentClass + Subject + RecipientName + RecipientTown + Notes AS FullText
FROM       dbo.OutgoingRegisters


GO
INSERT [dbo].[Configuration] ([ConfigKey], [ConfigValue]) VALUES (N'UpdatingToVersion', N'1.3.8')
INSERT [dbo].[Configuration] ([ConfigKey], [ConfigValue]) VALUES (N'Version', N'1.3.8')
INSERT [dbo].[Languages] ([UICulture], [Name]) VALUES (N'en', N'English             ')
INSERT [dbo].[Languages] ([UICulture], [Name]) VALUES (N'es', N'Español             ')
INSERT [dbo].[Languages] ([UICulture], [Name]) VALUES (N'fr', N'Français            ')
INSERT [dbo].[Languages] ([UICulture], [Name]) VALUES (N'pt', N'Português           ')
SET IDENTITY_INSERT [dbo].[PropertyConfiguration] ON 

INSERT [dbo].[PropertyConfiguration] ([ConfigurationId], [ObjectName], [Name], [IsRequired], [IsReadOnly], [IsVisible], [ListOrder]) VALUES (1, N'DeliveryInfo', N'DocumentClass', 0, 1, 1, 7)
INSERT [dbo].[PropertyConfiguration] ([ConfigurationId], [ObjectName], [Name], [IsRequired], [IsReadOnly], [IsVisible], [ListOrder]) VALUES (2, N'DeliveryInfo', N'DocumentDate', 0, 1, 1, 8)
INSERT [dbo].[PropertyConfiguration] ([ConfigurationId], [ObjectName], [Name], [IsRequired], [IsReadOnly], [IsVisible], [ListOrder]) VALUES (3, N'DeliveryInfo', N'DocumentDept', 0, 1, 1, 6)
INSERT [dbo].[PropertyConfiguration] ([ConfigurationId], [ObjectName], [Name], [IsRequired], [IsReadOnly], [IsVisible], [ListOrder]) VALUES (4, N'DeliveryInfo', N'DocumentEntity', 0, 1, 1, 5)
INSERT [dbo].[PropertyConfiguration] ([ConfigurationId], [ObjectName], [Name], [IsRequired], [IsReadOnly], [IsVisible], [ListOrder]) VALUES (5, N'DeliveryInfo', N'DocumentReference', 0, 1, 1, 4)
INSERT [dbo].[PropertyConfiguration] ([ConfigurationId], [ObjectName], [Name], [IsRequired], [IsReadOnly], [IsVisible], [ListOrder]) VALUES (6, N'DeliveryInfo', N'DocumentType', 0, 1, 1, 3)
INSERT [dbo].[PropertyConfiguration] ([ConfigurationId], [ObjectName], [Name], [IsRequired], [IsReadOnly], [IsVisible], [ListOrder]) VALUES (7, N'DeliveryInfo', N'ExpeditorName', 0, 1, 1, 11)
INSERT [dbo].[PropertyConfiguration] ([ConfigurationId], [ObjectName], [Name], [IsRequired], [IsReadOnly], [IsVisible], [ListOrder]) VALUES (8, N'DeliveryInfo', N'ReceptionDate', 0, 1, 1, 13)
INSERT [dbo].[PropertyConfiguration] ([ConfigurationId], [ObjectName], [Name], [IsRequired], [IsReadOnly], [IsVisible], [ListOrder]) VALUES (9, N'DeliveryInfo', N'ReceptionName', 0, 1, 1, 12)
INSERT [dbo].[PropertyConfiguration] ([ConfigurationId], [ObjectName], [Name], [IsRequired], [IsReadOnly], [IsVisible], [ListOrder]) VALUES (10, N'DeliveryInfo', N'RecipientName', 0, 1, 1, 10)
INSERT [dbo].[PropertyConfiguration] ([ConfigurationId], [ObjectName], [Name], [IsRequired], [IsReadOnly], [IsVisible], [ListOrder]) VALUES (11, N'DeliveryInfo', N'RegisterDate', 0, 1, 1, 2)
INSERT [dbo].[PropertyConfiguration] ([ConfigurationId], [ObjectName], [Name], [IsRequired], [IsReadOnly], [IsVisible], [ListOrder]) VALUES (12, N'DeliveryInfo', N'RegisterId', 0, 1, 1, 1)
INSERT [dbo].[PropertyConfiguration] ([ConfigurationId], [ObjectName], [Name], [IsRequired], [IsReadOnly], [IsVisible], [ListOrder]) VALUES (13, N'DeliveryRegister', N'DocumentClass', 0, 0, 1, 7)
INSERT [dbo].[PropertyConfiguration] ([ConfigurationId], [ObjectName], [Name], [IsRequired], [IsReadOnly], [IsVisible], [ListOrder]) VALUES (14, N'DeliveryRegister', N'DocumentDate', 1, 0, 1, 8)
INSERT [dbo].[PropertyConfiguration] ([ConfigurationId], [ObjectName], [Name], [IsRequired], [IsReadOnly], [IsVisible], [ListOrder]) VALUES (15, N'DeliveryRegister', N'DocumentDept', 0, 0, 1, 6)
INSERT [dbo].[PropertyConfiguration] ([ConfigurationId], [ObjectName], [Name], [IsRequired], [IsReadOnly], [IsVisible], [ListOrder]) VALUES (16, N'DeliveryRegister', N'DocumentEntity', 1, 0, 1, 5)
INSERT [dbo].[PropertyConfiguration] ([ConfigurationId], [ObjectName], [Name], [IsRequired], [IsReadOnly], [IsVisible], [ListOrder]) VALUES (17, N'DeliveryRegister', N'DocumentReference', 1, 0, 1, 4)
INSERT [dbo].[PropertyConfiguration] ([ConfigurationId], [ObjectName], [Name], [IsRequired], [IsReadOnly], [IsVisible], [ListOrder]) VALUES (18, N'DeliveryRegister', N'DocumentType', 1, 0, 1, 3)
INSERT [dbo].[PropertyConfiguration] ([ConfigurationId], [ObjectName], [Name], [IsRequired], [IsReadOnly], [IsVisible], [ListOrder]) VALUES (19, N'DeliveryRegister', N'ExpeditorName', 1, 0, 1, 11)
INSERT [dbo].[PropertyConfiguration] ([ConfigurationId], [ObjectName], [Name], [IsRequired], [IsReadOnly], [IsVisible], [ListOrder]) VALUES (20, N'DeliveryRegister', N'ReceptionDate', 0, 0, 1, 13)
INSERT [dbo].[PropertyConfiguration] ([ConfigurationId], [ObjectName], [Name], [IsRequired], [IsReadOnly], [IsVisible], [ListOrder]) VALUES (21, N'DeliveryRegister', N'ReceptionName', 0, 0, 1, 12)
INSERT [dbo].[PropertyConfiguration] ([ConfigurationId], [ObjectName], [Name], [IsRequired], [IsReadOnly], [IsVisible], [ListOrder]) VALUES (22, N'DeliveryRegister', N'RecipientName', 1, 0, 1, 10)
INSERT [dbo].[PropertyConfiguration] ([ConfigurationId], [ObjectName], [Name], [IsRequired], [IsReadOnly], [IsVisible], [ListOrder]) VALUES (23, N'DeliveryRegister', N'RegisterDate', 1, 0, 1, 2)
INSERT [dbo].[PropertyConfiguration] ([ConfigurationId], [ObjectName], [Name], [IsRequired], [IsReadOnly], [IsVisible], [ListOrder]) VALUES (24, N'DeliveryRegister', N'RegisterId', 0, 1, 1, 1)
INSERT [dbo].[PropertyConfiguration] ([ConfigurationId], [ObjectName], [Name], [IsRequired], [IsReadOnly], [IsVisible], [ListOrder]) VALUES (25, N'IncomingInfo', N'ArchiveLocation', 0, 1, 1, 14)
INSERT [dbo].[PropertyConfiguration] ([ConfigurationId], [ObjectName], [Name], [IsRequired], [IsReadOnly], [IsVisible], [ListOrder]) VALUES (26, N'IncomingInfo', N'DocumentClass', 0, 1, 1, 7)
INSERT [dbo].[PropertyConfiguration] ([ConfigurationId], [ObjectName], [Name], [IsRequired], [IsReadOnly], [IsVisible], [ListOrder]) VALUES (27, N'IncomingInfo', N'DocumentDate', 0, 1, 1, 8)
INSERT [dbo].[PropertyConfiguration] ([ConfigurationId], [ObjectName], [Name], [IsRequired], [IsReadOnly], [IsVisible], [ListOrder]) VALUES (28, N'IncomingInfo', N'DocumentDept', 0, 1, 1, 6)
INSERT [dbo].[PropertyConfiguration] ([ConfigurationId], [ObjectName], [Name], [IsRequired], [IsReadOnly], [IsVisible], [ListOrder]) VALUES (29, N'IncomingInfo', N'DocumentEntity', 0, 1, 1, 5)
INSERT [dbo].[PropertyConfiguration] ([ConfigurationId], [ObjectName], [Name], [IsRequired], [IsReadOnly], [IsVisible], [ListOrder]) VALUES (30, N'IncomingInfo', N'DocumentReference', 0, 1, 1, 4)
INSERT [dbo].[PropertyConfiguration] ([ConfigurationId], [ObjectName], [Name], [IsRequired], [IsReadOnly], [IsVisible], [ListOrder]) VALUES (31, N'IncomingInfo', N'DocumentType', 0, 1, 1, 3)
INSERT [dbo].[PropertyConfiguration] ([ConfigurationId], [ObjectName], [Name], [IsRequired], [IsReadOnly], [IsVisible], [ListOrder]) VALUES (32, N'IncomingInfo', N'Notes', 0, 1, 1, 13)
INSERT [dbo].[PropertyConfiguration] ([ConfigurationId], [ObjectName], [Name], [IsRequired], [IsReadOnly], [IsVisible], [ListOrder]) VALUES (33, N'IncomingInfo', N'ReceptionDate', 0, 1, 1, 11)
INSERT [dbo].[PropertyConfiguration] ([ConfigurationId], [ObjectName], [Name], [IsRequired], [IsReadOnly], [IsVisible], [ListOrder]) VALUES (34, N'IncomingInfo', N'RegisterDate', 0, 1, 1, 2)
INSERT [dbo].[PropertyConfiguration] ([ConfigurationId], [ObjectName], [Name], [IsRequired], [IsReadOnly], [IsVisible], [ListOrder]) VALUES (35, N'IncomingInfo', N'RegisterId', 0, 1, 1, 1)
INSERT [dbo].[PropertyConfiguration] ([ConfigurationId], [ObjectName], [Name], [IsRequired], [IsReadOnly], [IsVisible], [ListOrder]) VALUES (36, N'IncomingInfo', N'RoutedTo', 0, 1, 1, 12)
INSERT [dbo].[PropertyConfiguration] ([ConfigurationId], [ObjectName], [Name], [IsRequired], [IsReadOnly], [IsVisible], [ListOrder]) VALUES (37, N'IncomingInfo', N'SenderName', 0, 1, 1, 10)
INSERT [dbo].[PropertyConfiguration] ([ConfigurationId], [ObjectName], [Name], [IsRequired], [IsReadOnly], [IsVisible], [ListOrder]) VALUES (38, N'IncomingInfo', N'Subject', 0, 1, 1, 9)
INSERT [dbo].[PropertyConfiguration] ([ConfigurationId], [ObjectName], [Name], [IsRequired], [IsReadOnly], [IsVisible], [ListOrder]) VALUES (39, N'IncomingRegister', N'ArchiveLocation', 0, 0, 1, 14)
INSERT [dbo].[PropertyConfiguration] ([ConfigurationId], [ObjectName], [Name], [IsRequired], [IsReadOnly], [IsVisible], [ListOrder]) VALUES (40, N'IncomingRegister', N'DocumentClass', 0, 0, 1, 7)
INSERT [dbo].[PropertyConfiguration] ([ConfigurationId], [ObjectName], [Name], [IsRequired], [IsReadOnly], [IsVisible], [ListOrder]) VALUES (41, N'IncomingRegister', N'DocumentDate', 1, 0, 1, 8)
INSERT [dbo].[PropertyConfiguration] ([ConfigurationId], [ObjectName], [Name], [IsRequired], [IsReadOnly], [IsVisible], [ListOrder]) VALUES (42, N'IncomingRegister', N'DocumentDept', 0, 0, 1, 6)
INSERT [dbo].[PropertyConfiguration] ([ConfigurationId], [ObjectName], [Name], [IsRequired], [IsReadOnly], [IsVisible], [ListOrder]) VALUES (43, N'IncomingRegister', N'DocumentEntity', 1, 0, 1, 5)
INSERT [dbo].[PropertyConfiguration] ([ConfigurationId], [ObjectName], [Name], [IsRequired], [IsReadOnly], [IsVisible], [ListOrder]) VALUES (44, N'IncomingRegister', N'DocumentReference', 1, 0, 1, 4)
INSERT [dbo].[PropertyConfiguration] ([ConfigurationId], [ObjectName], [Name], [IsRequired], [IsReadOnly], [IsVisible], [ListOrder]) VALUES (45, N'IncomingRegister', N'DocumentType', 1, 0, 1, 3)
INSERT [dbo].[PropertyConfiguration] ([ConfigurationId], [ObjectName], [Name], [IsRequired], [IsReadOnly], [IsVisible], [ListOrder]) VALUES (46, N'IncomingRegister', N'Notes', 0, 0, 1, 13)
INSERT [dbo].[PropertyConfiguration] ([ConfigurationId], [ObjectName], [Name], [IsRequired], [IsReadOnly], [IsVisible], [ListOrder]) VALUES (47, N'IncomingRegister', N'ReceptionDate', 1, 0, 1, 11)
INSERT [dbo].[PropertyConfiguration] ([ConfigurationId], [ObjectName], [Name], [IsRequired], [IsReadOnly], [IsVisible], [ListOrder]) VALUES (48, N'IncomingRegister', N'RegisterDate', 1, 0, 1, 2)
INSERT [dbo].[PropertyConfiguration] ([ConfigurationId], [ObjectName], [Name], [IsRequired], [IsReadOnly], [IsVisible], [ListOrder]) VALUES (49, N'IncomingRegister', N'RegisterId', 0, 1, 1, 1)
INSERT [dbo].[PropertyConfiguration] ([ConfigurationId], [ObjectName], [Name], [IsRequired], [IsReadOnly], [IsVisible], [ListOrder]) VALUES (50, N'IncomingRegister', N'RoutedTo', 0, 0, 1, 12)
INSERT [dbo].[PropertyConfiguration] ([ConfigurationId], [ObjectName], [Name], [IsRequired], [IsReadOnly], [IsVisible], [ListOrder]) VALUES (51, N'IncomingRegister', N'SenderName', 0, 0, 1, 10)
INSERT [dbo].[PropertyConfiguration] ([ConfigurationId], [ObjectName], [Name], [IsRequired], [IsReadOnly], [IsVisible], [ListOrder]) VALUES (52, N'IncomingRegister', N'Subject', 1, 0, 1, 9)
INSERT [dbo].[PropertyConfiguration] ([ConfigurationId], [ObjectName], [Name], [IsRequired], [IsReadOnly], [IsVisible], [ListOrder]) VALUES (53, N'OutgoingInfo', N'ArchiveLocation', 0, 1, 1, 14)
INSERT [dbo].[PropertyConfiguration] ([ConfigurationId], [ObjectName], [Name], [IsRequired], [IsReadOnly], [IsVisible], [ListOrder]) VALUES (54, N'OutgoingInfo', N'DocumentClass', 0, 1, 1, 7)
INSERT [dbo].[PropertyConfiguration] ([ConfigurationId], [ObjectName], [Name], [IsRequired], [IsReadOnly], [IsVisible], [ListOrder]) VALUES (55, N'OutgoingInfo', N'DocumentDate', 0, 1, 1, 8)
INSERT [dbo].[PropertyConfiguration] ([ConfigurationId], [ObjectName], [Name], [IsRequired], [IsReadOnly], [IsVisible], [ListOrder]) VALUES (56, N'OutgoingInfo', N'DocumentDept', 0, 1, 1, 6)
INSERT [dbo].[PropertyConfiguration] ([ConfigurationId], [ObjectName], [Name], [IsRequired], [IsReadOnly], [IsVisible], [ListOrder]) VALUES (57, N'OutgoingInfo', N'DocumentEntity', 0, 1, 1, 5)
INSERT [dbo].[PropertyConfiguration] ([ConfigurationId], [ObjectName], [Name], [IsRequired], [IsReadOnly], [IsVisible], [ListOrder]) VALUES (58, N'OutgoingInfo', N'DocumentReference', 0, 1, 1, 4)
INSERT [dbo].[PropertyConfiguration] ([ConfigurationId], [ObjectName], [Name], [IsRequired], [IsReadOnly], [IsVisible], [ListOrder]) VALUES (59, N'OutgoingInfo', N'DocumentType', 0, 1, 1, 3)
INSERT [dbo].[PropertyConfiguration] ([ConfigurationId], [ObjectName], [Name], [IsRequired], [IsReadOnly], [IsVisible], [ListOrder]) VALUES (60, N'OutgoingInfo', N'Notes', 0, 1, 1, 13)
INSERT [dbo].[PropertyConfiguration] ([ConfigurationId], [ObjectName], [Name], [IsRequired], [IsReadOnly], [IsVisible], [ListOrder]) VALUES (61, N'OutgoingInfo', N'RecipientName', 0, 1, 1, 10)
INSERT [dbo].[PropertyConfiguration] ([ConfigurationId], [ObjectName], [Name], [IsRequired], [IsReadOnly], [IsVisible], [ListOrder]) VALUES (62, N'OutgoingInfo', N'RecipientTown', 0, 1, 1, 12)
INSERT [dbo].[PropertyConfiguration] ([ConfigurationId], [ObjectName], [Name], [IsRequired], [IsReadOnly], [IsVisible], [ListOrder]) VALUES (63, N'OutgoingInfo', N'RegisterDate', 0, 1, 1, 2)
INSERT [dbo].[PropertyConfiguration] ([ConfigurationId], [ObjectName], [Name], [IsRequired], [IsReadOnly], [IsVisible], [ListOrder]) VALUES (64, N'OutgoingInfo', N'RegisterId', 0, 1, 1, 1)
INSERT [dbo].[PropertyConfiguration] ([ConfigurationId], [ObjectName], [Name], [IsRequired], [IsReadOnly], [IsVisible], [ListOrder]) VALUES (65, N'OutgoingInfo', N'SendDate', 0, 1, 1, 11)
INSERT [dbo].[PropertyConfiguration] ([ConfigurationId], [ObjectName], [Name], [IsRequired], [IsReadOnly], [IsVisible], [ListOrder]) VALUES (66, N'OutgoingInfo', N'Subject', 0, 1, 1, 9)
INSERT [dbo].[PropertyConfiguration] ([ConfigurationId], [ObjectName], [Name], [IsRequired], [IsReadOnly], [IsVisible], [ListOrder]) VALUES (67, N'OutgoingRegister', N'ArchiveLocation', 0, 0, 1, 14)
INSERT [dbo].[PropertyConfiguration] ([ConfigurationId], [ObjectName], [Name], [IsRequired], [IsReadOnly], [IsVisible], [ListOrder]) VALUES (68, N'OutgoingRegister', N'DocumentClass', 0, 0, 1, 7)
INSERT [dbo].[PropertyConfiguration] ([ConfigurationId], [ObjectName], [Name], [IsRequired], [IsReadOnly], [IsVisible], [ListOrder]) VALUES (69, N'OutgoingRegister', N'DocumentDate', 1, 0, 1, 8)
INSERT [dbo].[PropertyConfiguration] ([ConfigurationId], [ObjectName], [Name], [IsRequired], [IsReadOnly], [IsVisible], [ListOrder]) VALUES (70, N'OutgoingRegister', N'DocumentDept', 0, 0, 1, 6)
INSERT [dbo].[PropertyConfiguration] ([ConfigurationId], [ObjectName], [Name], [IsRequired], [IsReadOnly], [IsVisible], [ListOrder]) VALUES (71, N'OutgoingRegister', N'DocumentEntity', 1, 0, 1, 5)
INSERT [dbo].[PropertyConfiguration] ([ConfigurationId], [ObjectName], [Name], [IsRequired], [IsReadOnly], [IsVisible], [ListOrder]) VALUES (72, N'OutgoingRegister', N'DocumentReference', 1, 0, 1, 4)
INSERT [dbo].[PropertyConfiguration] ([ConfigurationId], [ObjectName], [Name], [IsRequired], [IsReadOnly], [IsVisible], [ListOrder]) VALUES (73, N'OutgoingRegister', N'DocumentType', 1, 0, 1, 3)
INSERT [dbo].[PropertyConfiguration] ([ConfigurationId], [ObjectName], [Name], [IsRequired], [IsReadOnly], [IsVisible], [ListOrder]) VALUES (74, N'OutgoingRegister', N'Notes', 0, 0, 1, 13)
INSERT [dbo].[PropertyConfiguration] ([ConfigurationId], [ObjectName], [Name], [IsRequired], [IsReadOnly], [IsVisible], [ListOrder]) VALUES (75, N'OutgoingRegister', N'RecipientName', 1, 0, 1, 10)
INSERT [dbo].[PropertyConfiguration] ([ConfigurationId], [ObjectName], [Name], [IsRequired], [IsReadOnly], [IsVisible], [ListOrder]) VALUES (76, N'OutgoingRegister', N'RecipientTown', 0, 0, 1, 12)
INSERT [dbo].[PropertyConfiguration] ([ConfigurationId], [ObjectName], [Name], [IsRequired], [IsReadOnly], [IsVisible], [ListOrder]) VALUES (77, N'OutgoingRegister', N'RegisterDate', 1, 0, 1, 2)
INSERT [dbo].[PropertyConfiguration] ([ConfigurationId], [ObjectName], [Name], [IsRequired], [IsReadOnly], [IsVisible], [ListOrder]) VALUES (78, N'OutgoingRegister', N'RegisterId', 0, 1, 1, 1)
INSERT [dbo].[PropertyConfiguration] ([ConfigurationId], [ObjectName], [Name], [IsRequired], [IsReadOnly], [IsVisible], [ListOrder]) VALUES (79, N'OutgoingRegister', N'SendDate', 1, 0, 1, 11)
INSERT [dbo].[PropertyConfiguration] ([ConfigurationId], [ObjectName], [Name], [IsRequired], [IsReadOnly], [IsVisible], [ListOrder]) VALUES (80, N'OutgoingRegister', N'Subject', 1, 0, 1, 9)
SET IDENTITY_INSERT [dbo].[PropertyConfiguration] OFF
INSERT [dbo].[PropertyFriendyName] ([ConfigurationId], [UICulture], [FriendlyName]) VALUES (1, N'en', N'Class')
INSERT [dbo].[PropertyFriendyName] ([ConfigurationId], [UICulture], [FriendlyName]) VALUES (1, N'es', N'Clase')
INSERT [dbo].[PropertyFriendyName] ([ConfigurationId], [UICulture], [FriendlyName]) VALUES (1, N'fr', N'Classe')
INSERT [dbo].[PropertyFriendyName] ([ConfigurationId], [UICulture], [FriendlyName]) VALUES (1, N'pt', N'Classe')
INSERT [dbo].[PropertyFriendyName] ([ConfigurationId], [UICulture], [FriendlyName]) VALUES (2, N'en', N'Doc. date')
INSERT [dbo].[PropertyFriendyName] ([ConfigurationId], [UICulture], [FriendlyName]) VALUES (2, N'es', N'Fecha doc.')
INSERT [dbo].[PropertyFriendyName] ([ConfigurationId], [UICulture], [FriendlyName]) VALUES (2, N'fr', N'Date doc.')
INSERT [dbo].[PropertyFriendyName] ([ConfigurationId], [UICulture], [FriendlyName]) VALUES (2, N'pt', N'Data doc.')
INSERT [dbo].[PropertyFriendyName] ([ConfigurationId], [UICulture], [FriendlyName]) VALUES (3, N'en', N'Department')
INSERT [dbo].[PropertyFriendyName] ([ConfigurationId], [UICulture], [FriendlyName]) VALUES (3, N'es', N'Departamento')
INSERT [dbo].[PropertyFriendyName] ([ConfigurationId], [UICulture], [FriendlyName]) VALUES (3, N'fr', N'Département')
INSERT [dbo].[PropertyFriendyName] ([ConfigurationId], [UICulture], [FriendlyName]) VALUES (3, N'pt', N'Departamento')
INSERT [dbo].[PropertyFriendyName] ([ConfigurationId], [UICulture], [FriendlyName]) VALUES (4, N'en', N'Entity')
INSERT [dbo].[PropertyFriendyName] ([ConfigurationId], [UICulture], [FriendlyName]) VALUES (4, N'es', N'Entidad')
INSERT [dbo].[PropertyFriendyName] ([ConfigurationId], [UICulture], [FriendlyName]) VALUES (4, N'fr', N'Entité')
INSERT [dbo].[PropertyFriendyName] ([ConfigurationId], [UICulture], [FriendlyName]) VALUES (4, N'pt', N'Entidade')
INSERT [dbo].[PropertyFriendyName] ([ConfigurationId], [UICulture], [FriendlyName]) VALUES (5, N'en', N'Document nr.')
INSERT [dbo].[PropertyFriendyName] ([ConfigurationId], [UICulture], [FriendlyName]) VALUES (5, N'es', N'Nº Documento')
INSERT [dbo].[PropertyFriendyName] ([ConfigurationId], [UICulture], [FriendlyName]) VALUES (5, N'fr', N'Nº Document')
INSERT [dbo].[PropertyFriendyName] ([ConfigurationId], [UICulture], [FriendlyName]) VALUES (5, N'pt', N'Nº Documento')
INSERT [dbo].[PropertyFriendyName] ([ConfigurationId], [UICulture], [FriendlyName]) VALUES (6, N'en', N'Type')
INSERT [dbo].[PropertyFriendyName] ([ConfigurationId], [UICulture], [FriendlyName]) VALUES (6, N'es', N'Tipo')
INSERT [dbo].[PropertyFriendyName] ([ConfigurationId], [UICulture], [FriendlyName]) VALUES (6, N'fr', N'Type')
INSERT [dbo].[PropertyFriendyName] ([ConfigurationId], [UICulture], [FriendlyName]) VALUES (6, N'pt', N'Tipo')
INSERT [dbo].[PropertyFriendyName] ([ConfigurationId], [UICulture], [FriendlyName]) VALUES (7, N'en', N'Sent')
INSERT [dbo].[PropertyFriendyName] ([ConfigurationId], [UICulture], [FriendlyName]) VALUES (7, N'es', N'Expedido')
INSERT [dbo].[PropertyFriendyName] ([ConfigurationId], [UICulture], [FriendlyName]) VALUES (7, N'fr', N'Expédié')
INSERT [dbo].[PropertyFriendyName] ([ConfigurationId], [UICulture], [FriendlyName]) VALUES (7, N'pt', N'Expedido')
INSERT [dbo].[PropertyFriendyName] ([ConfigurationId], [UICulture], [FriendlyName]) VALUES (8, N'en', N'Reception date')
INSERT [dbo].[PropertyFriendyName] ([ConfigurationId], [UICulture], [FriendlyName]) VALUES (8, N'es', N'Fecha recepción')
INSERT [dbo].[PropertyFriendyName] ([ConfigurationId], [UICulture], [FriendlyName]) VALUES (8, N'fr', N'Date réception')
INSERT [dbo].[PropertyFriendyName] ([ConfigurationId], [UICulture], [FriendlyName]) VALUES (8, N'pt', N'Data recepção')
INSERT [dbo].[PropertyFriendyName] ([ConfigurationId], [UICulture], [FriendlyName]) VALUES (9, N'en', N'Received')
INSERT [dbo].[PropertyFriendyName] ([ConfigurationId], [UICulture], [FriendlyName]) VALUES (9, N'es', N'Recibido')
INSERT [dbo].[PropertyFriendyName] ([ConfigurationId], [UICulture], [FriendlyName]) VALUES (9, N'fr', N'Reçu')
INSERT [dbo].[PropertyFriendyName] ([ConfigurationId], [UICulture], [FriendlyName]) VALUES (9, N'pt', N'Recebido')
INSERT [dbo].[PropertyFriendyName] ([ConfigurationId], [UICulture], [FriendlyName]) VALUES (10, N'en', N'Recipient')
INSERT [dbo].[PropertyFriendyName] ([ConfigurationId], [UICulture], [FriendlyName]) VALUES (10, N'es', N'Destinatario')
INSERT [dbo].[PropertyFriendyName] ([ConfigurationId], [UICulture], [FriendlyName]) VALUES (10, N'fr', N'Destinataire')
INSERT [dbo].[PropertyFriendyName] ([ConfigurationId], [UICulture], [FriendlyName]) VALUES (10, N'pt', N'Destinatário')
INSERT [dbo].[PropertyFriendyName] ([ConfigurationId], [UICulture], [FriendlyName]) VALUES (11, N'en', N'Reg. date')
INSERT [dbo].[PropertyFriendyName] ([ConfigurationId], [UICulture], [FriendlyName]) VALUES (11, N'es', N'Fecha reg.')
INSERT [dbo].[PropertyFriendyName] ([ConfigurationId], [UICulture], [FriendlyName]) VALUES (11, N'fr', N'Date enreg.')
INSERT [dbo].[PropertyFriendyName] ([ConfigurationId], [UICulture], [FriendlyName]) VALUES (11, N'pt', N'Data reg.')
INSERT [dbo].[PropertyFriendyName] ([ConfigurationId], [UICulture], [FriendlyName]) VALUES (12, N'en', N'Register Nr.')
INSERT [dbo].[PropertyFriendyName] ([ConfigurationId], [UICulture], [FriendlyName]) VALUES (12, N'es', N'Nº Registro')
INSERT [dbo].[PropertyFriendyName] ([ConfigurationId], [UICulture], [FriendlyName]) VALUES (12, N'fr', N'Nº Enregistr.')
INSERT [dbo].[PropertyFriendyName] ([ConfigurationId], [UICulture], [FriendlyName]) VALUES (12, N'pt', N'Nº Registo')
INSERT [dbo].[PropertyFriendyName] ([ConfigurationId], [UICulture], [FriendlyName]) VALUES (13, N'en', N'Class')
INSERT [dbo].[PropertyFriendyName] ([ConfigurationId], [UICulture], [FriendlyName]) VALUES (13, N'es', N'Clase')
INSERT [dbo].[PropertyFriendyName] ([ConfigurationId], [UICulture], [FriendlyName]) VALUES (13, N'fr', N'Classe')
INSERT [dbo].[PropertyFriendyName] ([ConfigurationId], [UICulture], [FriendlyName]) VALUES (13, N'pt', N'Classe')
INSERT [dbo].[PropertyFriendyName] ([ConfigurationId], [UICulture], [FriendlyName]) VALUES (14, N'en', N'Date')
INSERT [dbo].[PropertyFriendyName] ([ConfigurationId], [UICulture], [FriendlyName]) VALUES (14, N'es', N'Fecha')
INSERT [dbo].[PropertyFriendyName] ([ConfigurationId], [UICulture], [FriendlyName]) VALUES (14, N'fr', N'Date')
INSERT [dbo].[PropertyFriendyName] ([ConfigurationId], [UICulture], [FriendlyName]) VALUES (14, N'pt', N'Data')
INSERT [dbo].[PropertyFriendyName] ([ConfigurationId], [UICulture], [FriendlyName]) VALUES (15, N'en', N'Department')
INSERT [dbo].[PropertyFriendyName] ([ConfigurationId], [UICulture], [FriendlyName]) VALUES (15, N'es', N'Departamento')
INSERT [dbo].[PropertyFriendyName] ([ConfigurationId], [UICulture], [FriendlyName]) VALUES (15, N'fr', N'Département')
INSERT [dbo].[PropertyFriendyName] ([ConfigurationId], [UICulture], [FriendlyName]) VALUES (15, N'pt', N'Departamento')
INSERT [dbo].[PropertyFriendyName] ([ConfigurationId], [UICulture], [FriendlyName]) VALUES (16, N'en', N'Entity')
INSERT [dbo].[PropertyFriendyName] ([ConfigurationId], [UICulture], [FriendlyName]) VALUES (16, N'es', N'Entidad')
INSERT [dbo].[PropertyFriendyName] ([ConfigurationId], [UICulture], [FriendlyName]) VALUES (16, N'fr', N'Entité')
INSERT [dbo].[PropertyFriendyName] ([ConfigurationId], [UICulture], [FriendlyName]) VALUES (16, N'pt', N'Entidade')
INSERT [dbo].[PropertyFriendyName] ([ConfigurationId], [UICulture], [FriendlyName]) VALUES (17, N'en', N'Number')
INSERT [dbo].[PropertyFriendyName] ([ConfigurationId], [UICulture], [FriendlyName]) VALUES (17, N'es', N'Número')
INSERT [dbo].[PropertyFriendyName] ([ConfigurationId], [UICulture], [FriendlyName]) VALUES (17, N'fr', N'Numéro')
INSERT [dbo].[PropertyFriendyName] ([ConfigurationId], [UICulture], [FriendlyName]) VALUES (17, N'pt', N'Número')
INSERT [dbo].[PropertyFriendyName] ([ConfigurationId], [UICulture], [FriendlyName]) VALUES (18, N'en', N'Type')
INSERT [dbo].[PropertyFriendyName] ([ConfigurationId], [UICulture], [FriendlyName]) VALUES (18, N'es', N'Tipo')
INSERT [dbo].[PropertyFriendyName] ([ConfigurationId], [UICulture], [FriendlyName]) VALUES (18, N'fr', N'Type')
INSERT [dbo].[PropertyFriendyName] ([ConfigurationId], [UICulture], [FriendlyName]) VALUES (18, N'pt', N'Tipo')
INSERT [dbo].[PropertyFriendyName] ([ConfigurationId], [UICulture], [FriendlyName]) VALUES (19, N'en', N'Sent by')
INSERT [dbo].[PropertyFriendyName] ([ConfigurationId], [UICulture], [FriendlyName]) VALUES (19, N'es', N'Expedido por')
INSERT [dbo].[PropertyFriendyName] ([ConfigurationId], [UICulture], [FriendlyName]) VALUES (19, N'fr', N'Expédié par')
INSERT [dbo].[PropertyFriendyName] ([ConfigurationId], [UICulture], [FriendlyName]) VALUES (19, N'pt', N'Expedido por')
INSERT [dbo].[PropertyFriendyName] ([ConfigurationId], [UICulture], [FriendlyName]) VALUES (20, N'en', N'Reception date')
INSERT [dbo].[PropertyFriendyName] ([ConfigurationId], [UICulture], [FriendlyName]) VALUES (20, N'es', N'Fecha recepción')
INSERT [dbo].[PropertyFriendyName] ([ConfigurationId], [UICulture], [FriendlyName]) VALUES (20, N'fr', N'Date de réception')
INSERT [dbo].[PropertyFriendyName] ([ConfigurationId], [UICulture], [FriendlyName]) VALUES (20, N'pt', N'Data recepção')
INSERT [dbo].[PropertyFriendyName] ([ConfigurationId], [UICulture], [FriendlyName]) VALUES (21, N'en', N'Received by')
INSERT [dbo].[PropertyFriendyName] ([ConfigurationId], [UICulture], [FriendlyName]) VALUES (21, N'es', N'Recibido por')
INSERT [dbo].[PropertyFriendyName] ([ConfigurationId], [UICulture], [FriendlyName]) VALUES (21, N'fr', N'Reçu par')
INSERT [dbo].[PropertyFriendyName] ([ConfigurationId], [UICulture], [FriendlyName]) VALUES (21, N'pt', N'Recebido por')
INSERT [dbo].[PropertyFriendyName] ([ConfigurationId], [UICulture], [FriendlyName]) VALUES (22, N'en', N'Recipient')
INSERT [dbo].[PropertyFriendyName] ([ConfigurationId], [UICulture], [FriendlyName]) VALUES (22, N'es', N'Destinatario')
INSERT [dbo].[PropertyFriendyName] ([ConfigurationId], [UICulture], [FriendlyName]) VALUES (22, N'fr', N'Destinataire')
INSERT [dbo].[PropertyFriendyName] ([ConfigurationId], [UICulture], [FriendlyName]) VALUES (22, N'pt', N'Destinatário')
INSERT [dbo].[PropertyFriendyName] ([ConfigurationId], [UICulture], [FriendlyName]) VALUES (23, N'en', N'Register date')
INSERT [dbo].[PropertyFriendyName] ([ConfigurationId], [UICulture], [FriendlyName]) VALUES (23, N'es', N'Fecha de registro')
INSERT [dbo].[PropertyFriendyName] ([ConfigurationId], [UICulture], [FriendlyName]) VALUES (23, N'fr', N'Date d''enreg.')
INSERT [dbo].[PropertyFriendyName] ([ConfigurationId], [UICulture], [FriendlyName]) VALUES (23, N'pt', N'Data de registo')
INSERT [dbo].[PropertyFriendyName] ([ConfigurationId], [UICulture], [FriendlyName]) VALUES (24, N'en', N'Register Nr.')
INSERT [dbo].[PropertyFriendyName] ([ConfigurationId], [UICulture], [FriendlyName]) VALUES (24, N'es', N'Nº Registro')
INSERT [dbo].[PropertyFriendyName] ([ConfigurationId], [UICulture], [FriendlyName]) VALUES (24, N'fr', N'Nº Enregistr.')
INSERT [dbo].[PropertyFriendyName] ([ConfigurationId], [UICulture], [FriendlyName]) VALUES (24, N'pt', N'Nº Registo')
INSERT [dbo].[PropertyFriendyName] ([ConfigurationId], [UICulture], [FriendlyName]) VALUES (25, N'en', N'Location')
INSERT [dbo].[PropertyFriendyName] ([ConfigurationId], [UICulture], [FriendlyName]) VALUES (25, N'es', N'Ubicación')
INSERT [dbo].[PropertyFriendyName] ([ConfigurationId], [UICulture], [FriendlyName]) VALUES (25, N'fr', N'Localisation')
INSERT [dbo].[PropertyFriendyName] ([ConfigurationId], [UICulture], [FriendlyName]) VALUES (25, N'pt', N'Localização')
GO
INSERT [dbo].[PropertyFriendyName] ([ConfigurationId], [UICulture], [FriendlyName]) VALUES (26, N'en', N'Class')
INSERT [dbo].[PropertyFriendyName] ([ConfigurationId], [UICulture], [FriendlyName]) VALUES (26, N'es', N'Clase')
INSERT [dbo].[PropertyFriendyName] ([ConfigurationId], [UICulture], [FriendlyName]) VALUES (26, N'fr', N'Classe')
INSERT [dbo].[PropertyFriendyName] ([ConfigurationId], [UICulture], [FriendlyName]) VALUES (26, N'pt', N'Classe')
INSERT [dbo].[PropertyFriendyName] ([ConfigurationId], [UICulture], [FriendlyName]) VALUES (27, N'en', N'Doc. date')
INSERT [dbo].[PropertyFriendyName] ([ConfigurationId], [UICulture], [FriendlyName]) VALUES (27, N'es', N'Fecha doc.')
INSERT [dbo].[PropertyFriendyName] ([ConfigurationId], [UICulture], [FriendlyName]) VALUES (27, N'fr', N'Date doc.')
INSERT [dbo].[PropertyFriendyName] ([ConfigurationId], [UICulture], [FriendlyName]) VALUES (27, N'pt', N'Data doc.')
INSERT [dbo].[PropertyFriendyName] ([ConfigurationId], [UICulture], [FriendlyName]) VALUES (28, N'en', N'Department')
INSERT [dbo].[PropertyFriendyName] ([ConfigurationId], [UICulture], [FriendlyName]) VALUES (28, N'es', N'Departamento')
INSERT [dbo].[PropertyFriendyName] ([ConfigurationId], [UICulture], [FriendlyName]) VALUES (28, N'fr', N'Département')
INSERT [dbo].[PropertyFriendyName] ([ConfigurationId], [UICulture], [FriendlyName]) VALUES (28, N'pt', N'Departamento')
INSERT [dbo].[PropertyFriendyName] ([ConfigurationId], [UICulture], [FriendlyName]) VALUES (29, N'en', N'Entity')
INSERT [dbo].[PropertyFriendyName] ([ConfigurationId], [UICulture], [FriendlyName]) VALUES (29, N'es', N'Entidad')
INSERT [dbo].[PropertyFriendyName] ([ConfigurationId], [UICulture], [FriendlyName]) VALUES (29, N'fr', N'Entité')
INSERT [dbo].[PropertyFriendyName] ([ConfigurationId], [UICulture], [FriendlyName]) VALUES (29, N'pt', N'Entidade')
INSERT [dbo].[PropertyFriendyName] ([ConfigurationId], [UICulture], [FriendlyName]) VALUES (30, N'en', N'Document nr.')
INSERT [dbo].[PropertyFriendyName] ([ConfigurationId], [UICulture], [FriendlyName]) VALUES (30, N'es', N'Nº Documento')
INSERT [dbo].[PropertyFriendyName] ([ConfigurationId], [UICulture], [FriendlyName]) VALUES (30, N'fr', N'Nº Document')
INSERT [dbo].[PropertyFriendyName] ([ConfigurationId], [UICulture], [FriendlyName]) VALUES (30, N'pt', N'Nº Documento')
INSERT [dbo].[PropertyFriendyName] ([ConfigurationId], [UICulture], [FriendlyName]) VALUES (31, N'en', N'Type')
INSERT [dbo].[PropertyFriendyName] ([ConfigurationId], [UICulture], [FriendlyName]) VALUES (31, N'es', N'Tipo')
INSERT [dbo].[PropertyFriendyName] ([ConfigurationId], [UICulture], [FriendlyName]) VALUES (31, N'fr', N'Type')
INSERT [dbo].[PropertyFriendyName] ([ConfigurationId], [UICulture], [FriendlyName]) VALUES (31, N'pt', N'Tipo')
INSERT [dbo].[PropertyFriendyName] ([ConfigurationId], [UICulture], [FriendlyName]) VALUES (32, N'en', N'Observations')
INSERT [dbo].[PropertyFriendyName] ([ConfigurationId], [UICulture], [FriendlyName]) VALUES (32, N'es', N'Observaciones')
INSERT [dbo].[PropertyFriendyName] ([ConfigurationId], [UICulture], [FriendlyName]) VALUES (32, N'fr', N'Observations')
INSERT [dbo].[PropertyFriendyName] ([ConfigurationId], [UICulture], [FriendlyName]) VALUES (32, N'pt', N'Observações')
INSERT [dbo].[PropertyFriendyName] ([ConfigurationId], [UICulture], [FriendlyName]) VALUES (33, N'en', N'Reception date')
INSERT [dbo].[PropertyFriendyName] ([ConfigurationId], [UICulture], [FriendlyName]) VALUES (33, N'es', N'Fecha recepción')
INSERT [dbo].[PropertyFriendyName] ([ConfigurationId], [UICulture], [FriendlyName]) VALUES (33, N'fr', N'Date réception')
INSERT [dbo].[PropertyFriendyName] ([ConfigurationId], [UICulture], [FriendlyName]) VALUES (33, N'pt', N'Data recepção')
INSERT [dbo].[PropertyFriendyName] ([ConfigurationId], [UICulture], [FriendlyName]) VALUES (34, N'en', N'Reg. date')
INSERT [dbo].[PropertyFriendyName] ([ConfigurationId], [UICulture], [FriendlyName]) VALUES (34, N'es', N'Fecha reg.')
INSERT [dbo].[PropertyFriendyName] ([ConfigurationId], [UICulture], [FriendlyName]) VALUES (34, N'fr', N'Date enreg.')
INSERT [dbo].[PropertyFriendyName] ([ConfigurationId], [UICulture], [FriendlyName]) VALUES (34, N'pt', N'Data reg.')
INSERT [dbo].[PropertyFriendyName] ([ConfigurationId], [UICulture], [FriendlyName]) VALUES (35, N'en', N'Register Nr.')
INSERT [dbo].[PropertyFriendyName] ([ConfigurationId], [UICulture], [FriendlyName]) VALUES (35, N'es', N'Nº Registro')
INSERT [dbo].[PropertyFriendyName] ([ConfigurationId], [UICulture], [FriendlyName]) VALUES (35, N'fr', N'Nº Enregistr.')
INSERT [dbo].[PropertyFriendyName] ([ConfigurationId], [UICulture], [FriendlyName]) VALUES (35, N'pt', N'Nº Registo')
INSERT [dbo].[PropertyFriendyName] ([ConfigurationId], [UICulture], [FriendlyName]) VALUES (36, N'en', N'Circulated')
INSERT [dbo].[PropertyFriendyName] ([ConfigurationId], [UICulture], [FriendlyName]) VALUES (36, N'es', N'Encaminado')
INSERT [dbo].[PropertyFriendyName] ([ConfigurationId], [UICulture], [FriendlyName]) VALUES (36, N'fr', N'Acheminé')
INSERT [dbo].[PropertyFriendyName] ([ConfigurationId], [UICulture], [FriendlyName]) VALUES (36, N'pt', N'Encaminhado')
INSERT [dbo].[PropertyFriendyName] ([ConfigurationId], [UICulture], [FriendlyName]) VALUES (37, N'en', N'Origin')
INSERT [dbo].[PropertyFriendyName] ([ConfigurationId], [UICulture], [FriendlyName]) VALUES (37, N'es', N'Origen')
INSERT [dbo].[PropertyFriendyName] ([ConfigurationId], [UICulture], [FriendlyName]) VALUES (37, N'fr', N'Origine')
INSERT [dbo].[PropertyFriendyName] ([ConfigurationId], [UICulture], [FriendlyName]) VALUES (37, N'pt', N'Proveniência')
INSERT [dbo].[PropertyFriendyName] ([ConfigurationId], [UICulture], [FriendlyName]) VALUES (38, N'en', N'Subject')
INSERT [dbo].[PropertyFriendyName] ([ConfigurationId], [UICulture], [FriendlyName]) VALUES (38, N'es', N'Asunto')
INSERT [dbo].[PropertyFriendyName] ([ConfigurationId], [UICulture], [FriendlyName]) VALUES (38, N'fr', N'Sujet')
INSERT [dbo].[PropertyFriendyName] ([ConfigurationId], [UICulture], [FriendlyName]) VALUES (38, N'pt', N'Assunto')
INSERT [dbo].[PropertyFriendyName] ([ConfigurationId], [UICulture], [FriendlyName]) VALUES (39, N'en', N'Location')
INSERT [dbo].[PropertyFriendyName] ([ConfigurationId], [UICulture], [FriendlyName]) VALUES (39, N'es', N'Ubicación')
INSERT [dbo].[PropertyFriendyName] ([ConfigurationId], [UICulture], [FriendlyName]) VALUES (39, N'fr', N'Localisation')
INSERT [dbo].[PropertyFriendyName] ([ConfigurationId], [UICulture], [FriendlyName]) VALUES (39, N'pt', N'Localização')
INSERT [dbo].[PropertyFriendyName] ([ConfigurationId], [UICulture], [FriendlyName]) VALUES (40, N'en', N'Class')
INSERT [dbo].[PropertyFriendyName] ([ConfigurationId], [UICulture], [FriendlyName]) VALUES (40, N'es', N'Clase')
INSERT [dbo].[PropertyFriendyName] ([ConfigurationId], [UICulture], [FriendlyName]) VALUES (40, N'fr', N'Classe')
INSERT [dbo].[PropertyFriendyName] ([ConfigurationId], [UICulture], [FriendlyName]) VALUES (40, N'pt', N'Classe')
INSERT [dbo].[PropertyFriendyName] ([ConfigurationId], [UICulture], [FriendlyName]) VALUES (41, N'en', N'Date')
INSERT [dbo].[PropertyFriendyName] ([ConfigurationId], [UICulture], [FriendlyName]) VALUES (41, N'es', N'Fecha')
INSERT [dbo].[PropertyFriendyName] ([ConfigurationId], [UICulture], [FriendlyName]) VALUES (41, N'fr', N'Date')
INSERT [dbo].[PropertyFriendyName] ([ConfigurationId], [UICulture], [FriendlyName]) VALUES (41, N'pt', N'Data')
INSERT [dbo].[PropertyFriendyName] ([ConfigurationId], [UICulture], [FriendlyName]) VALUES (42, N'en', N'Department')
INSERT [dbo].[PropertyFriendyName] ([ConfigurationId], [UICulture], [FriendlyName]) VALUES (42, N'es', N'Departamento')
INSERT [dbo].[PropertyFriendyName] ([ConfigurationId], [UICulture], [FriendlyName]) VALUES (42, N'fr', N'Département')
INSERT [dbo].[PropertyFriendyName] ([ConfigurationId], [UICulture], [FriendlyName]) VALUES (42, N'pt', N'Departamento')
INSERT [dbo].[PropertyFriendyName] ([ConfigurationId], [UICulture], [FriendlyName]) VALUES (43, N'en', N'Entity')
INSERT [dbo].[PropertyFriendyName] ([ConfigurationId], [UICulture], [FriendlyName]) VALUES (43, N'es', N'Entidad')
INSERT [dbo].[PropertyFriendyName] ([ConfigurationId], [UICulture], [FriendlyName]) VALUES (43, N'fr', N'Entité')
INSERT [dbo].[PropertyFriendyName] ([ConfigurationId], [UICulture], [FriendlyName]) VALUES (43, N'pt', N'Entidade')
INSERT [dbo].[PropertyFriendyName] ([ConfigurationId], [UICulture], [FriendlyName]) VALUES (44, N'en', N'Number')
INSERT [dbo].[PropertyFriendyName] ([ConfigurationId], [UICulture], [FriendlyName]) VALUES (44, N'es', N'Número')
INSERT [dbo].[PropertyFriendyName] ([ConfigurationId], [UICulture], [FriendlyName]) VALUES (44, N'fr', N'Numéro')
INSERT [dbo].[PropertyFriendyName] ([ConfigurationId], [UICulture], [FriendlyName]) VALUES (44, N'pt', N'Número')
INSERT [dbo].[PropertyFriendyName] ([ConfigurationId], [UICulture], [FriendlyName]) VALUES (45, N'en', N'Type')
INSERT [dbo].[PropertyFriendyName] ([ConfigurationId], [UICulture], [FriendlyName]) VALUES (45, N'es', N'Tipo')
INSERT [dbo].[PropertyFriendyName] ([ConfigurationId], [UICulture], [FriendlyName]) VALUES (45, N'fr', N'Type')
INSERT [dbo].[PropertyFriendyName] ([ConfigurationId], [UICulture], [FriendlyName]) VALUES (45, N'pt', N'Tipo')
INSERT [dbo].[PropertyFriendyName] ([ConfigurationId], [UICulture], [FriendlyName]) VALUES (46, N'en', N'Observations')
INSERT [dbo].[PropertyFriendyName] ([ConfigurationId], [UICulture], [FriendlyName]) VALUES (46, N'es', N'Observaciones')
INSERT [dbo].[PropertyFriendyName] ([ConfigurationId], [UICulture], [FriendlyName]) VALUES (46, N'fr', N'Observations')
INSERT [dbo].[PropertyFriendyName] ([ConfigurationId], [UICulture], [FriendlyName]) VALUES (46, N'pt', N'Observações')
INSERT [dbo].[PropertyFriendyName] ([ConfigurationId], [UICulture], [FriendlyName]) VALUES (47, N'en', N'Reception date')
INSERT [dbo].[PropertyFriendyName] ([ConfigurationId], [UICulture], [FriendlyName]) VALUES (47, N'es', N'Fecha recepción')
INSERT [dbo].[PropertyFriendyName] ([ConfigurationId], [UICulture], [FriendlyName]) VALUES (47, N'fr', N'Date de réception')
INSERT [dbo].[PropertyFriendyName] ([ConfigurationId], [UICulture], [FriendlyName]) VALUES (47, N'pt', N'Data recepção')
INSERT [dbo].[PropertyFriendyName] ([ConfigurationId], [UICulture], [FriendlyName]) VALUES (48, N'en', N'Register date')
INSERT [dbo].[PropertyFriendyName] ([ConfigurationId], [UICulture], [FriendlyName]) VALUES (48, N'es', N'Fecha de registro')
INSERT [dbo].[PropertyFriendyName] ([ConfigurationId], [UICulture], [FriendlyName]) VALUES (48, N'fr', N'Date d''enreg.')
INSERT [dbo].[PropertyFriendyName] ([ConfigurationId], [UICulture], [FriendlyName]) VALUES (48, N'pt', N'Data de registo')
INSERT [dbo].[PropertyFriendyName] ([ConfigurationId], [UICulture], [FriendlyName]) VALUES (49, N'en', N'Register Nr.')
INSERT [dbo].[PropertyFriendyName] ([ConfigurationId], [UICulture], [FriendlyName]) VALUES (49, N'es', N'Nº Registro')
INSERT [dbo].[PropertyFriendyName] ([ConfigurationId], [UICulture], [FriendlyName]) VALUES (49, N'fr', N'Nº Enregistr.')
INSERT [dbo].[PropertyFriendyName] ([ConfigurationId], [UICulture], [FriendlyName]) VALUES (49, N'pt', N'Nº Registo')
INSERT [dbo].[PropertyFriendyName] ([ConfigurationId], [UICulture], [FriendlyName]) VALUES (50, N'en', N'Circulation')
INSERT [dbo].[PropertyFriendyName] ([ConfigurationId], [UICulture], [FriendlyName]) VALUES (50, N'es', N'Encaminamiento')
INSERT [dbo].[PropertyFriendyName] ([ConfigurationId], [UICulture], [FriendlyName]) VALUES (50, N'fr', N'Acheminement')
INSERT [dbo].[PropertyFriendyName] ([ConfigurationId], [UICulture], [FriendlyName]) VALUES (50, N'pt', N'Encaminhamento')
GO
INSERT [dbo].[PropertyFriendyName] ([ConfigurationId], [UICulture], [FriendlyName]) VALUES (51, N'en', N'Origin')
INSERT [dbo].[PropertyFriendyName] ([ConfigurationId], [UICulture], [FriendlyName]) VALUES (51, N'es', N'Origen')
INSERT [dbo].[PropertyFriendyName] ([ConfigurationId], [UICulture], [FriendlyName]) VALUES (51, N'fr', N'Origine')
INSERT [dbo].[PropertyFriendyName] ([ConfigurationId], [UICulture], [FriendlyName]) VALUES (51, N'pt', N'Proveniência')
INSERT [dbo].[PropertyFriendyName] ([ConfigurationId], [UICulture], [FriendlyName]) VALUES (52, N'en', N'Subject')
INSERT [dbo].[PropertyFriendyName] ([ConfigurationId], [UICulture], [FriendlyName]) VALUES (52, N'es', N'Asunto')
INSERT [dbo].[PropertyFriendyName] ([ConfigurationId], [UICulture], [FriendlyName]) VALUES (52, N'fr', N'Sujet')
INSERT [dbo].[PropertyFriendyName] ([ConfigurationId], [UICulture], [FriendlyName]) VALUES (52, N'pt', N'Assunto')
INSERT [dbo].[PropertyFriendyName] ([ConfigurationId], [UICulture], [FriendlyName]) VALUES (53, N'en', N'Location')
INSERT [dbo].[PropertyFriendyName] ([ConfigurationId], [UICulture], [FriendlyName]) VALUES (53, N'es', N'Ubicación')
INSERT [dbo].[PropertyFriendyName] ([ConfigurationId], [UICulture], [FriendlyName]) VALUES (53, N'fr', N'Localisation')
INSERT [dbo].[PropertyFriendyName] ([ConfigurationId], [UICulture], [FriendlyName]) VALUES (53, N'pt', N'Localização')
INSERT [dbo].[PropertyFriendyName] ([ConfigurationId], [UICulture], [FriendlyName]) VALUES (54, N'en', N'Class')
INSERT [dbo].[PropertyFriendyName] ([ConfigurationId], [UICulture], [FriendlyName]) VALUES (54, N'es', N'Clase')
INSERT [dbo].[PropertyFriendyName] ([ConfigurationId], [UICulture], [FriendlyName]) VALUES (54, N'fr', N'Classe')
INSERT [dbo].[PropertyFriendyName] ([ConfigurationId], [UICulture], [FriendlyName]) VALUES (54, N'pt', N'Classe')
INSERT [dbo].[PropertyFriendyName] ([ConfigurationId], [UICulture], [FriendlyName]) VALUES (55, N'en', N'Doc. date')
INSERT [dbo].[PropertyFriendyName] ([ConfigurationId], [UICulture], [FriendlyName]) VALUES (55, N'es', N'Fecha doc.')
INSERT [dbo].[PropertyFriendyName] ([ConfigurationId], [UICulture], [FriendlyName]) VALUES (55, N'fr', N'Date doc.')
INSERT [dbo].[PropertyFriendyName] ([ConfigurationId], [UICulture], [FriendlyName]) VALUES (55, N'pt', N'Data doc.')
INSERT [dbo].[PropertyFriendyName] ([ConfigurationId], [UICulture], [FriendlyName]) VALUES (56, N'en', N'Department')
INSERT [dbo].[PropertyFriendyName] ([ConfigurationId], [UICulture], [FriendlyName]) VALUES (56, N'es', N'Departamento')
INSERT [dbo].[PropertyFriendyName] ([ConfigurationId], [UICulture], [FriendlyName]) VALUES (56, N'fr', N'Département')
INSERT [dbo].[PropertyFriendyName] ([ConfigurationId], [UICulture], [FriendlyName]) VALUES (56, N'pt', N'Departamento')
INSERT [dbo].[PropertyFriendyName] ([ConfigurationId], [UICulture], [FriendlyName]) VALUES (57, N'en', N'Entity')
INSERT [dbo].[PropertyFriendyName] ([ConfigurationId], [UICulture], [FriendlyName]) VALUES (57, N'es', N'Entidad')
INSERT [dbo].[PropertyFriendyName] ([ConfigurationId], [UICulture], [FriendlyName]) VALUES (57, N'fr', N'Entité')
INSERT [dbo].[PropertyFriendyName] ([ConfigurationId], [UICulture], [FriendlyName]) VALUES (57, N'pt', N'Entidade')
INSERT [dbo].[PropertyFriendyName] ([ConfigurationId], [UICulture], [FriendlyName]) VALUES (58, N'en', N'Document nr.')
INSERT [dbo].[PropertyFriendyName] ([ConfigurationId], [UICulture], [FriendlyName]) VALUES (58, N'es', N'Nº Documento')
INSERT [dbo].[PropertyFriendyName] ([ConfigurationId], [UICulture], [FriendlyName]) VALUES (58, N'fr', N'Nº Document')
INSERT [dbo].[PropertyFriendyName] ([ConfigurationId], [UICulture], [FriendlyName]) VALUES (58, N'pt', N'Nº Documento')
INSERT [dbo].[PropertyFriendyName] ([ConfigurationId], [UICulture], [FriendlyName]) VALUES (59, N'en', N'Type')
INSERT [dbo].[PropertyFriendyName] ([ConfigurationId], [UICulture], [FriendlyName]) VALUES (59, N'es', N'Tipo')
INSERT [dbo].[PropertyFriendyName] ([ConfigurationId], [UICulture], [FriendlyName]) VALUES (59, N'fr', N'Type')
INSERT [dbo].[PropertyFriendyName] ([ConfigurationId], [UICulture], [FriendlyName]) VALUES (59, N'pt', N'Tipo')
INSERT [dbo].[PropertyFriendyName] ([ConfigurationId], [UICulture], [FriendlyName]) VALUES (60, N'en', N'Observations')
INSERT [dbo].[PropertyFriendyName] ([ConfigurationId], [UICulture], [FriendlyName]) VALUES (60, N'es', N'Observaciones')
INSERT [dbo].[PropertyFriendyName] ([ConfigurationId], [UICulture], [FriendlyName]) VALUES (60, N'fr', N'Observations')
INSERT [dbo].[PropertyFriendyName] ([ConfigurationId], [UICulture], [FriendlyName]) VALUES (60, N'pt', N'Observações')
INSERT [dbo].[PropertyFriendyName] ([ConfigurationId], [UICulture], [FriendlyName]) VALUES (61, N'en', N'Recipient')
INSERT [dbo].[PropertyFriendyName] ([ConfigurationId], [UICulture], [FriendlyName]) VALUES (61, N'es', N'Destinatario')
INSERT [dbo].[PropertyFriendyName] ([ConfigurationId], [UICulture], [FriendlyName]) VALUES (61, N'fr', N'Destinataire')
INSERT [dbo].[PropertyFriendyName] ([ConfigurationId], [UICulture], [FriendlyName]) VALUES (61, N'pt', N'Destinatário')
INSERT [dbo].[PropertyFriendyName] ([ConfigurationId], [UICulture], [FriendlyName]) VALUES (62, N'en', N'Town')
INSERT [dbo].[PropertyFriendyName] ([ConfigurationId], [UICulture], [FriendlyName]) VALUES (62, N'es', N'Localidad')
INSERT [dbo].[PropertyFriendyName] ([ConfigurationId], [UICulture], [FriendlyName]) VALUES (62, N'fr', N'Ville')
INSERT [dbo].[PropertyFriendyName] ([ConfigurationId], [UICulture], [FriendlyName]) VALUES (62, N'pt', N'Localidade')
INSERT [dbo].[PropertyFriendyName] ([ConfigurationId], [UICulture], [FriendlyName]) VALUES (63, N'en', N'Reg. date')
INSERT [dbo].[PropertyFriendyName] ([ConfigurationId], [UICulture], [FriendlyName]) VALUES (63, N'es', N'Fecha reg.')
INSERT [dbo].[PropertyFriendyName] ([ConfigurationId], [UICulture], [FriendlyName]) VALUES (63, N'fr', N'Date enreg.')
INSERT [dbo].[PropertyFriendyName] ([ConfigurationId], [UICulture], [FriendlyName]) VALUES (63, N'pt', N'Data reg.')
INSERT [dbo].[PropertyFriendyName] ([ConfigurationId], [UICulture], [FriendlyName]) VALUES (64, N'en', N'Register Nr.')
INSERT [dbo].[PropertyFriendyName] ([ConfigurationId], [UICulture], [FriendlyName]) VALUES (64, N'es', N'Nº Registro')
INSERT [dbo].[PropertyFriendyName] ([ConfigurationId], [UICulture], [FriendlyName]) VALUES (64, N'fr', N'Nº Enregistr.')
INSERT [dbo].[PropertyFriendyName] ([ConfigurationId], [UICulture], [FriendlyName]) VALUES (64, N'pt', N'Nº Registo')
INSERT [dbo].[PropertyFriendyName] ([ConfigurationId], [UICulture], [FriendlyName]) VALUES (65, N'en', N'Sent date')
INSERT [dbo].[PropertyFriendyName] ([ConfigurationId], [UICulture], [FriendlyName]) VALUES (65, N'es', N'Fecha expedición')
INSERT [dbo].[PropertyFriendyName] ([ConfigurationId], [UICulture], [FriendlyName]) VALUES (65, N'fr', N'Date d''expédition')
INSERT [dbo].[PropertyFriendyName] ([ConfigurationId], [UICulture], [FriendlyName]) VALUES (65, N'pt', N'Data expedição')
INSERT [dbo].[PropertyFriendyName] ([ConfigurationId], [UICulture], [FriendlyName]) VALUES (66, N'en', N'Subject')
INSERT [dbo].[PropertyFriendyName] ([ConfigurationId], [UICulture], [FriendlyName]) VALUES (66, N'es', N'Asunto')
INSERT [dbo].[PropertyFriendyName] ([ConfigurationId], [UICulture], [FriendlyName]) VALUES (66, N'fr', N'Sujet')
INSERT [dbo].[PropertyFriendyName] ([ConfigurationId], [UICulture], [FriendlyName]) VALUES (66, N'pt', N'Assunto')
INSERT [dbo].[PropertyFriendyName] ([ConfigurationId], [UICulture], [FriendlyName]) VALUES (67, N'en', N'Location')
INSERT [dbo].[PropertyFriendyName] ([ConfigurationId], [UICulture], [FriendlyName]) VALUES (67, N'es', N'Ubicación')
INSERT [dbo].[PropertyFriendyName] ([ConfigurationId], [UICulture], [FriendlyName]) VALUES (67, N'fr', N'Localisation')
INSERT [dbo].[PropertyFriendyName] ([ConfigurationId], [UICulture], [FriendlyName]) VALUES (67, N'pt', N'Localização')
INSERT [dbo].[PropertyFriendyName] ([ConfigurationId], [UICulture], [FriendlyName]) VALUES (68, N'en', N'Class')
INSERT [dbo].[PropertyFriendyName] ([ConfigurationId], [UICulture], [FriendlyName]) VALUES (68, N'es', N'Clase')
INSERT [dbo].[PropertyFriendyName] ([ConfigurationId], [UICulture], [FriendlyName]) VALUES (68, N'fr', N'Classe')
INSERT [dbo].[PropertyFriendyName] ([ConfigurationId], [UICulture], [FriendlyName]) VALUES (68, N'pt', N'Classe')
INSERT [dbo].[PropertyFriendyName] ([ConfigurationId], [UICulture], [FriendlyName]) VALUES (69, N'en', N'Date')
INSERT [dbo].[PropertyFriendyName] ([ConfigurationId], [UICulture], [FriendlyName]) VALUES (69, N'es', N'Fecha')
INSERT [dbo].[PropertyFriendyName] ([ConfigurationId], [UICulture], [FriendlyName]) VALUES (69, N'fr', N'Date')
INSERT [dbo].[PropertyFriendyName] ([ConfigurationId], [UICulture], [FriendlyName]) VALUES (69, N'pt', N'Data')
INSERT [dbo].[PropertyFriendyName] ([ConfigurationId], [UICulture], [FriendlyName]) VALUES (70, N'en', N'Department')
INSERT [dbo].[PropertyFriendyName] ([ConfigurationId], [UICulture], [FriendlyName]) VALUES (70, N'es', N'Departamento')
INSERT [dbo].[PropertyFriendyName] ([ConfigurationId], [UICulture], [FriendlyName]) VALUES (70, N'fr', N'Département')
INSERT [dbo].[PropertyFriendyName] ([ConfigurationId], [UICulture], [FriendlyName]) VALUES (70, N'pt', N'Departamento')
INSERT [dbo].[PropertyFriendyName] ([ConfigurationId], [UICulture], [FriendlyName]) VALUES (71, N'en', N'Entity')
INSERT [dbo].[PropertyFriendyName] ([ConfigurationId], [UICulture], [FriendlyName]) VALUES (71, N'es', N'Entidad')
INSERT [dbo].[PropertyFriendyName] ([ConfigurationId], [UICulture], [FriendlyName]) VALUES (71, N'fr', N'Entité')
INSERT [dbo].[PropertyFriendyName] ([ConfigurationId], [UICulture], [FriendlyName]) VALUES (71, N'pt', N'Entidade')
INSERT [dbo].[PropertyFriendyName] ([ConfigurationId], [UICulture], [FriendlyName]) VALUES (72, N'en', N'Number')
INSERT [dbo].[PropertyFriendyName] ([ConfigurationId], [UICulture], [FriendlyName]) VALUES (72, N'es', N'Número')
INSERT [dbo].[PropertyFriendyName] ([ConfigurationId], [UICulture], [FriendlyName]) VALUES (72, N'fr', N'Numéro')
INSERT [dbo].[PropertyFriendyName] ([ConfigurationId], [UICulture], [FriendlyName]) VALUES (72, N'pt', N'Número')
INSERT [dbo].[PropertyFriendyName] ([ConfigurationId], [UICulture], [FriendlyName]) VALUES (73, N'en', N'Type')
INSERT [dbo].[PropertyFriendyName] ([ConfigurationId], [UICulture], [FriendlyName]) VALUES (73, N'es', N'Tipo')
INSERT [dbo].[PropertyFriendyName] ([ConfigurationId], [UICulture], [FriendlyName]) VALUES (73, N'fr', N'Type')
INSERT [dbo].[PropertyFriendyName] ([ConfigurationId], [UICulture], [FriendlyName]) VALUES (73, N'pt', N'Tipo')
INSERT [dbo].[PropertyFriendyName] ([ConfigurationId], [UICulture], [FriendlyName]) VALUES (74, N'en', N'Observations')
INSERT [dbo].[PropertyFriendyName] ([ConfigurationId], [UICulture], [FriendlyName]) VALUES (74, N'es', N'Observaciones')
INSERT [dbo].[PropertyFriendyName] ([ConfigurationId], [UICulture], [FriendlyName]) VALUES (74, N'fr', N'Observations')
INSERT [dbo].[PropertyFriendyName] ([ConfigurationId], [UICulture], [FriendlyName]) VALUES (74, N'pt', N'Observações')
INSERT [dbo].[PropertyFriendyName] ([ConfigurationId], [UICulture], [FriendlyName]) VALUES (75, N'en', N'Recipient')
INSERT [dbo].[PropertyFriendyName] ([ConfigurationId], [UICulture], [FriendlyName]) VALUES (75, N'es', N'Destinatario')
INSERT [dbo].[PropertyFriendyName] ([ConfigurationId], [UICulture], [FriendlyName]) VALUES (75, N'fr', N'Destinataire')
INSERT [dbo].[PropertyFriendyName] ([ConfigurationId], [UICulture], [FriendlyName]) VALUES (75, N'pt', N'Destinatário')
GO
INSERT [dbo].[PropertyFriendyName] ([ConfigurationId], [UICulture], [FriendlyName]) VALUES (76, N'en', N'Town')
INSERT [dbo].[PropertyFriendyName] ([ConfigurationId], [UICulture], [FriendlyName]) VALUES (76, N'es', N'Localidad')
INSERT [dbo].[PropertyFriendyName] ([ConfigurationId], [UICulture], [FriendlyName]) VALUES (76, N'fr', N'Ville')
INSERT [dbo].[PropertyFriendyName] ([ConfigurationId], [UICulture], [FriendlyName]) VALUES (76, N'pt', N'Localidade')
INSERT [dbo].[PropertyFriendyName] ([ConfigurationId], [UICulture], [FriendlyName]) VALUES (77, N'en', N'Register date')
INSERT [dbo].[PropertyFriendyName] ([ConfigurationId], [UICulture], [FriendlyName]) VALUES (77, N'es', N'Fecha de registro')
INSERT [dbo].[PropertyFriendyName] ([ConfigurationId], [UICulture], [FriendlyName]) VALUES (77, N'fr', N'Date d''enreg.')
INSERT [dbo].[PropertyFriendyName] ([ConfigurationId], [UICulture], [FriendlyName]) VALUES (77, N'pt', N'Data de registo')
INSERT [dbo].[PropertyFriendyName] ([ConfigurationId], [UICulture], [FriendlyName]) VALUES (78, N'en', N'Register Nr.')
INSERT [dbo].[PropertyFriendyName] ([ConfigurationId], [UICulture], [FriendlyName]) VALUES (78, N'es', N'Nº Registro')
INSERT [dbo].[PropertyFriendyName] ([ConfigurationId], [UICulture], [FriendlyName]) VALUES (78, N'fr', N'Nº Enregistr.')
INSERT [dbo].[PropertyFriendyName] ([ConfigurationId], [UICulture], [FriendlyName]) VALUES (78, N'pt', N'Nº Registo')
INSERT [dbo].[PropertyFriendyName] ([ConfigurationId], [UICulture], [FriendlyName]) VALUES (79, N'en', N'Sent date')
INSERT [dbo].[PropertyFriendyName] ([ConfigurationId], [UICulture], [FriendlyName]) VALUES (79, N'es', N'Fecha expedición')
INSERT [dbo].[PropertyFriendyName] ([ConfigurationId], [UICulture], [FriendlyName]) VALUES (79, N'fr', N'Date d''expédition')
INSERT [dbo].[PropertyFriendyName] ([ConfigurationId], [UICulture], [FriendlyName]) VALUES (79, N'pt', N'Data expedição')
INSERT [dbo].[PropertyFriendyName] ([ConfigurationId], [UICulture], [FriendlyName]) VALUES (80, N'en', N'Subject')
INSERT [dbo].[PropertyFriendyName] ([ConfigurationId], [UICulture], [FriendlyName]) VALUES (80, N'es', N'Asunto')
INSERT [dbo].[PropertyFriendyName] ([ConfigurationId], [UICulture], [FriendlyName]) VALUES (80, N'fr', N'Sujet')
INSERT [dbo].[PropertyFriendyName] ([ConfigurationId], [UICulture], [FriendlyName]) VALUES (80, N'pt', N'Assunto')
SET IDENTITY_INSERT [dbo].[Resources] ON 

INSERT [dbo].[Resources] ([ResourceId], [ResourceType], [ResourceName]) VALUES (1, N'InterwayDocs', N'LabelClickCreateIncoming')
INSERT [dbo].[Resources] ([ResourceId], [ResourceType], [ResourceName]) VALUES (2, N'InterwayDocs', N'ToolTipRegisterDate')
INSERT [dbo].[Resources] ([ResourceId], [ResourceType], [ResourceName]) VALUES (3, N'InterwayDocs', N'UpgradingVersion')
INSERT [dbo].[Resources] ([ResourceId], [ResourceType], [ResourceName]) VALUES (4, N'InterwayDocs', N'AuditNoChanges')
INSERT [dbo].[Resources] ([ResourceId], [ResourceType], [ResourceName]) VALUES (5, N'InterwayDocs', N'LabelDelivery')
INSERT [dbo].[Resources] ([ResourceId], [ResourceType], [ResourceName]) VALUES (6, N'InterwayDocs', N'ToolTipHideDetail')
INSERT [dbo].[Resources] ([ResourceId], [ResourceType], [ResourceName]) VALUES (7, N'InterwayDocs', N'CloseOrCancel')
INSERT [dbo].[Resources] ([ResourceId], [ResourceType], [ResourceName]) VALUES (8, N'InterwayDocs', N'DeliveryBookDisplayName')
INSERT [dbo].[Resources] ([ResourceId], [ResourceType], [ResourceName]) VALUES (9, N'InterwayDocs', N'AboutFormDeveloperLabel')
INSERT [dbo].[Resources] ([ResourceId], [ResourceType], [ResourceName]) VALUES (10, N'InterwayDocs', N'ToolTipSubject')
INSERT [dbo].[Resources] ([ResourceId], [ResourceType], [ResourceName]) VALUES (11, N'InterwayDocs', N'ToolTipCurrentPageTotalPages')
INSERT [dbo].[Resources] ([ResourceId], [ResourceType], [ResourceName]) VALUES (12, N'InterwayDocs', N'FatalError')
INSERT [dbo].[Resources] ([ResourceId], [ResourceType], [ResourceName]) VALUES (13, N'InterwayDocs', N'AboutFormFileLabel')
INSERT [dbo].[Resources] ([ResourceId], [ResourceType], [ResourceName]) VALUES (14, N'InterwayDocs', N'ApplyingQueryFile')
INSERT [dbo].[Resources] ([ResourceId], [ResourceType], [ResourceName]) VALUES (15, N'InterwayDocs', N'ToolTipFullText')
INSERT [dbo].[Resources] ([ResourceId], [ResourceType], [ResourceName]) VALUES (16, N'InterwayDocs', N'BookReportDateSince')
INSERT [dbo].[Resources] ([ResourceId], [ResourceType], [ResourceName]) VALUES (17, N'InterwayDocs', N'BookReportDateRange')
INSERT [dbo].[Resources] ([ResourceId], [ResourceType], [ResourceName]) VALUES (18, N'InterwayDocs', N'ToolTipLocation')
INSERT [dbo].[Resources] ([ResourceId], [ResourceType], [ResourceName]) VALUES (19, N'InterwayDocs', N'LabelArchiveLocation')
INSERT [dbo].[Resources] ([ResourceId], [ResourceType], [ResourceName]) VALUES (20, N'InterwayDocs', N'ToolTipEndDate')
INSERT [dbo].[Resources] ([ResourceId], [ResourceType], [ResourceName]) VALUES (21, N'InterwayDocs', N'CopyDatabaseFiles')
INSERT [dbo].[Resources] ([ResourceId], [ResourceType], [ResourceName]) VALUES (22, N'InterwayDocs', N'DatabaseTemperingWrongVersion')
INSERT [dbo].[Resources] ([ResourceId], [ResourceType], [ResourceName]) VALUES (23, N'InterwayDocs', N'ToolTipNew')
INSERT [dbo].[Resources] ([ResourceId], [ResourceType], [ResourceName]) VALUES (24, N'InterwayDocs', N'Application_ThreadException')
INSERT [dbo].[Resources] ([ResourceId], [ResourceType], [ResourceName]) VALUES (25, N'InterwayDocs', N'LabelStartDate')
INSERT [dbo].[Resources] ([ResourceId], [ResourceType], [ResourceName]) VALUES (26, N'InterwayDocs', N'ToolsExportlabel')
INSERT [dbo].[Resources] ([ResourceId], [ResourceType], [ResourceName]) VALUES (27, N'InterwayDocs', N'OutgoingRegisterReportName')
INSERT [dbo].[Resources] ([ResourceId], [ResourceType], [ResourceName]) VALUES (28, N'InterwayDocs', N'NewRegister')
INSERT [dbo].[Resources] ([ResourceId], [ResourceType], [ResourceName]) VALUES (29, N'InterwayDocs', N'ToolsImportLabel')
INSERT [dbo].[Resources] ([ResourceId], [ResourceType], [ResourceName]) VALUES (30, N'InterwayDocs', N'IncomingRegisterReportName')
INSERT [dbo].[Resources] ([ResourceId], [ResourceType], [ResourceName]) VALUES (31, N'InterwayDocs', N'ToolTipDates')
INSERT [dbo].[Resources] ([ResourceId], [ResourceType], [ResourceName]) VALUES (32, N'InterwayDocs', N'DeliveryRegisterReportName')
INSERT [dbo].[Resources] ([ResourceId], [ResourceType], [ResourceName]) VALUES (33, N'InterwayDocs', N'LabelIncoming')
INSERT [dbo].[Resources] ([ResourceId], [ResourceType], [ResourceName]) VALUES (34, N'InterwayDocs', N'EmailSupport')
INSERT [dbo].[Resources] ([ResourceId], [ResourceType], [ResourceName]) VALUES (35, N'InterwayDocs', N'DatabaseTemperingVersionEmpty')
INSERT [dbo].[Resources] ([ResourceId], [ResourceType], [ResourceName]) VALUES (36, N'InterwayDocs', N'ToolsBackupLabel')
INSERT [dbo].[Resources] ([ResourceId], [ResourceType], [ResourceName]) VALUES (37, N'InterwayDocs', N'ToolTipExportListExcel')
INSERT [dbo].[Resources] ([ResourceId], [ResourceType], [ResourceName]) VALUES (38, N'InterwayDocs', N'AuditChanged')
INSERT [dbo].[Resources] ([ResourceId], [ResourceType], [ResourceName]) VALUES (39, N'InterwayDocs', N'AppDomain_UnhandledException')
INSERT [dbo].[Resources] ([ResourceId], [ResourceType], [ResourceName]) VALUES (40, N'InterwayDocs', N'AuditCreatedFormat')
INSERT [dbo].[Resources] ([ResourceId], [ResourceType], [ResourceName]) VALUES (41, N'InterwayDocs', N'Unspecified')
INSERT [dbo].[Resources] ([ResourceId], [ResourceType], [ResourceName]) VALUES (42, N'InterwayDocs', N'NoAvailableRegisters')
INSERT [dbo].[Resources] ([ResourceId], [ResourceType], [ResourceName]) VALUES (43, N'InterwayDocs', N'BookReportTitle')
INSERT [dbo].[Resources] ([ResourceId], [ResourceType], [ResourceName]) VALUES (44, N'InterwayDocs', N'AuditChangedSameDayFormat')
INSERT [dbo].[Resources] ([ResourceId], [ResourceType], [ResourceName]) VALUES (45, N'InterwayDocs', N'AboutFormVersionLabel')
INSERT [dbo].[Resources] ([ResourceId], [ResourceType], [ResourceName]) VALUES (46, N'InterwayDocs', N'Language')
INSERT [dbo].[Resources] ([ResourceId], [ResourceType], [ResourceName]) VALUES (47, N'InterwayDocs', N'NoScriptForVersion')
INSERT [dbo].[Resources] ([ResourceId], [ResourceType], [ResourceName]) VALUES (48, N'InterwayDocs', N'LabelClickCreateDelivery')
INSERT [dbo].[Resources] ([ResourceId], [ResourceType], [ResourceName]) VALUES (49, N'InterwayDocs', N'ReportLabelAudit')
INSERT [dbo].[Resources] ([ResourceId], [ResourceType], [ResourceName]) VALUES (50, N'InterwayDocs', N'LabelAboutApplication')
INSERT [dbo].[Resources] ([ResourceId], [ResourceType], [ResourceName]) VALUES (51, N'InterwayDocs', N'ToolTipStartDate')
INSERT [dbo].[Resources] ([ResourceId], [ResourceType], [ResourceName]) VALUES (52, N'InterwayDocs', N'ToolTipSenderName')
INSERT [dbo].[Resources] ([ResourceId], [ResourceType], [ResourceName]) VALUES (53, N'InterwayDocs', N'CommunReportTitle')
INSERT [dbo].[Resources] ([ResourceId], [ResourceType], [ResourceName]) VALUES (54, N'InterwayDocs', N'IncomingRegisterShortName')
INSERT [dbo].[Resources] ([ResourceId], [ResourceType], [ResourceName]) VALUES (55, N'InterwayDocs', N'ToolTipDocumentNumber')
INSERT [dbo].[Resources] ([ResourceId], [ResourceType], [ResourceName]) VALUES (56, N'InterwayDocs', N'ToolTipShowSearchPanel')
INSERT [dbo].[Resources] ([ResourceId], [ResourceType], [ResourceName]) VALUES (57, N'InterwayDocs', N'ExcelWorkbook')
INSERT [dbo].[Resources] ([ResourceId], [ResourceType], [ResourceName]) VALUES (58, N'InterwayDocs', N'LabelSearch')
INSERT [dbo].[Resources] ([ResourceId], [ResourceType], [ResourceName]) VALUES (59, N'InterwayDocs', N'OperationError')
INSERT [dbo].[Resources] ([ResourceId], [ResourceType], [ResourceName]) VALUES (60, N'InterwayDocs', N'HideSearchPanel')
INSERT [dbo].[Resources] ([ResourceId], [ResourceType], [ResourceName]) VALUES (61, N'InterwayDocs', N'LabelEndDate')
INSERT [dbo].[Resources] ([ResourceId], [ResourceType], [ResourceName]) VALUES (62, N'InterwayDocs', N'BookReportDateUpTo')
INSERT [dbo].[Resources] ([ResourceId], [ResourceType], [ResourceName]) VALUES (63, N'InterwayDocs', N'RegisterReportTitle')
INSERT [dbo].[Resources] ([ResourceId], [ResourceType], [ResourceName]) VALUES (64, N'InterwayDocs', N'RefreshigDbObjects')
INSERT [dbo].[Resources] ([ResourceId], [ResourceType], [ResourceName]) VALUES (65, N'InterwayDocs', N'RegisterNumber')
INSERT [dbo].[Resources] ([ResourceId], [ResourceType], [ResourceName]) VALUES (66, N'InterwayDocs', N'DeliveryBookShortName')
INSERT [dbo].[Resources] ([ResourceId], [ResourceType], [ResourceName]) VALUES (67, N'InterwayDocs', N'ToolTipDocumentEntity')
INSERT [dbo].[Resources] ([ResourceId], [ResourceType], [ResourceName]) VALUES (68, N'InterwayDocs', N'AuditChangedSameDay')
INSERT [dbo].[Resources] ([ResourceId], [ResourceType], [ResourceName]) VALUES (69, N'InterwayDocs', N'LabelFullText')
INSERT [dbo].[Resources] ([ResourceId], [ResourceType], [ResourceName]) VALUES (70, N'InterwayDocs', N'AboutFormUrlLabel')
INSERT [dbo].[Resources] ([ResourceId], [ResourceType], [ResourceName]) VALUES (71, N'InterwayDocs', N'LabelHelp')
INSERT [dbo].[Resources] ([ResourceId], [ResourceType], [ResourceName]) VALUES (72, N'InterwayDocs', N'LabelDocumentation')
INSERT [dbo].[Resources] ([ResourceId], [ResourceType], [ResourceName]) VALUES (73, N'InterwayDocs', N'AuditChangedFormat')
INSERT [dbo].[Resources] ([ResourceId], [ResourceType], [ResourceName]) VALUES (74, N'InterwayDocs', N'MissingDatabaseFile')
INSERT [dbo].[Resources] ([ResourceId], [ResourceType], [ResourceName]) VALUES (75, N'InterwayDocs', N'ToolTipDocumentClass')
INSERT [dbo].[Resources] ([ResourceId], [ResourceType], [ResourceName]) VALUES (76, N'InterwayDocs', N'ToolsRestoreLabel')
INSERT [dbo].[Resources] ([ResourceId], [ResourceType], [ResourceName]) VALUES (77, N'InterwayDocs', N'AboutFormHtmlFileName')
INSERT [dbo].[Resources] ([ResourceId], [ResourceType], [ResourceName]) VALUES (78, N'InterwayDocs', N'FastDateToolTip')
INSERT [dbo].[Resources] ([ResourceId], [ResourceType], [ResourceName]) VALUES (79, N'InterwayDocs', N'AboutFormUrlLink')
INSERT [dbo].[Resources] ([ResourceId], [ResourceType], [ResourceName]) VALUES (80, N'InterwayDocs', N'ToolTipPreviousPage')
INSERT [dbo].[Resources] ([ResourceId], [ResourceType], [ResourceName]) VALUES (81, N'InterwayDocs', N'IncomingBookShortName')
INSERT [dbo].[Resources] ([ResourceId], [ResourceType], [ResourceName]) VALUES (82, N'InterwayDocs', N'DateTimeFormat')
INSERT [dbo].[Resources] ([ResourceId], [ResourceType], [ResourceName]) VALUES (83, N'InterwayDocs', N'IncomingBookDisplayName')
INSERT [dbo].[Resources] ([ResourceId], [ResourceType], [ResourceName]) VALUES (84, N'InterwayDocs', N'ToolTipReceptionName')
INSERT [dbo].[Resources] ([ResourceId], [ResourceType], [ResourceName]) VALUES (85, N'InterwayDocs', N'ToolTipReceptionDate')
INSERT [dbo].[Resources] ([ResourceId], [ResourceType], [ResourceName]) VALUES (86, N'InterwayDocs', N'OutgoingBookDisplayName')
INSERT [dbo].[Resources] ([ResourceId], [ResourceType], [ResourceName]) VALUES (87, N'InterwayDocs', N'ToolTipFirstPage')
INSERT [dbo].[Resources] ([ResourceId], [ResourceType], [ResourceName]) VALUES (88, N'InterwayDocs', N'FilenameDateTimeFormat')
INSERT [dbo].[Resources] ([ResourceId], [ResourceType], [ResourceName]) VALUES (89, N'InterwayDocs', N'ToolTipCancel')
INSERT [dbo].[Resources] ([ResourceId], [ResourceType], [ResourceName]) VALUES (90, N'InterwayDocs', N'ToolTipRoutedTo')
INSERT [dbo].[Resources] ([ResourceId], [ResourceType], [ResourceName]) VALUES (91, N'InterwayDocs', N'LabelOutgoing')
INSERT [dbo].[Resources] ([ResourceId], [ResourceType], [ResourceName]) VALUES (92, N'InterwayDocs', N'ToolTipExpeditorName')
INSERT [dbo].[Resources] ([ResourceId], [ResourceType], [ResourceName]) VALUES (93, N'InterwayDocs', N'ToolTipShowDetailPanel')
INSERT [dbo].[Resources] ([ResourceId], [ResourceType], [ResourceName]) VALUES (94, N'InterwayDocs', N'ToolTipDocumentType')
INSERT [dbo].[Resources] ([ResourceId], [ResourceType], [ResourceName]) VALUES (95, N'InterwayDocs', N'ToolTipDocumentDate')
INSERT [dbo].[Resources] ([ResourceId], [ResourceType], [ResourceName]) VALUES (96, N'InterwayDocs', N'ToolTipDocumentDept')
INSERT [dbo].[Resources] ([ResourceId], [ResourceType], [ResourceName]) VALUES (97, N'InterwayDocs', N'OutgoingRegisterShortName')
INSERT [dbo].[Resources] ([ResourceId], [ResourceType], [ResourceName]) VALUES (98, N'InterwayDocs', N'LabelClickCreateOutgoing')
INSERT [dbo].[Resources] ([ResourceId], [ResourceType], [ResourceName]) VALUES (99, N'InterwayDocs', N'ToolTipSave')
GO
INSERT [dbo].[Resources] ([ResourceId], [ResourceType], [ResourceName]) VALUES (100, N'InterwayDocs', N'ToolTipEdit')
INSERT [dbo].[Resources] ([ResourceId], [ResourceType], [ResourceName]) VALUES (101, N'InterwayDocs', N'ToolTipLastPage')
INSERT [dbo].[Resources] ([ResourceId], [ResourceType], [ResourceName]) VALUES (102, N'InterwayDocs', N'LabelAlert')
INSERT [dbo].[Resources] ([ResourceId], [ResourceType], [ResourceName]) VALUES (103, N'InterwayDocs', N'LabelDates')
INSERT [dbo].[Resources] ([ResourceId], [ResourceType], [ResourceName]) VALUES (104, N'InterwayDocs', N'LabelTools')
INSERT [dbo].[Resources] ([ResourceId], [ResourceType], [ResourceName]) VALUES (105, N'InterwayDocs', N'OutgoingBookShortName')
INSERT [dbo].[Resources] ([ResourceId], [ResourceType], [ResourceName]) VALUES (106, N'InterwayDocs', N'SaveError')
INSERT [dbo].[Resources] ([ResourceId], [ResourceType], [ResourceName]) VALUES (107, N'InterwayDocs', N'LabelDocument')
INSERT [dbo].[Resources] ([ResourceId], [ResourceType], [ResourceName]) VALUES (108, N'InterwayDocs', N'ToolTipExportRegisterExcel')
INSERT [dbo].[Resources] ([ResourceId], [ResourceType], [ResourceName]) VALUES (109, N'InterwayDocs', N'UnsavedRegister')
INSERT [dbo].[Resources] ([ResourceId], [ResourceType], [ResourceName]) VALUES (110, N'InterwayDocs', N'ToolTipSendDate')
INSERT [dbo].[Resources] ([ResourceId], [ResourceType], [ResourceName]) VALUES (111, N'InterwayDocs', N'MainFormTitle')
INSERT [dbo].[Resources] ([ResourceId], [ResourceType], [ResourceName]) VALUES (112, N'InterwayDocs', N'ToolTipNextPage')
INSERT [dbo].[Resources] ([ResourceId], [ResourceType], [ResourceName]) VALUES (113, N'InterwayDocs', N'ToolTipRecipientName')
INSERT [dbo].[Resources] ([ResourceId], [ResourceType], [ResourceName]) VALUES (114, N'InterwayDocs', N'ToolTipRecipientTown')
INSERT [dbo].[Resources] ([ResourceId], [ResourceType], [ResourceName]) VALUES (115, N'InterwayDocs.Business', N'DateNotInFuture')
INSERT [dbo].[Resources] ([ResourceId], [ResourceType], [ResourceName]) VALUES (116, N'InterwayDocs.Business', N'RegisterDate')
INSERT [dbo].[Resources] ([ResourceId], [ResourceType], [ResourceName]) VALUES (117, N'InterwayDocs.Business', N'EndDateGreaterThanOrEqualStartDate')
INSERT [dbo].[Resources] ([ResourceId], [ResourceType], [ResourceName]) VALUES (118, N'InterwayDocs.Business', N'AllDates')
INSERT [dbo].[Resources] ([ResourceId], [ResourceType], [ResourceName]) VALUES (119, N'InterwayDocs.Business', N'FastDateOptionsYesterday')
INSERT [dbo].[Resources] ([ResourceId], [ResourceType], [ResourceName]) VALUES (120, N'InterwayDocs.Business', N'DocumentDate')
INSERT [dbo].[Resources] ([ResourceId], [ResourceType], [ResourceName]) VALUES (121, N'InterwayDocs.Business', N'ChangeDate')
INSERT [dbo].[Resources] ([ResourceId], [ResourceType], [ResourceName]) VALUES (122, N'InterwayDocs.Business', N'Required')
INSERT [dbo].[Resources] ([ResourceId], [ResourceType], [ResourceName]) VALUES (123, N'InterwayDocs.Business', N'FastDateOptionsLast90Days')
INSERT [dbo].[Resources] ([ResourceId], [ResourceType], [ResourceName]) VALUES (124, N'InterwayDocs.Business', N'FastDateOptionsLast30Days')
INSERT [dbo].[Resources] ([ResourceId], [ResourceType], [ResourceName]) VALUES (125, N'InterwayDocs.Business', N'FastDateOptionsToday')
INSERT [dbo].[Resources] ([ResourceId], [ResourceType], [ResourceName]) VALUES (126, N'InterwayDocs.Business', N'FastDateOptionsLast15Days')
INSERT [dbo].[Resources] ([ResourceId], [ResourceType], [ResourceName]) VALUES (127, N'InterwayDocs.Business', N'CreateDate')
INSERT [dbo].[Resources] ([ResourceId], [ResourceType], [ResourceName]) VALUES (128, N'InterwayDocs.Business', N'FastDateOptionsLast7Days')
INSERT [dbo].[Resources] ([ResourceId], [ResourceType], [ResourceName]) VALUES (129, N'InterwayDocs.Business', N'ReceptionDate')
INSERT [dbo].[Resources] ([ResourceId], [ResourceType], [ResourceName]) VALUES (130, N'InterwayDocs.Business', N'SendDate')
INSERT [dbo].[Resources] ([ResourceId], [ResourceType], [ResourceName]) VALUES (131, N'InterwayDocs.Business', N'FastDateOptionsFreeSearch')
INSERT [dbo].[Resources] ([ResourceId], [ResourceType], [ResourceName]) VALUES (132, N'InterwayDocs.Business', N'ThreePartsFullText')
INSERT [dbo].[Resources] ([ResourceId], [ResourceType], [ResourceName]) VALUES (133, N'InterwayDocs.Business', N'WrongClassFormat')
INSERT [dbo].[Resources] ([ResourceId], [ResourceType], [ResourceName]) VALUES (134, N'InterwayDocs', N'LabelClickCreateIncoming')
SET IDENTITY_INSERT [dbo].[Resources] OFF
INSERT [dbo].[ResourceTranslations] ([ResourceId], [UICulture], [Translation]) VALUES (1, N'en', N'Click to create an incoming mail register')
INSERT [dbo].[ResourceTranslations] ([ResourceId], [UICulture], [Translation]) VALUES (1, N'es', N'Clique para crear un registro de correspondencia entrada')
INSERT [dbo].[ResourceTranslations] ([ResourceId], [UICulture], [Translation]) VALUES (1, N'fr', N'Cliquez pour créer un enregistrement de correspondance arrivée')
INSERT [dbo].[ResourceTranslations] ([ResourceId], [UICulture], [Translation]) VALUES (1, N'pt', N'Clique para criar um registo de correspondência entrada')
INSERT [dbo].[ResourceTranslations] ([ResourceId], [UICulture], [Translation]) VALUES (2, N'en', N'Document creation date.')
INSERT [dbo].[ResourceTranslations] ([ResourceId], [UICulture], [Translation]) VALUES (2, N'es', N'Fecha de creación del documento.')
INSERT [dbo].[ResourceTranslations] ([ResourceId], [UICulture], [Translation]) VALUES (2, N'fr', N'Date de création du document.')
INSERT [dbo].[ResourceTranslations] ([ResourceId], [UICulture], [Translation]) VALUES (2, N'pt', N'Data de criação do documento.')
INSERT [dbo].[ResourceTranslations] ([ResourceId], [UICulture], [Translation]) VALUES (3, N'en', N'You are going to upgrade version {0} to {1}.')
INSERT [dbo].[ResourceTranslations] ([ResourceId], [UICulture], [Translation]) VALUES (3, N'es', N'Va a actualizar la versión {0} a {1}.')
INSERT [dbo].[ResourceTranslations] ([ResourceId], [UICulture], [Translation]) VALUES (3, N'fr', N'Vous allez mettre à niveau la version {0} vers {1}.')
INSERT [dbo].[ResourceTranslations] ([ResourceId], [UICulture], [Translation]) VALUES (3, N'pt', N'Vai actualizar a versão {0} para {1}.')
INSERT [dbo].[ResourceTranslations] ([ResourceId], [UICulture], [Translation]) VALUES (4, N'en', N'Created on {0}. No changes.')
INSERT [dbo].[ResourceTranslations] ([ResourceId], [UICulture], [Translation]) VALUES (4, N'es', N'Creado en {0}. Sin modificaciones.')
INSERT [dbo].[ResourceTranslations] ([ResourceId], [UICulture], [Translation]) VALUES (4, N'fr', N'Créé le {0}. Sans modifications.')
INSERT [dbo].[ResourceTranslations] ([ResourceId], [UICulture], [Translation]) VALUES (4, N'pt', N'Criado em {0}. Sem alterações.')
INSERT [dbo].[ResourceTranslations] ([ResourceId], [UICulture], [Translation]) VALUES (5, N'en', N'Delivery')
INSERT [dbo].[ResourceTranslations] ([ResourceId], [UICulture], [Translation]) VALUES (5, N'es', N'Protocolo')
INSERT [dbo].[ResourceTranslations] ([ResourceId], [UICulture], [Translation]) VALUES (5, N'fr', N'Protocole')
INSERT [dbo].[ResourceTranslations] ([ResourceId], [UICulture], [Translation]) VALUES (5, N'pt', N'Protocolo')
INSERT [dbo].[ResourceTranslations] ([ResourceId], [UICulture], [Translation]) VALUES (6, N'en', N'Hide the register')
INSERT [dbo].[ResourceTranslations] ([ResourceId], [UICulture], [Translation]) VALUES (6, N'es', N'Ocultar el registro')
INSERT [dbo].[ResourceTranslations] ([ResourceId], [UICulture], [Translation]) VALUES (6, N'fr', N'Cacher l''enregistrement')
INSERT [dbo].[ResourceTranslations] ([ResourceId], [UICulture], [Translation]) VALUES (6, N'pt', N'Esconder o registo')
INSERT [dbo].[ResourceTranslations] ([ResourceId], [UICulture], [Translation]) VALUES (7, N'en', N'The register isn''t saved. If you close without saving you will loose the changes.
Do you want to close without saving?')
INSERT [dbo].[ResourceTranslations] ([ResourceId], [UICulture], [Translation]) VALUES (7, N'es', N'El registro no está grabado. Si se cierra sin grabar, perderá las modificaciones.
¿Quiere cerrar el registro sin grabar?')
INSERT [dbo].[ResourceTranslations] ([ResourceId], [UICulture], [Translation]) VALUES (7, N'fr', N'L''enregistrement n''est pas sauvegardé. Si vous fermez sans sauvegarder, vous perdrez vos modifications.
Voulez-vous fermer l''enregistrement sans sauvegarder?')
INSERT [dbo].[ResourceTranslations] ([ResourceId], [UICulture], [Translation]) VALUES (7, N'pt', N'O registo não está gravada. Se fechar sem gravar, vai perder as alterações.
Quer fechar o registo sem gravar?')
INSERT [dbo].[ResourceTranslations] ([ResourceId], [UICulture], [Translation]) VALUES (8, N'en', N'Delivery mail book')
INSERT [dbo].[ResourceTranslations] ([ResourceId], [UICulture], [Translation]) VALUES (8, N'es', N'Libro de protocolo de correspondencia')
INSERT [dbo].[ResourceTranslations] ([ResourceId], [UICulture], [Translation]) VALUES (8, N'fr', N'Livre de protocole de correspondance')
INSERT [dbo].[ResourceTranslations] ([ResourceId], [UICulture], [Translation]) VALUES (8, N'pt', N'Livro de protocolo de correspondência')
INSERT [dbo].[ResourceTranslations] ([ResourceId], [UICulture], [Translation]) VALUES (9, N'en', N'Developed by Codisa IT Solutions & Tiago Freitas Leal')
INSERT [dbo].[ResourceTranslations] ([ResourceId], [UICulture], [Translation]) VALUES (9, N'es', N'Desarrollado por Codisa IT Solutions & Tiago Freitas Leal')
INSERT [dbo].[ResourceTranslations] ([ResourceId], [UICulture], [Translation]) VALUES (9, N'fr', N'Développé par Codisa IT Solutions & Tiago Freitas Leal')
INSERT [dbo].[ResourceTranslations] ([ResourceId], [UICulture], [Translation]) VALUES (9, N'pt', N'Desenvolvido por Codisa IT Solutions & Tiago Freitas Leal')
INSERT [dbo].[ResourceTranslations] ([ResourceId], [UICulture], [Translation]) VALUES (10, N'en', N'Document subject')
INSERT [dbo].[ResourceTranslations] ([ResourceId], [UICulture], [Translation]) VALUES (10, N'es', N'Assunto del documento')
INSERT [dbo].[ResourceTranslations] ([ResourceId], [UICulture], [Translation]) VALUES (10, N'fr', N'Sujet du document')
INSERT [dbo].[ResourceTranslations] ([ResourceId], [UICulture], [Translation]) VALUES (10, N'pt', N'Assunto do documento')
INSERT [dbo].[ResourceTranslations] ([ResourceId], [UICulture], [Translation]) VALUES (11, N'en', N'Page nr. / Page total')
INSERT [dbo].[ResourceTranslations] ([ResourceId], [UICulture], [Translation]) VALUES (11, N'es', N'Nº página / Total de páginas')
INSERT [dbo].[ResourceTranslations] ([ResourceId], [UICulture], [Translation]) VALUES (11, N'fr', N'Nº page / Total de pages')
INSERT [dbo].[ResourceTranslations] ([ResourceId], [UICulture], [Translation]) VALUES (11, N'pt', N'Nº página / Total de páginas')
INSERT [dbo].[ResourceTranslations] ([ResourceId], [UICulture], [Translation]) VALUES (12, N'en', N'Fatal error')
INSERT [dbo].[ResourceTranslations] ([ResourceId], [UICulture], [Translation]) VALUES (12, N'es', N'Error fatal')
INSERT [dbo].[ResourceTranslations] ([ResourceId], [UICulture], [Translation]) VALUES (12, N'fr', N'Erreur fatal')
INSERT [dbo].[ResourceTranslations] ([ResourceId], [UICulture], [Translation]) VALUES (12, N'pt', N'Erro fatal')
INSERT [dbo].[ResourceTranslations] ([ResourceId], [UICulture], [Translation]) VALUES (13, N'en', N'File: ')
INSERT [dbo].[ResourceTranslations] ([ResourceId], [UICulture], [Translation]) VALUES (13, N'es', N'Archivo: ')
INSERT [dbo].[ResourceTranslations] ([ResourceId], [UICulture], [Translation]) VALUES (13, N'fr', N'Fichier: ')
INSERT [dbo].[ResourceTranslations] ([ResourceId], [UICulture], [Translation]) VALUES (13, N'pt', N'Ficheiro: ')
INSERT [dbo].[ResourceTranslations] ([ResourceId], [UICulture], [Translation]) VALUES (14, N'en', N'You are going to apply the file {0}.')
INSERT [dbo].[ResourceTranslations] ([ResourceId], [UICulture], [Translation]) VALUES (14, N'es', N'Va a aplicar el archivo {0}.')
INSERT [dbo].[ResourceTranslations] ([ResourceId], [UICulture], [Translation]) VALUES (14, N'fr', N'Vous allez appliquer le fichier {0}.')
INSERT [dbo].[ResourceTranslations] ([ResourceId], [UICulture], [Translation]) VALUES (14, N'pt', N'Vai aplicar o ficheiro {0}.')
INSERT [dbo].[ResourceTranslations] ([ResourceId], [UICulture], [Translation]) VALUES (15, N'en', N'Type the words that will be searched in all fields, 
up to three words.')
INSERT [dbo].[ResourceTranslations] ([ResourceId], [UICulture], [Translation]) VALUES (15, N'es', N'Escriba las palabras que se buscarán en todos los campos,
hasta un máximo de 3 palabras.')
INSERT [dbo].[ResourceTranslations] ([ResourceId], [UICulture], [Translation]) VALUES (15, N'fr', N'Écrivez les mots qui seront recherchés dans tous les champs, 
jusqu''au maximum de 3 mots.')
INSERT [dbo].[ResourceTranslations] ([ResourceId], [UICulture], [Translation]) VALUES (15, N'pt', N'Escreva as palavras que vão ser pesquisadas em todos os campos, 
até ao máximo de 3 palavras.')
INSERT [dbo].[ResourceTranslations] ([ResourceId], [UICulture], [Translation]) VALUES (16, N'en', N'{0} since {1}')
INSERT [dbo].[ResourceTranslations] ([ResourceId], [UICulture], [Translation]) VALUES (16, N'es', N'{0} desde el {1}')
INSERT [dbo].[ResourceTranslations] ([ResourceId], [UICulture], [Translation]) VALUES (16, N'fr', N'{0} depuis {1}')
INSERT [dbo].[ResourceTranslations] ([ResourceId], [UICulture], [Translation]) VALUES (16, N'pt', N'{0} desde {1}')
INSERT [dbo].[ResourceTranslations] ([ResourceId], [UICulture], [Translation]) VALUES (17, N'en', N'{0} between {1} and {2}')
INSERT [dbo].[ResourceTranslations] ([ResourceId], [UICulture], [Translation]) VALUES (17, N'es', N'{0} entre {1} y {2}')
INSERT [dbo].[ResourceTranslations] ([ResourceId], [UICulture], [Translation]) VALUES (17, N'fr', N'{0} entre {1} et {2}')
INSERT [dbo].[ResourceTranslations] ([ResourceId], [UICulture], [Translation]) VALUES (17, N'pt', N'{0} entre {1} e {2}')
INSERT [dbo].[ResourceTranslations] ([ResourceId], [UICulture], [Translation]) VALUES (18, N'en', N'Location where the document is archived.')
INSERT [dbo].[ResourceTranslations] ([ResourceId], [UICulture], [Translation]) VALUES (18, N'es', N'Lugar donde se archivó el documento.')
INSERT [dbo].[ResourceTranslations] ([ResourceId], [UICulture], [Translation]) VALUES (18, N'fr', N'Emplacement où le document est archivé.')
INSERT [dbo].[ResourceTranslations] ([ResourceId], [UICulture], [Translation]) VALUES (18, N'pt', N'Local onde o documento está arquivado.')
INSERT [dbo].[ResourceTranslations] ([ResourceId], [UICulture], [Translation]) VALUES (19, N'en', N'Location')
INSERT [dbo].[ResourceTranslations] ([ResourceId], [UICulture], [Translation]) VALUES (19, N'es', N'Ubicación')
INSERT [dbo].[ResourceTranslations] ([ResourceId], [UICulture], [Translation]) VALUES (19, N'fr', N'Localization')
INSERT [dbo].[ResourceTranslations] ([ResourceId], [UICulture], [Translation]) VALUES (19, N'pt', N'Localização')
INSERT [dbo].[ResourceTranslations] ([ResourceId], [UICulture], [Translation]) VALUES (20, N'en', N'Search until this date (inclusive). 
If empty, finds the newest documents.')
INSERT [dbo].[ResourceTranslations] ([ResourceId], [UICulture], [Translation]) VALUES (20, N'es', N'Buscar hasta esta fecha (inclusive).
Si está vacío, encuentra los documentos más recientes.')
INSERT [dbo].[ResourceTranslations] ([ResourceId], [UICulture], [Translation]) VALUES (20, N'fr', N'Rechercher jusqu''à cette date (incluse).
Si vide, trouve les documents les plus récents.')
INSERT [dbo].[ResourceTranslations] ([ResourceId], [UICulture], [Translation]) VALUES (20, N'pt', N'Pesquisar até esta data (inclusive).
Se vazio, encontra os documentos mais recentes.')
INSERT [dbo].[ResourceTranslations] ([ResourceId], [UICulture], [Translation]) VALUES (21, N'en', N'You are going to copy the database files.')
INSERT [dbo].[ResourceTranslations] ([ResourceId], [UICulture], [Translation]) VALUES (21, N'es', N'Va a copiar los archivos de la base de datos.')
INSERT [dbo].[ResourceTranslations] ([ResourceId], [UICulture], [Translation]) VALUES (21, N'fr', N'Vous allez copier les fichiers de base de données.')
INSERT [dbo].[ResourceTranslations] ([ResourceId], [UICulture], [Translation]) VALUES (21, N'pt', N'Vai copiar os ficheiros da base de dados.')
INSERT [dbo].[ResourceTranslations] ([ResourceId], [UICulture], [Translation]) VALUES (22, N'en', N'The database have been tampered with (the version can''t be {0}). Consult your system administrator.')
INSERT [dbo].[ResourceTranslations] ([ResourceId], [UICulture], [Translation]) VALUES (22, N'es', N'La base de datos ha sido adulterada (la versión no puede ser {0}). Consulte a su administrador de sistemas.')
INSERT [dbo].[ResourceTranslations] ([ResourceId], [UICulture], [Translation]) VALUES (22, N'fr', N'La base de données est  endommagée  (la version ne peut pas être {0}). Consultez votre administrateur système.')
INSERT [dbo].[ResourceTranslations] ([ResourceId], [UICulture], [Translation]) VALUES (22, N'pt', N'A base de dados foi adulterada (a versão não pode ser {0}). Consulte o seu administrador de rede.')
INSERT [dbo].[ResourceTranslations] ([ResourceId], [UICulture], [Translation]) VALUES (23, N'en', N'New register')
INSERT [dbo].[ResourceTranslations] ([ResourceId], [UICulture], [Translation]) VALUES (23, N'es', N'Nuevo registro')
INSERT [dbo].[ResourceTranslations] ([ResourceId], [UICulture], [Translation]) VALUES (23, N'fr', N'Nouveau enregistrement')
INSERT [dbo].[ResourceTranslations] ([ResourceId], [UICulture], [Translation]) VALUES (23, N'pt', N'Novo registo')
INSERT [dbo].[ResourceTranslations] ([ResourceId], [UICulture], [Translation]) VALUES (24, N'en', N'Fatal error (ThreadException)')
INSERT [dbo].[ResourceTranslations] ([ResourceId], [UICulture], [Translation]) VALUES (24, N'es', N'Error fatal (ThreadException)')
INSERT [dbo].[ResourceTranslations] ([ResourceId], [UICulture], [Translation]) VALUES (24, N'fr', N'Erreur fatale (ThreadException)')
INSERT [dbo].[ResourceTranslations] ([ResourceId], [UICulture], [Translation]) VALUES (24, N'pt', N'Erro fatal (ThreadException)')
INSERT [dbo].[ResourceTranslations] ([ResourceId], [UICulture], [Translation]) VALUES (25, N'en', N'Since')
INSERT [dbo].[ResourceTranslations] ([ResourceId], [UICulture], [Translation]) VALUES (25, N'es', N'Desde')
INSERT [dbo].[ResourceTranslations] ([ResourceId], [UICulture], [Translation]) VALUES (25, N'fr', N'Depuis')
INSERT [dbo].[ResourceTranslations] ([ResourceId], [UICulture], [Translation]) VALUES (25, N'pt', N'Desde')
GO
INSERT [dbo].[ResourceTranslations] ([ResourceId], [UICulture], [Translation]) VALUES (26, N'en', N'Export data')
INSERT [dbo].[ResourceTranslations] ([ResourceId], [UICulture], [Translation]) VALUES (26, N'es', N'Exportar los datos')
INSERT [dbo].[ResourceTranslations] ([ResourceId], [UICulture], [Translation]) VALUES (26, N'fr', N'Exportation de données')
INSERT [dbo].[ResourceTranslations] ([ResourceId], [UICulture], [Translation]) VALUES (26, N'pt', N'Exportar dados')
INSERT [dbo].[ResourceTranslations] ([ResourceId], [UICulture], [Translation]) VALUES (27, N'en', N'Outgoing mail register')
INSERT [dbo].[ResourceTranslations] ([ResourceId], [UICulture], [Translation]) VALUES (27, N'es', N'Registro de correspondencia salida')
INSERT [dbo].[ResourceTranslations] ([ResourceId], [UICulture], [Translation]) VALUES (27, N'fr', N'Enregistrement de correspondance départ')
INSERT [dbo].[ResourceTranslations] ([ResourceId], [UICulture], [Translation]) VALUES (27, N'pt', N'Registo de correspondência saída')
INSERT [dbo].[ResourceTranslations] ([ResourceId], [UICulture], [Translation]) VALUES (28, N'en', N'New register')
INSERT [dbo].[ResourceTranslations] ([ResourceId], [UICulture], [Translation]) VALUES (28, N'es', N'Nuevo registro')
INSERT [dbo].[ResourceTranslations] ([ResourceId], [UICulture], [Translation]) VALUES (28, N'fr', N'Nouveau enregistrement')
INSERT [dbo].[ResourceTranslations] ([ResourceId], [UICulture], [Translation]) VALUES (28, N'pt', N'Novo registo')
INSERT [dbo].[ResourceTranslations] ([ResourceId], [UICulture], [Translation]) VALUES (29, N'en', N'Import data')
INSERT [dbo].[ResourceTranslations] ([ResourceId], [UICulture], [Translation]) VALUES (29, N'es', N'Importar los datos')
INSERT [dbo].[ResourceTranslations] ([ResourceId], [UICulture], [Translation]) VALUES (29, N'fr', N'Importation de données')
INSERT [dbo].[ResourceTranslations] ([ResourceId], [UICulture], [Translation]) VALUES (29, N'pt', N'Importar dados')
INSERT [dbo].[ResourceTranslations] ([ResourceId], [UICulture], [Translation]) VALUES (30, N'en', N'Incoming mail register')
INSERT [dbo].[ResourceTranslations] ([ResourceId], [UICulture], [Translation]) VALUES (30, N'es', N'Registro de correspondencia entrada')
INSERT [dbo].[ResourceTranslations] ([ResourceId], [UICulture], [Translation]) VALUES (30, N'fr', N'Enregistrement de correspondance arrivée')
INSERT [dbo].[ResourceTranslations] ([ResourceId], [UICulture], [Translation]) VALUES (30, N'pt', N'Registo de correspondência entrada')
INSERT [dbo].[ResourceTranslations] ([ResourceId], [UICulture], [Translation]) VALUES (31, N'en', N'Select the date type you want to search for.')
INSERT [dbo].[ResourceTranslations] ([ResourceId], [UICulture], [Translation]) VALUES (31, N'es', N'Seleccione el tipo de fecha que desea buscar.')
INSERT [dbo].[ResourceTranslations] ([ResourceId], [UICulture], [Translation]) VALUES (31, N'fr', N'Sélectionnez le type de date que vous souhaitez rechercher.')
INSERT [dbo].[ResourceTranslations] ([ResourceId], [UICulture], [Translation]) VALUES (31, N'pt', N'Seleccione o tipo de data que quer pesquisar.')
INSERT [dbo].[ResourceTranslations] ([ResourceId], [UICulture], [Translation]) VALUES (32, N'en', N'Delivery mail register')
INSERT [dbo].[ResourceTranslations] ([ResourceId], [UICulture], [Translation]) VALUES (32, N'es', N'Registro de protocolo de correspondencia')
INSERT [dbo].[ResourceTranslations] ([ResourceId], [UICulture], [Translation]) VALUES (32, N'fr', N'Enregistrement de protocole de correspondance')
INSERT [dbo].[ResourceTranslations] ([ResourceId], [UICulture], [Translation]) VALUES (32, N'pt', N'Registo de protocolo de correspondência')
INSERT [dbo].[ResourceTranslations] ([ResourceId], [UICulture], [Translation]) VALUES (33, N'en', N'Incoming')
INSERT [dbo].[ResourceTranslations] ([ResourceId], [UICulture], [Translation]) VALUES (33, N'es', N'Entrada')
INSERT [dbo].[ResourceTranslations] ([ResourceId], [UICulture], [Translation]) VALUES (33, N'fr', N'Arrivée')
INSERT [dbo].[ResourceTranslations] ([ResourceId], [UICulture], [Translation]) VALUES (33, N'pt', N'Entrada')
INSERT [dbo].[ResourceTranslations] ([ResourceId], [UICulture], [Translation]) VALUES (34, N'en', N'email@support.sup')
INSERT [dbo].[ResourceTranslations] ([ResourceId], [UICulture], [Translation]) VALUES (34, N'es', N'email@support.sup')
INSERT [dbo].[ResourceTranslations] ([ResourceId], [UICulture], [Translation]) VALUES (34, N'fr', N'email@support.sup')
INSERT [dbo].[ResourceTranslations] ([ResourceId], [UICulture], [Translation]) VALUES (34, N'pt', N'email@support.sup')
INSERT [dbo].[ResourceTranslations] ([ResourceId], [UICulture], [Translation]) VALUES (35, N'en', N'The database have been tampered with (the version can''t be empty). Consult your system administrator.')
INSERT [dbo].[ResourceTranslations] ([ResourceId], [UICulture], [Translation]) VALUES (35, N'es', N'La base de datos ha sido adulterado (la versión no puede estar en blanco). Consulte a su administrador de sistemas.')
INSERT [dbo].[ResourceTranslations] ([ResourceId], [UICulture], [Translation]) VALUES (35, N'fr', N'La base de données est  endommagée  (la version ne peut pas être vide). Consultez votre administrateur système.')
INSERT [dbo].[ResourceTranslations] ([ResourceId], [UICulture], [Translation]) VALUES (35, N'pt', N'A base de dados foi adulterada (a versão não pode estar em branco). Consulte o seu administrador de rede.')
INSERT [dbo].[ResourceTranslations] ([ResourceId], [UICulture], [Translation]) VALUES (36, N'en', N'Make a data backup')
INSERT [dbo].[ResourceTranslations] ([ResourceId], [UICulture], [Translation]) VALUES (36, N'es', N'Hacer copia de seguridad de los datos')
INSERT [dbo].[ResourceTranslations] ([ResourceId], [UICulture], [Translation]) VALUES (36, N'fr', N'Sauvegarder les données')
INSERT [dbo].[ResourceTranslations] ([ResourceId], [UICulture], [Translation]) VALUES (36, N'pt', N'Fazer cópia de segurança dos dados')
INSERT [dbo].[ResourceTranslations] ([ResourceId], [UICulture], [Translation]) VALUES (37, N'en', N'Export the list to Excel')
INSERT [dbo].[ResourceTranslations] ([ResourceId], [UICulture], [Translation]) VALUES (37, N'es', N'Exportar la lista para Excel')
INSERT [dbo].[ResourceTranslations] ([ResourceId], [UICulture], [Translation]) VALUES (37, N'fr', N'Exporter la liste pour un classeur Excel')
INSERT [dbo].[ResourceTranslations] ([ResourceId], [UICulture], [Translation]) VALUES (37, N'pt', N'Exportar a lista para Excel')
INSERT [dbo].[ResourceTranslations] ([ResourceId], [UICulture], [Translation]) VALUES (38, N'en', N'Created on {0}. Changed on {1}')
INSERT [dbo].[ResourceTranslations] ([ResourceId], [UICulture], [Translation]) VALUES (38, N'es', N'Creado en {0}. Modificado en {1}')
INSERT [dbo].[ResourceTranslations] ([ResourceId], [UICulture], [Translation]) VALUES (38, N'fr', N'Créé le {0}. Modifié le {1}')
INSERT [dbo].[ResourceTranslations] ([ResourceId], [UICulture], [Translation]) VALUES (38, N'pt', N'Criado em {0}. Alterado em {1}')
INSERT [dbo].[ResourceTranslations] ([ResourceId], [UICulture], [Translation]) VALUES (39, N'en', N'Fatal error (AppDomain Unhandled)')
INSERT [dbo].[ResourceTranslations] ([ResourceId], [UICulture], [Translation]) VALUES (39, N'es', N'Error fatal (AppDomain Unhandled)')
INSERT [dbo].[ResourceTranslations] ([ResourceId], [UICulture], [Translation]) VALUES (39, N'fr', N'Erreur fatale (AppDomain Unhandled)')
INSERT [dbo].[ResourceTranslations] ([ResourceId], [UICulture], [Translation]) VALUES (39, N'pt', N'Erro fatal (AppDomain Unhandled)')
INSERT [dbo].[ResourceTranslations] ([ResourceId], [UICulture], [Translation]) VALUES (40, N'en', N'dd/MM/yyyy a\t  HH:mm:ss')
INSERT [dbo].[ResourceTranslations] ([ResourceId], [UICulture], [Translation]) VALUES (40, N'es', N'dd/MM/yyyy a la\s HH:mm:ss')
INSERT [dbo].[ResourceTranslations] ([ResourceId], [UICulture], [Translation]) VALUES (40, N'fr', N'dd/MM/yyyy à HH:mm:ss')
INSERT [dbo].[ResourceTranslations] ([ResourceId], [UICulture], [Translation]) VALUES (40, N'pt', N'dd/MM/yyyy à\s  HH:mm:ss')
INSERT [dbo].[ResourceTranslations] ([ResourceId], [UICulture], [Translation]) VALUES (41, N'en', N'<not filled>')
INSERT [dbo].[ResourceTranslations] ([ResourceId], [UICulture], [Translation]) VALUES (41, N'es', N'<no lhenado>')
INSERT [dbo].[ResourceTranslations] ([ResourceId], [UICulture], [Translation]) VALUES (41, N'fr', N'<pas remplit>')
INSERT [dbo].[ResourceTranslations] ([ResourceId], [UICulture], [Translation]) VALUES (41, N'pt', N'<não preenchido>')
INSERT [dbo].[ResourceTranslations] ([ResourceId], [UICulture], [Translation]) VALUES (42, N'en', N'No registers to show')
INSERT [dbo].[ResourceTranslations] ([ResourceId], [UICulture], [Translation]) VALUES (42, N'es', N'Sin registros para mostrar')
INSERT [dbo].[ResourceTranslations] ([ResourceId], [UICulture], [Translation]) VALUES (42, N'fr', N'Sans enregistrements pour afficher')
INSERT [dbo].[ResourceTranslations] ([ResourceId], [UICulture], [Translation]) VALUES (42, N'pt', N'Sem registos para mostrar')
INSERT [dbo].[ResourceTranslations] ([ResourceId], [UICulture], [Translation]) VALUES (43, N'en', N'{0} ({1})')
INSERT [dbo].[ResourceTranslations] ([ResourceId], [UICulture], [Translation]) VALUES (43, N'es', N'{0} ({1})')
INSERT [dbo].[ResourceTranslations] ([ResourceId], [UICulture], [Translation]) VALUES (43, N'fr', N'{0} ({1})')
INSERT [dbo].[ResourceTranslations] ([ResourceId], [UICulture], [Translation]) VALUES (43, N'pt', N'{0} ({1})')
INSERT [dbo].[ResourceTranslations] ([ResourceId], [UICulture], [Translation]) VALUES (44, N'en', N'HH:mm:ss')
INSERT [dbo].[ResourceTranslations] ([ResourceId], [UICulture], [Translation]) VALUES (44, N'es', N'HH:mm:ss')
INSERT [dbo].[ResourceTranslations] ([ResourceId], [UICulture], [Translation]) VALUES (44, N'fr', N'HH:mm:ss')
INSERT [dbo].[ResourceTranslations] ([ResourceId], [UICulture], [Translation]) VALUES (44, N'pt', N'HH:mm:ss')
INSERT [dbo].[ResourceTranslations] ([ResourceId], [UICulture], [Translation]) VALUES (45, N'en', N'Version: ')
INSERT [dbo].[ResourceTranslations] ([ResourceId], [UICulture], [Translation]) VALUES (45, N'es', N'Versión: ')
INSERT [dbo].[ResourceTranslations] ([ResourceId], [UICulture], [Translation]) VALUES (45, N'fr', N'Version: ')
INSERT [dbo].[ResourceTranslations] ([ResourceId], [UICulture], [Translation]) VALUES (45, N'pt', N'Versão: ')
INSERT [dbo].[ResourceTranslations] ([ResourceId], [UICulture], [Translation]) VALUES (46, N'en', N'Language')
INSERT [dbo].[ResourceTranslations] ([ResourceId], [UICulture], [Translation]) VALUES (46, N'es', N'Lengua')
INSERT [dbo].[ResourceTranslations] ([ResourceId], [UICulture], [Translation]) VALUES (46, N'fr', N'Langue')
INSERT [dbo].[ResourceTranslations] ([ResourceId], [UICulture], [Translation]) VALUES (46, N'pt', N'Língua')
INSERT [dbo].[ResourceTranslations] ([ResourceId], [UICulture], [Translation]) VALUES (47, N'en', N'The database or files have been tampered with (there is no update script for version {0}). Consult your system administrator.')
INSERT [dbo].[ResourceTranslations] ([ResourceId], [UICulture], [Translation]) VALUES (47, N'es', N'La base de datos o los archivos se han sido adulterados (no hay script de actualización para la versión {0}). Consulte a su administrador de sistemas.')
INSERT [dbo].[ResourceTranslations] ([ResourceId], [UICulture], [Translation]) VALUES (47, N'fr', N'La base de données ou les fichiers sont endommagés (il n''y a pas de script de mise à jour pour la version {0}). Consultez votre administrateur système.')
INSERT [dbo].[ResourceTranslations] ([ResourceId], [UICulture], [Translation]) VALUES (47, N'pt', N'A base de dados ou os ficheiros foram adulterados (não há script de actualização para a versão {0}). Consulte o seu administrador de sistemas.')
INSERT [dbo].[ResourceTranslations] ([ResourceId], [UICulture], [Translation]) VALUES (48, N'en', N'Click to create a delivery mail register')
INSERT [dbo].[ResourceTranslations] ([ResourceId], [UICulture], [Translation]) VALUES (48, N'es', N'Clique para crear un registro de protocolo de correspondencia')
INSERT [dbo].[ResourceTranslations] ([ResourceId], [UICulture], [Translation]) VALUES (48, N'fr', N'Cliquez pour créer un enregistrement de protocole de correspondance')
INSERT [dbo].[ResourceTranslations] ([ResourceId], [UICulture], [Translation]) VALUES (48, N'pt', N'Clique para criar um registo de protocolo de correspondência')
INSERT [dbo].[ResourceTranslations] ([ResourceId], [UICulture], [Translation]) VALUES (49, N'en', N'Historic:')
INSERT [dbo].[ResourceTranslations] ([ResourceId], [UICulture], [Translation]) VALUES (49, N'es', N'Histórico:')
INSERT [dbo].[ResourceTranslations] ([ResourceId], [UICulture], [Translation]) VALUES (49, N'fr', N'Historique:')
INSERT [dbo].[ResourceTranslations] ([ResourceId], [UICulture], [Translation]) VALUES (49, N'pt', N'Histórico:')
INSERT [dbo].[ResourceTranslations] ([ResourceId], [UICulture], [Translation]) VALUES (50, N'en', N'About InterwayDocs')
INSERT [dbo].[ResourceTranslations] ([ResourceId], [UICulture], [Translation]) VALUES (50, N'es', N'Información de InterwayDocs')
INSERT [dbo].[ResourceTranslations] ([ResourceId], [UICulture], [Translation]) VALUES (50, N'fr', N'À propos de InterwayDocs')
INSERT [dbo].[ResourceTranslations] ([ResourceId], [UICulture], [Translation]) VALUES (50, N'pt', N'Sobre o InterwayDocs')
GO
INSERT [dbo].[ResourceTranslations] ([ResourceId], [UICulture], [Translation]) VALUES (51, N'en', N'Search since this date (inclusive). 
If empty, finds the oldest documents.')
INSERT [dbo].[ResourceTranslations] ([ResourceId], [UICulture], [Translation]) VALUES (51, N'es', N'Búsqueda desde esta fecha (inclusive).
Si está vacío, encuentra los documentos más antiguos.')
INSERT [dbo].[ResourceTranslations] ([ResourceId], [UICulture], [Translation]) VALUES (51, N'fr', N'Recherche depuis cette date (incluse).
Si vide, trouve les documents les plus anciens.')
INSERT [dbo].[ResourceTranslations] ([ResourceId], [UICulture], [Translation]) VALUES (51, N'pt', N'Pesquisar a partir desta data (inclusive).
Se vazio, encontra os documentos mais antigos.')
INSERT [dbo].[ResourceTranslations] ([ResourceId], [UICulture], [Translation]) VALUES (52, N'en', N'Origin of the document')
INSERT [dbo].[ResourceTranslations] ([ResourceId], [UICulture], [Translation]) VALUES (52, N'es', N'Origen del documento')
INSERT [dbo].[ResourceTranslations] ([ResourceId], [UICulture], [Translation]) VALUES (52, N'fr', N'Origine du document')
INSERT [dbo].[ResourceTranslations] ([ResourceId], [UICulture], [Translation]) VALUES (52, N'pt', N'Origem do documento')
INSERT [dbo].[ResourceTranslations] ([ResourceId], [UICulture], [Translation]) VALUES (53, N'en', N'Report:')
INSERT [dbo].[ResourceTranslations] ([ResourceId], [UICulture], [Translation]) VALUES (53, N'es', N'Reporto:')
INSERT [dbo].[ResourceTranslations] ([ResourceId], [UICulture], [Translation]) VALUES (53, N'fr', N'Rapport:')
INSERT [dbo].[ResourceTranslations] ([ResourceId], [UICulture], [Translation]) VALUES (53, N'pt', N'Relatório:')
INSERT [dbo].[ResourceTranslations] ([ResourceId], [UICulture], [Translation]) VALUES (54, N'en', N'Incoming register')
INSERT [dbo].[ResourceTranslations] ([ResourceId], [UICulture], [Translation]) VALUES (54, N'es', N'Registro de entrada')
INSERT [dbo].[ResourceTranslations] ([ResourceId], [UICulture], [Translation]) VALUES (54, N'fr', N'Enregistrement arrivée')
INSERT [dbo].[ResourceTranslations] ([ResourceId], [UICulture], [Translation]) VALUES (54, N'pt', N'Registo de entrada')
INSERT [dbo].[ResourceTranslations] ([ResourceId], [UICulture], [Translation]) VALUES (55, N'en', N'The number that is written on the document.')
INSERT [dbo].[ResourceTranslations] ([ResourceId], [UICulture], [Translation]) VALUES (55, N'es', N'El número que está escrito en el documento.')
INSERT [dbo].[ResourceTranslations] ([ResourceId], [UICulture], [Translation]) VALUES (55, N'fr', N'Le numéro du document qui est écrit sur le document.')
INSERT [dbo].[ResourceTranslations] ([ResourceId], [UICulture], [Translation]) VALUES (55, N'pt', N'O número que está escrito no documento.')
INSERT [dbo].[ResourceTranslations] ([ResourceId], [UICulture], [Translation]) VALUES (56, N'en', N'Show the search panel')
INSERT [dbo].[ResourceTranslations] ([ResourceId], [UICulture], [Translation]) VALUES (56, N'es', N'Mostrar panel de búsqueda')
INSERT [dbo].[ResourceTranslations] ([ResourceId], [UICulture], [Translation]) VALUES (56, N'fr', N'Afficher le panneau de recherche')
INSERT [dbo].[ResourceTranslations] ([ResourceId], [UICulture], [Translation]) VALUES (56, N'pt', N'Mostrar painel da pesquisa')
INSERT [dbo].[ResourceTranslations] ([ResourceId], [UICulture], [Translation]) VALUES (57, N'en', N'Excel Workbook(*.xlsx)|*.xlsx')
INSERT [dbo].[ResourceTranslations] ([ResourceId], [UICulture], [Translation]) VALUES (57, N'es', N'Libro de trabajo de Excel (*.xlsx)|*.xlsx')
INSERT [dbo].[ResourceTranslations] ([ResourceId], [UICulture], [Translation]) VALUES (57, N'fr', N'Classeur Excel (*.xlsx)|*.xlsx')
INSERT [dbo].[ResourceTranslations] ([ResourceId], [UICulture], [Translation]) VALUES (57, N'pt', N'Livro Excel (*.xlsx)|*.xlsx')
INSERT [dbo].[ResourceTranslations] ([ResourceId], [UICulture], [Translation]) VALUES (58, N'en', N'Search')
INSERT [dbo].[ResourceTranslations] ([ResourceId], [UICulture], [Translation]) VALUES (58, N'es', N'Buscar')
INSERT [dbo].[ResourceTranslations] ([ResourceId], [UICulture], [Translation]) VALUES (58, N'fr', N'Rechercher')
INSERT [dbo].[ResourceTranslations] ([ResourceId], [UICulture], [Translation]) VALUES (58, N'pt', N'Pesquisar')
INSERT [dbo].[ResourceTranslations] ([ResourceId], [UICulture], [Translation]) VALUES (59, N'en', N'Operation error')
INSERT [dbo].[ResourceTranslations] ([ResourceId], [UICulture], [Translation]) VALUES (59, N'es', N'Error de operación')
INSERT [dbo].[ResourceTranslations] ([ResourceId], [UICulture], [Translation]) VALUES (59, N'fr', N'Erreur d''operation')
INSERT [dbo].[ResourceTranslations] ([ResourceId], [UICulture], [Translation]) VALUES (59, N'pt', N'Erro de operação')
INSERT [dbo].[ResourceTranslations] ([ResourceId], [UICulture], [Translation]) VALUES (60, N'en', N'Hide search panel')
INSERT [dbo].[ResourceTranslations] ([ResourceId], [UICulture], [Translation]) VALUES (60, N'es', N'Ocultar panel de búsqueda')
INSERT [dbo].[ResourceTranslations] ([ResourceId], [UICulture], [Translation]) VALUES (60, N'fr', N'Cacher le panneau de recherche')
INSERT [dbo].[ResourceTranslations] ([ResourceId], [UICulture], [Translation]) VALUES (60, N'pt', N'Esconder painel da pesquisa')
INSERT [dbo].[ResourceTranslations] ([ResourceId], [UICulture], [Translation]) VALUES (61, N'en', N'Until')
INSERT [dbo].[ResourceTranslations] ([ResourceId], [UICulture], [Translation]) VALUES (61, N'es', N'Hasta')
INSERT [dbo].[ResourceTranslations] ([ResourceId], [UICulture], [Translation]) VALUES (61, N'fr', N'Jusq''au')
INSERT [dbo].[ResourceTranslations] ([ResourceId], [UICulture], [Translation]) VALUES (61, N'pt', N'Até')
INSERT [dbo].[ResourceTranslations] ([ResourceId], [UICulture], [Translation]) VALUES (62, N'en', N'{0} until {1}')
INSERT [dbo].[ResourceTranslations] ([ResourceId], [UICulture], [Translation]) VALUES (62, N'es', N'{0} hasta el {1}')
INSERT [dbo].[ResourceTranslations] ([ResourceId], [UICulture], [Translation]) VALUES (62, N'fr', N'{0} jusq''au {1}')
INSERT [dbo].[ResourceTranslations] ([ResourceId], [UICulture], [Translation]) VALUES (62, N'pt', N'{0} até {1}')
INSERT [dbo].[ResourceTranslations] ([ResourceId], [UICulture], [Translation]) VALUES (63, N'en', N'{0} with {1} {2} ({3})')
INSERT [dbo].[ResourceTranslations] ([ResourceId], [UICulture], [Translation]) VALUES (63, N'es', N'{0} con {1} {2} ({3})')
INSERT [dbo].[ResourceTranslations] ([ResourceId], [UICulture], [Translation]) VALUES (63, N'fr', N'{0} avec {1} {2} ({3})')
INSERT [dbo].[ResourceTranslations] ([ResourceId], [UICulture], [Translation]) VALUES (63, N'pt', N'{0} com {1} {2} ({3})')
INSERT [dbo].[ResourceTranslations] ([ResourceId], [UICulture], [Translation]) VALUES (64, N'en', N'Recreate the objects in the database.')
INSERT [dbo].[ResourceTranslations] ([ResourceId], [UICulture], [Translation]) VALUES (64, N'es', N'Vuelve a crear los objetos de la base de datos.')
INSERT [dbo].[ResourceTranslations] ([ResourceId], [UICulture], [Translation]) VALUES (64, N'fr', N'Recréer les objets de la base de données.')
INSERT [dbo].[ResourceTranslations] ([ResourceId], [UICulture], [Translation]) VALUES (64, N'pt', N'Vai recriar os objectos da base de dados.')
INSERT [dbo].[ResourceTranslations] ([ResourceId], [UICulture], [Translation]) VALUES (65, N'en', N'Register nr. {0}')
INSERT [dbo].[ResourceTranslations] ([ResourceId], [UICulture], [Translation]) VALUES (65, N'es', N'Nº de registro {0}')
INSERT [dbo].[ResourceTranslations] ([ResourceId], [UICulture], [Translation]) VALUES (65, N'fr', N'Nº de enregistrement {0}')
INSERT [dbo].[ResourceTranslations] ([ResourceId], [UICulture], [Translation]) VALUES (65, N'pt', N'Nº de registo {0}')
INSERT [dbo].[ResourceTranslations] ([ResourceId], [UICulture], [Translation]) VALUES (66, N'en', N'Delivery')
INSERT [dbo].[ResourceTranslations] ([ResourceId], [UICulture], [Translation]) VALUES (66, N'es', N'Protocolo')
INSERT [dbo].[ResourceTranslations] ([ResourceId], [UICulture], [Translation]) VALUES (66, N'fr', N'Protocole')
INSERT [dbo].[ResourceTranslations] ([ResourceId], [UICulture], [Translation]) VALUES (66, N'pt', N'Protocolo')
INSERT [dbo].[ResourceTranslations] ([ResourceId], [UICulture], [Translation]) VALUES (67, N'en', N'Document Producing Entity')
INSERT [dbo].[ResourceTranslations] ([ResourceId], [UICulture], [Translation]) VALUES (67, N'es', N'Entidad productora del documento')
INSERT [dbo].[ResourceTranslations] ([ResourceId], [UICulture], [Translation]) VALUES (67, N'fr', N'Entité qui a produit le document')
INSERT [dbo].[ResourceTranslations] ([ResourceId], [UICulture], [Translation]) VALUES (67, N'pt', N'Entidade produtora do documento')
INSERT [dbo].[ResourceTranslations] ([ResourceId], [UICulture], [Translation]) VALUES (68, N'en', N'Created on {0}. Changed at {1}')
INSERT [dbo].[ResourceTranslations] ([ResourceId], [UICulture], [Translation]) VALUES (68, N'es', N'Creado en {0}. Modificado a las {1}')
INSERT [dbo].[ResourceTranslations] ([ResourceId], [UICulture], [Translation]) VALUES (68, N'fr', N'Créé le {0}. Modifié à {1}')
INSERT [dbo].[ResourceTranslations] ([ResourceId], [UICulture], [Translation]) VALUES (68, N'pt', N'Criado em {0}. Alterado às {1}')
INSERT [dbo].[ResourceTranslations] ([ResourceId], [UICulture], [Translation]) VALUES (69, N'en', N'Free text')
INSERT [dbo].[ResourceTranslations] ([ResourceId], [UICulture], [Translation]) VALUES (69, N'es', N'Texto libre')
INSERT [dbo].[ResourceTranslations] ([ResourceId], [UICulture], [Translation]) VALUES (69, N'fr', N'Text libre')
INSERT [dbo].[ResourceTranslations] ([ResourceId], [UICulture], [Translation]) VALUES (69, N'pt', N'Texto livre')
INSERT [dbo].[ResourceTranslations] ([ResourceId], [UICulture], [Translation]) VALUES (70, N'en', N'Web address: ')
INSERT [dbo].[ResourceTranslations] ([ResourceId], [UICulture], [Translation]) VALUES (70, N'es', N'Dirección Web: ')
INSERT [dbo].[ResourceTranslations] ([ResourceId], [UICulture], [Translation]) VALUES (70, N'fr', N'Adresse Web: ')
INSERT [dbo].[ResourceTranslations] ([ResourceId], [UICulture], [Translation]) VALUES (70, N'pt', N'Endereço Web: ')
INSERT [dbo].[ResourceTranslations] ([ResourceId], [UICulture], [Translation]) VALUES (71, N'en', N'Help')
INSERT [dbo].[ResourceTranslations] ([ResourceId], [UICulture], [Translation]) VALUES (71, N'es', N'Ayuda')
INSERT [dbo].[ResourceTranslations] ([ResourceId], [UICulture], [Translation]) VALUES (71, N'fr', N'Aide')
INSERT [dbo].[ResourceTranslations] ([ResourceId], [UICulture], [Translation]) VALUES (71, N'pt', N'Ajuda')
INSERT [dbo].[ResourceTranslations] ([ResourceId], [UICulture], [Translation]) VALUES (72, N'en', N'Show Manual (PDF)')
INSERT [dbo].[ResourceTranslations] ([ResourceId], [UICulture], [Translation]) VALUES (72, N'es', N'Ver el manual (PDF)')
INSERT [dbo].[ResourceTranslations] ([ResourceId], [UICulture], [Translation]) VALUES (72, N'fr', N'Afficher le manuel (PDF)')
INSERT [dbo].[ResourceTranslations] ([ResourceId], [UICulture], [Translation]) VALUES (72, N'pt', N'Ver o Manual (PDF)')
INSERT [dbo].[ResourceTranslations] ([ResourceId], [UICulture], [Translation]) VALUES (73, N'en', N'dd/MM/yyyy a\t HH:mm:ss')
INSERT [dbo].[ResourceTranslations] ([ResourceId], [UICulture], [Translation]) VALUES (73, N'es', N'dd/MM/yyyy a la\s HH:mm:ss')
INSERT [dbo].[ResourceTranslations] ([ResourceId], [UICulture], [Translation]) VALUES (73, N'fr', N'dd/MM/yyyy à HH:mm:ss')
INSERT [dbo].[ResourceTranslations] ([ResourceId], [UICulture], [Translation]) VALUES (73, N'pt', N'dd/MM/yyyy à\s HH:mm:ss')
INSERT [dbo].[ResourceTranslations] ([ResourceId], [UICulture], [Translation]) VALUES (74, N'en', N'The database file {0} wasn''t found.')
INSERT [dbo].[ResourceTranslations] ([ResourceId], [UICulture], [Translation]) VALUES (74, N'es', N'El archivo de base de datos {0} no se encontró.')
INSERT [dbo].[ResourceTranslations] ([ResourceId], [UICulture], [Translation]) VALUES (74, N'fr', N'Le fichier de base de données {0} n''a pas été trouvé.')
INSERT [dbo].[ResourceTranslations] ([ResourceId], [UICulture], [Translation]) VALUES (74, N'pt', N'O ficheiro da base de dados {0} não foi encontrado.')
INSERT [dbo].[ResourceTranslations] ([ResourceId], [UICulture], [Translation]) VALUES (75, N'en', N'Document classification code')
INSERT [dbo].[ResourceTranslations] ([ResourceId], [UICulture], [Translation]) VALUES (75, N'es', N'Code de classification du document')
INSERT [dbo].[ResourceTranslations] ([ResourceId], [UICulture], [Translation]) VALUES (75, N'fr', N'Code de classification du document')
INSERT [dbo].[ResourceTranslations] ([ResourceId], [UICulture], [Translation]) VALUES (75, N'pt', N'Código de classificação do documento')
GO
INSERT [dbo].[ResourceTranslations] ([ResourceId], [UICulture], [Translation]) VALUES (76, N'en', N'Restore data backup')
INSERT [dbo].[ResourceTranslations] ([ResourceId], [UICulture], [Translation]) VALUES (76, N'es', N'Restaurar copia de seguridad de los datos')
INSERT [dbo].[ResourceTranslations] ([ResourceId], [UICulture], [Translation]) VALUES (76, N'fr', N'Restaurer sauvegarde des données')
INSERT [dbo].[ResourceTranslations] ([ResourceId], [UICulture], [Translation]) VALUES (76, N'pt', N'Restaurar cópia de segurança dos dados')
INSERT [dbo].[ResourceTranslations] ([ResourceId], [UICulture], [Translation]) VALUES (77, N'en', N'About.en')
INSERT [dbo].[ResourceTranslations] ([ResourceId], [UICulture], [Translation]) VALUES (77, N'es', N'About.es')
INSERT [dbo].[ResourceTranslations] ([ResourceId], [UICulture], [Translation]) VALUES (77, N'fr', N'About.fr')
INSERT [dbo].[ResourceTranslations] ([ResourceId], [UICulture], [Translation]) VALUES (77, N'pt', N'About.pt')
INSERT [dbo].[ResourceTranslations] ([ResourceId], [UICulture], [Translation]) VALUES (78, N'en', N'Select search mode.')
INSERT [dbo].[ResourceTranslations] ([ResourceId], [UICulture], [Translation]) VALUES (78, N'es', N'Seleccione el modo de búsqueda.')
INSERT [dbo].[ResourceTranslations] ([ResourceId], [UICulture], [Translation]) VALUES (78, N'fr', N'Sélectionnez le mode de recherche.')
INSERT [dbo].[ResourceTranslations] ([ResourceId], [UICulture], [Translation]) VALUES (78, N'pt', N'Seleccione o modo de pesquisa.')
INSERT [dbo].[ResourceTranslations] ([ResourceId], [UICulture], [Translation]) VALUES (79, N'en', N'http://www.codisa-its.com')
INSERT [dbo].[ResourceTranslations] ([ResourceId], [UICulture], [Translation]) VALUES (79, N'es', N'http://www.codisa-its.com')
INSERT [dbo].[ResourceTranslations] ([ResourceId], [UICulture], [Translation]) VALUES (79, N'fr', N'http://www.codisa-its.com')
INSERT [dbo].[ResourceTranslations] ([ResourceId], [UICulture], [Translation]) VALUES (79, N'pt', N'http://www.codisa-its.com')
INSERT [dbo].[ResourceTranslations] ([ResourceId], [UICulture], [Translation]) VALUES (80, N'en', N'Previous page')
INSERT [dbo].[ResourceTranslations] ([ResourceId], [UICulture], [Translation]) VALUES (80, N'es', N'Página anterior')
INSERT [dbo].[ResourceTranslations] ([ResourceId], [UICulture], [Translation]) VALUES (80, N'fr', N'Page précédente')
INSERT [dbo].[ResourceTranslations] ([ResourceId], [UICulture], [Translation]) VALUES (80, N'pt', N'Página anterior')
INSERT [dbo].[ResourceTranslations] ([ResourceId], [UICulture], [Translation]) VALUES (81, N'en', N'Incoming')
INSERT [dbo].[ResourceTranslations] ([ResourceId], [UICulture], [Translation]) VALUES (81, N'es', N'Entradas')
INSERT [dbo].[ResourceTranslations] ([ResourceId], [UICulture], [Translation]) VALUES (81, N'fr', N'Arrivées')
INSERT [dbo].[ResourceTranslations] ([ResourceId], [UICulture], [Translation]) VALUES (81, N'pt', N'Entradas')
INSERT [dbo].[ResourceTranslations] ([ResourceId], [UICulture], [Translation]) VALUES (82, N'en', N'dd/MM/yyyy')
INSERT [dbo].[ResourceTranslations] ([ResourceId], [UICulture], [Translation]) VALUES (82, N'es', N'dd/MM/yyyy')
INSERT [dbo].[ResourceTranslations] ([ResourceId], [UICulture], [Translation]) VALUES (82, N'fr', N'dd/MM/yyyy')
INSERT [dbo].[ResourceTranslations] ([ResourceId], [UICulture], [Translation]) VALUES (82, N'pt', N'dd/MM/yyyy')
INSERT [dbo].[ResourceTranslations] ([ResourceId], [UICulture], [Translation]) VALUES (83, N'en', N'Incoming mail book')
INSERT [dbo].[ResourceTranslations] ([ResourceId], [UICulture], [Translation]) VALUES (83, N'es', N'Libro de correspondencia entrada')
INSERT [dbo].[ResourceTranslations] ([ResourceId], [UICulture], [Translation]) VALUES (83, N'fr', N'Livre de correspondance arrivée')
INSERT [dbo].[ResourceTranslations] ([ResourceId], [UICulture], [Translation]) VALUES (83, N'pt', N'Livro de correspondência entrada')
INSERT [dbo].[ResourceTranslations] ([ResourceId], [UICulture], [Translation]) VALUES (84, N'en', N'Person who received the document')
INSERT [dbo].[ResourceTranslations] ([ResourceId], [UICulture], [Translation]) VALUES (84, N'es', N'Persona que recibió el documento')
INSERT [dbo].[ResourceTranslations] ([ResourceId], [UICulture], [Translation]) VALUES (84, N'fr', N'Personne qui a reçu le document')
INSERT [dbo].[ResourceTranslations] ([ResourceId], [UICulture], [Translation]) VALUES (84, N'pt', N'Pessoa que recebeu o documento')
INSERT [dbo].[ResourceTranslations] ([ResourceId], [UICulture], [Translation]) VALUES (85, N'en', N'Document reception date.')
INSERT [dbo].[ResourceTranslations] ([ResourceId], [UICulture], [Translation]) VALUES (85, N'es', N'Fecha de recepción del documento.')
INSERT [dbo].[ResourceTranslations] ([ResourceId], [UICulture], [Translation]) VALUES (85, N'fr', N'Date de réception du document.')
INSERT [dbo].[ResourceTranslations] ([ResourceId], [UICulture], [Translation]) VALUES (85, N'pt', N'Data de recepção do documento.')
INSERT [dbo].[ResourceTranslations] ([ResourceId], [UICulture], [Translation]) VALUES (86, N'en', N'Outgoing mail book')
INSERT [dbo].[ResourceTranslations] ([ResourceId], [UICulture], [Translation]) VALUES (86, N'es', N'Libro de correspondencia salida')
INSERT [dbo].[ResourceTranslations] ([ResourceId], [UICulture], [Translation]) VALUES (86, N'fr', N'Livre de correspondance départ')
INSERT [dbo].[ResourceTranslations] ([ResourceId], [UICulture], [Translation]) VALUES (86, N'pt', N'Livro de correspondência saída')
INSERT [dbo].[ResourceTranslations] ([ResourceId], [UICulture], [Translation]) VALUES (87, N'en', N'First page')
INSERT [dbo].[ResourceTranslations] ([ResourceId], [UICulture], [Translation]) VALUES (87, N'es', N'Primera página')
INSERT [dbo].[ResourceTranslations] ([ResourceId], [UICulture], [Translation]) VALUES (87, N'fr', N'Premiére page')
INSERT [dbo].[ResourceTranslations] ([ResourceId], [UICulture], [Translation]) VALUES (87, N'pt', N'Primeira página')
INSERT [dbo].[ResourceTranslations] ([ResourceId], [UICulture], [Translation]) VALUES (88, N'en', N'yyyy-MM-dd HHmmss')
INSERT [dbo].[ResourceTranslations] ([ResourceId], [UICulture], [Translation]) VALUES (88, N'es', N'yyyy-MM-dd HHmmss')
INSERT [dbo].[ResourceTranslations] ([ResourceId], [UICulture], [Translation]) VALUES (88, N'fr', N'yyyy-MM-dd HHmmss')
INSERT [dbo].[ResourceTranslations] ([ResourceId], [UICulture], [Translation]) VALUES (88, N'pt', N'yyyy-MM-dd HHmmss')
INSERT [dbo].[ResourceTranslations] ([ResourceId], [UICulture], [Translation]) VALUES (89, N'en', N'Cancel changes')
INSERT [dbo].[ResourceTranslations] ([ResourceId], [UICulture], [Translation]) VALUES (89, N'es', N'Cancelar las modificaciones')
INSERT [dbo].[ResourceTranslations] ([ResourceId], [UICulture], [Translation]) VALUES (89, N'fr', N'Annuler les modifications')
INSERT [dbo].[ResourceTranslations] ([ResourceId], [UICulture], [Translation]) VALUES (89, N'pt', N'Cancelar as alterações')
INSERT [dbo].[ResourceTranslations] ([ResourceId], [UICulture], [Translation]) VALUES (90, N'en', N'Person or department for whom the document was forwarded.')
INSERT [dbo].[ResourceTranslations] ([ResourceId], [UICulture], [Translation]) VALUES (90, N'es', N'Persona o departamento para quien el documento fue encaminado.')
INSERT [dbo].[ResourceTranslations] ([ResourceId], [UICulture], [Translation]) VALUES (90, N'fr', N'Personne ou département pour lequel le document a été transmis.')
INSERT [dbo].[ResourceTranslations] ([ResourceId], [UICulture], [Translation]) VALUES (90, N'pt', N'Pessoa ou departamento para quem o documento foi encaminhado.')
INSERT [dbo].[ResourceTranslations] ([ResourceId], [UICulture], [Translation]) VALUES (91, N'en', N'Outgoing')
INSERT [dbo].[ResourceTranslations] ([ResourceId], [UICulture], [Translation]) VALUES (91, N'es', N'Salida')
INSERT [dbo].[ResourceTranslations] ([ResourceId], [UICulture], [Translation]) VALUES (91, N'fr', N'Départ')
INSERT [dbo].[ResourceTranslations] ([ResourceId], [UICulture], [Translation]) VALUES (91, N'pt', N'Saída')
INSERT [dbo].[ResourceTranslations] ([ResourceId], [UICulture], [Translation]) VALUES (92, N'en', N'Person that sent the document')
INSERT [dbo].[ResourceTranslations] ([ResourceId], [UICulture], [Translation]) VALUES (92, N'es', N'Persona que envió el documento')
INSERT [dbo].[ResourceTranslations] ([ResourceId], [UICulture], [Translation]) VALUES (92, N'fr', N'Personne qui a envoyé le document')
INSERT [dbo].[ResourceTranslations] ([ResourceId], [UICulture], [Translation]) VALUES (92, N'pt', N'Pessoa que expediu o documento')
INSERT [dbo].[ResourceTranslations] ([ResourceId], [UICulture], [Translation]) VALUES (93, N'en', N'Show the register')
INSERT [dbo].[ResourceTranslations] ([ResourceId], [UICulture], [Translation]) VALUES (93, N'es', N'Mostrar el registro')
INSERT [dbo].[ResourceTranslations] ([ResourceId], [UICulture], [Translation]) VALUES (93, N'fr', N'Afficher l''enregistrement')
INSERT [dbo].[ResourceTranslations] ([ResourceId], [UICulture], [Translation]) VALUES (93, N'pt', N'Mostrar o registo')
INSERT [dbo].[ResourceTranslations] ([ResourceId], [UICulture], [Translation]) VALUES (94, N'en', N'Document type')
INSERT [dbo].[ResourceTranslations] ([ResourceId], [UICulture], [Translation]) VALUES (94, N'es', N'Tipo do documento')
INSERT [dbo].[ResourceTranslations] ([ResourceId], [UICulture], [Translation]) VALUES (94, N'fr', N'Type de document')
INSERT [dbo].[ResourceTranslations] ([ResourceId], [UICulture], [Translation]) VALUES (94, N'pt', N'Tipo do documento')
INSERT [dbo].[ResourceTranslations] ([ResourceId], [UICulture], [Translation]) VALUES (95, N'en', N'The date that is written on the document.')
INSERT [dbo].[ResourceTranslations] ([ResourceId], [UICulture], [Translation]) VALUES (95, N'es', N'Fecha que está escrita en el documento.')
INSERT [dbo].[ResourceTranslations] ([ResourceId], [UICulture], [Translation]) VALUES (95, N'fr', N'La date qui est écrite sur le document.')
INSERT [dbo].[ResourceTranslations] ([ResourceId], [UICulture], [Translation]) VALUES (95, N'pt', N'A data que está escrita no documento.')
INSERT [dbo].[ResourceTranslations] ([ResourceId], [UICulture], [Translation]) VALUES (96, N'en', N'Department that produced the document.')
INSERT [dbo].[ResourceTranslations] ([ResourceId], [UICulture], [Translation]) VALUES (96, N'es', N'Departamento que produjo el documento.')
INSERT [dbo].[ResourceTranslations] ([ResourceId], [UICulture], [Translation]) VALUES (96, N'fr', N'Département qui a produit le document.')
INSERT [dbo].[ResourceTranslations] ([ResourceId], [UICulture], [Translation]) VALUES (96, N'pt', N'Departamento que produziu o documento.')
INSERT [dbo].[ResourceTranslations] ([ResourceId], [UICulture], [Translation]) VALUES (97, N'en', N'Outgoing register')
INSERT [dbo].[ResourceTranslations] ([ResourceId], [UICulture], [Translation]) VALUES (97, N'es', N'Registro de salida')
INSERT [dbo].[ResourceTranslations] ([ResourceId], [UICulture], [Translation]) VALUES (97, N'fr', N'Enregistrement départ')
INSERT [dbo].[ResourceTranslations] ([ResourceId], [UICulture], [Translation]) VALUES (97, N'pt', N'Registo de saída')
INSERT [dbo].[ResourceTranslations] ([ResourceId], [UICulture], [Translation]) VALUES (98, N'en', N'Click to create an outgoing mail register')
INSERT [dbo].[ResourceTranslations] ([ResourceId], [UICulture], [Translation]) VALUES (98, N'es', N'Clique para crear un registro de correspondencia salida')
INSERT [dbo].[ResourceTranslations] ([ResourceId], [UICulture], [Translation]) VALUES (98, N'fr', N'Cliquez pour créer un enregistrement de correspondance départ')
INSERT [dbo].[ResourceTranslations] ([ResourceId], [UICulture], [Translation]) VALUES (98, N'pt', N'Clique para criar um registo de correspondência saída')
INSERT [dbo].[ResourceTranslations] ([ResourceId], [UICulture], [Translation]) VALUES (99, N'en', N'Confirm changes')
INSERT [dbo].[ResourceTranslations] ([ResourceId], [UICulture], [Translation]) VALUES (99, N'es', N'Confirmar las modificaciones')
INSERT [dbo].[ResourceTranslations] ([ResourceId], [UICulture], [Translation]) VALUES (99, N'fr', N'Confirmer les modifications')
INSERT [dbo].[ResourceTranslations] ([ResourceId], [UICulture], [Translation]) VALUES (99, N'pt', N'Confirmar as alterações')
INSERT [dbo].[ResourceTranslations] ([ResourceId], [UICulture], [Translation]) VALUES (100, N'en', N'Edit the register.')
INSERT [dbo].[ResourceTranslations] ([ResourceId], [UICulture], [Translation]) VALUES (100, N'es', N'Modificar el registro.')
INSERT [dbo].[ResourceTranslations] ([ResourceId], [UICulture], [Translation]) VALUES (100, N'fr', N'Modifier l''enregistrement.')
INSERT [dbo].[ResourceTranslations] ([ResourceId], [UICulture], [Translation]) VALUES (100, N'pt', N'Alterar o registo.')
GO
INSERT [dbo].[ResourceTranslations] ([ResourceId], [UICulture], [Translation]) VALUES (101, N'en', N'Last page')
INSERT [dbo].[ResourceTranslations] ([ResourceId], [UICulture], [Translation]) VALUES (101, N'es', N'Última página')
INSERT [dbo].[ResourceTranslations] ([ResourceId], [UICulture], [Translation]) VALUES (101, N'fr', N'Derniére page')
INSERT [dbo].[ResourceTranslations] ([ResourceId], [UICulture], [Translation]) VALUES (101, N'pt', N'Última página')
INSERT [dbo].[ResourceTranslations] ([ResourceId], [UICulture], [Translation]) VALUES (102, N'en', N'Alert')
INSERT [dbo].[ResourceTranslations] ([ResourceId], [UICulture], [Translation]) VALUES (102, N'es', N'Alerta')
INSERT [dbo].[ResourceTranslations] ([ResourceId], [UICulture], [Translation]) VALUES (102, N'fr', N'Alerte')
INSERT [dbo].[ResourceTranslations] ([ResourceId], [UICulture], [Translation]) VALUES (102, N'pt', N'Alerta')
INSERT [dbo].[ResourceTranslations] ([ResourceId], [UICulture], [Translation]) VALUES (103, N'en', N'Dates')
INSERT [dbo].[ResourceTranslations] ([ResourceId], [UICulture], [Translation]) VALUES (103, N'es', N'Fechas')
INSERT [dbo].[ResourceTranslations] ([ResourceId], [UICulture], [Translation]) VALUES (103, N'fr', N'Dates')
INSERT [dbo].[ResourceTranslations] ([ResourceId], [UICulture], [Translation]) VALUES (103, N'pt', N'Datas')
INSERT [dbo].[ResourceTranslations] ([ResourceId], [UICulture], [Translation]) VALUES (104, N'en', N'Tools')
INSERT [dbo].[ResourceTranslations] ([ResourceId], [UICulture], [Translation]) VALUES (104, N'es', N'Herramientas')
INSERT [dbo].[ResourceTranslations] ([ResourceId], [UICulture], [Translation]) VALUES (104, N'fr', N'Outils')
INSERT [dbo].[ResourceTranslations] ([ResourceId], [UICulture], [Translation]) VALUES (104, N'pt', N'Ferramentas')
INSERT [dbo].[ResourceTranslations] ([ResourceId], [UICulture], [Translation]) VALUES (105, N'en', N'Outgoing')
INSERT [dbo].[ResourceTranslations] ([ResourceId], [UICulture], [Translation]) VALUES (105, N'es', N'Salidas')
INSERT [dbo].[ResourceTranslations] ([ResourceId], [UICulture], [Translation]) VALUES (105, N'fr', N'Départs')
INSERT [dbo].[ResourceTranslations] ([ResourceId], [UICulture], [Translation]) VALUES (105, N'pt', N'Saídas')
INSERT [dbo].[ResourceTranslations] ([ResourceId], [UICulture], [Translation]) VALUES (106, N'en', N'Save error')
INSERT [dbo].[ResourceTranslations] ([ResourceId], [UICulture], [Translation]) VALUES (106, N'es', N'Error al escribir')
INSERT [dbo].[ResourceTranslations] ([ResourceId], [UICulture], [Translation]) VALUES (106, N'fr', N'Erreur d''écriture')
INSERT [dbo].[ResourceTranslations] ([ResourceId], [UICulture], [Translation]) VALUES (106, N'pt', N'Erro ao gravar')
INSERT [dbo].[ResourceTranslations] ([ResourceId], [UICulture], [Translation]) VALUES (107, N'en', N'Document')
INSERT [dbo].[ResourceTranslations] ([ResourceId], [UICulture], [Translation]) VALUES (107, N'es', N'Documento')
INSERT [dbo].[ResourceTranslations] ([ResourceId], [UICulture], [Translation]) VALUES (107, N'fr', N'Document')
INSERT [dbo].[ResourceTranslations] ([ResourceId], [UICulture], [Translation]) VALUES (107, N'pt', N'Documento')
INSERT [dbo].[ResourceTranslations] ([ResourceId], [UICulture], [Translation]) VALUES (108, N'en', N'Export the register to Excel')
INSERT [dbo].[ResourceTranslations] ([ResourceId], [UICulture], [Translation]) VALUES (108, N'es', N'Exportar el registro para Excel')
INSERT [dbo].[ResourceTranslations] ([ResourceId], [UICulture], [Translation]) VALUES (108, N'fr', N'Exporter l''enregistrement pour un classeur Excel')
INSERT [dbo].[ResourceTranslations] ([ResourceId], [UICulture], [Translation]) VALUES (108, N'pt', N'Exportar o registo para Excel')
INSERT [dbo].[ResourceTranslations] ([ResourceId], [UICulture], [Translation]) VALUES (109, N'en', N'Unsaved register')
INSERT [dbo].[ResourceTranslations] ([ResourceId], [UICulture], [Translation]) VALUES (109, N'es', N'Registro no grabado')
INSERT [dbo].[ResourceTranslations] ([ResourceId], [UICulture], [Translation]) VALUES (109, N'fr', N'Enregistrement non sauvegardé')
INSERT [dbo].[ResourceTranslations] ([ResourceId], [UICulture], [Translation]) VALUES (109, N'pt', N'Registo não gravado')
INSERT [dbo].[ResourceTranslations] ([ResourceId], [UICulture], [Translation]) VALUES (110, N'en', N'Date of document dispatch')
INSERT [dbo].[ResourceTranslations] ([ResourceId], [UICulture], [Translation]) VALUES (110, N'es', N'Fecha de expedicíon del documento')
INSERT [dbo].[ResourceTranslations] ([ResourceId], [UICulture], [Translation]) VALUES (110, N'fr', N'Date d''expédition du document')
INSERT [dbo].[ResourceTranslations] ([ResourceId], [UICulture], [Translation]) VALUES (110, N'pt', N'Data de expedição do documento')
INSERT [dbo].[ResourceTranslations] ([ResourceId], [UICulture], [Translation]) VALUES (111, N'en', N'InterwayDocs - Mail registry')
INSERT [dbo].[ResourceTranslations] ([ResourceId], [UICulture], [Translation]) VALUES (111, N'es', N'InterwayDocs - Registro de correspondencia')
INSERT [dbo].[ResourceTranslations] ([ResourceId], [UICulture], [Translation]) VALUES (111, N'fr', N'InterwayDocs - Enregistrement de correspondance')
INSERT [dbo].[ResourceTranslations] ([ResourceId], [UICulture], [Translation]) VALUES (111, N'pt', N'InterwayDocs - Registo de correspondência')
INSERT [dbo].[ResourceTranslations] ([ResourceId], [UICulture], [Translation]) VALUES (112, N'en', N'Next page')
INSERT [dbo].[ResourceTranslations] ([ResourceId], [UICulture], [Translation]) VALUES (112, N'es', N'Página siguiente')
INSERT [dbo].[ResourceTranslations] ([ResourceId], [UICulture], [Translation]) VALUES (112, N'fr', N'Page suivante')
INSERT [dbo].[ResourceTranslations] ([ResourceId], [UICulture], [Translation]) VALUES (112, N'pt', N'Página seguinte')
INSERT [dbo].[ResourceTranslations] ([ResourceId], [UICulture], [Translation]) VALUES (113, N'en', N'Document recipient')
INSERT [dbo].[ResourceTranslations] ([ResourceId], [UICulture], [Translation]) VALUES (113, N'es', N'Destinatario do documento')
INSERT [dbo].[ResourceTranslations] ([ResourceId], [UICulture], [Translation]) VALUES (113, N'fr', N'Destinataire du document')
INSERT [dbo].[ResourceTranslations] ([ResourceId], [UICulture], [Translation]) VALUES (113, N'pt', N'Destinatário do documento')
INSERT [dbo].[ResourceTranslations] ([ResourceId], [UICulture], [Translation]) VALUES (114, N'en', N'Document recipient town')
INSERT [dbo].[ResourceTranslations] ([ResourceId], [UICulture], [Translation]) VALUES (114, N'es', N'Localidad del destinatario del documento')
INSERT [dbo].[ResourceTranslations] ([ResourceId], [UICulture], [Translation]) VALUES (114, N'fr', N'Ville du destinataire du document')
INSERT [dbo].[ResourceTranslations] ([ResourceId], [UICulture], [Translation]) VALUES (114, N'pt', N'Localidade do destinatário do documento')
INSERT [dbo].[ResourceTranslations] ([ResourceId], [UICulture], [Translation]) VALUES (115, N'en', N'The date can''t be in the future.')
INSERT [dbo].[ResourceTranslations] ([ResourceId], [UICulture], [Translation]) VALUES (115, N'es', N'La fecha no puede ser en el futuro.')
INSERT [dbo].[ResourceTranslations] ([ResourceId], [UICulture], [Translation]) VALUES (115, N'fr', N'La date ne peut pas être à l''avenir.')
INSERT [dbo].[ResourceTranslations] ([ResourceId], [UICulture], [Translation]) VALUES (115, N'pt', N'A data não pode ser no futuro.')
INSERT [dbo].[ResourceTranslations] ([ResourceId], [UICulture], [Translation]) VALUES (116, N'en', N'Register date')
INSERT [dbo].[ResourceTranslations] ([ResourceId], [UICulture], [Translation]) VALUES (116, N'es', N'Fecha de registro')
INSERT [dbo].[ResourceTranslations] ([ResourceId], [UICulture], [Translation]) VALUES (116, N'fr', N'Date de l''enregistrement')
INSERT [dbo].[ResourceTranslations] ([ResourceId], [UICulture], [Translation]) VALUES (116, N'pt', N'Data de registo')
INSERT [dbo].[ResourceTranslations] ([ResourceId], [UICulture], [Translation]) VALUES (117, N'en', N'The date must be bigger or equal to {2}.')
INSERT [dbo].[ResourceTranslations] ([ResourceId], [UICulture], [Translation]) VALUES (117, N'es', N'La fecha debe ser mayor o igual a {2}.')
INSERT [dbo].[ResourceTranslations] ([ResourceId], [UICulture], [Translation]) VALUES (117, N'fr', N'La date doit être égale ou supérieure à {2}.')
INSERT [dbo].[ResourceTranslations] ([ResourceId], [UICulture], [Translation]) VALUES (117, N'pt', N'A data tem que ser maior ou igual a {2}.')
INSERT [dbo].[ResourceTranslations] ([ResourceId], [UICulture], [Translation]) VALUES (118, N'en', N'All dates')
INSERT [dbo].[ResourceTranslations] ([ResourceId], [UICulture], [Translation]) VALUES (118, N'es', N'Todas las fechas')
INSERT [dbo].[ResourceTranslations] ([ResourceId], [UICulture], [Translation]) VALUES (118, N'fr', N'Toutes les dates')
INSERT [dbo].[ResourceTranslations] ([ResourceId], [UICulture], [Translation]) VALUES (118, N'pt', N'Todas as datas')
INSERT [dbo].[ResourceTranslations] ([ResourceId], [UICulture], [Translation]) VALUES (119, N'en', N'Yesterday')
INSERT [dbo].[ResourceTranslations] ([ResourceId], [UICulture], [Translation]) VALUES (119, N'es', N'Ayer')
INSERT [dbo].[ResourceTranslations] ([ResourceId], [UICulture], [Translation]) VALUES (119, N'fr', N'Hier')
INSERT [dbo].[ResourceTranslations] ([ResourceId], [UICulture], [Translation]) VALUES (119, N'pt', N'Ontem')
INSERT [dbo].[ResourceTranslations] ([ResourceId], [UICulture], [Translation]) VALUES (120, N'en', N'Document date')
INSERT [dbo].[ResourceTranslations] ([ResourceId], [UICulture], [Translation]) VALUES (120, N'es', N'Fecha del documento')
INSERT [dbo].[ResourceTranslations] ([ResourceId], [UICulture], [Translation]) VALUES (120, N'fr', N'Date du document')
INSERT [dbo].[ResourceTranslations] ([ResourceId], [UICulture], [Translation]) VALUES (120, N'pt', N'Data do documento')
INSERT [dbo].[ResourceTranslations] ([ResourceId], [UICulture], [Translation]) VALUES (121, N'en', N'Change date')
INSERT [dbo].[ResourceTranslations] ([ResourceId], [UICulture], [Translation]) VALUES (121, N'es', N'Fecha de modificación')
INSERT [dbo].[ResourceTranslations] ([ResourceId], [UICulture], [Translation]) VALUES (121, N'fr', N'Date de modification')
INSERT [dbo].[ResourceTranslations] ([ResourceId], [UICulture], [Translation]) VALUES (121, N'pt', N'Data de alteração')
INSERT [dbo].[ResourceTranslations] ([ResourceId], [UICulture], [Translation]) VALUES (122, N'en', N'Required.')
INSERT [dbo].[ResourceTranslations] ([ResourceId], [UICulture], [Translation]) VALUES (122, N'es', N'Campo obligatorio.')
INSERT [dbo].[ResourceTranslations] ([ResourceId], [UICulture], [Translation]) VALUES (122, N'fr', N'Champ obligatoire.')
INSERT [dbo].[ResourceTranslations] ([ResourceId], [UICulture], [Translation]) VALUES (122, N'pt', N'Preenchimento obrigatório.')
INSERT [dbo].[ResourceTranslations] ([ResourceId], [UICulture], [Translation]) VALUES (123, N'en', N'Last trimester')
INSERT [dbo].[ResourceTranslations] ([ResourceId], [UICulture], [Translation]) VALUES (123, N'es', N'Último trimestre')
INSERT [dbo].[ResourceTranslations] ([ResourceId], [UICulture], [Translation]) VALUES (123, N'fr', N'Trimestre dernier')
INSERT [dbo].[ResourceTranslations] ([ResourceId], [UICulture], [Translation]) VALUES (123, N'pt', N'Último trimestre')
INSERT [dbo].[ResourceTranslations] ([ResourceId], [UICulture], [Translation]) VALUES (124, N'en', N'Last month')
INSERT [dbo].[ResourceTranslations] ([ResourceId], [UICulture], [Translation]) VALUES (124, N'es', N'Mes pasado')
INSERT [dbo].[ResourceTranslations] ([ResourceId], [UICulture], [Translation]) VALUES (124, N'fr', N'Mois dernier')
INSERT [dbo].[ResourceTranslations] ([ResourceId], [UICulture], [Translation]) VALUES (124, N'pt', N'Último mês')
INSERT [dbo].[ResourceTranslations] ([ResourceId], [UICulture], [Translation]) VALUES (125, N'en', N'Today')
INSERT [dbo].[ResourceTranslations] ([ResourceId], [UICulture], [Translation]) VALUES (125, N'es', N'Hoy')
INSERT [dbo].[ResourceTranslations] ([ResourceId], [UICulture], [Translation]) VALUES (125, N'fr', N'Aujourd''hui')
INSERT [dbo].[ResourceTranslations] ([ResourceId], [UICulture], [Translation]) VALUES (125, N'pt', N'Hoje')
GO
INSERT [dbo].[ResourceTranslations] ([ResourceId], [UICulture], [Translation]) VALUES (126, N'en', N'Last 15 days')
INSERT [dbo].[ResourceTranslations] ([ResourceId], [UICulture], [Translation]) VALUES (126, N'es', N'Última quincena')
INSERT [dbo].[ResourceTranslations] ([ResourceId], [UICulture], [Translation]) VALUES (126, N'fr', N'Quinzaine derniére')
INSERT [dbo].[ResourceTranslations] ([ResourceId], [UICulture], [Translation]) VALUES (126, N'pt', N'Última quinzena')
INSERT [dbo].[ResourceTranslations] ([ResourceId], [UICulture], [Translation]) VALUES (127, N'en', N'Creation date')
INSERT [dbo].[ResourceTranslations] ([ResourceId], [UICulture], [Translation]) VALUES (127, N'es', N'Fecha de creación')
INSERT [dbo].[ResourceTranslations] ([ResourceId], [UICulture], [Translation]) VALUES (127, N'fr', N'Date de création')
INSERT [dbo].[ResourceTranslations] ([ResourceId], [UICulture], [Translation]) VALUES (127, N'pt', N'Data de criação')
INSERT [dbo].[ResourceTranslations] ([ResourceId], [UICulture], [Translation]) VALUES (128, N'en', N'Last week')
INSERT [dbo].[ResourceTranslations] ([ResourceId], [UICulture], [Translation]) VALUES (128, N'es', N'Última semana')
INSERT [dbo].[ResourceTranslations] ([ResourceId], [UICulture], [Translation]) VALUES (128, N'fr', N'Semaine derniére')
INSERT [dbo].[ResourceTranslations] ([ResourceId], [UICulture], [Translation]) VALUES (128, N'pt', N'Última semana')
INSERT [dbo].[ResourceTranslations] ([ResourceId], [UICulture], [Translation]) VALUES (129, N'en', N'Reception date')
INSERT [dbo].[ResourceTranslations] ([ResourceId], [UICulture], [Translation]) VALUES (129, N'es', N'Fecha de recepción')
INSERT [dbo].[ResourceTranslations] ([ResourceId], [UICulture], [Translation]) VALUES (129, N'fr', N'Date de reception')
INSERT [dbo].[ResourceTranslations] ([ResourceId], [UICulture], [Translation]) VALUES (129, N'pt', N'Data de recepção')
INSERT [dbo].[ResourceTranslations] ([ResourceId], [UICulture], [Translation]) VALUES (130, N'en', N'Sent date')
INSERT [dbo].[ResourceTranslations] ([ResourceId], [UICulture], [Translation]) VALUES (130, N'es', N'Fecha de expedición')
INSERT [dbo].[ResourceTranslations] ([ResourceId], [UICulture], [Translation]) VALUES (130, N'fr', N'Date d''expédition')
INSERT [dbo].[ResourceTranslations] ([ResourceId], [UICulture], [Translation]) VALUES (130, N'pt', N'Data de expedição')
INSERT [dbo].[ResourceTranslations] ([ResourceId], [UICulture], [Translation]) VALUES (131, N'en', N'Free search')
INSERT [dbo].[ResourceTranslations] ([ResourceId], [UICulture], [Translation]) VALUES (131, N'es', N'Búsqueda libre')
INSERT [dbo].[ResourceTranslations] ([ResourceId], [UICulture], [Translation]) VALUES (131, N'fr', N'Recherche libre')
INSERT [dbo].[ResourceTranslations] ([ResourceId], [UICulture], [Translation]) VALUES (131, N'pt', N'Pesquisa livre')
INSERT [dbo].[ResourceTranslations] ([ResourceId], [UICulture], [Translation]) VALUES (132, N'en', N'You can''t use more than 3 words.')
INSERT [dbo].[ResourceTranslations] ([ResourceId], [UICulture], [Translation]) VALUES (132, N'es', N'No puede usar más de 3 palabras.')
INSERT [dbo].[ResourceTranslations] ([ResourceId], [UICulture], [Translation]) VALUES (132, N'fr', N'Vous ne pouvez pas utiliser plus de 3 mots.')
INSERT [dbo].[ResourceTranslations] ([ResourceId], [UICulture], [Translation]) VALUES (132, N'pt', N'Não pode usar mais de 3 palavras.')
INSERT [dbo].[ResourceTranslations] ([ResourceId], [UICulture], [Translation]) VALUES (133, N'en', N'Class is in the wrong format.
The format must be "AAA.AAA".')
INSERT [dbo].[ResourceTranslations] ([ResourceId], [UICulture], [Translation]) VALUES (133, N'es', N'La clase está en el formato incorrecto.
El formato debe ser "AAA.AAA".')
INSERT [dbo].[ResourceTranslations] ([ResourceId], [UICulture], [Translation]) VALUES (133, N'fr', N'La classe est dans le mauvais format.
Le format doit être  "AAA.AAA".')
INSERT [dbo].[ResourceTranslations] ([ResourceId], [UICulture], [Translation]) VALUES (133, N'pt', N'A classe está no formato errado.
O formato deve ser "AAA.AAA".')
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_DeliveryRegisters]    Script Date: 16/05/2018 17:12:07 ******/
CREATE NONCLUSTERED INDEX [IX_DeliveryRegisters] ON [dbo].[DeliveryRegisters]
(
	[RegisterDate] ASC,
	[DocumentDate] ASC,
	[ReceptionDate] ASC,
	[DocumentType] ASC,
	[DocumentReference] ASC,
	[DocumentEntity] ASC,
	[DocumentDept] ASC,
	[DocumentClass] ASC,
	[RecipientName] ASC,
	[ExpeditorName] ASC,
	[ReceptionName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_IncomingRegisters]    Script Date: 16/05/2018 17:12:07 ******/
CREATE NONCLUSTERED INDEX [IX_IncomingRegisters] ON [dbo].[IncomingRegisters]
(
	[RegisterDate] ASC,
	[DocumentDate] ASC,
	[ReceptionDate] ASC,
	[ArchiveLocation] ASC,
	[DocumentType] ASC,
	[DocumentReference] ASC,
	[DocumentEntity] ASC,
	[DocumentDept] ASC,
	[DocumentClass] ASC,
	[SenderName] ASC,
	[RoutedTo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_IncomingRegisters_Notes]    Script Date: 16/05/2018 17:12:07 ******/
CREATE NONCLUSTERED INDEX [IX_IncomingRegisters_Notes] ON [dbo].[IncomingRegisters]
(
	[Notes] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_IncomingRegisters_Subject]    Script Date: 16/05/2018 17:12:07 ******/
CREATE NONCLUSTERED INDEX [IX_IncomingRegisters_Subject] ON [dbo].[IncomingRegisters]
(
	[Subject] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_Languages]    Script Date: 16/05/2018 17:12:07 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_Languages] ON [dbo].[Languages]
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_OutgoingRegisters]    Script Date: 16/05/2018 17:12:07 ******/
CREATE NONCLUSTERED INDEX [IX_OutgoingRegisters] ON [dbo].[OutgoingRegisters]
(
	[RegisterDate] ASC,
	[DocumentDate] ASC,
	[SendDate] ASC,
	[ArchiveLocation] ASC,
	[DocumentType] ASC,
	[DocumentReference] ASC,
	[DocumentEntity] ASC,
	[DocumentDept] ASC,
	[DocumentClass] ASC,
	[RecipientName] ASC,
	[RecipientTown] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_OutgoingRegisters_Notes]    Script Date: 16/05/2018 17:12:07 ******/
CREATE NONCLUSTERED INDEX [IX_OutgoingRegisters_Notes] ON [dbo].[OutgoingRegisters]
(
	[Notes] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_OutgoingRegisters_Subject]    Script Date: 16/05/2018 17:12:07 ******/
CREATE NONCLUSTERED INDEX [IX_OutgoingRegisters_Subject] ON [dbo].[OutgoingRegisters]
(
	[Subject] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_PropertyConfiguration]    Script Date: 16/05/2018 17:12:07 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_PropertyConfiguration] ON [dbo].[PropertyConfiguration]
(
	[ObjectName] ASC,
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[PropertyFriendyName]  WITH CHECK ADD  CONSTRAINT [FK_PropertyFriendyName_PropertyConfiguration1] FOREIGN KEY([ConfigurationId])
REFERENCES [dbo].[PropertyConfiguration] ([ConfigurationId])
GO
ALTER TABLE [dbo].[PropertyFriendyName] CHECK CONSTRAINT [FK_PropertyFriendyName_PropertyConfiguration1]
GO
ALTER TABLE [dbo].[ResourceTranslations]  WITH CHECK ADD  CONSTRAINT [FK_ResourceTranslations_Languages] FOREIGN KEY([UICulture])
REFERENCES [dbo].[Languages] ([UICulture])
GO
ALTER TABLE [dbo].[ResourceTranslations] CHECK CONSTRAINT [FK_ResourceTranslations_Languages]
GO
ALTER TABLE [dbo].[ResourceTranslations]  WITH CHECK ADD  CONSTRAINT [FK_ResourceTranslations_Resources] FOREIGN KEY([ResourceId])
REFERENCES [dbo].[Resources] ([ResourceId])
GO
ALTER TABLE [dbo].[ResourceTranslations] CHECK CONSTRAINT [FK_ResourceTranslations_Resources]
GO
/****** Object:  StoredProcedure [dbo].[AddDeliveryRegister]    Script Date: 16/05/2018 17:12:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[AddDeliveryRegister]
    @RegisterId int OUTPUT,
    @RegisterDate date,
    @DocumentType varchar(25),
    @DocumentReference varchar(20),
    @DocumentEntity varchar(150),
    @DocumentDept varchar(150),
    @DocumentClass varchar(50),
    @DocumentDate date,
    @RecipientName varchar(150),
    @ExpeditorName varchar(50),
    @ReceptionName varchar(50),
    @ReceptionDate date,
    @CreateDate datetime2,
    @ChangeDate datetime2
AS
    BEGIN

        SET NOCOUNT ON

        /* Insert object into dbo.DeliveryRegisters */
        INSERT INTO [dbo].[DeliveryRegisters]
        (
            [RegisterDate],
            [DocumentType],
            [DocumentReference],
            [DocumentEntity],
            [DocumentDept],
            [DocumentClass],
            [DocumentDate],
            [RecipientName],
            [ExpeditorName],
            [ReceptionName],
            [ReceptionDate],
            [CreateDate],
            [ChangeDate]
        )
        VALUES
        (
            @RegisterDate,
            @DocumentType,
            @DocumentReference,
            @DocumentEntity,
            @DocumentDept,
            @DocumentClass,
            @DocumentDate,
            @RecipientName,
            @ExpeditorName,
            @ReceptionName,
            @ReceptionDate,
            @CreateDate,
            @ChangeDate
        )

        /* Return new primary key */
        SET @RegisterId = SCOPE_IDENTITY()

    END

GO
/****** Object:  StoredProcedure [dbo].[AddIncomingRegister]    Script Date: 16/05/2018 17:12:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[AddIncomingRegister]
    @RegisterId int OUTPUT,
    @RegisterDate date,
    @DocumentType varchar(25),
    @DocumentReference varchar(20),
    @DocumentEntity varchar(150),
    @DocumentDept varchar(150),
    @DocumentClass varchar(50),
    @DocumentDate date,
    @Subject varchar(500),
    @SenderName varchar(150),
    @ReceptionDate date,
    @RoutedTo varchar(50),
    @Notes varchar(500),
    @ArchiveLocation varchar(50),
    @CreateDate datetime2,
    @ChangeDate datetime2
AS
    BEGIN

        SET NOCOUNT ON

        /* Insert object into dbo.IncomingRegisters */
        INSERT INTO [dbo].[IncomingRegisters]
        (
            [RegisterDate],
            [DocumentType],
            [DocumentReference],
            [DocumentEntity],
            [DocumentDept],
            [DocumentClass],
            [DocumentDate],
            [Subject],
            [SenderName],
            [ReceptionDate],
            [RoutedTo],
            [Notes],
            [ArchiveLocation],
            [CreateDate],
            [ChangeDate]
        )
        VALUES
        (
            @RegisterDate,
            @DocumentType,
            @DocumentReference,
            @DocumentEntity,
            @DocumentDept,
            @DocumentClass,
            @DocumentDate,
            @Subject,
            @SenderName,
            @ReceptionDate,
            @RoutedTo,
            @Notes,
            @ArchiveLocation,
            @CreateDate,
            @ChangeDate
        )

        /* Return new primary key */
        SET @RegisterId = SCOPE_IDENTITY()

    END

GO
/****** Object:  StoredProcedure [dbo].[AddLanguage]    Script Date: 16/05/2018 17:12:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[AddLanguage]
    @UICulture varchar(5),
    @Name nchar(10)
AS
    BEGIN

        SET NOCOUNT ON

        /* Insert object into dbo.Languages */
        INSERT INTO [dbo].[Languages]
        (
            [UICulture],
            [Name]
        )
        VALUES
        (
            @UICulture,
            @Name
        )

    END

GO
/****** Object:  StoredProcedure [dbo].[AddOutgoingRegister]    Script Date: 16/05/2018 17:12:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[AddOutgoingRegister]
    @RegisterId int OUTPUT,
    @RegisterDate date,
    @DocumentType varchar(25),
    @DocumentReference varchar(20),
    @DocumentEntity varchar(150),
    @DocumentDept varchar(150),
    @DocumentClass varchar(50),
    @DocumentDate date,
    @Subject varchar(500),
    @SendDate date,
    @RecipientName varchar(150),
    @RecipientTown varchar(50),
    @Notes varchar(500),
    @ArchiveLocation varchar(50),
    @CreateDate datetime2,
    @ChangeDate datetime2
AS
    BEGIN

        SET NOCOUNT ON

        /* Insert object into dbo.OutgoingRegisters */
        INSERT INTO [dbo].[OutgoingRegisters]
        (
            [RegisterDate],
            [DocumentType],
            [DocumentReference],
            [DocumentEntity],
            [DocumentDept],
            [DocumentClass],
            [DocumentDate],
            [Subject],
            [SendDate],
            [RecipientName],
            [RecipientTown],
            [Notes],
            [ArchiveLocation],
            [CreateDate],
            [ChangeDate]
        )
        VALUES
        (
            @RegisterDate,
            @DocumentType,
            @DocumentReference,
            @DocumentEntity,
            @DocumentDept,
            @DocumentClass,
            @DocumentDate,
            @Subject,
            @SendDate,
            @RecipientName,
            @RecipientTown,
            @Notes,
            @ArchiveLocation,
            @CreateDate,
            @ChangeDate
        )

        /* Return new primary key */
        SET @RegisterId = SCOPE_IDENTITY()

    END

GO
/****** Object:  StoredProcedure [dbo].[AddResource]    Script Date: 16/05/2018 17:12:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[AddResource]
    @ResourceId int OUTPUT,
    @ResourceType varchar(50),
    @ResourceName varchar(50)
AS
    BEGIN

        SET NOCOUNT ON

        /* Insert object into dbo.Resources */
        INSERT INTO [dbo].[Resources]
        (
            [ResourceType],
            [ResourceName]
        )
        VALUES
        (
            @ResourceType,
            @ResourceName
        )

        /* Return new primary key */
        SET @ResourceId = SCOPE_IDENTITY()

    END

GO
/****** Object:  StoredProcedure [dbo].[AddResourceCulture]    Script Date: 16/05/2018 17:12:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[AddResourceCulture]
    @ResourceId int,
    @UICulture varchar(5),
    @Translation varchar(500)
AS
    BEGIN

        SET NOCOUNT ON

        /* Insert object into dbo.ResourceTranslations */
        INSERT INTO [dbo].[ResourceTranslations]
        (
            [ResourceId],
            [UICulture],
            [Translation]
        )
        VALUES
        (
            @ResourceId,
            @UICulture,
            @Translation
        )

    END

GO
/****** Object:  StoredProcedure [dbo].[DeleteLanguage]    Script Date: 16/05/2018 17:12:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[DeleteLanguage]
    @UICulture varchar(5)
AS
    BEGIN

        SET NOCOUNT ON

        /* Check for object existence */
        IF NOT EXISTS
        (
            SELECT [UICulture] FROM [dbo].[Languages]
            WHERE
                [UICulture] = @UICulture
        )
        BEGIN
            RAISERROR ('''dbo.Language'' object not found. It was probably removed by another user.', 16, 1)
            RETURN
        END

        /* Delete Language object from Languages */
        DELETE
        FROM [dbo].[Languages]
        WHERE
            [dbo].[Languages].[UICulture] = @UICulture

    END

GO
/****** Object:  StoredProcedure [dbo].[DeleteResource]    Script Date: 16/05/2018 17:12:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[DeleteResource]
    @ResourceId int
AS
    BEGIN

        SET NOCOUNT ON

        /* Check for object existence */
        IF NOT EXISTS
        (
            SELECT [ResourceId] FROM [dbo].[Resources]
            WHERE
                [ResourceId] = @ResourceId
        )
        BEGIN
            RAISERROR ('''dbo.Resource'' object not found. It was probably removed by another user.', 16, 1)
            RETURN
        END

        /* Delete child ResourceCulture from ResourceTranslations */
        DELETE
            [dbo].[ResourceTranslations]
        FROM [dbo].[ResourceTranslations]
            INNER JOIN [dbo].[Resources] ON [ResourceTranslations].[ResourceId] = [Resources].[ResourceId]
        WHERE
            [dbo].[Resources].[ResourceId] = @ResourceId

        /* Delete Resource object from Resources */
        DELETE
        FROM [dbo].[Resources]
        WHERE
            [dbo].[Resources].[ResourceId] = @ResourceId

    END

GO
/****** Object:  StoredProcedure [dbo].[DeleteResourceCulture]    Script Date: 16/05/2018 17:12:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[DeleteResourceCulture]
    @UICulture varchar(5)
AS
    BEGIN

        SET NOCOUNT ON

        /* Check for object existence */
        IF NOT EXISTS
        (
            SELECT [UICulture] FROM [dbo].[ResourceTranslations]
            WHERE
                [UICulture] = @UICulture
        )
        BEGIN
            RAISERROR ('''dbo.ResourceCulture'' object not found. It was probably removed by another user.', 16, 1)
            RETURN
        END

        /* Delete ResourceCulture object from ResourceTranslations */
        DELETE
        FROM [dbo].[ResourceTranslations]
        WHERE
            [dbo].[ResourceTranslations].[UICulture] = @UICulture

    END

GO
/****** Object:  StoredProcedure [dbo].[GetDeliveryRegister]    Script Date: 16/05/2018 17:12:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[GetDeliveryRegister]
    @RegisterId int
AS
    BEGIN

        SET NOCOUNT ON

        /* Get DeliveryRegister from table */
        SELECT
            [DeliveryRegisters].[RegisterId],
            [DeliveryRegisters].[RegisterDate],
            [DeliveryRegisters].[DocumentType],
            [DeliveryRegisters].[DocumentReference],
            [DeliveryRegisters].[DocumentEntity],
            [DeliveryRegisters].[DocumentDept],
            [DeliveryRegisters].[DocumentClass],
            [DeliveryRegisters].[DocumentDate],
            [DeliveryRegisters].[RecipientName],
            [DeliveryRegisters].[ExpeditorName],
            [DeliveryRegisters].[ReceptionName],
            [DeliveryRegisters].[ReceptionDate],
            [DeliveryRegisters].[CreateDate],
            [DeliveryRegisters].[ChangeDate]
        FROM [dbo].[DeliveryRegisters]
        WHERE
            [DeliveryRegisters].[RegisterId] = @RegisterId

    END

GO
/****** Object:  StoredProcedure [dbo].[GetIncomingRegister]    Script Date: 16/05/2018 17:12:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[GetIncomingRegister]
    @RegisterId int
AS
    BEGIN

        SET NOCOUNT ON

        /* Get IncomingRegister from table */
        SELECT
            [IncomingRegisters].[RegisterId],
            [IncomingRegisters].[RegisterDate],
            [IncomingRegisters].[DocumentType],
            [IncomingRegisters].[DocumentReference],
            [IncomingRegisters].[DocumentEntity],
            [IncomingRegisters].[DocumentDept],
            [IncomingRegisters].[DocumentClass],
            [IncomingRegisters].[DocumentDate],
            [IncomingRegisters].[Subject],
            [IncomingRegisters].[SenderName],
            [IncomingRegisters].[ReceptionDate],
            [IncomingRegisters].[RoutedTo],
            [IncomingRegisters].[Notes],
            [IncomingRegisters].[ArchiveLocation],
            [IncomingRegisters].[CreateDate],
            [IncomingRegisters].[ChangeDate]
        FROM [dbo].[IncomingRegisters]
        WHERE
            [IncomingRegisters].[RegisterId] = @RegisterId

    END

GO
/****** Object:  StoredProcedure [dbo].[GetLanguageColl]    Script Date: 16/05/2018 17:12:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[GetLanguageColl]
AS
    BEGIN

        SET NOCOUNT ON

        /* Get Language from table */
        SELECT
            [Languages].[UICulture],
            RTRIM([Languages].[Name]) AS [Name]
        FROM [dbo].[Languages]

    END

GO
/****** Object:  StoredProcedure [dbo].[GetOutgoingRegister]    Script Date: 16/05/2018 17:12:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[GetOutgoingRegister]
    @RegisterId int
AS
    BEGIN

        SET NOCOUNT ON

        /* Get OutgoingRegister from table */
        SELECT
            [OutgoingRegisters].[RegisterId],
            [OutgoingRegisters].[RegisterDate],
            [OutgoingRegisters].[DocumentType],
            [OutgoingRegisters].[DocumentReference],
            [OutgoingRegisters].[DocumentEntity],
            [OutgoingRegisters].[DocumentDept],
            [OutgoingRegisters].[DocumentClass],
            [OutgoingRegisters].[DocumentDate],
            [OutgoingRegisters].[Subject],
            [OutgoingRegisters].[SendDate],
            [OutgoingRegisters].[RecipientName],
            [OutgoingRegisters].[RecipientTown],
            [OutgoingRegisters].[Notes],
            [OutgoingRegisters].[ArchiveLocation],
            [OutgoingRegisters].[CreateDate],
            [OutgoingRegisters].[ChangeDate]
        FROM [dbo].[OutgoingRegisters]
        WHERE
            [OutgoingRegisters].[RegisterId] = @RegisterId

    END

GO
/****** Object:  StoredProcedure [dbo].[GetPropertyConfigurationColl]    Script Date: 16/05/2018 17:12:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[GetPropertyConfigurationColl]
AS
    BEGIN

        SET NOCOUNT ON

        /* Get PropertyConfiguration from table */
        SELECT
            [PropertyConfiguration].[ConfigurationId],
            [PropertyConfiguration].[ObjectName],
            [PropertyConfiguration].[Name],
            [PropertyConfiguration].[IsRequired],
            [PropertyConfiguration].[IsReadOnly],
            [PropertyConfiguration].[IsVisible],
            [PropertyConfiguration].[ListOrder]
        FROM [dbo].[PropertyConfiguration]

        /* Get PropertyFriendlyName from table */
        SELECT
            [PropertyFriendyName].[ConfigurationId],
            [PropertyFriendyName].[UICulture],
            [PropertyFriendyName].[FriendlyName]
        FROM [dbo].[PropertyFriendyName]

    END

GO
/****** Object:  StoredProcedure [dbo].[GetPropertyConfigurationList]    Script Date: 16/05/2018 17:12:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[GetPropertyConfigurationList]
    @ObjectName varchar(50),
    @UICulture varchar(5)
AS
    BEGIN

        SET NOCOUNT ON

        /* Get PropertyConfigurationInfo from table */
        SELECT
            [PropertyConfiguration].[ObjectName],
            [PropertyConfiguration].[Name],
            [PropertyFriendyName].[UICulture],
            [PropertyFriendyName].[FriendlyName],
            [PropertyConfiguration].[IsRequired],
            [PropertyConfiguration].[IsReadOnly],
            [PropertyConfiguration].[IsVisible]
        FROM [dbo].[PropertyFriendyName]
            INNER JOIN [dbo].[PropertyConfiguration] ON [PropertyFriendyName].[ConfigurationId] = [PropertyConfiguration].[ConfigurationId]
        WHERE
            [PropertyConfiguration].[ObjectName] = @ObjectName AND
            [PropertyFriendyName].[UICulture] LIKE @UICulture
        ORDER BY
            [PropertyConfiguration].[ObjectName], [PropertyFriendyName].[UICulture], PropertyConfiguration.[ListOrder]

    END

GO
/****** Object:  StoredProcedure [dbo].[GetPropertyRequiredList]    Script Date: 16/05/2018 17:12:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[GetPropertyRequiredList]
AS
    BEGIN

        SET NOCOUNT ON

        /* Get PropertyRequiredInfo from table */
        SELECT
            [PropertyConfiguration].[ObjectName],
            [PropertyConfiguration].[Name],
            [PropertyConfiguration].[IsRequired]
        FROM [dbo].[PropertyConfiguration]

    END

GO
/****** Object:  StoredProcedure [dbo].[GetResourceColl]    Script Date: 16/05/2018 17:12:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[GetResourceColl]
AS
    BEGIN

        SET NOCOUNT ON

        /* Get Resource from table */
        SELECT
            [Resources].[ResourceId],
            [Resources].[ResourceType],
            [Resources].[ResourceName]
        FROM [dbo].[Resources]

        /* Get ResourceCulture from table */
        SELECT
            [ResourceTranslations].[ResourceId],
            [ResourceTranslations].[UICulture],
            [ResourceTranslations].[Translation]
        FROM [dbo].[ResourceTranslations]

    END

GO
/****** Object:  StoredProcedure [dbo].[GetResourceList]    Script Date: 16/05/2018 17:12:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[GetResourceList]
    @ResourceType varchar(50),
    @UICulture varchar(5)
AS
    BEGIN

        SET NOCOUNT ON

        /* Get ResourceInfo from table */
        SELECT
            [Resources].[ResourceType],
            [Resources].[ResourceName],
            [ResourceTranslations].[UICulture],
            [ResourceTranslations].[Translation]
        FROM [dbo].[ResourceTranslations]
            INNER JOIN [dbo].[Resources] ON [ResourceTranslations].[ResourceId] = [Resources].[ResourceId]
        WHERE
            [Resources].[ResourceType] = @ResourceType AND
            [ResourceTranslations].[UICulture] = @UICulture
        ORDER BY
            [Resources].[ResourceName]

    END

GO
/****** Object:  StoredProcedure [dbo].[MigrationAddResource]    Script Date: 16/05/2018 17:12:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[MigrationAddResource]
    @ResourceId int OUTPUT,
    @ResourceType varchar(50),
    @ResourceName varchar(50)
AS
    BEGIN

        SET NOCOUNT ON

        /* Insert object into dbo.Resources */
        INSERT INTO [dbo].[Resources]
        (
            [ResourceType],
            [ResourceName]
        )
        VALUES
        (
            @ResourceType,
            @ResourceName
        )

        /* Return new primary key */
        SET @ResourceId = SCOPE_IDENTITY()

    END

GO
/****** Object:  StoredProcedure [dbo].[MigrationAddResourceTranslation]    Script Date: 16/05/2018 17:12:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[MigrationAddResourceTranslation]
    @ResourceId int,
    @UICulture varchar(5),
    @Translation varchar(500)
AS
    BEGIN

        SET NOCOUNT ON

        /* Insert object into dbo.Resources */
        INSERT INTO [dbo].[ResourceTranslations]
        (
            [ResourceId],
            [UICulture],
            [Translation]
        )
        VALUES
        (
            @ResourceId,
            @UICulture,
            @Translation
        )


    END

GO
/****** Object:  StoredProcedure [dbo].[UpdateDeliveryRegister]    Script Date: 16/05/2018 17:12:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[UpdateDeliveryRegister]
    @RegisterId int,
    @RegisterDate date,
    @DocumentType varchar(25),
    @DocumentReference varchar(20),
    @DocumentEntity varchar(150),
    @DocumentDept varchar(150),
    @DocumentClass varchar(50),
    @DocumentDate date,
    @RecipientName varchar(150),
    @ExpeditorName varchar(50),
    @ReceptionName varchar(50),
    @ReceptionDate date,
    @ChangeDate datetime2
AS
    BEGIN

        SET NOCOUNT ON

        /* Check for object existence */
        IF NOT EXISTS
        (
            SELECT [RegisterId] FROM [dbo].[DeliveryRegisters]
            WHERE
                [RegisterId] = @RegisterId
        )
        BEGIN
            RAISERROR ('''dbo.DeliveryRegister'' object not found. It was probably removed by another user.', 16, 1)
            RETURN
        END

        /* Update object in dbo.DeliveryRegisters */
        UPDATE [dbo].[DeliveryRegisters]
        SET
            [RegisterDate] = @RegisterDate,
            [DocumentType] = @DocumentType,
            [DocumentReference] = @DocumentReference,
            [DocumentEntity] = @DocumentEntity,
            [DocumentDept] = @DocumentDept,
            [DocumentClass] = @DocumentClass,
            [DocumentDate] = @DocumentDate,
            [RecipientName] = @RecipientName,
            [ExpeditorName] = @ExpeditorName,
            [ReceptionName] = @ReceptionName,
            [ReceptionDate] = @ReceptionDate,
            [ChangeDate] = @ChangeDate
        WHERE
            [RegisterId] = @RegisterId

    END

GO
/****** Object:  StoredProcedure [dbo].[UpdateIncomingRegister]    Script Date: 16/05/2018 17:12:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[UpdateIncomingRegister]
    @RegisterId int,
    @RegisterDate date,
    @DocumentType varchar(25),
    @DocumentReference varchar(20),
    @DocumentEntity varchar(150),
    @DocumentDept varchar(150),
    @DocumentClass varchar(50),
    @DocumentDate date,
    @Subject varchar(500),
    @SenderName varchar(150),
    @ReceptionDate date,
    @RoutedTo varchar(50),
    @Notes varchar(500),
    @ArchiveLocation varchar(50),
    @ChangeDate datetime2
AS
    BEGIN

        SET NOCOUNT ON

        /* Check for object existence */
        IF NOT EXISTS
        (
            SELECT [RegisterId] FROM [dbo].[IncomingRegisters]
            WHERE
                [RegisterId] = @RegisterId
        )
        BEGIN
            RAISERROR ('''dbo.IncomingRegister'' object not found. It was probably removed by another user.', 16, 1)
            RETURN
        END

        /* Update object in dbo.IncomingRegisters */
        UPDATE [dbo].[IncomingRegisters]
        SET
            [RegisterDate] = @RegisterDate,
            [DocumentType] = @DocumentType,
            [DocumentReference] = @DocumentReference,
            [DocumentEntity] = @DocumentEntity,
            [DocumentDept] = @DocumentDept,
            [DocumentClass] = @DocumentClass,
            [DocumentDate] = @DocumentDate,
            [Subject] = @Subject,
            [SenderName] = @SenderName,
            [ReceptionDate] = @ReceptionDate,
            [RoutedTo] = @RoutedTo,
            [Notes] = @Notes,
            [ArchiveLocation] = @ArchiveLocation,
            [ChangeDate] = @ChangeDate
        WHERE
            [RegisterId] = @RegisterId

    END

GO
/****** Object:  StoredProcedure [dbo].[UpdateLanguage]    Script Date: 16/05/2018 17:12:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[UpdateLanguage]
    @UICulture varchar(5),
    @Name nchar(10)
AS
    BEGIN

        SET NOCOUNT ON

        /* Check for object existence */
        IF NOT EXISTS
        (
            SELECT [UICulture] FROM [dbo].[Languages]
            WHERE
                [UICulture] = @UICulture
        )
        BEGIN
            RAISERROR ('''dbo.Language'' object not found. It was probably removed by another user.', 16, 1)
            RETURN
        END

        /* Update object in dbo.Languages */
        UPDATE [dbo].[Languages]
        SET
            [Name] = @Name
        WHERE
            [UICulture] = @UICulture

    END

GO
/****** Object:  StoredProcedure [dbo].[UpdateOutgoingRegister]    Script Date: 16/05/2018 17:12:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[UpdateOutgoingRegister]
    @RegisterId int,
    @RegisterDate date,
    @DocumentType varchar(25),
    @DocumentReference varchar(20),
    @DocumentEntity varchar(150),
    @DocumentDept varchar(150),
    @DocumentClass varchar(50),
    @DocumentDate date,
    @Subject varchar(500),
    @SendDate date,
    @RecipientName varchar(150),
    @RecipientTown varchar(50),
    @Notes varchar(500),
    @ArchiveLocation varchar(50),
    @ChangeDate datetime2
AS
    BEGIN

        SET NOCOUNT ON

        /* Check for object existence */
        IF NOT EXISTS
        (
            SELECT [RegisterId] FROM [dbo].[OutgoingRegisters]
            WHERE
                [RegisterId] = @RegisterId
        )
        BEGIN
            RAISERROR ('''dbo.OutgoingRegister'' object not found. It was probably removed by another user.', 16, 1)
            RETURN
        END

        /* Update object in dbo.OutgoingRegisters */
        UPDATE [dbo].[OutgoingRegisters]
        SET
            [RegisterDate] = @RegisterDate,
            [DocumentType] = @DocumentType,
            [DocumentReference] = @DocumentReference,
            [DocumentEntity] = @DocumentEntity,
            [DocumentDept] = @DocumentDept,
            [DocumentClass] = @DocumentClass,
            [DocumentDate] = @DocumentDate,
            [Subject] = @Subject,
            [SendDate] = @SendDate,
            [RecipientName] = @RecipientName,
            [RecipientTown] = @RecipientTown,
            [Notes] = @Notes,
            [ArchiveLocation] = @ArchiveLocation,
            [ChangeDate] = @ChangeDate
        WHERE
            [RegisterId] = @RegisterId

    END

GO
/****** Object:  StoredProcedure [dbo].[UpdatePropertyConfiguration]    Script Date: 16/05/2018 17:12:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[UpdatePropertyConfiguration]
    @ConfigurationId int,
    @IsRequired bit,
    @IsReadOnly bit,
    @IsVisible bit,
    @ListOrder int
AS
    BEGIN

        SET NOCOUNT ON

        /* Check for object existence */
        IF NOT EXISTS
        (
            SELECT [ConfigurationId] FROM [dbo].[PropertyConfiguration]
            WHERE
                [ConfigurationId] = @ConfigurationId
        )
        BEGIN
            RAISERROR ('''dbo.PropertyConfiguration'' object not found. It was probably removed by another user.', 16, 1)
            RETURN
        END

        /* Update object in dbo.PropertyConfiguration */
        UPDATE [dbo].[PropertyConfiguration]
        SET
            [IsRequired] = @IsRequired,
            [IsReadOnly] = @IsReadOnly,
            [IsVisible] = @IsVisible,
            [ListOrder] = @ListOrder
        WHERE
            [ConfigurationId] = @ConfigurationId

    END

GO
/****** Object:  StoredProcedure [dbo].[UpdatePropertyFriendlyName]    Script Date: 16/05/2018 17:12:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[UpdatePropertyFriendlyName]
    @ConfigurationId int,
    @UICulture varchar(5),
    @FriendlyName varchar(50)
AS
    BEGIN

        SET NOCOUNT ON

        /* Check for object existence */
        IF NOT EXISTS
        (
            SELECT [ConfigurationId], [UICulture] FROM [dbo].[PropertyFriendyName]
            WHERE
                [ConfigurationId] = @ConfigurationId AND
                [UICulture] = @UICulture
        )
        BEGIN
            RAISERROR ('''dbo.PropertyFriendlyName'' object not found. It was probably removed by another user.', 16, 1)
            RETURN
        END

        /* Update object in dbo.PropertyFriendyName */
        UPDATE [dbo].[PropertyFriendyName]
        SET
            [FriendlyName] = @FriendlyName
        WHERE
            [ConfigurationId] = @ConfigurationId AND
            [UICulture] = @UICulture

    END

GO
/****** Object:  StoredProcedure [dbo].[UpdateResource]    Script Date: 16/05/2018 17:12:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[UpdateResource]
    @ResourceId int,
    @ResourceType varchar(50),
    @ResourceName varchar(50)
AS
    BEGIN

        SET NOCOUNT ON

        /* Check for object existence */
        IF NOT EXISTS
        (
            SELECT [ResourceId] FROM [dbo].[Resources]
            WHERE
                [ResourceId] = @ResourceId
        )
        BEGIN
            RAISERROR ('''dbo.Resource'' object not found. It was probably removed by another user.', 16, 1)
            RETURN
        END

        /* Update object in dbo.Resources */
        UPDATE [dbo].[Resources]
        SET
            [ResourceType] = @ResourceType,
            [ResourceName] = @ResourceName
        WHERE
            [ResourceId] = @ResourceId

    END

GO
/****** Object:  StoredProcedure [dbo].[UpdateResourceCulture]    Script Date: 16/05/2018 17:12:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[UpdateResourceCulture]
    @UICulture varchar(5),
    @Translation varchar(500)
AS
    BEGIN

        SET NOCOUNT ON

        /* Check for object existence */
        IF NOT EXISTS
        (
            SELECT [UICulture] FROM [dbo].[ResourceTranslations]
            WHERE
                [UICulture] = @UICulture
        )
        BEGIN
            RAISERROR ('''dbo.ResourceCulture'' object not found. It was probably removed by another user.', 16, 1)
            RETURN
        END

        /* Update object in dbo.ResourceTranslations */
        UPDATE [dbo].[ResourceTranslations]
        SET
            [Translation] = @Translation
        WHERE
            [UICulture] = @UICulture

    END

GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties =
   Begin PaneConfigurations =
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane =
      Begin Origin =
         Top = 0
         Left = 0
      End
      Begin Tables =
         Begin Table = "DeliveryRegisters"
            Begin Extent =
               Top = 6
               Left = 38
               Bottom = 213
               Right = 334
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane =
   End
   Begin DataPane =
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane =
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'DeliveryView'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'DeliveryView'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties =
   Begin PaneConfigurations =
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane =
      Begin Origin =
         Top = 0
         Left = 0
      End
      Begin Tables =
         Begin Table = "IncomingRegisters"
            Begin Extent =
               Top = 6
               Left = 38
               Bottom = 213
               Right = 308
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane =
   End
   Begin DataPane =
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane =
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'IncomingView'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'IncomingView'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties =
   Begin PaneConfigurations =
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane =
      Begin Origin =
         Top = 0
         Left = 0
      End
      Begin Tables =
         Begin Table = "OutgoingRegisters"
            Begin Extent =
               Top = 6
               Left = 38
               Bottom = 213
               Right = 345
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane =
   End
   Begin DataPane =
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane =
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1560
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'OutgoingView'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'OutgoingView'
GO
USE [master]
GO
ALTER DATABASE [InterwayDocs] SET  READ_WRITE 
GO
