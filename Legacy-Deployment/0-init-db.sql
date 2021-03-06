USE [master]
GO
/****** Object:  Database [ArollHiTech]    Script Date: 16/05/2022 13:50:23 ******/
IF NOT EXISTS (SELECT name FROM sys.databases WHERE name = N'ArollHiTech')
BEGIN
CREATE DATABASE [ArollHiTech]
END
GO
ALTER DATABASE [ArollHiTech] SET COMPATIBILITY_LEVEL = 140
GO

ALTER DATABASE [ArollHiTech] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [ArollHiTech] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [ArollHiTech] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [ArollHiTech] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [ArollHiTech] SET ARITHABORT OFF 
GO
ALTER DATABASE [ArollHiTech] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [ArollHiTech] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [ArollHiTech] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [ArollHiTech] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [ArollHiTech] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [ArollHiTech] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [ArollHiTech] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [ArollHiTech] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [ArollHiTech] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [ArollHiTech] SET  DISABLE_BROKER 
GO
ALTER DATABASE [ArollHiTech] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [ArollHiTech] SET RECOVERY SIMPLE
GO
USE [ArollHiTech]
GO
/****** Object:  Table [dbo].[Products]    Script Date: 16/05/2022 13:50:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Products]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Products](
	[ProductId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](500) NOT NULL,
	[CategoryId] [int] NOT NULL,
	[Description] [nvarchar](max) NULL,
	[UnitPrice] [money] NOT NULL,
	[Stock] [int] NOT NULL,
 CONSTRAINT [PK_Products] PRIMARY KEY CLUSTERED 
(
	[ProductId] ASC
)
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[Categories]    Script Date: 16/05/2022 13:50:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Categories]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Categories](
	[CategoryId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK_Categories] PRIMARY KEY CLUSTERED 
(
	[CategoryId] ASC
)
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[Customers]    Script Date: 16/05/2022 13:50:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Customers]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Customers](
	[CustomerId] [int] IDENTITY(1,1) NOT NULL,
	[Username] [nvarchar](500) NOT NULL,
 CONSTRAINT [PK_Customers] PRIMARY KEY CLUSTERED 
(
	[CustomerId] ASC
)
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[Orders]    Script Date: 16/05/2022 13:50:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Orders]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Orders](
	[OrderId] [int] IDENTITY(1,1) NOT NULL,
	[CustomerId] [int] NOT NULL,
	[DeliveryAddress] [nvarchar](500) NOT NULL,
	[PaymentMethod] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Orders] PRIMARY KEY CLUSTERED 
(
	[OrderId] ASC
)
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[OrderLines]    Script Date: 16/05/2022 13:50:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[OrderLines]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[OrderLines](
	[OrderId] [int] NOT NULL,
	[ProductId] [int] NOT NULL,
	[Quantity] [int] NOT NULL,
 CONSTRAINT [PK_OrderLines] PRIMARY KEY CLUSTERED 
(
	[OrderId] ASC,
	[ProductId] ASC
)
) ON [PRIMARY]
END
GO
/****** Object:  View [dbo].[CustomerOrders]    Script Date: 16/05/2022 13:50:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[CustomerOrders]'))
EXEC dbo.sp_executesql @statement = N'CREATE VIEW [dbo].[CustomerOrders] AS
(
    SELECT c.CustomerId, c.Username, o.OrderId, o.DeliveryAddress, o.PaymentMethod
        , p.ProductId, p.Name ProductName, cat.Name CategoryName, p.UnitPrice, ol.Quantity, p.UnitPrice * ol.Quantity TotalPrice
    FROM Customers c
    INNER JOIN Orders o ON o.CustomerId = c.CustomerId
    INNER JOIN OrderLines ol ON ol.OrderId = o.OrderId
    INNER JOIN Products p ON p.ProductId = ol.ProductId
    INNER JOIN Categories cat ON cat.CategoryId = p.CategoryId
)' 
GO
/****** Object:  Table [dbo].[PaymentMethods]    Script Date: 16/05/2022 13:50:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[PaymentMethods]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[PaymentMethods](
	[PaymentMethod] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_PaymentMethods] PRIMARY KEY CLUSTERED 
(
	[PaymentMethod] ASC
)
) ON [PRIMARY]
END
GO
SET IDENTITY_INSERT [dbo].[Categories] ON 

INSERT [dbo].[Categories] ([CategoryId], [Name]) VALUES (1, N'Computers')
INSERT [dbo].[Categories] ([CategoryId], [Name]) VALUES (2, N'Phones')
INSERT [dbo].[Categories] ([CategoryId], [Name]) VALUES (3, N'TV')
INSERT [dbo].[Categories] ([CategoryId], [Name]) VALUES (4, N'Minitels')
INSERT [dbo].[Categories] ([CategoryId], [Name]) VALUES (5, N'Cameras')
INSERT [dbo].[Categories] ([CategoryId], [Name]) VALUES (6, N'Audio')
INSERT [dbo].[Categories] ([CategoryId], [Name]) VALUES (7, N'Accessories')
INSERT [dbo].[Categories] ([CategoryId], [Name]) VALUES (8, N'DVD and Blu-rays')
SET IDENTITY_INSERT [dbo].[Categories] OFF
GO
SET IDENTITY_INSERT [dbo].[Customers] ON 

INSERT [dbo].[Customers] ([CustomerId], [Username]) VALUES (1, N'IamSauron')
SET IDENTITY_INSERT [dbo].[Customers] OFF
GO
INSERT [dbo].[OrderLines] ([OrderId], [ProductId], [Quantity]) VALUES (1, 5, 1)
INSERT [dbo].[OrderLines] ([OrderId], [ProductId], [Quantity]) VALUES (1, 6, 1)
GO
SET IDENTITY_INSERT [dbo].[Orders] ON 

INSERT [dbo].[Orders] ([OrderId], [CustomerId], [DeliveryAddress], [PaymentMethod]) VALUES (1, 1, N'Dol Guldur, Mordor, Middle Earth', N'Gold')
SET IDENTITY_INSERT [dbo].[Orders] OFF
GO
INSERT [dbo].[PaymentMethods] ([PaymentMethod]) VALUES (N'Gold')
GO
SET IDENTITY_INSERT [dbo].[Products] ON 

INSERT [dbo].[Products] ([ProductId], [Name], [CategoryId], [Description], [UnitPrice], [Stock]) VALUES (2, N'Minitel 5 Matra', 4, N'Pour avoir ses notes de bac', 200.0000, 2198)
INSERT [dbo].[Products] ([ProductId], [Name], [CategoryId], [Description], [UnitPrice], [Stock]) VALUES (3, N'Minitel 1b Telic Alcatel', 4, N'Pour consulter les horaires de train', 180.0000, 412)
INSERT [dbo].[Products] ([ProductId], [Name], [CategoryId], [Description], [UnitPrice], [Stock]) VALUES (5, N'Coffret le Seigneur des Anneaux La trilogie', 8, N'https://fr.wikipedia.org/wiki/Le_Seigneur_des_anneaux', 89.9900, 561)
INSERT [dbo].[Products] ([ProductId], [Name], [CategoryId], [Description], [UnitPrice], [Stock]) VALUES (6, N'Télé avec lecteur Blu-ray intégré', 3, NULL, 390.0000, 3)
SET IDENTITY_INSERT [dbo].[Products] OFF
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UIX_Customers_Username]    Script Date: 16/05/2022 13:50:23 ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[Customers]') AND name = N'UIX_Customers_Username')
CREATE UNIQUE NONCLUSTERED INDEX [UIX_Customers_Username] ON [dbo].[Customers]
(
	[Username] ASC
)
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_OrderLines_Quantity]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[OrderLines] ADD  CONSTRAINT [DF_OrderLines_Quantity]  DEFAULT ((1)) FOR [Quantity]
END
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_OrderLines_Orders]') AND parent_object_id = OBJECT_ID(N'[dbo].[OrderLines]'))
ALTER TABLE [dbo].[OrderLines]  WITH CHECK ADD  CONSTRAINT [FK_OrderLines_Orders] FOREIGN KEY([OrderId])
REFERENCES [dbo].[Orders] ([OrderId])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_OrderLines_Orders]') AND parent_object_id = OBJECT_ID(N'[dbo].[OrderLines]'))
ALTER TABLE [dbo].[OrderLines] CHECK CONSTRAINT [FK_OrderLines_Orders]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_OrderLines_Products]') AND parent_object_id = OBJECT_ID(N'[dbo].[OrderLines]'))
ALTER TABLE [dbo].[OrderLines]  WITH CHECK ADD  CONSTRAINT [FK_OrderLines_Products] FOREIGN KEY([ProductId])
REFERENCES [dbo].[Products] ([ProductId])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_OrderLines_Products]') AND parent_object_id = OBJECT_ID(N'[dbo].[OrderLines]'))
ALTER TABLE [dbo].[OrderLines] CHECK CONSTRAINT [FK_OrderLines_Products]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Orders_Customers]') AND parent_object_id = OBJECT_ID(N'[dbo].[Orders]'))
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_Orders_Customers] FOREIGN KEY([CustomerId])
REFERENCES [dbo].[Customers] ([CustomerId])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Orders_Customers]') AND parent_object_id = OBJECT_ID(N'[dbo].[Orders]'))
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_Orders_Customers]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Orders_PaymentMethods]') AND parent_object_id = OBJECT_ID(N'[dbo].[Orders]'))
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_Orders_PaymentMethods] FOREIGN KEY([PaymentMethod])
REFERENCES [dbo].[PaymentMethods] ([PaymentMethod])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Orders_PaymentMethods]') AND parent_object_id = OBJECT_ID(N'[dbo].[Orders]'))
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_Orders_PaymentMethods]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Products_Categories]') AND parent_object_id = OBJECT_ID(N'[dbo].[Products]'))
ALTER TABLE [dbo].[Products]  WITH CHECK ADD  CONSTRAINT [FK_Products_Categories] FOREIGN KEY([CategoryId])
REFERENCES [dbo].[Categories] ([CategoryId])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Products_Categories]') AND parent_object_id = OBJECT_ID(N'[dbo].[Products]'))
ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [FK_Products_Categories]
GO
USE [master]
GO
ALTER DATABASE [ArollHiTech] SET  READ_WRITE 
GO
