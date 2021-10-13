USE [Store]
GO
ALTER TABLE [dbo].[ShoppingSession] DROP CONSTRAINT [FK_ShoppingSession_Customer]
GO
ALTER TABLE [dbo].[Product] DROP CONSTRAINT [FK_Product_ProductType]
GO
ALTER TABLE [dbo].[OrderDetail] DROP CONSTRAINT [FK_OrderDetail_Product]
GO
ALTER TABLE [dbo].[OrderDetail] DROP CONSTRAINT [FK_OrderDetail_Order]
GO
ALTER TABLE [dbo].[Order] DROP CONSTRAINT [FK_Order_Customer]
GO
ALTER TABLE [dbo].[CartItem] DROP CONSTRAINT [FK_CartItem_ShoppingSession]
GO
ALTER TABLE [dbo].[CartItem] DROP CONSTRAINT [FK_CartItem_Product]
GO
/****** Object:  Table [dbo].[ShoppingSession]    Script Date: 13/10/2021 09:38:11 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ShoppingSession]') AND type in (N'U'))
DROP TABLE [dbo].[ShoppingSession]
GO
/****** Object:  Table [dbo].[Product]    Script Date: 13/10/2021 09:38:11 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Product]') AND type in (N'U'))
DROP TABLE [dbo].[Product]
GO
/****** Object:  Table [dbo].[OrderDetail]    Script Date: 13/10/2021 09:38:11 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[OrderDetail]') AND type in (N'U'))
DROP TABLE [dbo].[OrderDetail]
GO
/****** Object:  Table [dbo].[Order]    Script Date: 13/10/2021 09:38:11 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Order]') AND type in (N'U'))
DROP TABLE [dbo].[Order]
GO
/****** Object:  Table [dbo].[Customer]    Script Date: 13/10/2021 09:38:11 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Customer]') AND type in (N'U'))
DROP TABLE [dbo].[Customer]
GO
/****** Object:  Table [dbo].[Category]    Script Date: 13/10/2021 09:38:11 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Category]') AND type in (N'U'))
DROP TABLE [dbo].[Category]
GO
/****** Object:  Table [dbo].[CartItem]    Script Date: 13/10/2021 09:38:11 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[CartItem]') AND type in (N'U'))
DROP TABLE [dbo].[CartItem]
GO
USE [master]
GO
/****** Object:  Database [Store]    Script Date: 13/10/2021 09:38:11 ******/
DROP DATABASE [Store]
GO
/****** Object:  Database [Store]    Script Date: 13/10/2021 09:38:12 ******/
CREATE DATABASE [Store]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Store', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\Store.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Store_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\Store_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [Store] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Store].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Store] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Store] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Store] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Store] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Store] SET ARITHABORT OFF 
GO
ALTER DATABASE [Store] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Store] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Store] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Store] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Store] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Store] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Store] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Store] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Store] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Store] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Store] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Store] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Store] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Store] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Store] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Store] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Store] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Store] SET RECOVERY FULL 
GO
ALTER DATABASE [Store] SET  MULTI_USER 
GO
ALTER DATABASE [Store] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Store] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Store] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Store] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Store] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Store] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'Store', N'ON'
GO
ALTER DATABASE [Store] SET QUERY_STORE = OFF
GO
USE [Store]
GO
/****** Object:  Table [dbo].[CartItem]    Script Date: 13/10/2021 09:38:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CartItem](
	[id] [nvarchar](10) NOT NULL,
	[session_id] [nvarchar](10) NULL,
	[product_id] [nvarchar](10) NOT NULL,
	[quantity] [nvarchar](50) NULL,
 CONSTRAINT [PK_CartItem_1] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Category]    Script Date: 13/10/2021 09:38:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
	[id] [nvarchar](10) NOT NULL,
	[name] [nvarchar](50) NULL,
	[image] [nchar](10) NULL,
	[description] [nvarchar](max) NULL,
 CONSTRAINT [PK_ProductType] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Customer]    Script Date: 13/10/2021 09:38:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customer](
	[id] [nvarchar](10) NOT NULL,
	[username] [nvarchar](50) NULL,
	[password] [nvarchar](50) NULL,
	[first_name] [nvarchar](50) NULL,
	[last_name] [nvarchar](50) NULL,
	[telephone] [nvarchar](50) NULL,
	[address] [nchar](10) NULL,
	[email] [nvarchar](50) NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Order]    Script Date: 13/10/2021 09:38:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order](
	[id] [nvarchar](10) NOT NULL,
	[order_no] [nvarchar](50) NULL,
	[order_date] [date] NULL,
	[order_total] [int] NULL,
	[customer_id] [nvarchar](10) NOT NULL,
	[shipping_date] [date] NULL,
	[is_delivered] [bit] NULL,
 CONSTRAINT [PK_Order] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderDetail]    Script Date: 13/10/2021 09:38:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderDetail](
	[id] [nvarchar](10) NOT NULL,
	[product_id] [nvarchar](10) NULL,
	[product_quantity] [int] NULL,
	[product_price] [float] NULL,
	[order_id] [nvarchar](10) NULL,
	[subtotal] [int] NULL,
 CONSTRAINT [PK_Order_Details] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product]    Script Date: 13/10/2021 09:38:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[id] [nvarchar](10) NOT NULL,
	[name] [nvarchar](50) NULL,
	[quantity] [int] NULL,
	[price] [float] NULL,
	[image] [nvarchar](max) NULL,
	[description] [nvarchar](max) NULL,
	[category_id] [nvarchar](10) NULL,
 CONSTRAINT [PK_Product] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ShoppingSession]    Script Date: 13/10/2021 09:38:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ShoppingSession](
	[id] [nvarchar](10) NOT NULL,
	[user_id] [nvarchar](10) NULL,
	[total] [nvarchar](50) NULL,
 CONSTRAINT [PK_ShoppingSession] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[CartItem]  WITH CHECK ADD  CONSTRAINT [FK_CartItem_Product] FOREIGN KEY([product_id])
REFERENCES [dbo].[Product] ([id])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[CartItem] CHECK CONSTRAINT [FK_CartItem_Product]
GO
ALTER TABLE [dbo].[CartItem]  WITH CHECK ADD  CONSTRAINT [FK_CartItem_ShoppingSession] FOREIGN KEY([session_id])
REFERENCES [dbo].[ShoppingSession] ([id])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[CartItem] CHECK CONSTRAINT [FK_CartItem_ShoppingSession]
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_Order_Customer] FOREIGN KEY([customer_id])
REFERENCES [dbo].[Customer] ([id])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_Order_Customer]
GO
ALTER TABLE [dbo].[OrderDetail]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetail_Order] FOREIGN KEY([order_id])
REFERENCES [dbo].[Order] ([id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[OrderDetail] CHECK CONSTRAINT [FK_OrderDetail_Order]
GO
ALTER TABLE [dbo].[OrderDetail]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetail_Product] FOREIGN KEY([product_id])
REFERENCES [dbo].[Product] ([id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[OrderDetail] CHECK CONSTRAINT [FK_OrderDetail_Product]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_ProductType] FOREIGN KEY([category_id])
REFERENCES [dbo].[Category] ([id])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_ProductType]
GO
ALTER TABLE [dbo].[ShoppingSession]  WITH CHECK ADD  CONSTRAINT [FK_ShoppingSession_Customer] FOREIGN KEY([user_id])
REFERENCES [dbo].[Customer] ([id])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[ShoppingSession] CHECK CONSTRAINT [FK_ShoppingSession_Customer]
GO
USE [master]
GO
ALTER DATABASE [Store] SET  READ_WRITE 
GO
