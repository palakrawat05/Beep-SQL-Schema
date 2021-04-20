USE [BeepDB]
GO

/****** Object:  Database [BeepDB]    Script Date: 3/24/2021 7:39:22 PM ******/
CREATE DATABASE [BeepDB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'BeepDB', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\BeepDB.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'BeepDB_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\BeepDB_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO

IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [BeepDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO

ALTER DATABASE [BeepDB] SET ANSI_NULL_DEFAULT OFF 
GO

ALTER DATABASE [BeepDB] SET ANSI_NULLS OFF 
GO

ALTER DATABASE [BeepDB] SET ANSI_PADDING OFF 
GO

ALTER DATABASE [BeepDB] SET ANSI_WARNINGS OFF 
GO

ALTER DATABASE [BeepDB] SET ARITHABORT OFF 
GO

ALTER DATABASE [BeepDB] SET AUTO_CLOSE OFF 
GO

ALTER DATABASE [BeepDB] SET AUTO_SHRINK OFF 
GO

ALTER DATABASE [BeepDB] SET AUTO_UPDATE_STATISTICS ON 
GO

ALTER DATABASE [BeepDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO

ALTER DATABASE [BeepDB] SET CURSOR_DEFAULT  GLOBAL 
GO

ALTER DATABASE [BeepDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO

ALTER DATABASE [BeepDB] SET NUMERIC_ROUNDABORT OFF 
GO

ALTER DATABASE [BeepDB] SET QUOTED_IDENTIFIER OFF 
GO

ALTER DATABASE [BeepDB] SET RECURSIVE_TRIGGERS OFF 
GO

ALTER DATABASE [BeepDB] SET  DISABLE_BROKER 
GO

ALTER DATABASE [BeepDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO

ALTER DATABASE [BeepDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO

ALTER DATABASE [BeepDB] SET TRUSTWORTHY OFF 
GO

ALTER DATABASE [BeepDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO

ALTER DATABASE [BeepDB] SET PARAMETERIZATION SIMPLE 
GO

ALTER DATABASE [BeepDB] SET READ_COMMITTED_SNAPSHOT OFF 
GO

ALTER DATABASE [BeepDB] SET HONOR_BROKER_PRIORITY OFF 
GO

ALTER DATABASE [BeepDB] SET RECOVERY FULL 
GO

ALTER DATABASE [BeepDB] SET  MULTI_USER 
GO

ALTER DATABASE [BeepDB] SET PAGE_VERIFY CHECKSUM  
GO

ALTER DATABASE [BeepDB] SET DB_CHAINING OFF 
GO

ALTER DATABASE [BeepDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO

ALTER DATABASE [BeepDB] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO

ALTER DATABASE [BeepDB] SET DELAYED_DURABILITY = DISABLED 
GO

ALTER DATABASE [BeepDB] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO

ALTER DATABASE [BeepDB] SET QUERY_STORE = OFF
GO

ALTER DATABASE [BeepDB] SET  READ_WRITE 
GO

GO

/****** Object:  Table [dbo].[cart]    Script Date: 3/24/2021 7:42:37 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[cart](
	[ID] [int] NOT NULL,
	[CART_NO] [int] NOT NULL,
	[CUSTOMER_ID] [int] NOT NULL,
	[PRODUCT_NAME] [varchar](20) NULL,
	[PRODUCT_ID] [varchar](20) NULL,
	[sku] [varchar](20) NULL,
	[price] [smallmoney] NULL,
	[quantity] [varchar](20) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[cart]  WITH CHECK ADD  CONSTRAINT [FK_customer_id] FOREIGN KEY([CUSTOMER_ID])
REFERENCES [dbo].[customer] ([Customer_Id])
GO

ALTER TABLE [dbo].[cart] CHECK CONSTRAINT [FK_customer_id]
GO

GO

/****** Object:  Table [dbo].[category]    Script Date: 3/24/2021 7:44:23 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[category](
	[catergory_id] [int] NOT NULL,
	[category_name] [varchar](20) NULL,
	[description] [varchar](20) NULL,
PRIMARY KEY CLUSTERED 
(
	[catergory_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

GO

/****** Object:  Table [dbo].[customer]    Script Date: 3/24/2021 7:45:24 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[customer](
	[Customer_Id] [int] IDENTITY(1,1) NOT NULL,
	[Email] [varchar](40) NOT NULL,
	[Name] [varchar](40) NOT NULL,
	[PhoneNumber] [varchar](20) NOT NULL,
	[Billing_Address] [varchar](40) NOT NULL,
	[Default_address] [varchar](40) NULL,
	[Country] [varchar](20) NOT NULL,
	[password_user] [varchar](20) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Customer_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[Email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO


GO

/****** Object:  Table [dbo].[order_confirmation]    Script Date: 3/24/2021 7:45:50 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[order_confirmation](
	[order_id] [int] NOT NULL,
	[customer_id] [int] NOT NULL,
	[product_id] [int] NOT NULL,
	[order_date_time] [datetime] NOT NULL,
	[ship_date] [date] NOT NULL,
	[ship_address] [varchar](20) NOT NULL,
	[billing_address] [varchar](20) NOT NULL,
	[total_bill] [smallmoney] NULL,
	[transaction_number] [int] NULL,
	[payment_mode] [varchar](20) NOT NULL
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[order_confirmation]  WITH CHECK ADD  CONSTRAINT [fk_customer_id_oc] FOREIGN KEY([customer_id])
REFERENCES [dbo].[customer] ([Customer_Id])
GO

ALTER TABLE [dbo].[order_confirmation] CHECK CONSTRAINT [fk_customer_id_oc]
GO

ALTER TABLE [dbo].[order_confirmation]  WITH CHECK ADD  CONSTRAINT [fk_order_id_od] FOREIGN KEY([order_id])
REFERENCES [dbo].[order_detail] ([order_id])
GO

ALTER TABLE [dbo].[order_confirmation] CHECK CONSTRAINT [fk_order_id_od]
GO



/****** Object:  Table [dbo].[order_detail]    Script Date: 3/24/2021 7:46:29 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[order_detail](
	[order_id] [int] IDENTITY(100000,1) NOT NULL,
	[order_number] [int] NOT NULL,
	[customer_id] [int] NOT NULL,
	[product_id] [int] NOT NULL,
	[price] [smallmoney] NOT NULL,
	[quantity] [int] NOT NULL,
	[sku] [varchar](20) NOT NULL,
	[cart_id] [int] NOT NULL,
	[total] [smallmoney] NULL,
PRIMARY KEY CLUSTERED 
(
	[order_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[order_detail]  WITH CHECK ADD  CONSTRAINT [fk_cart_no_od] FOREIGN KEY([cart_id])
REFERENCES [dbo].[cart] ([ID])
GO

ALTER TABLE [dbo].[order_detail] CHECK CONSTRAINT [fk_cart_no_od]
GO

ALTER TABLE [dbo].[order_detail]  WITH CHECK ADD  CONSTRAINT [fk_customer_id_od] FOREIGN KEY([customer_id])
REFERENCES [dbo].[customer] ([Customer_Id])
GO

ALTER TABLE [dbo].[order_detail] CHECK CONSTRAINT [fk_customer_id_od]
GO

ALTER TABLE [dbo].[order_detail]  WITH CHECK ADD  CONSTRAINT [fk_product_id_od] FOREIGN KEY([product_id])
REFERENCES [dbo].[product] ([product_id])
GO

ALTER TABLE [dbo].[order_detail] CHECK CONSTRAINT [fk_product_id_od]
GO

/****** Object:  Table [dbo].[product]    Script Date: 3/24/2021 7:46:50 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[product](
	[product_id] [int] NOT NULL,
	[sku] [varchar](20) NOT NULL,
	[product_name] [varchar](20) NOT NULL,
	[price] [smallmoney] NULL,
	[Description_p] [varchar](20) NULL,
	[image] [varchar](20) NULL,
	[stock] [int] NOT NULL,
	[catergory_id] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[product_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[product]  WITH CHECK ADD  CONSTRAINT [fk_catergory_id] FOREIGN KEY([catergory_id])
REFERENCES [dbo].[category] ([catergory_id])
GO

ALTER TABLE [dbo].[product] CHECK CONSTRAINT [fk_catergory_id]
GO



