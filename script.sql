USE [master]
GO
/****** Object:  Database [OnlineShop]    Script Date: 3/14/2024 2:20:46 PM ******/
CREATE DATABASE [OnlineShop]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'OnlineShop', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLSEVER\MSSQL\DATA\OnlineShop.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'OnlineShop_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLSEVER\MSSQL\DATA\OnlineShop_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [OnlineShop] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [OnlineShop].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [OnlineShop] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [OnlineShop] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [OnlineShop] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [OnlineShop] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [OnlineShop] SET ARITHABORT OFF 
GO
ALTER DATABASE [OnlineShop] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [OnlineShop] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [OnlineShop] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [OnlineShop] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [OnlineShop] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [OnlineShop] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [OnlineShop] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [OnlineShop] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [OnlineShop] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [OnlineShop] SET  DISABLE_BROKER 
GO
ALTER DATABASE [OnlineShop] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [OnlineShop] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [OnlineShop] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [OnlineShop] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [OnlineShop] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [OnlineShop] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [OnlineShop] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [OnlineShop] SET RECOVERY FULL 
GO
ALTER DATABASE [OnlineShop] SET  MULTI_USER 
GO
ALTER DATABASE [OnlineShop] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [OnlineShop] SET DB_CHAINING OFF 
GO
ALTER DATABASE [OnlineShop] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [OnlineShop] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [OnlineShop] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [OnlineShop] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'OnlineShop', N'ON'
GO
ALTER DATABASE [OnlineShop] SET QUERY_STORE = ON
GO
ALTER DATABASE [OnlineShop] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [OnlineShop]
GO
/****** Object:  Table [dbo].[Brands]    Script Date: 3/14/2024 2:20:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Brands](
	[brandID] [int] IDENTITY(1,1) NOT NULL,
	[brandName] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[brandID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Cart]    Script Date: 3/14/2024 2:20:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cart](
	[cartID] [int] IDENTITY(1,1) NOT NULL,
	[userID] [int] NULL,
	[productID] [int] NULL,
	[amount] [int] NULL,
	[price] [float] NULL,
PRIMARY KEY CLUSTERED 
(
	[cartID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Category]    Script Date: 3/14/2024 2:20:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
	[categoryID] [int] IDENTITY(1,1) NOT NULL,
	[categoryName] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[categoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderDetail]    Script Date: 3/14/2024 2:20:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderDetail](
	[orderDetailID] [int] IDENTITY(1,1) NOT NULL,
	[orderID] [int] NULL,
	[productID] [int] NULL,
	[price] [float] NULL,
	[quantity] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[orderDetailID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Orders]    Script Date: 3/14/2024 2:20:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orders](
	[orderID] [int] IDENTITY(1,1) NOT NULL,
	[userID] [int] NULL,
	[order_date] [date] NULL,
	[statusID] [int] NULL,
	[phone] [nvarchar](50) NULL,
	[addressShip] [nvarchar](50) NULL,
	[totalMoney] [float] NULL,
	[name] [nvarchar](50) NULL,
	[needToCreate] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[orderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Products]    Script Date: 3/14/2024 2:20:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Products](
	[productID] [int] IDENTITY(1,1) NOT NULL,
	[productName] [nvarchar](50) NULL,
	[productPrice] [float] NULL,
	[quantity] [int] NULL,
	[brandID] [int] NULL,
	[categoryID] [int] NULL,
	[images] [nvarchar](max) NULL,
	[productDetail] [nvarchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[productID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Reviews]    Script Date: 3/14/2024 2:20:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Reviews](
	[reviewID] [int] IDENTITY(1,1) NOT NULL,
	[userID] [int] NULL,
	[dateCreated] [date] NULL,
	[productID] [int] NULL,
	[reviewContent] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[reviewID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Roles]    Script Date: 3/14/2024 2:20:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Roles](
	[roleID] [int] IDENTITY(1,1) NOT NULL,
	[roleName] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[roleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Sliders]    Script Date: 3/14/2024 2:20:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Sliders](
	[sliderID] [int] IDENTITY(1,1) NOT NULL,
	[images] [nvarchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[sliderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Status]    Script Date: 3/14/2024 2:20:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Status](
	[statusID] [int] IDENTITY(1,1) NOT NULL,
	[statusName] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[statusID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 3/14/2024 2:20:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[userID] [int] IDENTITY(1,1) NOT NULL,
	[userName] [nvarchar](50) NULL,
	[email] [nvarchar](50) NOT NULL,
	[password] [nvarchar](50) NOT NULL,
	[roleID] [int] NULL,
	[defaultPhone] [nvarchar](255) NULL,
	[defaultAddress] [nvarchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[userID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Cart]  WITH CHECK ADD  CONSTRAINT [fk_cart_product] FOREIGN KEY([productID])
REFERENCES [dbo].[Products] ([productID])
GO
ALTER TABLE [dbo].[Cart] CHECK CONSTRAINT [fk_cart_product]
GO
ALTER TABLE [dbo].[Cart]  WITH CHECK ADD  CONSTRAINT [fk_cart_user] FOREIGN KEY([userID])
REFERENCES [dbo].[Users] ([userID])
GO
ALTER TABLE [dbo].[Cart] CHECK CONSTRAINT [fk_cart_user]
GO
ALTER TABLE [dbo].[OrderDetail]  WITH CHECK ADD  CONSTRAINT [fk_order] FOREIGN KEY([orderID])
REFERENCES [dbo].[Orders] ([orderID])
GO
ALTER TABLE [dbo].[OrderDetail] CHECK CONSTRAINT [fk_order]
GO
ALTER TABLE [dbo].[OrderDetail]  WITH CHECK ADD  CONSTRAINT [fk_productDetail] FOREIGN KEY([productID])
REFERENCES [dbo].[Products] ([productID])
GO
ALTER TABLE [dbo].[OrderDetail] CHECK CONSTRAINT [fk_productDetail]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [fk_statusID] FOREIGN KEY([statusID])
REFERENCES [dbo].[Status] ([statusID])
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [fk_statusID]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [fk_userID] FOREIGN KEY([userID])
REFERENCES [dbo].[Users] ([userID])
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [fk_userID]
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD  CONSTRAINT [fk_brandID] FOREIGN KEY([brandID])
REFERENCES [dbo].[Brands] ([brandID])
GO
ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [fk_brandID]
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD  CONSTRAINT [fk_categoryID] FOREIGN KEY([categoryID])
REFERENCES [dbo].[Category] ([categoryID])
GO
ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [fk_categoryID]
GO
ALTER TABLE [dbo].[Reviews]  WITH CHECK ADD  CONSTRAINT [fk_review_product] FOREIGN KEY([productID])
REFERENCES [dbo].[Products] ([productID])
GO
ALTER TABLE [dbo].[Reviews] CHECK CONSTRAINT [fk_review_product]
GO
ALTER TABLE [dbo].[Reviews]  WITH CHECK ADD  CONSTRAINT [fk_review_user] FOREIGN KEY([userID])
REFERENCES [dbo].[Users] ([userID])
GO
ALTER TABLE [dbo].[Reviews] CHECK CONSTRAINT [fk_review_user]
GO
ALTER TABLE [dbo].[Users]  WITH CHECK ADD  CONSTRAINT [fk_roleID] FOREIGN KEY([roleID])
REFERENCES [dbo].[Roles] ([roleID])
GO
ALTER TABLE [dbo].[Users] CHECK CONSTRAINT [fk_roleID]
GO
USE [master]
GO
ALTER DATABASE [OnlineShop] SET  READ_WRITE 
GO
