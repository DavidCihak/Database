USE [master]
GO
/****** Object:  Database [PV]    Script Date: 07.01.2022 11:53:56 ******/
CREATE DATABASE [PV]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'PV', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\PV.mdf' , SIZE = 5120KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'PV_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\PV_log.ldf' , SIZE = 2048KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [PV] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [PV].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [PV] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [PV] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [PV] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [PV] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [PV] SET ARITHABORT OFF 
GO
ALTER DATABASE [PV] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [PV] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [PV] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [PV] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [PV] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [PV] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [PV] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [PV] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [PV] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [PV] SET  DISABLE_BROKER 
GO
ALTER DATABASE [PV] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [PV] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [PV] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [PV] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [PV] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [PV] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [PV] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [PV] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [PV] SET  MULTI_USER 
GO
ALTER DATABASE [PV] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [PV] SET DB_CHAINING OFF 
GO
ALTER DATABASE [PV] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [PV] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [PV] SET DELAYED_DURABILITY = DISABLED 
GO
USE [PV]
GO
/****** Object:  User [user]    Script Date: 07.01.2022 11:53:56 ******/
CREATE USER [user] WITHOUT LOGIN WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [student]    Script Date: 07.01.2022 11:53:56 ******/
CREATE USER [student] FOR LOGIN [student] WITH DEFAULT_SCHEMA=[student]
GO
/****** Object:  User [skola]    Script Date: 07.01.2022 11:53:56 ******/
CREATE USER [skola] WITHOUT LOGIN WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [app1user]    Script Date: 07.01.2022 11:53:56 ******/
CREATE USER [app1user] WITHOUT LOGIN WITH DEFAULT_SCHEMA=[dbo]
GO
ALTER ROLE [db_owner] ADD MEMBER [user]
GO
ALTER ROLE [db_owner] ADD MEMBER [student]
GO
ALTER ROLE [db_owner] ADD MEMBER [skola]
GO
ALTER ROLE [db_owner] ADD MEMBER [app1user]
GO
/****** Object:  Schema [student]    Script Date: 07.01.2022 11:53:56 ******/
CREATE SCHEMA [student]
GO
/****** Object:  Table [dbo].[addresses]    Script Date: 07.01.2022 11:53:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[addresses](
	[cus_id] [int] NOT NULL,
	[street] [varchar](30) NOT NULL,
	[city] [varchar](30) NOT NULL,
	[country] [varchar](30) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[cus_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[customers]    Script Date: 07.01.2022 11:53:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[customers](
	[id_cus] [int] NOT NULL,
	[fullname] [nvarchar](60) NOT NULL,
	[gender] [varchar](10) NOT NULL,
	[phone_numb] [int] NOT NULL,
	[email] [nvarchar](40) NOT NULL,
	[pi_numb] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id_cus] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[orders]    Script Date: 07.01.2022 11:53:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[orders](
	[id_ord] [int] IDENTITY(1,1) NOT NULL,
	[ord_date] [date] NOT NULL,
	[done] [bit] NOT NULL,
	[done_date] [date] NULL,
	[id_cus] [int] NULL,
	[id_prod] [int] NULL,
	[number_of_products] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id_ord] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[products]    Script Date: 07.01.2022 11:53:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[products](
	[id_prod] [int] NOT NULL,
	[name] [varchar](100) NOT NULL,
	[producer_brand] [varchar](100) NOT NULL,
	[expiration_date] [date] NOT NULL,
	[price] [float] NOT NULL,
	[storage_count] [int] NOT NULL,
	[sn] [char](12) NULL,
PRIMARY KEY CLUSTERED 
(
	[id_prod] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[reviews]    Script Date: 07.01.2022 11:53:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[reviews](
	[id_rev] [int] NOT NULL,
	[reviewer_name] [varchar](255) NULL,
	[content] [varchar](255) NULL,
	[rating_stars] [int] NULL,
	[published_date] [datetime] NULL,
	[id_prod] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id_rev] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[addresses] ([cus_id], [street], [city], [country]) VALUES (1, N'Holeckova', N'Prague', N'CZ')
INSERT [dbo].[addresses] ([cus_id], [street], [city], [country]) VALUES (2, N'Karoliny Svetle', N'Prague', N'CZ')
INSERT [dbo].[addresses] ([cus_id], [street], [city], [country]) VALUES (3, N'Parizska', N'Prague', N'CZ')
INSERT [dbo].[addresses] ([cus_id], [street], [city], [country]) VALUES (4, N'Masarykova', N'Brno', N'CZ')
INSERT [dbo].[addresses] ([cus_id], [street], [city], [country]) VALUES (5, N'Polni', N'Brno', N'CZ')
INSERT [dbo].[customers] ([id_cus], [fullname], [gender], [phone_numb], [email], [pi_numb]) VALUES (1, N'David Cihak', N'male', 777777777, N'cihak@spsejecna.cz', 656565656)
INSERT [dbo].[customers] ([id_cus], [fullname], [gender], [phone_numb], [email], [pi_numb]) VALUES (2, N'Eliska Cerna', N'female', 666666666, N'cerna@spsejecna.cz', 123565656)
INSERT [dbo].[customers] ([id_cus], [fullname], [gender], [phone_numb], [email], [pi_numb]) VALUES (3, N'Michaela Mysliveckova', N'female', 555555555, N'mysliveckova@spsejecna.cz', 321565656)
INSERT [dbo].[customers] ([id_cus], [fullname], [gender], [phone_numb], [email], [pi_numb]) VALUES (4, N'Filip Cermak', N'male', 444444444, N'cermak@spsejecna.cz', 659865656)
INSERT [dbo].[customers] ([id_cus], [fullname], [gender], [phone_numb], [email], [pi_numb]) VALUES (5, N'Sergei Bee', N'male', 333333333, N'bee@spsejecna.cz', 116565656)
SET IDENTITY_INSERT [dbo].[orders] ON 

INSERT [dbo].[orders] ([id_ord], [ord_date], [done], [done_date], [id_cus], [id_prod], [number_of_products]) VALUES (1, CAST(N'2022-01-04' AS Date), 1, CAST(N'2022-01-04' AS Date), 1, 1, 2)
INSERT [dbo].[orders] ([id_ord], [ord_date], [done], [done_date], [id_cus], [id_prod], [number_of_products]) VALUES (2, CAST(N'1905-07-12' AS Date), 0, NULL, 1, 2, 3)
INSERT [dbo].[orders] ([id_ord], [ord_date], [done], [done_date], [id_cus], [id_prod], [number_of_products]) VALUES (3, CAST(N'1905-07-09' AS Date), 1, CAST(N'1905-07-02' AS Date), 2, 3, 5)
INSERT [dbo].[orders] ([id_ord], [ord_date], [done], [done_date], [id_cus], [id_prod], [number_of_products]) VALUES (4, CAST(N'1905-06-21' AS Date), 1, CAST(N'1905-07-14' AS Date), 3, 4, 6)
INSERT [dbo].[orders] ([id_ord], [ord_date], [done], [done_date], [id_cus], [id_prod], [number_of_products]) VALUES (5, CAST(N'2022-01-04' AS Date), 0, NULL, 4, 5, 2)
INSERT [dbo].[orders] ([id_ord], [ord_date], [done], [done_date], [id_cus], [id_prod], [number_of_products]) VALUES (6, CAST(N'1905-06-27' AS Date), 1, CAST(N'1905-06-20' AS Date), 5, 6, 1)
INSERT [dbo].[orders] ([id_ord], [ord_date], [done], [done_date], [id_cus], [id_prod], [number_of_products]) VALUES (7, CAST(N'2022-01-04' AS Date), 1, CAST(N'2022-07-01' AS Date), 1, 2, 3)
SET IDENTITY_INSERT [dbo].[orders] OFF
INSERT [dbo].[products] ([id_prod], [name], [producer_brand], [expiration_date], [price], [storage_count], [sn]) VALUES (1, N'PeanutButter', N'Nutrend', CAST(N'2026-09-01' AS Date), 399.9, 50, N'3864736     ')
INSERT [dbo].[products] ([id_prod], [name], [producer_brand], [expiration_date], [price], [storage_count], [sn]) VALUES (2, N'Whey Protein', N'GymBean', CAST(N'2022-12-31' AS Date), 784.9, 27, N'38664634    ')
INSERT [dbo].[products] ([id_prod], [name], [producer_brand], [expiration_date], [price], [storage_count], [sn]) VALUES (3, N'Protein Pancakes', N'GymBean', CAST(N'2022-09-01' AS Date), 49.9, 20, N'649848      ')
INSERT [dbo].[products] ([id_prod], [name], [producer_brand], [expiration_date], [price], [storage_count], [sn]) VALUES (4, N'Nutella', N'Fererro', CAST(N'2023-03-05' AS Date), 69.9, 10, N'3545375     ')
INSERT [dbo].[products] ([id_prod], [name], [producer_brand], [expiration_date], [price], [storage_count], [sn]) VALUES (5, N'Food for dogs', N'Bifid', CAST(N'2025-09-08' AS Date), 1200, 30, N'5645638     ')
INSERT [dbo].[products] ([id_prod], [name], [producer_brand], [expiration_date], [price], [storage_count], [sn]) VALUES (6, N'Oreo chockolate', N'Milka', CAST(N'2022-05-01' AS Date), 25.9, 50, N'5674657     ')
INSERT [dbo].[reviews] ([id_rev], [reviewer_name], [content], [rating_stars], [published_date], [id_prod]) VALUES (1, N'boss48', N'very nice taste', 5, CAST(N'2022-01-04 11:31:47.270' AS DateTime), 1)
INSERT [dbo].[reviews] ([id_rev], [reviewer_name], [content], [rating_stars], [published_date], [id_prod]) VALUES (2, N'MenT98', N'not bad taste', 4, CAST(N'2021-06-02 09:13:00.000' AS DateTime), 1)
INSERT [dbo].[reviews] ([id_rev], [reviewer_name], [content], [rating_stars], [published_date], [id_prod]) VALUES (3, N'user8', N'my dog vomited', 1, CAST(N'2021-09-03 04:14:00.000' AS DateTime), 5)
INSERT [dbo].[reviews] ([id_rev], [reviewer_name], [content], [rating_stars], [published_date], [id_prod]) VALUES (4, N'habkpauh', N'nothin', 3, CAST(N'2021-01-02 11:14:00.000' AS DateTime), 2)
INSERT [dbo].[reviews] ([id_rev], [reviewer_name], [content], [rating_stars], [published_date], [id_prod]) VALUES (5, N'mortal', N'I like that', 4, CAST(N'2021-01-01 08:15:00.000' AS DateTime), 3)
INSERT [dbo].[reviews] ([id_rev], [reviewer_name], [content], [rating_stars], [published_date], [id_prod]) VALUES (6, N'gamer', N'After this I will be huge', 5, CAST(N'2021-10-04 07:16:00.000' AS DateTime), 4)
INSERT [dbo].[reviews] ([id_rev], [reviewer_name], [content], [rating_stars], [published_date], [id_prod]) VALUES (7, N'boss48', N'very nice taste', 5, CAST(N'2022-01-04 11:31:47.270' AS DateTime), 1)
SET ANSI_PADDING ON

GO
/****** Object:  Index [UQ__products__3214186D01D656BD]    Script Date: 07.01.2022 11:53:56 ******/
ALTER TABLE [dbo].[products] ADD UNIQUE NONCLUSTERED 
(
	[sn] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[addresses]  WITH CHECK ADD FOREIGN KEY([cus_id])
REFERENCES [dbo].[customers] ([id_cus])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[orders]  WITH CHECK ADD FOREIGN KEY([id_cus])
REFERENCES [dbo].[customers] ([id_cus])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[orders]  WITH CHECK ADD FOREIGN KEY([id_prod])
REFERENCES [dbo].[products] ([id_prod])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[reviews]  WITH CHECK ADD FOREIGN KEY([id_prod])
REFERENCES [dbo].[products] ([id_prod])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[customers]  WITH CHECK ADD CHECK  (([gender]='female' OR [gender]='male'))
GO
ALTER TABLE [dbo].[reviews]  WITH CHECK ADD CHECK  (([rating_stars]<=(5)))
GO
/****** Object:  StoredProcedure [dbo].[Objednani]    Script Date: 07.01.2022 11:53:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[Objednani]
@id_cus int,
@id_prod int,
@number_of_products int
as
begin
begin transaction tra
insert into orders(ord_date, done, done_date, id_cus, id_prod, number_of_products)
values (GETDATE(), 0 , NULL , @id_cus, @id_prod, @number_of_products)
update products set storage_count = storage_count - @number_of_products
where id_prod = @id_prod
commit
end





GO
USE [master]
GO
ALTER DATABASE [PV] SET  READ_WRITE 
GO
