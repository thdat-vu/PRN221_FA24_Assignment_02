USE [master]
GO
/****** Object:  Database [BookManagement]    Script Date: 11/2/2024 11:17:59 PM ******/
CREATE DATABASE [BookManagement]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'BookManagement', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\BookManagement.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'BookManagement_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\BookManagement_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [BookManagement] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [BookManagement].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [BookManagement] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [BookManagement] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [BookManagement] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [BookManagement] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [BookManagement] SET ARITHABORT OFF 
GO
ALTER DATABASE [BookManagement] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [BookManagement] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [BookManagement] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [BookManagement] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [BookManagement] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [BookManagement] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [BookManagement] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [BookManagement] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [BookManagement] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [BookManagement] SET  DISABLE_BROKER 
GO
ALTER DATABASE [BookManagement] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [BookManagement] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [BookManagement] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [BookManagement] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [BookManagement] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [BookManagement] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [BookManagement] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [BookManagement] SET RECOVERY FULL 
GO
ALTER DATABASE [BookManagement] SET  MULTI_USER 
GO
ALTER DATABASE [BookManagement] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [BookManagement] SET DB_CHAINING OFF 
GO
ALTER DATABASE [BookManagement] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [BookManagement] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [BookManagement] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [BookManagement] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'BookManagement', N'ON'
GO
ALTER DATABASE [BookManagement] SET QUERY_STORE = OFF
GO
USE [BookManagement]
GO
/****** Object:  Table [dbo].[Account]    Script Date: 11/2/2024 11:18:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Account](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Username] [nvarchar](50) NOT NULL,
	[Password] [nvarchar](255) NOT NULL,
	[Role] [nvarchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Book]    Script Date: 11/2/2024 11:18:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Book](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](100) NOT NULL,
	[Author] [nvarchar](100) NOT NULL,
	[CategoryId] [int] NOT NULL,
	[Price] [decimal](18, 2) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Category]    Script Date: 11/2/2024 11:18:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Order]    Script Date: 11/2/2024 11:18:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[AccountId] [int] NOT NULL,
	[OrderDate] [datetime] NOT NULL,
	[TotalAmount] [decimal](18, 2) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderDetail]    Script Date: 11/2/2024 11:18:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderDetail](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[OrderId] [int] NOT NULL,
	[BookId] [int] NOT NULL,
	[Quantity] [int] NOT NULL,
	[Price] [decimal](18, 2) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Account] ON 

INSERT [dbo].[Account] ([Id], [Username], [Password], [Role]) VALUES (1, N'admin', N'password123', N'Admin')
INSERT [dbo].[Account] ([Id], [Username], [Password], [Role]) VALUES (2, N'user1', N'password123', N'User')
INSERT [dbo].[Account] ([Id], [Username], [Password], [Role]) VALUES (3, N'user2', N'password123', N'User')
SET IDENTITY_INSERT [dbo].[Account] OFF
GO
SET IDENTITY_INSERT [dbo].[Book] ON 

INSERT [dbo].[Book] ([Id], [Title], [Author], [CategoryId], [Price]) VALUES (1, N'The Great Gatsby', N'F. Scott Fitzgerald', 1, CAST(30000.00 AS Decimal(18, 2)))
INSERT [dbo].[Book] ([Id], [Title], [Author], [CategoryId], [Price]) VALUES (2, N'A Brief History of Time', N'Stephen Hawking', 4, CAST(120000.00 AS Decimal(18, 2)))
INSERT [dbo].[Book] ([Id], [Title], [Author], [CategoryId], [Price]) VALUES (3, N'Clean Code', N'Robert C. Martin', 3, CAST(900000.00 AS Decimal(18, 2)))
INSERT [dbo].[Book] ([Id], [Title], [Author], [CategoryId], [Price]) VALUES (4, N'Sapiens: A Brief History of Humankind', N'Yuval Noah Harari', 4, CAST(400000.00 AS Decimal(18, 2)))
INSERT [dbo].[Book] ([Id], [Title], [Author], [CategoryId], [Price]) VALUES (5, N'Nexus', N'Yuval Noah Hahari', 1, CAST(510000.00 AS Decimal(18, 2)))
INSERT [dbo].[Book] ([Id], [Title], [Author], [CategoryId], [Price]) VALUES (7, N'When Breath Becomes Air', N'Paul Kalanithi', 1, CAST(294000.00 AS Decimal(18, 2)))
INSERT [dbo].[Book] ([Id], [Title], [Author], [CategoryId], [Price]) VALUES (8, N'Dune', N'Frank Herbert', 1, CAST(40000.00 AS Decimal(18, 2)))
SET IDENTITY_INSERT [dbo].[Book] OFF
GO
SET IDENTITY_INSERT [dbo].[Category] ON 

INSERT [dbo].[Category] ([Id], [Name]) VALUES (1, N'Fiction')
INSERT [dbo].[Category] ([Id], [Name]) VALUES (2, N'Science')
INSERT [dbo].[Category] ([Id], [Name]) VALUES (3, N'Technology')
INSERT [dbo].[Category] ([Id], [Name]) VALUES (4, N'History')
SET IDENTITY_INSERT [dbo].[Category] OFF
GO
SET IDENTITY_INSERT [dbo].[Order] ON 

INSERT [dbo].[Order] ([Id], [AccountId], [OrderDate], [TotalAmount]) VALUES (1, 2, CAST(N'2024-10-17T13:57:48.753' AS DateTime), CAST(60000.00 AS Decimal(18, 2)))
INSERT [dbo].[Order] ([Id], [AccountId], [OrderDate], [TotalAmount]) VALUES (2, 3, CAST(N'2024-10-17T13:57:48.753' AS DateTime), CAST(1800000.00 AS Decimal(18, 2)))
INSERT [dbo].[Order] ([Id], [AccountId], [OrderDate], [TotalAmount]) VALUES (3, 2, CAST(N'2024-10-30T06:34:28.513' AS DateTime), CAST(5400000.00 AS Decimal(18, 2)))
INSERT [dbo].[Order] ([Id], [AccountId], [OrderDate], [TotalAmount]) VALUES (5, 2, CAST(N'2024-10-30T16:23:51.207' AS DateTime), CAST(240000.00 AS Decimal(18, 2)))
INSERT [dbo].[Order] ([Id], [AccountId], [OrderDate], [TotalAmount]) VALUES (6, 2, CAST(N'2024-10-30T16:36:50.503' AS DateTime), CAST(240000.00 AS Decimal(18, 2)))
INSERT [dbo].[Order] ([Id], [AccountId], [OrderDate], [TotalAmount]) VALUES (7, 2, CAST(N'2024-10-30T16:54:45.863' AS DateTime), CAST(150000.00 AS Decimal(18, 2)))
INSERT [dbo].[Order] ([Id], [AccountId], [OrderDate], [TotalAmount]) VALUES (8, 2, CAST(N'2024-10-30T20:37:15.970' AS DateTime), CAST(1902000.00 AS Decimal(18, 2)))
SET IDENTITY_INSERT [dbo].[Order] OFF
GO
SET IDENTITY_INSERT [dbo].[OrderDetail] ON 

INSERT [dbo].[OrderDetail] ([Id], [OrderId], [BookId], [Quantity], [Price]) VALUES (1, 1, 1, 2, CAST(30000.00 AS Decimal(18, 2)))
INSERT [dbo].[OrderDetail] ([Id], [OrderId], [BookId], [Quantity], [Price]) VALUES (3, 2, 3, 2, CAST(900000.00 AS Decimal(18, 2)))
INSERT [dbo].[OrderDetail] ([Id], [OrderId], [BookId], [Quantity], [Price]) VALUES (4, 3, 2, 6, CAST(900000.00 AS Decimal(18, 2)))
INSERT [dbo].[OrderDetail] ([Id], [OrderId], [BookId], [Quantity], [Price]) VALUES (6, 5, 2, 2, CAST(120000.00 AS Decimal(18, 2)))
INSERT [dbo].[OrderDetail] ([Id], [OrderId], [BookId], [Quantity], [Price]) VALUES (7, 6, 2, 2, CAST(120000.00 AS Decimal(18, 2)))
INSERT [dbo].[OrderDetail] ([Id], [OrderId], [BookId], [Quantity], [Price]) VALUES (8, 7, 1, 5, CAST(30000.00 AS Decimal(18, 2)))
INSERT [dbo].[OrderDetail] ([Id], [OrderId], [BookId], [Quantity], [Price]) VALUES (10, 8, 5, 2, CAST(510000.00 AS Decimal(18, 2)))
INSERT [dbo].[OrderDetail] ([Id], [OrderId], [BookId], [Quantity], [Price]) VALUES (11, 8, 7, 3, CAST(294000.00 AS Decimal(18, 2)))
SET IDENTITY_INSERT [dbo].[OrderDetail] OFF
GO
ALTER TABLE [dbo].[Book]  WITH CHECK ADD  CONSTRAINT [FK_Book_Category] FOREIGN KEY([CategoryId])
REFERENCES [dbo].[Category] ([Id])
GO
ALTER TABLE [dbo].[Book] CHECK CONSTRAINT [FK_Book_Category]
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_Order_Account] FOREIGN KEY([AccountId])
REFERENCES [dbo].[Account] ([Id])
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_Order_Account]
GO
ALTER TABLE [dbo].[OrderDetail]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetail_Book] FOREIGN KEY([BookId])
REFERENCES [dbo].[Book] ([Id])
GO
ALTER TABLE [dbo].[OrderDetail] CHECK CONSTRAINT [FK_OrderDetail_Book]
GO
ALTER TABLE [dbo].[OrderDetail]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetail_Order] FOREIGN KEY([OrderId])
REFERENCES [dbo].[Order] ([Id])
GO
ALTER TABLE [dbo].[OrderDetail] CHECK CONSTRAINT [FK_OrderDetail_Order]
GO
USE [master]
GO
ALTER DATABASE [BookManagement] SET  READ_WRITE 
GO
