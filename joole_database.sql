USE [master]
GO
/****** Object:  Database [Market_backend]    Script Date: 4/12/2019 8:23:33 PM ******/
IF NOT EXISTS (SELECT name FROM sys.databases WHERE name = N'Market_backend')
BEGIN
CREATE DATABASE [Market_backend]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Market_backend', FILENAME = N'/Users/weichen/Desktop/Market_backend.mdf' , SIZE = 5120KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'Market_backend_log', FILENAME = N'/Users/weichen/Desktop/Market_backend_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
END

GO
ALTER DATABASE [Market_backend] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Market_backend].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Market_backend] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Market_backend] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Market_backend] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Market_backend] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Market_backend] SET ARITHABORT OFF 
GO
ALTER DATABASE [Market_backend] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Market_backend] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Market_backend] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Market_backend] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Market_backend] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Market_backend] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Market_backend] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Market_backend] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Market_backend] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Market_backend] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Market_backend] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Market_backend] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Market_backend] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Market_backend] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Market_backend] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Market_backend] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Market_backend] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Market_backend] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Market_backend] SET  MULTI_USER 
GO
ALTER DATABASE [Market_backend] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Market_backend] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Market_backend] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Market_backend] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [Market_backend] SET DELAYED_DURABILITY = DISABLED 
GO
USE [Market_backend]
GO
/****** Object:  Table [dbo].[Attribute]    Script Date: 4/12/2019 8:23:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Attribute]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Attribute](
	[AttributeID] [bigint] NOT NULL,
	[AttributeName] [varchar](50) NOT NULL,
	[MinValue] [int] NOT NULL,
	[MaxValue] [bigint] NOT NULL,
	[AttributeTypeID] [int] NOT NULL,
	[SubCategoryID] [int] NOT NULL,
 CONSTRAINT [PK_Attribute] PRIMARY KEY CLUSTERED 
(
	[AttributeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[AttributeType]    Script Date: 4/12/2019 8:23:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AttributeType]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[AttributeType](
	[AttributeTypeID] [int] NOT NULL,
	[AttributeTypeName] [varchar](50) NOT NULL,
 CONSTRAINT [PK_AttributeType] PRIMARY KEY CLUSTERED 
(
	[AttributeTypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Buyer]    Script Date: 4/12/2019 8:23:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Buyer]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Buyer](
	[BuyerID] [int] NOT NULL,
	[Email] [varchar](50) NOT NULL,
	[Password] [varchar](50) NOT NULL,
	[FirstName] [varchar](50) NOT NULL,
	[LastName] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Buyer] PRIMARY KEY CLUSTERED 
(
	[BuyerID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Category]    Script Date: 4/12/2019 8:23:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Category]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Category](
	[CategoryID] [int] NOT NULL,
	[CategoryName] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Category] PRIMARY KEY CLUSTERED 
(
	[CategoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Manufacturer]    Script Date: 4/12/2019 8:23:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Manufacturer]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Manufacturer](
	[ManufacturerID] [int] NOT NULL,
	[Department] [varchar](50) NOT NULL,
	[Phone] [varchar](50) NOT NULL,
	[Email] [varchar](50) NOT NULL,
	[Web] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Manufacturer] PRIMARY KEY CLUSTERED 
(
	[ManufacturerID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Product]    Script Date: 4/12/2019 8:23:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Product]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Product](
	[ProductID] [bigint] NOT NULL,
	[ProductName] [varchar](50) NOT NULL,
	[ProductDescription] [varchar](200) NOT NULL,
	[ProductPrice] [money] NULL,
	[DocumentXML] [xml] NOT NULL,
	[AttributeXML] [xml] NOT NULL,
	[ManufacturerID] [int] NOT NULL,
	[SalesID] [int] NOT NULL,
	[SubCategoryID] [int] NOT NULL,
	[Details] [varchar](300) NOT NULL,
 CONSTRAINT [PK_Product] PRIMARY KEY CLUSTERED 
(
	[ProductID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Sales]    Script Date: 4/12/2019 8:23:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Sales]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Sales](
	[SalesID] [int] NOT NULL,
	[Name] [varchar](50) NOT NULL,
	[Phone] [varchar](50) NOT NULL,
	[Email] [varchar](50) NOT NULL,
	[Web] [varchar](50) NOT NULL,
	[ManufacturerID] [int] NOT NULL,
 CONSTRAINT [PK_Sales] PRIMARY KEY CLUSTERED 
(
	[SalesID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[SubCategory]    Script Date: 4/12/2019 8:23:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SubCategory]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[SubCategory](
	[SubCategoryID] [int] NOT NULL,
	[SubCategoryName] [varchar](50) NOT NULL,
	[CategoryID] [int] NOT NULL,
 CONSTRAINT [PK_SubCategory] PRIMARY KEY CLUSTERED 
(
	[SubCategoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Attribute_AttributeType]') AND parent_object_id = OBJECT_ID(N'[dbo].[Attribute]'))
ALTER TABLE [dbo].[Attribute]  WITH CHECK ADD  CONSTRAINT [FK_Attribute_AttributeType] FOREIGN KEY([AttributeTypeID])
REFERENCES [dbo].[AttributeType] ([AttributeTypeID])
ON UPDATE CASCADE
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Attribute_AttributeType]') AND parent_object_id = OBJECT_ID(N'[dbo].[Attribute]'))
ALTER TABLE [dbo].[Attribute] CHECK CONSTRAINT [FK_Attribute_AttributeType]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Attribute_SubCategory]') AND parent_object_id = OBJECT_ID(N'[dbo].[Attribute]'))
ALTER TABLE [dbo].[Attribute]  WITH CHECK ADD  CONSTRAINT [FK_Attribute_SubCategory] FOREIGN KEY([SubCategoryID])
REFERENCES [dbo].[SubCategory] ([SubCategoryID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Attribute_SubCategory]') AND parent_object_id = OBJECT_ID(N'[dbo].[Attribute]'))
ALTER TABLE [dbo].[Attribute] CHECK CONSTRAINT [FK_Attribute_SubCategory]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Product_Manufacturer]') AND parent_object_id = OBJECT_ID(N'[dbo].[Product]'))
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_Manufacturer] FOREIGN KEY([ManufacturerID])
REFERENCES [dbo].[Manufacturer] ([ManufacturerID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Product_Manufacturer]') AND parent_object_id = OBJECT_ID(N'[dbo].[Product]'))
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_Manufacturer]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Product_Sales]') AND parent_object_id = OBJECT_ID(N'[dbo].[Product]'))
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_Sales] FOREIGN KEY([SalesID])
REFERENCES [dbo].[Sales] ([SalesID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Product_Sales]') AND parent_object_id = OBJECT_ID(N'[dbo].[Product]'))
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_Sales]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Product_SubCategory]') AND parent_object_id = OBJECT_ID(N'[dbo].[Product]'))
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_SubCategory] FOREIGN KEY([SubCategoryID])
REFERENCES [dbo].[SubCategory] ([SubCategoryID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Product_SubCategory]') AND parent_object_id = OBJECT_ID(N'[dbo].[Product]'))
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_SubCategory]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Sales_Manufacturer]') AND parent_object_id = OBJECT_ID(N'[dbo].[Sales]'))
ALTER TABLE [dbo].[Sales]  WITH CHECK ADD  CONSTRAINT [FK_Sales_Manufacturer] FOREIGN KEY([ManufacturerID])
REFERENCES [dbo].[Manufacturer] ([ManufacturerID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Sales_Manufacturer]') AND parent_object_id = OBJECT_ID(N'[dbo].[Sales]'))
ALTER TABLE [dbo].[Sales] CHECK CONSTRAINT [FK_Sales_Manufacturer]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_SubCategory_Category]') AND parent_object_id = OBJECT_ID(N'[dbo].[SubCategory]'))
ALTER TABLE [dbo].[SubCategory]  WITH CHECK ADD  CONSTRAINT [FK_SubCategory_Category] FOREIGN KEY([CategoryID])
REFERENCES [dbo].[Category] ([CategoryID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_SubCategory_Category]') AND parent_object_id = OBJECT_ID(N'[dbo].[SubCategory]'))
ALTER TABLE [dbo].[SubCategory] CHECK CONSTRAINT [FK_SubCategory_Category]
GO
USE [master]
GO
ALTER DATABASE [Market_backend] SET  READ_WRITE 
GO