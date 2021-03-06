USE [HotelBooking]
GO
/****** Object:  Table [dbo].[tbl_Account]    Script Date: 4/29/2020 23:38:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_Account](
	[Email] [nvarchar](50) NOT NULL,
	[FullName] [nvarchar](50) NOT NULL,
	[Password] [nvarchar](50) NOT NULL,
	[Phone] [int] NOT NULL,
	[DateCreated] [datetime] NOT NULL,
	[Address] [nvarchar](50) NOT NULL,
	[RoleId] [int] NOT NULL,
	[StatusId] [int] NOT NULL,
 CONSTRAINT [PK_tbl_Account] PRIMARY KEY CLUSTERED 
(
	[Email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_Booking]    Script Date: 4/29/2020 23:38:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_Booking](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[DateCreated] [datetime] NULL,
	[UserEmail] [nvarchar](50) NULL,
	[StatusId] [int] NULL,
	[DiscountPercent] [int] NULL,
 CONSTRAINT [PK_tbl_Booking] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_BookingDetails]    Script Date: 4/29/2020 23:38:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_BookingDetails](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[RoomId] [int] NULL,
	[BookingId] [int] NULL,
	[CheckInDate] [datetime] NULL,
	[CheckOutDate] [datetime] NULL,
	[Amount] [int] NULL,
	[UnitPrice] [int] NULL,
 CONSTRAINT [PK_tbl_BookingDetails] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_Discount]    Script Date: 4/29/2020 23:38:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_Discount](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Code] [varchar](50) NULL,
	[DiscountPercent] [int] NULL,
	[ExpiredDate] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_Hotel]    Script Date: 4/29/2020 23:38:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_Hotel](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NULL,
	[Location] [nvarchar](50) NULL,
 CONSTRAINT [PK_tbl_hotel] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_Role]    Script Date: 4/29/2020 23:38:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_Role](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Description] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_tbl_Role] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_Room]    Script Date: 4/29/2020 23:38:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_Room](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[HotelId] [int] NOT NULL,
	[TypeId] [int] NOT NULL,
	[Amount] [int] NOT NULL,
 CONSTRAINT [PK_tbl_Room] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_RoomType]    Script Date: 4/29/2020 23:38:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_RoomType](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NULL,
	[Price] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_Status]    Script Date: 4/29/2020 23:38:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_Status](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Description] [nchar](10) NOT NULL,
 CONSTRAINT [PK_tbl_Status] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[tbl_Account] ([Email], [FullName], [Password], [Phone], [DateCreated], [Address], [RoleId], [StatusId]) VALUES (N'admin@gmail.com', N'Admin', N'admin', 123123, CAST(N'2020-04-29T00:00:00.000' AS DateTime), N'a', 1, 1)
INSERT [dbo].[tbl_Account] ([Email], [FullName], [Password], [Phone], [DateCreated], [Address], [RoleId], [StatusId]) VALUES (N'billgates@gmail.com', N'Bill Gates', N'1qazXSW@', 10002000, CAST(N'2020-04-29T00:00:00.000' AS DateTime), N'Quận 9', 2, 1)
INSERT [dbo].[tbl_Account] ([Email], [FullName], [Password], [Phone], [DateCreated], [Address], [RoleId], [StatusId]) VALUES (N'user@gmail.com', N'User', N'user', 444111, CAST(N'2020-04-29T00:00:00.000' AS DateTime), N'b', 2, 1)
SET IDENTITY_INSERT [dbo].[tbl_Booking] ON 

INSERT [dbo].[tbl_Booking] ([Id], [DateCreated], [UserEmail], [StatusId], [DiscountPercent]) VALUES (1, CAST(N'2020-04-29T00:00:00.000' AS DateTime), N'billgates@gmail.com', 1, NULL)
SET IDENTITY_INSERT [dbo].[tbl_Booking] OFF
SET IDENTITY_INSERT [dbo].[tbl_BookingDetails] ON 

INSERT [dbo].[tbl_BookingDetails] ([Id], [RoomId], [BookingId], [CheckInDate], [CheckOutDate], [Amount], [UnitPrice]) VALUES (2, 2, 1, CAST(N'2020-04-20T00:00:00.000' AS DateTime), CAST(N'2020-05-20T00:00:00.000' AS DateTime), 10, 200000)
INSERT [dbo].[tbl_BookingDetails] ([Id], [RoomId], [BookingId], [CheckInDate], [CheckOutDate], [Amount], [UnitPrice]) VALUES (3, 3, 1, CAST(N'2020-04-20T00:00:00.000' AS DateTime), CAST(N'2020-05-20T00:00:00.000' AS DateTime), 10, 500000)
INSERT [dbo].[tbl_BookingDetails] ([Id], [RoomId], [BookingId], [CheckInDate], [CheckOutDate], [Amount], [UnitPrice]) VALUES (4, 4, 1, CAST(N'2020-04-20T00:00:00.000' AS DateTime), CAST(N'2020-05-20T00:00:00.000' AS DateTime), 9, 1200000)
SET IDENTITY_INSERT [dbo].[tbl_BookingDetails] OFF
SET IDENTITY_INSERT [dbo].[tbl_Discount] ON 

INSERT [dbo].[tbl_Discount] ([Id], [Code], [DiscountPercent], [ExpiredDate]) VALUES (1, N'HI', 50, CAST(N'2020-05-30' AS Date))
INSERT [dbo].[tbl_Discount] ([Id], [Code], [DiscountPercent], [ExpiredDate]) VALUES (2, N'HELLO', 20, CAST(N'2020-10-10' AS Date))
SET IDENTITY_INSERT [dbo].[tbl_Discount] OFF
SET IDENTITY_INSERT [dbo].[tbl_Hotel] ON 

INSERT [dbo].[tbl_Hotel] ([Id], [Name], [Location]) VALUES (1, N'Hoa Mai', N'Quận 1, TP. Hồ Chí Minh')
INSERT [dbo].[tbl_Hotel] ([Id], [Name], [Location]) VALUES (2, N'Hoa Đào', N'Quận 1, TP. Hồ Chí Minh')
INSERT [dbo].[tbl_Hotel] ([Id], [Name], [Location]) VALUES (3, N'Hoa Phượng', N'Quận 5, TP. Hồ Chí Minh')
INSERT [dbo].[tbl_Hotel] ([Id], [Name], [Location]) VALUES (4, N'Hoa Hồng', N'Quận 9, TP. Hồ Chí Minh')
INSERT [dbo].[tbl_Hotel] ([Id], [Name], [Location]) VALUES (5, N'Hoa Tím', N'Quận 9, TP. Hồ Chí Minh')
INSERT [dbo].[tbl_Hotel] ([Id], [Name], [Location]) VALUES (6, N'Hoa Vàng', N'Quận 9, TP. Hồ Chí Minh')
SET IDENTITY_INSERT [dbo].[tbl_Hotel] OFF
SET IDENTITY_INSERT [dbo].[tbl_Role] ON 

INSERT [dbo].[tbl_Role] ([Id], [Description]) VALUES (1, N'Admin')
INSERT [dbo].[tbl_Role] ([Id], [Description]) VALUES (2, N'User')
SET IDENTITY_INSERT [dbo].[tbl_Role] OFF
SET IDENTITY_INSERT [dbo].[tbl_Room] ON 

INSERT [dbo].[tbl_Room] ([Id], [HotelId], [TypeId], [Amount]) VALUES (2, 1, 1, 10)
INSERT [dbo].[tbl_Room] ([Id], [HotelId], [TypeId], [Amount]) VALUES (3, 1, 2, 10)
INSERT [dbo].[tbl_Room] ([Id], [HotelId], [TypeId], [Amount]) VALUES (4, 1, 3, 10)
INSERT [dbo].[tbl_Room] ([Id], [HotelId], [TypeId], [Amount]) VALUES (5, 2, 1, 12)
INSERT [dbo].[tbl_Room] ([Id], [HotelId], [TypeId], [Amount]) VALUES (6, 2, 2, 12)
INSERT [dbo].[tbl_Room] ([Id], [HotelId], [TypeId], [Amount]) VALUES (7, 2, 3, 12)
INSERT [dbo].[tbl_Room] ([Id], [HotelId], [TypeId], [Amount]) VALUES (8, 3, 1, 15)
INSERT [dbo].[tbl_Room] ([Id], [HotelId], [TypeId], [Amount]) VALUES (9, 3, 2, 10)
INSERT [dbo].[tbl_Room] ([Id], [HotelId], [TypeId], [Amount]) VALUES (10, 3, 3, 5)
INSERT [dbo].[tbl_Room] ([Id], [HotelId], [TypeId], [Amount]) VALUES (11, 4, 1, 20)
INSERT [dbo].[tbl_Room] ([Id], [HotelId], [TypeId], [Amount]) VALUES (12, 4, 2, 20)
INSERT [dbo].[tbl_Room] ([Id], [HotelId], [TypeId], [Amount]) VALUES (13, 4, 3, 20)
INSERT [dbo].[tbl_Room] ([Id], [HotelId], [TypeId], [Amount]) VALUES (14, 5, 1, 30)
INSERT [dbo].[tbl_Room] ([Id], [HotelId], [TypeId], [Amount]) VALUES (15, 5, 2, 20)
INSERT [dbo].[tbl_Room] ([Id], [HotelId], [TypeId], [Amount]) VALUES (16, 5, 3, 10)
INSERT [dbo].[tbl_Room] ([Id], [HotelId], [TypeId], [Amount]) VALUES (17, 6, 1, 25)
INSERT [dbo].[tbl_Room] ([Id], [HotelId], [TypeId], [Amount]) VALUES (18, 6, 2, 20)
INSERT [dbo].[tbl_Room] ([Id], [HotelId], [TypeId], [Amount]) VALUES (19, 6, 3, 20)
SET IDENTITY_INSERT [dbo].[tbl_Room] OFF
SET IDENTITY_INSERT [dbo].[tbl_RoomType] ON 

INSERT [dbo].[tbl_RoomType] ([Id], [Name], [Price]) VALUES (1, N'Single', 200000)
INSERT [dbo].[tbl_RoomType] ([Id], [Name], [Price]) VALUES (2, N'Double', 500000)
INSERT [dbo].[tbl_RoomType] ([Id], [Name], [Price]) VALUES (3, N'Family', 1200000)
SET IDENTITY_INSERT [dbo].[tbl_RoomType] OFF
SET IDENTITY_INSERT [dbo].[tbl_Status] ON 

INSERT [dbo].[tbl_Status] ([Id], [Description]) VALUES (1, N'active    ')
INSERT [dbo].[tbl_Status] ([Id], [Description]) VALUES (2, N'inactive  ')
SET IDENTITY_INSERT [dbo].[tbl_Status] OFF
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Discount__A25C5AA7001D71E5]    Script Date: 4/29/2020 23:38:03 ******/
ALTER TABLE [dbo].[tbl_Discount] ADD UNIQUE NONCLUSTERED 
(
	[Code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[tbl_Account]  WITH CHECK ADD  CONSTRAINT [FK_tbl_Account_tbl_Role] FOREIGN KEY([RoleId])
REFERENCES [dbo].[tbl_Role] ([Id])
GO
ALTER TABLE [dbo].[tbl_Account] CHECK CONSTRAINT [FK_tbl_Account_tbl_Role]
GO
ALTER TABLE [dbo].[tbl_Account]  WITH CHECK ADD  CONSTRAINT [FK_tbl_Account_tbl_Status] FOREIGN KEY([StatusId])
REFERENCES [dbo].[tbl_Status] ([Id])
GO
ALTER TABLE [dbo].[tbl_Account] CHECK CONSTRAINT [FK_tbl_Account_tbl_Status]
GO
ALTER TABLE [dbo].[tbl_Booking]  WITH CHECK ADD  CONSTRAINT [FK_tbl_Booking_tbl_Account] FOREIGN KEY([UserEmail])
REFERENCES [dbo].[tbl_Account] ([Email])
GO
ALTER TABLE [dbo].[tbl_Booking] CHECK CONSTRAINT [FK_tbl_Booking_tbl_Account]
GO
ALTER TABLE [dbo].[tbl_Booking]  WITH CHECK ADD  CONSTRAINT [FK_tbl_Booking_tbl_Status] FOREIGN KEY([StatusId])
REFERENCES [dbo].[tbl_Status] ([Id])
GO
ALTER TABLE [dbo].[tbl_Booking] CHECK CONSTRAINT [FK_tbl_Booking_tbl_Status]
GO
ALTER TABLE [dbo].[tbl_BookingDetails]  WITH CHECK ADD  CONSTRAINT [FK_tbl_BookingDetails_tbl_Booking] FOREIGN KEY([BookingId])
REFERENCES [dbo].[tbl_Booking] ([Id])
GO
ALTER TABLE [dbo].[tbl_BookingDetails] CHECK CONSTRAINT [FK_tbl_BookingDetails_tbl_Booking]
GO
ALTER TABLE [dbo].[tbl_BookingDetails]  WITH CHECK ADD  CONSTRAINT [FK_tbl_BookingDetails_tbl_Room] FOREIGN KEY([RoomId])
REFERENCES [dbo].[tbl_Room] ([Id])
GO
ALTER TABLE [dbo].[tbl_BookingDetails] CHECK CONSTRAINT [FK_tbl_BookingDetails_tbl_Room]
GO
ALTER TABLE [dbo].[tbl_Room]  WITH CHECK ADD  CONSTRAINT [FK_tbl_Room_tbl_Hotel] FOREIGN KEY([HotelId])
REFERENCES [dbo].[tbl_Hotel] ([Id])
GO
ALTER TABLE [dbo].[tbl_Room] CHECK CONSTRAINT [FK_tbl_Room_tbl_Hotel]
GO
ALTER TABLE [dbo].[tbl_Room]  WITH CHECK ADD  CONSTRAINT [FK_tbl_Room_tbl_RoomType] FOREIGN KEY([TypeId])
REFERENCES [dbo].[tbl_RoomType] ([Id])
GO
ALTER TABLE [dbo].[tbl_Room] CHECK CONSTRAINT [FK_tbl_Room_tbl_RoomType]
GO
