USE [Tickett]
GO
/****** Object:  Table [dbo].[Account]    Script Date: 6/15/2024 8:42:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Account](
	[accountID] [int] IDENTITY(1,1) NOT NULL,
	[username] [nvarchar](50) NOT NULL,
	[password] [nvarchar](50) NULL,
	[phoneNumber] [varchar](15) NULL,
	[birthdate] [date] NULL,
	[GoogleStatus] [bit] NOT NULL,
	[roleId] [int] NOT NULL,
	[passwordStatus] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[accountID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Area]    Script Date: 6/15/2024 8:42:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Area](
	[Area_id] [int] IDENTITY(1,1) NOT NULL,
	[Area_name] [nvarchar](100) NOT NULL,
	[Price] [decimal](10, 2) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Area_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Booking]    Script Date: 6/15/2024 8:42:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Booking](
	[BookingID] [int] IDENTITY(1,1) NOT NULL,
	[Booking_date] [date] NOT NULL,
	[Status] [nvarchar](100) NOT NULL,
	[Total_amount] [decimal](10, 2) NULL,
	[EventID] [int] NULL,
	[AccountID] [int] NULL,
	[Name] [nvarchar](max) NULL,
	[Phone] [nvarchar](max) NULL,
	[Address] [nvarchar](max) NULL,
	[Email] [nvarchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[BookingID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Booking_detail]    Script Date: 6/15/2024 8:42:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Booking_detail](
	[Booking_detail_ID] [int] IDENTITY(1,1) NOT NULL,
	[Quantity] [int] NOT NULL,
	[Unit_price] [decimal](10, 2) NOT NULL,
	[Subtotal] [decimal](10, 2) NOT NULL,
	[BookingID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Booking_detail_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Category]    Script Date: 6/15/2024 8:42:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
	[CategoryID] [int] IDENTITY(1,1) NOT NULL,
	[Categoryname] [nvarchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[CategoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Event]    Script Date: 6/15/2024 8:42:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Event](
	[EventID] [int] IDENTITY(1,1) NOT NULL,
	[CategoryID] [int] NOT NULL,
	[Eventname] [nvarchar](100) NOT NULL,
	[Description] [nvarchar](2000) NOT NULL,
	[EventImg] [varchar](500) NOT NULL,
	[LocationID] [int] NOT NULL,
	[Date] [date] NOT NULL,
	[Time] [time](7) NOT NULL,
	[AccountID] [int] NOT NULL,
	[StatusDisable] [bit] NOT NULL,
 CONSTRAINT [PK__Event__7944C87025C02315] PRIMARY KEY CLUSTERED 
(
	[EventID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Invoice]    Script Date: 6/15/2024 8:42:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Invoice](
	[InvoiceID] [int] IDENTITY(1,1) NOT NULL,
	[Invoice_date] [date] NOT NULL,
	[Total_mount] [decimal](10, 2) NOT NULL,
	[BookingID] [int] NULL,
	[AccountID] [int] NULL,
	[paymentID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[InvoiceID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Location]    Script Date: 6/15/2024 8:42:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Location](
	[Location_id] [int] IDENTITY(1,1) NOT NULL,
	[Location_name] [nvarchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Location_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Payment]    Script Date: 6/15/2024 8:42:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Payment](
	[PaymentID] [int] IDENTITY(1,1) NOT NULL,
	[Payment_date] [date] NOT NULL,
	[Transaction_id] [varchar](255) NOT NULL,
	[Amount] [decimal](10, 2) NOT NULL,
	[Status] [varchar](255) NOT NULL,
	[Payment_method] [nvarchar](255) NOT NULL,
	[BookingID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[PaymentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Promotion]    Script Date: 6/15/2024 8:42:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Promotion](
	[PromotionID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](150) NOT NULL,
	[Description] [text] NOT NULL,
	[Start_date] [date] NOT NULL,
	[End_date] [date] NOT NULL,
	[Discount_percent] [decimal](10, 2) NOT NULL,
	[Min_quantity] [int] NOT NULL,
	[Max_quantity] [int] NOT NULL,
	[Status] [varchar](20) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[PromotionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Role]    Script Date: 6/15/2024 8:42:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Role](
	[RoleID] [int] NOT NULL,
	[Role_name] [nvarchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[RoleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Ticket]    Script Date: 6/15/2024 8:42:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Ticket](
	[Ticket_id] [int] IDENTITY(1,1) NOT NULL,
	[Status] [bit] NOT NULL,
	[EventID] [int] NOT NULL,
	[Booking_detail_ID] [int] NULL,
	[Area_id] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Ticket_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Account] ON 

INSERT [dbo].[Account] ([accountID], [username], [password], [phoneNumber], [birthdate], [GoogleStatus], [roleId], [passwordStatus]) VALUES (1, N'admin@example.com', N'Admin123', N'555-123-4567', CAST(N'1985-10-15' AS Date), 0, 1, 0)
INSERT [dbo].[Account] ([accountID], [username], [password], [phoneNumber], [birthdate], [GoogleStatus], [roleId], [passwordStatus]) VALUES (2, N'staff@example.com', N'Staff456', N'555-234-5678', CAST(N'1990-04-20' AS Date), 0, 2, 0)
INSERT [dbo].[Account] ([accountID], [username], [password], [phoneNumber], [birthdate], [GoogleStatus], [roleId], [passwordStatus]) VALUES (3, N'customer@example.com', N'Customer789', N'555-345-6789', CAST(N'1995-07-25' AS Date), 0, 3, 0)
SET IDENTITY_INSERT [dbo].[Account] OFF
GO
SET IDENTITY_INSERT [dbo].[Area] ON 

INSERT [dbo].[Area] ([Area_id], [Area_name], [Price]) VALUES (1, N'C1', CAST(150000.00 AS Decimal(10, 2)))
INSERT [dbo].[Area] ([Area_id], [Area_name], [Price]) VALUES (2, N'C2', CAST(150000.00 AS Decimal(10, 2)))
INSERT [dbo].[Area] ([Area_id], [Area_name], [Price]) VALUES (3, N'C3', CAST(150000.00 AS Decimal(10, 2)))
INSERT [dbo].[Area] ([Area_id], [Area_name], [Price]) VALUES (4, N'C4', CAST(150000.00 AS Decimal(10, 2)))
INSERT [dbo].[Area] ([Area_id], [Area_name], [Price]) VALUES (5, N'C5', CAST(150000.00 AS Decimal(10, 2)))
INSERT [dbo].[Area] ([Area_id], [Area_name], [Price]) VALUES (6, N'C6', CAST(150000.00 AS Decimal(10, 2)))
INSERT [dbo].[Area] ([Area_id], [Area_name], [Price]) VALUES (7, N'C7', CAST(150000.00 AS Decimal(10, 2)))
INSERT [dbo].[Area] ([Area_id], [Area_name], [Price]) VALUES (8, N'C8', CAST(150000.00 AS Decimal(10, 2)))
INSERT [dbo].[Area] ([Area_id], [Area_name], [Price]) VALUES (9, N'C9', CAST(150000.00 AS Decimal(10, 2)))
INSERT [dbo].[Area] ([Area_id], [Area_name], [Price]) VALUES (10, N'C10', CAST(150000.00 AS Decimal(10, 2)))
INSERT [dbo].[Area] ([Area_id], [Area_name], [Price]) VALUES (11, N'C11', CAST(150000.00 AS Decimal(10, 2)))
INSERT [dbo].[Area] ([Area_id], [Area_name], [Price]) VALUES (12, N'C12', CAST(150000.00 AS Decimal(10, 2)))
INSERT [dbo].[Area] ([Area_id], [Area_name], [Price]) VALUES (13, N'C13', CAST(150000.00 AS Decimal(10, 2)))
INSERT [dbo].[Area] ([Area_id], [Area_name], [Price]) VALUES (14, N'C14', CAST(150000.00 AS Decimal(10, 2)))
INSERT [dbo].[Area] ([Area_id], [Area_name], [Price]) VALUES (15, N'C15', CAST(150000.00 AS Decimal(10, 2)))
INSERT [dbo].[Area] ([Area_id], [Area_name], [Price]) VALUES (16, N'C16', CAST(150000.00 AS Decimal(10, 2)))
INSERT [dbo].[Area] ([Area_id], [Area_name], [Price]) VALUES (17, N'C17', CAST(150000.00 AS Decimal(10, 2)))
INSERT [dbo].[Area] ([Area_id], [Area_name], [Price]) VALUES (18, N'C18', CAST(150000.00 AS Decimal(10, 2)))
INSERT [dbo].[Area] ([Area_id], [Area_name], [Price]) VALUES (19, N'C19', CAST(150000.00 AS Decimal(10, 2)))
INSERT [dbo].[Area] ([Area_id], [Area_name], [Price]) VALUES (20, N'C20', CAST(150000.00 AS Decimal(10, 2)))
INSERT [dbo].[Area] ([Area_id], [Area_name], [Price]) VALUES (21, N'C21', CAST(130000.00 AS Decimal(10, 2)))
INSERT [dbo].[Area] ([Area_id], [Area_name], [Price]) VALUES (22, N'C22', CAST(130000.00 AS Decimal(10, 2)))
INSERT [dbo].[Area] ([Area_id], [Area_name], [Price]) VALUES (23, N'C23', CAST(130000.00 AS Decimal(10, 2)))
INSERT [dbo].[Area] ([Area_id], [Area_name], [Price]) VALUES (24, N'C24', CAST(130000.00 AS Decimal(10, 2)))
INSERT [dbo].[Area] ([Area_id], [Area_name], [Price]) VALUES (25, N'C25', CAST(130000.00 AS Decimal(10, 2)))
INSERT [dbo].[Area] ([Area_id], [Area_name], [Price]) VALUES (26, N'C26', CAST(130000.00 AS Decimal(10, 2)))
INSERT [dbo].[Area] ([Area_id], [Area_name], [Price]) VALUES (27, N'C27', CAST(130000.00 AS Decimal(10, 2)))
INSERT [dbo].[Area] ([Area_id], [Area_name], [Price]) VALUES (28, N'C28', CAST(130000.00 AS Decimal(10, 2)))
INSERT [dbo].[Area] ([Area_id], [Area_name], [Price]) VALUES (29, N'C29', CAST(130000.00 AS Decimal(10, 2)))
INSERT [dbo].[Area] ([Area_id], [Area_name], [Price]) VALUES (30, N'C30', CAST(130000.00 AS Decimal(10, 2)))
INSERT [dbo].[Area] ([Area_id], [Area_name], [Price]) VALUES (31, N'C31', CAST(130000.00 AS Decimal(10, 2)))
INSERT [dbo].[Area] ([Area_id], [Area_name], [Price]) VALUES (32, N'C32', CAST(130000.00 AS Decimal(10, 2)))
INSERT [dbo].[Area] ([Area_id], [Area_name], [Price]) VALUES (33, N'C33', CAST(130000.00 AS Decimal(10, 2)))
INSERT [dbo].[Area] ([Area_id], [Area_name], [Price]) VALUES (34, N'C34', CAST(130000.00 AS Decimal(10, 2)))
INSERT [dbo].[Area] ([Area_id], [Area_name], [Price]) VALUES (35, N'C35', CAST(130000.00 AS Decimal(10, 2)))
INSERT [dbo].[Area] ([Area_id], [Area_name], [Price]) VALUES (36, N'C36', CAST(130000.00 AS Decimal(10, 2)))
INSERT [dbo].[Area] ([Area_id], [Area_name], [Price]) VALUES (37, N'C37', CAST(130000.00 AS Decimal(10, 2)))
INSERT [dbo].[Area] ([Area_id], [Area_name], [Price]) VALUES (38, N'C38', CAST(130000.00 AS Decimal(10, 2)))
INSERT [dbo].[Area] ([Area_id], [Area_name], [Price]) VALUES (39, N'C39', CAST(130000.00 AS Decimal(10, 2)))
INSERT [dbo].[Area] ([Area_id], [Area_name], [Price]) VALUES (40, N'C40', CAST(130000.00 AS Decimal(10, 2)))
INSERT [dbo].[Area] ([Area_id], [Area_name], [Price]) VALUES (41, N'C41', CAST(110000.00 AS Decimal(10, 2)))
INSERT [dbo].[Area] ([Area_id], [Area_name], [Price]) VALUES (42, N'C42', CAST(110000.00 AS Decimal(10, 2)))
INSERT [dbo].[Area] ([Area_id], [Area_name], [Price]) VALUES (43, N'C43', CAST(110000.00 AS Decimal(10, 2)))
INSERT [dbo].[Area] ([Area_id], [Area_name], [Price]) VALUES (44, N'C44', CAST(110000.00 AS Decimal(10, 2)))
INSERT [dbo].[Area] ([Area_id], [Area_name], [Price]) VALUES (45, N'C45', CAST(110000.00 AS Decimal(10, 2)))
INSERT [dbo].[Area] ([Area_id], [Area_name], [Price]) VALUES (46, N'C46', CAST(110000.00 AS Decimal(10, 2)))
INSERT [dbo].[Area] ([Area_id], [Area_name], [Price]) VALUES (47, N'C47', CAST(110000.00 AS Decimal(10, 2)))
INSERT [dbo].[Area] ([Area_id], [Area_name], [Price]) VALUES (48, N'C48', CAST(110000.00 AS Decimal(10, 2)))
INSERT [dbo].[Area] ([Area_id], [Area_name], [Price]) VALUES (49, N'C49', CAST(110000.00 AS Decimal(10, 2)))
INSERT [dbo].[Area] ([Area_id], [Area_name], [Price]) VALUES (50, N'C50', CAST(110000.00 AS Decimal(10, 2)))
INSERT [dbo].[Area] ([Area_id], [Area_name], [Price]) VALUES (51, N'C51', CAST(110000.00 AS Decimal(10, 2)))
INSERT [dbo].[Area] ([Area_id], [Area_name], [Price]) VALUES (52, N'C52', CAST(110000.00 AS Decimal(10, 2)))
INSERT [dbo].[Area] ([Area_id], [Area_name], [Price]) VALUES (53, N'C53', CAST(110000.00 AS Decimal(10, 2)))
INSERT [dbo].[Area] ([Area_id], [Area_name], [Price]) VALUES (54, N'C54', CAST(110000.00 AS Decimal(10, 2)))
INSERT [dbo].[Area] ([Area_id], [Area_name], [Price]) VALUES (55, N'C55', CAST(110000.00 AS Decimal(10, 2)))
INSERT [dbo].[Area] ([Area_id], [Area_name], [Price]) VALUES (56, N'C56', CAST(110000.00 AS Decimal(10, 2)))
INSERT [dbo].[Area] ([Area_id], [Area_name], [Price]) VALUES (57, N'C57', CAST(110000.00 AS Decimal(10, 2)))
INSERT [dbo].[Area] ([Area_id], [Area_name], [Price]) VALUES (58, N'C58', CAST(110000.00 AS Decimal(10, 2)))
INSERT [dbo].[Area] ([Area_id], [Area_name], [Price]) VALUES (59, N'C59', CAST(110000.00 AS Decimal(10, 2)))
INSERT [dbo].[Area] ([Area_id], [Area_name], [Price]) VALUES (60, N'C60', CAST(110000.00 AS Decimal(10, 2)))
SET IDENTITY_INSERT [dbo].[Area] OFF
GO
SET IDENTITY_INSERT [dbo].[Category] ON 

INSERT [dbo].[Category] ([CategoryID], [Categoryname]) VALUES (1, N'Talkshow')
INSERT [dbo].[Category] ([CategoryID], [Categoryname]) VALUES (2, N'Ca nhạc')
INSERT [dbo].[Category] ([CategoryID], [Categoryname]) VALUES (3, N'Workshop')
SET IDENTITY_INSERT [dbo].[Category] OFF
GO
SET IDENTITY_INSERT [dbo].[Event] ON 

INSERT [dbo].[Event] ([EventID], [CategoryID], [Eventname], [Description], [EventImg], [LocationID], [Date], [Time], [AccountID], [StatusDisable]) VALUES (3, 1, N'Talkshow1', N'This is a description for Talkshow 1.', N'img-1.jpg', 1, CAST(N'2024-07-01' AS Date), CAST(N'12:30:00' AS Time), 2, 0)
INSERT [dbo].[Event] ([EventID], [CategoryID], [Eventname], [Description], [EventImg], [LocationID], [Date], [Time], [AccountID], [StatusDisable]) VALUES (4, 2, N'Ca nhạc 1', N'This is a description forCa nhạc 1.', N'img-2.jpg', 2, CAST(N'2024-08-15' AS Date), CAST(N'12:31:00' AS Time), 2, 0)
INSERT [dbo].[Event] ([EventID], [CategoryID], [Eventname], [Description], [EventImg], [LocationID], [Date], [Time], [AccountID], [StatusDisable]) VALUES (5, 3, N'Workshop 1', N'This is a description for Workshop 1.', N'img-3.jpg', 3, CAST(N'2024-09-30' AS Date), CAST(N'12:30:00' AS Time), 2, 0)
SET IDENTITY_INSERT [dbo].[Event] OFF
GO
SET IDENTITY_INSERT [dbo].[Location] ON 

INSERT [dbo].[Location] ([Location_id], [Location_name]) VALUES (1, N'số 57 Phạm Hùng, Mễ Trì, Nam Từ Liêm, Hà Nội')
INSERT [dbo].[Location] ([Location_id], [Location_name]) VALUES (2, N'số 2 Phan Đăng Lưu, Hòa Cường Bắc, Hải Châu, Đà Nẵng')
INSERT [dbo].[Location] ([Location_id], [Location_name]) VALUES (3, N'số 49 đường Hoa Hồng, phường 4, Đà Lạt')
SET IDENTITY_INSERT [dbo].[Location] OFF
GO
INSERT [dbo].[Role] ([RoleID], [Role_name]) VALUES (1, N'admin')
INSERT [dbo].[Role] ([RoleID], [Role_name]) VALUES (2, N'staff')
INSERT [dbo].[Role] ([RoleID], [Role_name]) VALUES (3, N'customer')
GO
SET IDENTITY_INSERT [dbo].[Ticket] ON 

INSERT [dbo].[Ticket] ([Ticket_id], [Status], [EventID], [Booking_detail_ID], [Area_id]) VALUES (121, 0, 3, NULL, 1)
INSERT [dbo].[Ticket] ([Ticket_id], [Status], [EventID], [Booking_detail_ID], [Area_id]) VALUES (122, 0, 3, NULL, 2)
INSERT [dbo].[Ticket] ([Ticket_id], [Status], [EventID], [Booking_detail_ID], [Area_id]) VALUES (123, 0, 3, NULL, 3)
INSERT [dbo].[Ticket] ([Ticket_id], [Status], [EventID], [Booking_detail_ID], [Area_id]) VALUES (124, 0, 3, NULL, 4)
INSERT [dbo].[Ticket] ([Ticket_id], [Status], [EventID], [Booking_detail_ID], [Area_id]) VALUES (125, 0, 3, NULL, 5)
INSERT [dbo].[Ticket] ([Ticket_id], [Status], [EventID], [Booking_detail_ID], [Area_id]) VALUES (126, 0, 3, NULL, 6)
INSERT [dbo].[Ticket] ([Ticket_id], [Status], [EventID], [Booking_detail_ID], [Area_id]) VALUES (127, 0, 3, NULL, 7)
INSERT [dbo].[Ticket] ([Ticket_id], [Status], [EventID], [Booking_detail_ID], [Area_id]) VALUES (128, 0, 3, NULL, 8)
INSERT [dbo].[Ticket] ([Ticket_id], [Status], [EventID], [Booking_detail_ID], [Area_id]) VALUES (129, 0, 3, NULL, 9)
INSERT [dbo].[Ticket] ([Ticket_id], [Status], [EventID], [Booking_detail_ID], [Area_id]) VALUES (130, 0, 3, NULL, 10)
INSERT [dbo].[Ticket] ([Ticket_id], [Status], [EventID], [Booking_detail_ID], [Area_id]) VALUES (131, 0, 3, NULL, 11)
INSERT [dbo].[Ticket] ([Ticket_id], [Status], [EventID], [Booking_detail_ID], [Area_id]) VALUES (132, 0, 3, NULL, 12)
INSERT [dbo].[Ticket] ([Ticket_id], [Status], [EventID], [Booking_detail_ID], [Area_id]) VALUES (133, 0, 3, NULL, 13)
INSERT [dbo].[Ticket] ([Ticket_id], [Status], [EventID], [Booking_detail_ID], [Area_id]) VALUES (134, 0, 3, NULL, 14)
INSERT [dbo].[Ticket] ([Ticket_id], [Status], [EventID], [Booking_detail_ID], [Area_id]) VALUES (135, 0, 3, NULL, 15)
INSERT [dbo].[Ticket] ([Ticket_id], [Status], [EventID], [Booking_detail_ID], [Area_id]) VALUES (136, 0, 3, NULL, 16)
INSERT [dbo].[Ticket] ([Ticket_id], [Status], [EventID], [Booking_detail_ID], [Area_id]) VALUES (137, 0, 3, NULL, 17)
INSERT [dbo].[Ticket] ([Ticket_id], [Status], [EventID], [Booking_detail_ID], [Area_id]) VALUES (138, 0, 3, NULL, 18)
INSERT [dbo].[Ticket] ([Ticket_id], [Status], [EventID], [Booking_detail_ID], [Area_id]) VALUES (139, 0, 3, NULL, 19)
INSERT [dbo].[Ticket] ([Ticket_id], [Status], [EventID], [Booking_detail_ID], [Area_id]) VALUES (140, 0, 3, NULL, 20)
INSERT [dbo].[Ticket] ([Ticket_id], [Status], [EventID], [Booking_detail_ID], [Area_id]) VALUES (141, 0, 3, NULL, 21)
INSERT [dbo].[Ticket] ([Ticket_id], [Status], [EventID], [Booking_detail_ID], [Area_id]) VALUES (142, 0, 3, NULL, 22)
INSERT [dbo].[Ticket] ([Ticket_id], [Status], [EventID], [Booking_detail_ID], [Area_id]) VALUES (143, 0, 3, NULL, 23)
INSERT [dbo].[Ticket] ([Ticket_id], [Status], [EventID], [Booking_detail_ID], [Area_id]) VALUES (144, 0, 3, NULL, 24)
INSERT [dbo].[Ticket] ([Ticket_id], [Status], [EventID], [Booking_detail_ID], [Area_id]) VALUES (145, 0, 3, NULL, 25)
INSERT [dbo].[Ticket] ([Ticket_id], [Status], [EventID], [Booking_detail_ID], [Area_id]) VALUES (146, 0, 3, NULL, 26)
INSERT [dbo].[Ticket] ([Ticket_id], [Status], [EventID], [Booking_detail_ID], [Area_id]) VALUES (147, 0, 3, NULL, 27)
INSERT [dbo].[Ticket] ([Ticket_id], [Status], [EventID], [Booking_detail_ID], [Area_id]) VALUES (148, 0, 3, NULL, 28)
INSERT [dbo].[Ticket] ([Ticket_id], [Status], [EventID], [Booking_detail_ID], [Area_id]) VALUES (149, 0, 3, NULL, 29)
INSERT [dbo].[Ticket] ([Ticket_id], [Status], [EventID], [Booking_detail_ID], [Area_id]) VALUES (150, 0, 3, NULL, 30)
INSERT [dbo].[Ticket] ([Ticket_id], [Status], [EventID], [Booking_detail_ID], [Area_id]) VALUES (151, 0, 3, NULL, 31)
INSERT [dbo].[Ticket] ([Ticket_id], [Status], [EventID], [Booking_detail_ID], [Area_id]) VALUES (152, 0, 3, NULL, 32)
INSERT [dbo].[Ticket] ([Ticket_id], [Status], [EventID], [Booking_detail_ID], [Area_id]) VALUES (153, 0, 3, NULL, 33)
INSERT [dbo].[Ticket] ([Ticket_id], [Status], [EventID], [Booking_detail_ID], [Area_id]) VALUES (154, 0, 3, NULL, 34)
INSERT [dbo].[Ticket] ([Ticket_id], [Status], [EventID], [Booking_detail_ID], [Area_id]) VALUES (155, 0, 3, NULL, 35)
INSERT [dbo].[Ticket] ([Ticket_id], [Status], [EventID], [Booking_detail_ID], [Area_id]) VALUES (156, 0, 3, NULL, 36)
INSERT [dbo].[Ticket] ([Ticket_id], [Status], [EventID], [Booking_detail_ID], [Area_id]) VALUES (157, 0, 3, NULL, 37)
INSERT [dbo].[Ticket] ([Ticket_id], [Status], [EventID], [Booking_detail_ID], [Area_id]) VALUES (158, 0, 3, NULL, 38)
INSERT [dbo].[Ticket] ([Ticket_id], [Status], [EventID], [Booking_detail_ID], [Area_id]) VALUES (159, 0, 3, NULL, 39)
INSERT [dbo].[Ticket] ([Ticket_id], [Status], [EventID], [Booking_detail_ID], [Area_id]) VALUES (160, 0, 3, NULL, 40)
INSERT [dbo].[Ticket] ([Ticket_id], [Status], [EventID], [Booking_detail_ID], [Area_id]) VALUES (161, 0, 3, NULL, 41)
INSERT [dbo].[Ticket] ([Ticket_id], [Status], [EventID], [Booking_detail_ID], [Area_id]) VALUES (162, 0, 3, NULL, 42)
INSERT [dbo].[Ticket] ([Ticket_id], [Status], [EventID], [Booking_detail_ID], [Area_id]) VALUES (163, 0, 3, NULL, 43)
INSERT [dbo].[Ticket] ([Ticket_id], [Status], [EventID], [Booking_detail_ID], [Area_id]) VALUES (164, 0, 3, NULL, 44)
INSERT [dbo].[Ticket] ([Ticket_id], [Status], [EventID], [Booking_detail_ID], [Area_id]) VALUES (165, 0, 3, NULL, 45)
INSERT [dbo].[Ticket] ([Ticket_id], [Status], [EventID], [Booking_detail_ID], [Area_id]) VALUES (166, 0, 3, NULL, 46)
INSERT [dbo].[Ticket] ([Ticket_id], [Status], [EventID], [Booking_detail_ID], [Area_id]) VALUES (167, 0, 3, NULL, 47)
INSERT [dbo].[Ticket] ([Ticket_id], [Status], [EventID], [Booking_detail_ID], [Area_id]) VALUES (168, 0, 3, NULL, 48)
INSERT [dbo].[Ticket] ([Ticket_id], [Status], [EventID], [Booking_detail_ID], [Area_id]) VALUES (169, 0, 3, NULL, 49)
INSERT [dbo].[Ticket] ([Ticket_id], [Status], [EventID], [Booking_detail_ID], [Area_id]) VALUES (170, 0, 3, NULL, 50)
INSERT [dbo].[Ticket] ([Ticket_id], [Status], [EventID], [Booking_detail_ID], [Area_id]) VALUES (171, 0, 3, NULL, 51)
INSERT [dbo].[Ticket] ([Ticket_id], [Status], [EventID], [Booking_detail_ID], [Area_id]) VALUES (172, 0, 3, NULL, 52)
INSERT [dbo].[Ticket] ([Ticket_id], [Status], [EventID], [Booking_detail_ID], [Area_id]) VALUES (173, 0, 3, NULL, 53)
INSERT [dbo].[Ticket] ([Ticket_id], [Status], [EventID], [Booking_detail_ID], [Area_id]) VALUES (174, 0, 3, NULL, 54)
INSERT [dbo].[Ticket] ([Ticket_id], [Status], [EventID], [Booking_detail_ID], [Area_id]) VALUES (175, 0, 3, NULL, 55)
INSERT [dbo].[Ticket] ([Ticket_id], [Status], [EventID], [Booking_detail_ID], [Area_id]) VALUES (176, 0, 3, NULL, 56)
INSERT [dbo].[Ticket] ([Ticket_id], [Status], [EventID], [Booking_detail_ID], [Area_id]) VALUES (177, 0, 3, NULL, 57)
INSERT [dbo].[Ticket] ([Ticket_id], [Status], [EventID], [Booking_detail_ID], [Area_id]) VALUES (178, 0, 3, NULL, 58)
INSERT [dbo].[Ticket] ([Ticket_id], [Status], [EventID], [Booking_detail_ID], [Area_id]) VALUES (179, 0, 3, NULL, 59)
INSERT [dbo].[Ticket] ([Ticket_id], [Status], [EventID], [Booking_detail_ID], [Area_id]) VALUES (180, 0, 3, NULL, 60)
SET IDENTITY_INSERT [dbo].[Ticket] OFF
GO
ALTER TABLE [dbo].[Account]  WITH CHECK ADD FOREIGN KEY([roleId])
REFERENCES [dbo].[Role] ([RoleID])
GO
ALTER TABLE [dbo].[Booking]  WITH CHECK ADD FOREIGN KEY([AccountID])
REFERENCES [dbo].[Account] ([accountID])
GO
ALTER TABLE [dbo].[Booking]  WITH CHECK ADD  CONSTRAINT [FK__Booking__EventID__33D4B598] FOREIGN KEY([EventID])
REFERENCES [dbo].[Event] ([EventID])
GO
ALTER TABLE [dbo].[Booking] CHECK CONSTRAINT [FK__Booking__EventID__33D4B598]
GO
ALTER TABLE [dbo].[Booking_detail]  WITH CHECK ADD FOREIGN KEY([BookingID])
REFERENCES [dbo].[Booking] ([BookingID])
GO
ALTER TABLE [dbo].[Event]  WITH CHECK ADD  CONSTRAINT [FK__Event__AccountID__2F10007B] FOREIGN KEY([AccountID])
REFERENCES [dbo].[Account] ([accountID])
GO
ALTER TABLE [dbo].[Event] CHECK CONSTRAINT [FK__Event__AccountID__2F10007B]
GO
ALTER TABLE [dbo].[Event]  WITH CHECK ADD  CONSTRAINT [FK__Event__CategoryI__2E1BDC42] FOREIGN KEY([CategoryID])
REFERENCES [dbo].[Category] ([CategoryID])
GO
ALTER TABLE [dbo].[Event] CHECK CONSTRAINT [FK__Event__CategoryI__2E1BDC42]
GO
ALTER TABLE [dbo].[Event]  WITH CHECK ADD  CONSTRAINT [FK__Event__StatusDis__2D27B809] FOREIGN KEY([LocationID])
REFERENCES [dbo].[Location] ([Location_id])
GO
ALTER TABLE [dbo].[Event] CHECK CONSTRAINT [FK__Event__StatusDis__2D27B809]
GO
ALTER TABLE [dbo].[Invoice]  WITH CHECK ADD FOREIGN KEY([AccountID])
REFERENCES [dbo].[Account] ([accountID])
GO
ALTER TABLE [dbo].[Invoice]  WITH CHECK ADD FOREIGN KEY([BookingID])
REFERENCES [dbo].[Booking] ([BookingID])
GO
ALTER TABLE [dbo].[Invoice]  WITH CHECK ADD FOREIGN KEY([paymentID])
REFERENCES [dbo].[Payment] ([PaymentID])
GO
ALTER TABLE [dbo].[Payment]  WITH CHECK ADD FOREIGN KEY([BookingID])
REFERENCES [dbo].[Booking] ([BookingID])
GO
ALTER TABLE [dbo].[Ticket]  WITH CHECK ADD FOREIGN KEY([Area_id])
REFERENCES [dbo].[Area] ([Area_id])
GO
ALTER TABLE [dbo].[Ticket]  WITH CHECK ADD FOREIGN KEY([Booking_detail_ID])
REFERENCES [dbo].[Booking_detail] ([Booking_detail_ID])
GO
ALTER TABLE [dbo].[Ticket]  WITH CHECK ADD  CONSTRAINT [FK__Ticket__EventID__3A81B327] FOREIGN KEY([EventID])
REFERENCES [dbo].[Event] ([EventID])
GO
ALTER TABLE [dbo].[Ticket] CHECK CONSTRAINT [FK__Ticket__EventID__3A81B327]
GO
