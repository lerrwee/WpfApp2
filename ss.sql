USE [MasterPolDB]
GO
/****** Object:  Table [dbo].[Material_type]    Script Date: 17.04.2025 15:58:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Material_type](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Material_type] [nvarchar](50) NOT NULL,
	[Prosent_braka] [float] NOT NULL,
 CONSTRAINT [PK_Material_type] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Material_type_Product]    Script Date: 17.04.2025 15:58:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Material_type_Product](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Material_type_id] [int] NOT NULL,
	[Product_id] [int] NOT NULL,
 CONSTRAINT [PK_Material_type_Product] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Partner]    Script Date: 17.04.2025 15:58:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Partner](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Partner_type_id] [int] NOT NULL,
	[Partner_name] [nvarchar](50) NOT NULL,
	[Familia_director] [nvarchar](50) NOT NULL,
	[Name_director] [nvarchar](50) NOT NULL,
	[Othestvo_director] [nvarchar](50) NOT NULL,
	[Email] [nvarchar](50) NOT NULL,
	[Telephone] [nvarchar](50) NOT NULL,
	[Adress] [nvarchar](150) NOT NULL,
	[Inn] [nvarchar](50) NOT NULL,
	[Reiting] [int] NOT NULL,
 CONSTRAINT [PK_Partner_1] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Partner_products]    Script Date: 17.04.2025 15:58:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Partner_products](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Product_id] [int] NOT NULL,
	[Partner_id] [int] NOT NULL,
	[Kolvo] [int] NOT NULL,
	[Data_prodaz] [date] NOT NULL,
 CONSTRAINT [PK_Partner_products] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Partner_type]    Script Date: 17.04.2025 15:58:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Partner_type](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Partner_type] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Partner_type] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product]    Script Date: 17.04.2025 15:58:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Product_type_id] [int] NOT NULL,
	[Name_product] [nvarchar](200) NOT NULL,
	[Articul] [nvarchar](50) NOT NULL,
	[Min_stoumost] [float] NOT NULL,
 CONSTRAINT [PK_Partner] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product_type]    Script Date: 17.04.2025 15:58:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product_type](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Product_type] [nvarchar](50) NOT NULL,
	[Coff] [float] NOT NULL,
 CONSTRAINT [PK_Product_type] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Material_type_Product]  WITH CHECK ADD  CONSTRAINT [FK_Material_type_Product_Material_type] FOREIGN KEY([Material_type_id])
REFERENCES [dbo].[Material_type] ([Id])
GO
ALTER TABLE [dbo].[Material_type_Product] CHECK CONSTRAINT [FK_Material_type_Product_Material_type]
GO
ALTER TABLE [dbo].[Material_type_Product]  WITH CHECK ADD  CONSTRAINT [FK_Material_type_Product_Product] FOREIGN KEY([Product_id])
REFERENCES [dbo].[Product] ([Id])
GO
ALTER TABLE [dbo].[Material_type_Product] CHECK CONSTRAINT [FK_Material_type_Product_Product]
GO
ALTER TABLE [dbo].[Partner]  WITH CHECK ADD  CONSTRAINT [FK_Partner_Partner_type] FOREIGN KEY([Partner_type_id])
REFERENCES [dbo].[Partner_type] ([Id])
GO
ALTER TABLE [dbo].[Partner] CHECK CONSTRAINT [FK_Partner_Partner_type]
GO
ALTER TABLE [dbo].[Partner_products]  WITH CHECK ADD  CONSTRAINT [FK_Partner_products_Partner] FOREIGN KEY([Partner_id])
REFERENCES [dbo].[Partner] ([Id])
GO
ALTER TABLE [dbo].[Partner_products] CHECK CONSTRAINT [FK_Partner_products_Partner]
GO
ALTER TABLE [dbo].[Partner_products]  WITH CHECK ADD  CONSTRAINT [FK_Partner_products_Product] FOREIGN KEY([Product_id])
REFERENCES [dbo].[Product] ([Id])
GO
ALTER TABLE [dbo].[Partner_products] CHECK CONSTRAINT [FK_Partner_products_Product]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_Product_type] FOREIGN KEY([Product_type_id])
REFERENCES [dbo].[Product_type] ([Id])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_Product_type]
GO
