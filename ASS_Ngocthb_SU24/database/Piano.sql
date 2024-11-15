USE [PianoMusicCenter]
GO
/****** Object:  Table [dbo].[Categories]    Script Date: 7/5/2024 9:55:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categories](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](30) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Course]    Script Date: 7/5/2024 9:55:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Course](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[coursename] [nvarchar](max) NOT NULL,
	[categoryid] [int] NULL,
	[description] [nvarchar](max) NULL,
	[images] [varchar](255) NOT NULL,
	[startdate] [date] NOT NULL,
	[enddate] [date] NOT NULL,
	[price] [money] NOT NULL,
	[status] [bit] NOT NULL,
	[quantity] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderItem]    Script Date: 7/5/2024 9:55:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderItem](
	[quantity] [int] NOT NULL,
	[course_id] [int] NOT NULL,
	[order_id] [int] NOT NULL,
 CONSTRAINT [PK_OrderItem] PRIMARY KEY CLUSTERED 
(
	[course_id] ASC,
	[order_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Orders]    Script Date: 7/5/2024 9:55:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orders](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[orderdate] [datetime] NULL,
	[totalprice] [decimal](10, 2) NULL,
	[paymentid] [int] NOT NULL,
	[firstname] [nvarchar](30) NOT NULL,
	[lastname] [nvarchar](30) NOT NULL,
	[email] [nvarchar](50) NOT NULL,
	[address] [nvarchar](200) NOT NULL,
	[phone] [nvarchar](15) NOT NULL,
	[username] [varchar](30) NOT NULL,
	[status] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Payments]    Script Date: 7/5/2024 9:55:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Payments](
	[paymentid] [int] IDENTITY(1,1) NOT NULL,
	[payment_method] [nvarchar](30) NULL,
PRIMARY KEY CLUSTERED 
(
	[paymentid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 7/5/2024 9:55:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[firstname] [nvarchar](30) NOT NULL,
	[lastname] [nvarchar](30) NOT NULL,
	[email] [nvarchar](50) NOT NULL,
	[avatar] [varchar](200) NOT NULL,
	[username] [varchar](30) NOT NULL,
	[password] [varchar](64) NOT NULL,
	[address] [nvarchar](200) NOT NULL,
	[phone] [nvarchar](15) NOT NULL,
	[isadmin] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Categories] ON 

INSERT [dbo].[Categories] ([id], [name]) VALUES (1, N'Piano')
INSERT [dbo].[Categories] ([id], [name]) VALUES (2, N'Guitar')
INSERT [dbo].[Categories] ([id], [name]) VALUES (3, N'Drawing')
SET IDENTITY_INSERT [dbo].[Categories] OFF
GO
SET IDENTITY_INSERT [dbo].[Course] ON 

INSERT [dbo].[Course] ([id], [coursename], [categoryid], [description], [images], [startdate], [enddate], [price], [status], [quantity]) VALUES (206, N'Piano cơ bản', 1, N'Lớp piano cho người mới bắt đầu', N'View/Img/Piano/piano1.jpg', CAST(N'2024-07-01' AS Date), CAST(N'2024-08-01' AS Date), 100000.0000, 1, 20)
INSERT [dbo].[Course] ([id], [coursename], [categoryid], [description], [images], [startdate], [enddate], [price], [status], [quantity]) VALUES (207, N'Piano nâng cao', 1, N'Lớp piano cho người chơi nâng cao', N'View/Img/Piano/piano2.jpg', CAST(N'2024-08-01' AS Date), CAST(N'2024-09-01' AS Date), 200000.0000, 1, 20)
INSERT [dbo].[Course] ([id], [coursename], [categoryid], [description], [images], [startdate], [enddate], [price], [status], [quantity]) VALUES (208, N'Piano cổ điển', 1, N'Lớp piano chuyên về nhạc cổ điển', N'View/Img/Piano/piano3.jpg', CAST(N'2024-09-01' AS Date), CAST(N'2024-10-01' AS Date), 150000.0000, 0, 50)
INSERT [dbo].[Course] ([id], [coursename], [categoryid], [description], [images], [startdate], [enddate], [price], [status], [quantity]) VALUES (209, N'Piano hiện đại', 1, N'Lớp piano chuyên về nhạc hiện đại', N'View/Img/Piano/piano4.jpg', CAST(N'2024-10-01' AS Date), CAST(N'2024-11-01' AS Date), 180000.0000, 1, 19)
INSERT [dbo].[Course] ([id], [coursename], [categoryid], [description], [images], [startdate], [enddate], [price], [status], [quantity]) VALUES (210, N'Piano Jazz', 1, N'Lớp piano chuyên về nhạc Jazz', N'View/Img/Piano/piano5.jpg', CAST(N'2024-11-01' AS Date), CAST(N'2024-12-01' AS Date), 220000.0000, 1, 20)
INSERT [dbo].[Course] ([id], [coursename], [categoryid], [description], [images], [startdate], [enddate], [price], [status], [quantity]) VALUES (211, N'Piano Blues', 1, N'Lớp piano chuyên về nhạc Blues', N'View/Img/Piano/piano6.jpg', CAST(N'2024-12-01' AS Date), CAST(N'2025-01-01' AS Date), 210000.0000, 0, 12)
INSERT [dbo].[Course] ([id], [coursename], [categoryid], [description], [images], [startdate], [enddate], [price], [status], [quantity]) VALUES (212, N'Piano cho trẻ em', 1, N'Lớp piano dành cho trẻ em', N'View/Img/Piano/piano7.jpg', CAST(N'2024-07-15' AS Date), CAST(N'2024-08-15' AS Date), 130000.0000, 1, 20)
INSERT [dbo].[Course] ([id], [coursename], [categoryid], [description], [images], [startdate], [enddate], [price], [status], [quantity]) VALUES (213, N'Piano hòa tấu', 1, N'Lớp piano cho biểu diễn hòa tấu', N'View/Img/Piano/piano8.jpg', CAST(N'2024-08-15' AS Date), CAST(N'2024-09-15' AS Date), 160000.0000, 1, 20)
INSERT [dbo].[Course] ([id], [coursename], [categoryid], [description], [images], [startdate], [enddate], [price], [status], [quantity]) VALUES (214, N'Piano đệm hát', 1, N'Lớp piano cho đệm hát', N'View/Img/Piano/piano9.jpg', CAST(N'2024-09-15' AS Date), CAST(N'2024-10-15' AS Date), 175000.0000, 1, 20)
INSERT [dbo].[Course] ([id], [coursename], [categoryid], [description], [images], [startdate], [enddate], [price], [status], [quantity]) VALUES (215, N'Piano sáng tác', 1, N'Lớp piano cho sáng tác nhạc', N'View/Img/Piano/piano10.jpg', CAST(N'2024-10-15' AS Date), CAST(N'2024-11-15' AS Date), 190000.0000, 1, 20)
INSERT [dbo].[Course] ([id], [coursename], [categoryid], [description], [images], [startdate], [enddate], [price], [status], [quantity]) VALUES (216, N'Piano biểu diễn', 1, N'Lớp piano cho biểu diễn chuyên nghiệp', N'View/Img/Piano/piano11.jpg', CAST(N'2024-11-15' AS Date), CAST(N'2024-12-15' AS Date), 230000.0000, 1, 20)
INSERT [dbo].[Course] ([id], [coursename], [categoryid], [description], [images], [startdate], [enddate], [price], [status], [quantity]) VALUES (217, N'Piano luyện ngón', 1, N'Lớp piano tập trung vào kỹ thuật luyện ngón', N'View/Img/Piano/piano12.jpg', CAST(N'2024-12-15' AS Date), CAST(N'2025-01-15' AS Date), 120000.0000, 1, 18)
INSERT [dbo].[Course] ([id], [coursename], [categoryid], [description], [images], [startdate], [enddate], [price], [status], [quantity]) VALUES (218, N'Piano cấp tốc', 1, N'Lớp piano cấp tốc trong 1 tháng', N'View/Img/Piano/piano13.jpg', CAST(N'2024-01-01' AS Date), CAST(N'2024-02-01' AS Date), 250000.0000, 1, 20)
INSERT [dbo].[Course] ([id], [coursename], [categoryid], [description], [images], [startdate], [enddate], [price], [status], [quantity]) VALUES (219, N'Piano mùa hè', 1, N'Lớp piano trong dịp hè', N'View/Img/Piano/piano14.jpg', CAST(N'2024-06-01' AS Date), CAST(N'2024-07-01' AS Date), 110000.0000, 1, 20)
INSERT [dbo].[Course] ([id], [coursename], [categoryid], [description], [images], [startdate], [enddate], [price], [status], [quantity]) VALUES (220, N'Piano cuối tuần', 1, N'Lớp piano vào cuối tuần', N'View/Img/Piano/piano15.jpg', CAST(N'2024-05-01' AS Date), CAST(N'2024-06-01' AS Date), 175000.0000, 1, 20)
INSERT [dbo].[Course] ([id], [coursename], [categoryid], [description], [images], [startdate], [enddate], [price], [status], [quantity]) VALUES (221, N'Piano buổi tối', 1, N'Lớp piano vào buổi tối', N'View/Img/Piano/piano16.jpg', CAST(N'2024-09-01' AS Date), CAST(N'2024-10-01' AS Date), 130000.0000, 1, 20)
INSERT [dbo].[Course] ([id], [coursename], [categoryid], [description], [images], [startdate], [enddate], [price], [status], [quantity]) VALUES (222, N'Piano theo nhóm', 1, N'Lớp piano theo nhóm', N'View/Img/Piano/piano17.jpg', CAST(N'2024-10-01' AS Date), CAST(N'2024-11-01' AS Date), 140000.0000, 1, 20)
INSERT [dbo].[Course] ([id], [coursename], [categoryid], [description], [images], [startdate], [enddate], [price], [status], [quantity]) VALUES (223, N'Piano trực tuyến', 1, N'Lớp piano trực tuyến', N'View/Img/Piano/piano18.jpg', CAST(N'2024-11-01' AS Date), CAST(N'2024-12-01' AS Date), 125000.0000, 1, 19)
INSERT [dbo].[Course] ([id], [coursename], [categoryid], [description], [images], [startdate], [enddate], [price], [status], [quantity]) VALUES (224, N'Piano thực hành', 1, N'Lớp piano tập trung vào thực hành', N'View/Img/Piano/piano19.jpg', CAST(N'2024-12-01' AS Date), CAST(N'2025-01-01' AS Date), 220000.0000, 1, 18)
INSERT [dbo].[Course] ([id], [coursename], [categoryid], [description], [images], [startdate], [enddate], [price], [status], [quantity]) VALUES (225, N'Piano lý thuyết', 1, N'Lớp piano tập trung vào lý thuyết', N'View/Img/Piano/piano20.jpg', CAST(N'2024-01-15' AS Date), CAST(N'2024-02-15' AS Date), 160000.0000, 1, 20)
INSERT [dbo].[Course] ([id], [coursename], [categoryid], [description], [images], [startdate], [enddate], [price], [status], [quantity]) VALUES (226, N'Guitar cơ bản', 2, N'Lớp guitar cho người mới bắt đầu', N'View/Img/Guitar/guitar1.jpg', CAST(N'2024-07-01' AS Date), CAST(N'2024-08-01' AS Date), 120000.0000, 1, 20)
INSERT [dbo].[Course] ([id], [coursename], [categoryid], [description], [images], [startdate], [enddate], [price], [status], [quantity]) VALUES (227, N'Guitar nâng cao', 2, N'Lớp guitar cho người chơi nâng cao', N'View/Img/Guitar/guitar2.jpg', CAST(N'2024-08-01' AS Date), CAST(N'2024-09-01' AS Date), 250000.0000, 1, 20)
INSERT [dbo].[Course] ([id], [coursename], [categoryid], [description], [images], [startdate], [enddate], [price], [status], [quantity]) VALUES (228, N'Guitar cổ điển', 2, N'Lớp guitar chuyên về nhạc cổ điển', N'View/Img/Guitar/guitar3.jpg', CAST(N'2024-09-01' AS Date), CAST(N'2024-10-01' AS Date), 170000.0000, 1, 20)
INSERT [dbo].[Course] ([id], [coursename], [categoryid], [description], [images], [startdate], [enddate], [price], [status], [quantity]) VALUES (229, N'Guitar hiện đại', 2, N'Lớp guitar chuyên về nhạc hiện đại', N'View/Img/Guitar/guitar4.jpg', CAST(N'2024-10-01' AS Date), CAST(N'2024-11-01' AS Date), 200000.0000, 1, 20)
INSERT [dbo].[Course] ([id], [coursename], [categoryid], [description], [images], [startdate], [enddate], [price], [status], [quantity]) VALUES (230, N'Guitar Jazz', 2, N'Lớp guitar chuyên về nhạc Jazz', N'View/Img/Guitar/guitar5.jpg', CAST(N'2024-11-01' AS Date), CAST(N'2024-12-01' AS Date), 230000.0000, 1, 19)
INSERT [dbo].[Course] ([id], [coursename], [categoryid], [description], [images], [startdate], [enddate], [price], [status], [quantity]) VALUES (231, N'Guitar Blues', 2, N'Lớp guitar chuyên về nhạc Blues', N'View/Img/Guitar/guitar6.jpg', CAST(N'2024-12-01' AS Date), CAST(N'2025-01-01' AS Date), 220000.0000, 1, 20)
INSERT [dbo].[Course] ([id], [coursename], [categoryid], [description], [images], [startdate], [enddate], [price], [status], [quantity]) VALUES (232, N'Guitar cho trẻ em', 2, N'Lớp guitar dành cho trẻ em', N'View/Img/Guitar/guitar7.jpg', CAST(N'2024-07-15' AS Date), CAST(N'2024-08-15' AS Date), 140000.0000, 1, 20)
INSERT [dbo].[Course] ([id], [coursename], [categoryid], [description], [images], [startdate], [enddate], [price], [status], [quantity]) VALUES (233, N'Guitar hòa tấu', 2, N'Lớp guitar cho biểu diễn hòa tấu', N'View/Img/Guitar/guitar8.jpg', CAST(N'2024-08-15' AS Date), CAST(N'2024-09-15' AS Date), 180000.0000, 1, 20)
INSERT [dbo].[Course] ([id], [coursename], [categoryid], [description], [images], [startdate], [enddate], [price], [status], [quantity]) VALUES (234, N'Guitar đệm hát', 2, N'Lớp guitar cho đệm hát', N'View/Img/Guitar/guitar9.jpg', CAST(N'2024-09-15' AS Date), CAST(N'2024-10-15' AS Date), 195000.0000, 1, 20)
INSERT [dbo].[Course] ([id], [coursename], [categoryid], [description], [images], [startdate], [enddate], [price], [status], [quantity]) VALUES (235, N'Guitar sáng tác', 2, N'Lớp guitar cho sáng tác nhạc', N'View/Img/Guitar/guitar10.jpg', CAST(N'2024-10-15' AS Date), CAST(N'2024-11-15' AS Date), 210000.0000, 1, 20)
INSERT [dbo].[Course] ([id], [coursename], [categoryid], [description], [images], [startdate], [enddate], [price], [status], [quantity]) VALUES (236, N'Guitar mùa hè', 2, N'Lớp guitar trong dịp hè', N'View/Img/Guitar/guitar11.jpg', CAST(N'2024-06-01' AS Date), CAST(N'2024-07-01' AS Date), 150000.0000, 1, 20)
INSERT [dbo].[Course] ([id], [coursename], [categoryid], [description], [images], [startdate], [enddate], [price], [status], [quantity]) VALUES (237, N'Guitar cuối tuần', 2, N'Lớp guitar vào cuối tuần', N'View/Img/Guitar/guitar12.jpg', CAST(N'2024-05-01' AS Date), CAST(N'2024-06-01' AS Date), 180000.0000, 1, 20)
INSERT [dbo].[Course] ([id], [coursename], [categoryid], [description], [images], [startdate], [enddate], [price], [status], [quantity]) VALUES (238, N'Guitar buổi tối', 2, N'Lớp guitar vào buổi tối', N'View/Img/Guitar/guitar13.jpg', CAST(N'2024-09-01' AS Date), CAST(N'2024-10-01' AS Date), 190000.0000, 1, 20)
INSERT [dbo].[Course] ([id], [coursename], [categoryid], [description], [images], [startdate], [enddate], [price], [status], [quantity]) VALUES (239, N'Guitar theo nhóm', 2, N'Lớp guitar theo nhóm', N'View/Img/Guitar/guitar14.jpg', CAST(N'2024-10-01' AS Date), CAST(N'2024-11-01' AS Date), 210000.0000, 1, 20)
INSERT [dbo].[Course] ([id], [coursename], [categoryid], [description], [images], [startdate], [enddate], [price], [status], [quantity]) VALUES (240, N'Guitar trực tuyến', 2, N'Lớp guitar trực tuyến', N'View/Img/Guitar/guitar15.jpg', CAST(N'2024-11-01' AS Date), CAST(N'2024-12-01' AS Date), 230000.0000, 1, 20)
INSERT [dbo].[Course] ([id], [coursename], [categoryid], [description], [images], [startdate], [enddate], [price], [status], [quantity]) VALUES (241, N'Guitar thực hành', 2, N'Lớp guitar tập trung vào thực hành', N'View/Img/Guitar/guitar16.jpg', CAST(N'2024-12-01' AS Date), CAST(N'2025-01-01' AS Date), 220000.0000, 1, 19)
INSERT [dbo].[Course] ([id], [coursename], [categoryid], [description], [images], [startdate], [enddate], [price], [status], [quantity]) VALUES (242, N'Guitar lý thuyết', 2, N'Lớp guitar tập trung vào lý thuyết', N'View/Img/Guitar/guitar17.jpg', CAST(N'2024-01-15' AS Date), CAST(N'2024-02-15' AS Date), 240000.0000, 1, 20)
INSERT [dbo].[Course] ([id], [coursename], [categoryid], [description], [images], [startdate], [enddate], [price], [status], [quantity]) VALUES (243, N'Guitar cấp tốc', 2, N'Lớp guitar cấp tốc trong 1 tháng', N'View/Img/Guitar/guitar18.jpg', CAST(N'2024-02-15' AS Date), CAST(N'2024-03-15' AS Date), 260000.0000, 1, 20)
INSERT [dbo].[Course] ([id], [coursename], [categoryid], [description], [images], [startdate], [enddate], [price], [status], [quantity]) VALUES (244, N'Guitar biểu diễn', 2, N'Lớp guitar cho biểu diễn', N'View/Img/Guitar/guitar19.jpg', CAST(N'2024-03-15' AS Date), CAST(N'2024-04-15' AS Date), 270000.0000, 1, 20)
INSERT [dbo].[Course] ([id], [coursename], [categoryid], [description], [images], [startdate], [enddate], [price], [status], [quantity]) VALUES (245, N'Guitar nghệ thuật số', 2, N'Lớp guitar nghệ thuật số', N'View/Img/Guitar/guitar20.jpg', CAST(N'2024-04-15' AS Date), CAST(N'2024-05-15' AS Date), 280000.0000, 1, 20)
INSERT [dbo].[Course] ([id], [coursename], [categoryid], [description], [images], [startdate], [enddate], [price], [status], [quantity]) VALUES (246, N'Vẽ cơ bản', 3, N'Lớp vẽ cho người mới bắt đầu', N'View/Img/Drawing/drawing1.jpg', CAST(N'2024-07-01' AS Date), CAST(N'2024-08-01' AS Date), 110000.0000, 1, 20)
INSERT [dbo].[Course] ([id], [coursename], [categoryid], [description], [images], [startdate], [enddate], [price], [status], [quantity]) VALUES (247, N'Vẽ nâng cao', 3, N'Lớp vẽ cho người chơi nâng cao', N'View/Img/Drawing/drawing2.jpg', CAST(N'2024-08-01' AS Date), CAST(N'2024-09-01' AS Date), 220000.0000, 1, 20)
INSERT [dbo].[Course] ([id], [coursename], [categoryid], [description], [images], [startdate], [enddate], [price], [status], [quantity]) VALUES (248, N'Vẽ chân dung', 3, N'Lớp vẽ chân dung cho người mới bắt đầu', N'View/Img/Drawing/drawing3.jpg', CAST(N'2024-09-01' AS Date), CAST(N'2024-10-01' AS Date), 170000.0000, 1, 20)
INSERT [dbo].[Course] ([id], [coursename], [categoryid], [description], [images], [startdate], [enddate], [price], [status], [quantity]) VALUES (249, N'Vẽ tranh sơn dầu', 3, N'Lớp vẽ tranh sơn dầu', N'View/Img/Drawing/drawing4.jpg', CAST(N'2024-10-01' AS Date), CAST(N'2024-11-01' AS Date), 200000.0000, 1, 20)
INSERT [dbo].[Course] ([id], [coursename], [categoryid], [description], [images], [startdate], [enddate], [price], [status], [quantity]) VALUES (250, N'Vẽ tranh màu nước', 3, N'Lớp vẽ tranh màu nước', N'View/Img/Drawing/drawing5.jpg', CAST(N'2024-11-01' AS Date), CAST(N'2024-12-01' AS Date), 230000.0000, 1, 18)
INSERT [dbo].[Course] ([id], [coursename], [categoryid], [description], [images], [startdate], [enddate], [price], [status], [quantity]) VALUES (251, N'Vẽ phong cảnh', 3, N'Lớp vẽ phong cảnh', N'View/Img/Drawing/drawing6.jpg', CAST(N'2024-12-01' AS Date), CAST(N'2025-01-01' AS Date), 220000.0000, 1, 16)
INSERT [dbo].[Course] ([id], [coursename], [categoryid], [description], [images], [startdate], [enddate], [price], [status], [quantity]) VALUES (252, N'Vẽ tranh trừu tượng', 3, N'Lớp vẽ tranh trừu tượng', N'View/Img/Drawing/drawing7.jpg', CAST(N'2024-07-15' AS Date), CAST(N'2024-08-15' AS Date), 140000.0000, 1, 20)
INSERT [dbo].[Course] ([id], [coursename], [categoryid], [description], [images], [startdate], [enddate], [price], [status], [quantity]) VALUES (253, N'Vẽ tranh hoạt hình', 3, N'Lớp vẽ tranh hoạt hình', N'View/Img/Drawing/drawing8.jpg', CAST(N'2024-08-15' AS Date), CAST(N'2024-09-15' AS Date), 180000.0000, 1, 20)
INSERT [dbo].[Course] ([id], [coursename], [categoryid], [description], [images], [startdate], [enddate], [price], [status], [quantity]) VALUES (254, N'Vẽ truyện tranh', 3, N'Lớp vẽ truyện tranh', N'View/Img/Drawing/drawing9.jpg', CAST(N'2024-09-15' AS Date), CAST(N'2024-10-15' AS Date), 195000.0000, 1, 20)
INSERT [dbo].[Course] ([id], [coursename], [categoryid], [description], [images], [startdate], [enddate], [price], [status], [quantity]) VALUES (255, N'Vẽ nghệ thuật số', 3, N'Lớp vẽ nghệ thuật số', N'View/Img/Drawing/drawing10.jpg', CAST(N'2024-10-15' AS Date), CAST(N'2024-11-15' AS Date), 210000.0000, 1, 20)
INSERT [dbo].[Course] ([id], [coursename], [categoryid], [description], [images], [startdate], [enddate], [price], [status], [quantity]) VALUES (256, N'Guitar biểu diễn chuyên nghiệp', 2, N'Lớp guitar cho biểu diễn chuyên nghiệp', N'View/Img/Guitar/guitar11.jpg', CAST(N'2024-01-01' AS Date), CAST(N'2024-02-01' AS Date), 260000.0000, 1, 20)
INSERT [dbo].[Course] ([id], [coursename], [categoryid], [description], [images], [startdate], [enddate], [price], [status], [quantity]) VALUES (257, N'Guitar cổ điển nâng cao', 2, N'Lớp guitar cổ điển nâng cao', N'View/Img/Guitar/guitar12.jpg', CAST(N'2024-02-01' AS Date), CAST(N'2024-03-01' AS Date), 270000.0000, 1, 20)
INSERT [dbo].[Course] ([id], [coursename], [categoryid], [description], [images], [startdate], [enddate], [price], [status], [quantity]) VALUES (258, N'Guitar sáng tác nâng cao', 2, N'Lớp guitar sáng tác nâng cao', N'View/Img/Guitar/guitar13.jpg', CAST(N'2024-03-01' AS Date), CAST(N'2024-04-01' AS Date), 250000.0000, 1, 20)
INSERT [dbo].[Course] ([id], [coursename], [categoryid], [description], [images], [startdate], [enddate], [price], [status], [quantity]) VALUES (259, N'Guitar đệm hát nâng cao', 2, N'Lớp guitar đệm hát nâng cao', N'View/Img/Guitar/guitar14.jpg', CAST(N'2024-04-01' AS Date), CAST(N'2024-05-01' AS Date), 240000.0000, 1, 20)
INSERT [dbo].[Course] ([id], [coursename], [categoryid], [description], [images], [startdate], [enddate], [price], [status], [quantity]) VALUES (260, N'Guitar cho trẻ em nâng cao', 2, N'Lớp guitar cho trẻ em nâng cao', N'View/Img/Guitar/guitar15.jpg', CAST(N'2024-05-01' AS Date), CAST(N'2024-06-01' AS Date), 230000.0000, 1, 20)
INSERT [dbo].[Course] ([id], [coursename], [categoryid], [description], [images], [startdate], [enddate], [price], [status], [quantity]) VALUES (261, N'Guitar hiện đại nâng cao', 2, N'Lớp guitar hiện đại nâng cao', N'View/Img/Guitar/guitar16.jpg', CAST(N'2024-06-01' AS Date), CAST(N'2024-07-01' AS Date), 260000.0000, 1, 20)
INSERT [dbo].[Course] ([id], [coursename], [categoryid], [description], [images], [startdate], [enddate], [price], [status], [quantity]) VALUES (262, N'Guitar Jazz nâng cao', 2, N'Lớp guitar Jazz nâng cao', N'View/Img/Guitar/guitar17.jpg', CAST(N'2024-07-01' AS Date), CAST(N'2024-08-01' AS Date), 280000.0000, 1, 20)
INSERT [dbo].[Course] ([id], [coursename], [categoryid], [description], [images], [startdate], [enddate], [price], [status], [quantity]) VALUES (263, N'Guitar Blues nâng cao', 2, N'Lớp guitar Blues nâng cao', N'View/Img/Guitar/guitar18.jpg', CAST(N'2024-08-01' AS Date), CAST(N'2024-09-01' AS Date), 270000.0000, 1, 20)
INSERT [dbo].[Course] ([id], [coursename], [categoryid], [description], [images], [startdate], [enddate], [price], [status], [quantity]) VALUES (264, N'Guitar luyện ngón', 2, N'Lớp guitar luyện ngón', N'View/Img/Guitar/guitar19.jpg', CAST(N'2024-09-01' AS Date), CAST(N'2024-10-01' AS Date), 220000.0000, 1, 20)
INSERT [dbo].[Course] ([id], [coursename], [categoryid], [description], [images], [startdate], [enddate], [price], [status], [quantity]) VALUES (265, N'Guitar biểu diễn hòa tấu', 2, N'Lớp guitar biểu diễn hòa tấu', N'View/Img/Guitar/guitar20.jpg', CAST(N'2024-10-01' AS Date), CAST(N'2024-11-01' AS Date), 250000.0000, 1, 20)
SET IDENTITY_INSERT [dbo].[Course] OFF
GO
INSERT [dbo].[OrderItem] ([quantity], [course_id], [order_id]) VALUES (1, 211, 4)
INSERT [dbo].[OrderItem] ([quantity], [course_id], [order_id]) VALUES (1, 211, 5)
INSERT [dbo].[OrderItem] ([quantity], [course_id], [order_id]) VALUES (1, 223, 2)
INSERT [dbo].[OrderItem] ([quantity], [course_id], [order_id]) VALUES (1, 224, 1)
INSERT [dbo].[OrderItem] ([quantity], [course_id], [order_id]) VALUES (1, 224, 2)
INSERT [dbo].[OrderItem] ([quantity], [course_id], [order_id]) VALUES (1, 241, 2)
INSERT [dbo].[OrderItem] ([quantity], [course_id], [order_id]) VALUES (1, 251, 3)
GO
SET IDENTITY_INSERT [dbo].[Orders] ON 

INSERT [dbo].[Orders] ([id], [orderdate], [totalprice], [paymentid], [firstname], [lastname], [email], [address], [phone], [username], [status]) VALUES (1, CAST(N'2024-07-05T00:00:00.000' AS DateTime), CAST(220000.00 AS Decimal(10, 2)), 1, N'John', N'Doe', N'john.doe@example.com', N'123 Main St', N'1234567', N'jo', 1)
INSERT [dbo].[Orders] ([id], [orderdate], [totalprice], [paymentid], [firstname], [lastname], [email], [address], [phone], [username], [status]) VALUES (2, CAST(N'2024-07-05T00:00:00.000' AS DateTime), CAST(565000.00 AS Decimal(10, 2)), 1, N'Bùi', N'Hữu Hoàng', N'buihuuhoang@example.com', N'123 Bùi H?u Hoàng St, Bùi H?u Hoàng City', N'321987654', N'buihuuhoang', 1)
INSERT [dbo].[Orders] ([id], [orderdate], [totalprice], [paymentid], [firstname], [lastname], [email], [address], [phone], [username], [status]) VALUES (3, CAST(N'2024-07-05T00:00:00.000' AS DateTime), CAST(220000.00 AS Decimal(10, 2)), 1, N'minh anh', N'Doe1', N'anhm250426@gmail.com', N'123 Main St1', N'2345689', N'anhnm', 1)
INSERT [dbo].[Orders] ([id], [orderdate], [totalprice], [paymentid], [firstname], [lastname], [email], [address], [phone], [username], [status]) VALUES (4, CAST(N'2024-07-05T00:00:00.000' AS DateTime), CAST(210000.00 AS Decimal(10, 2)), 1, N'Bùi', N'Hữu Hoàng', N'buihuuhoang@example.com', N'123 Bùi H?u Hoàng St, Bùi H?u Hoàng City', N'321987654', N'buihuuhoang', 1)
INSERT [dbo].[Orders] ([id], [orderdate], [totalprice], [paymentid], [firstname], [lastname], [email], [address], [phone], [username], [status]) VALUES (5, CAST(N'2024-07-05T00:00:00.000' AS DateTime), CAST(210000.00 AS Decimal(10, 2)), 1, N'harley', N'leee', N'harleyle01@gmail.com', N'123 Main St1', N'2345689', N'harleyleee', 1)
SET IDENTITY_INSERT [dbo].[Orders] OFF
GO
SET IDENTITY_INSERT [dbo].[Payments] ON 

INSERT [dbo].[Payments] ([paymentid], [payment_method]) VALUES (1, N'Cash')
INSERT [dbo].[Payments] ([paymentid], [payment_method]) VALUES (2, N'Credit Card')
SET IDENTITY_INSERT [dbo].[Payments] OFF
GO
SET IDENTITY_INSERT [dbo].[Users] ON 

INSERT [dbo].[Users] ([id], [firstname], [lastname], [email], [avatar], [username], [password], [address], [phone], [isadmin]) VALUES (32, N'Admin', N'Siu Cấp Pro', N'admin@example.com', N'View/Img/User/user0.jpg', N'admin', N'12345', N'123 Admin St, Admin City', N'123456789', 1)
INSERT [dbo].[Users] ([id], [firstname], [lastname], [email], [avatar], [username], [password], [address], [phone], [isadmin]) VALUES (39, N'Bùi', N'Hữu Hoàng', N'buihuuhoang@example.com', N'View/Img/User/user7.jpg', N'buihuuhoang', N'Hhoangbui', N'123 Bùi H?u Hoàng St, Bùi H?u Hoàng City', N'321987654', 0)
INSERT [dbo].[Users] ([id], [firstname], [lastname], [email], [avatar], [username], [password], [address], [phone], [isadmin]) VALUES (42, N'Dương', N'Thị Hải', N'duongthihai@example.com', N'View/Img/User/user10.jpg', N'duongthihai', N'Haithihiu', N'123 Duong Th? H?i St, Duong Th? H?i City', N'321987654', 0)
INSERT [dbo].[Users] ([id], [firstname], [lastname], [email], [avatar], [username], [password], [address], [phone], [isadmin]) VALUES (33, N'Hoàng', N'Minh Anh', N'hoangminhanh@example.com', N'View/Img/User/user1.jpg', N'hoangminhanh', N'123456', N'123 Hoàng Minh Anh St, Hoàng Minh Anh City', N'987654321', 0)
INSERT [dbo].[Users] ([id], [firstname], [lastname], [email], [avatar], [username], [password], [address], [phone], [isadmin]) VALUES (37, N'Lê', N'Đức Tuấn', N'leductuan@example.com', N'View/Img/User/user5.jpg', N'leductuan', N'Tuanleee', N'123 Lê Ð?c Tu?n St, Lê Ð?c Tu?n City', N'654987321', 0)
INSERT [dbo].[Users] ([id], [firstname], [lastname], [email], [avatar], [username], [password], [address], [phone], [isadmin]) VALUES (41, N'Lương', N'Văn Nam', N'luongvannam@example.com', N'View/Img/User/user9.jpg', N'luongvannam', N'Concacon456', N'123 Luong Van Nam St, Luong Van Nam City', N'987654321', 0)
INSERT [dbo].[Users] ([id], [firstname], [lastname], [email], [avatar], [username], [password], [address], [phone], [isadmin]) VALUES (34, N'Nguyễn', N'Gia Minh', N'nguyengiaminh@example.com', N'View/Img/User/user2.jpg', N'nguyengiaminh', N'Conca123', N'123 Nguy?n Gia Minh St, Nguy?n Gia Minh City', N'456789123', 0)
INSERT [dbo].[Users] ([id], [firstname], [lastname], [email], [avatar], [username], [password], [address], [phone], [isadmin]) VALUES (36, N'Nguyễn', N'Thị Mai', N'nguyenthimai@example.com', N'View/Img/User/user4.jpg', N'nguyenthimai', N'Deplao789', N'123 Nguy?n Th? Mai St, Nguy?n Th? Mai City', N'321654987', 0)
INSERT [dbo].[Users] ([id], [firstname], [lastname], [email], [avatar], [username], [password], [address], [phone], [isadmin]) VALUES (38, N'Phạm', N'Thị Hồng', N'phamthihong@example.com', N'View/Img/User/user6.jpg', N'phamthihong', N'Congacon456', N'123 Ph?m Th? H?ng St, Ph?m Th? H?ng City', N'987321654', 0)
INSERT [dbo].[Users] ([id], [firstname], [lastname], [email], [avatar], [username], [password], [address], [phone], [isadmin]) VALUES (35, N'Trần', N'Hoàng Khánh', N'tranhoangkhanh@example.com', N'View/Img/User/user3.jpg', N'tranhoangkhanh', N'Khanhhoang456', N'123 Tr?n Hoàng Khánh St, Tr?n Hoàng Khánh City', N'789123456', 0)
INSERT [dbo].[Users] ([id], [firstname], [lastname], [email], [avatar], [username], [password], [address], [phone], [isadmin]) VALUES (40, N'Vũ', N'Thị Lan', N'vuthilan@example.com', N'View/Img/User/user8.jpg', N'vuthilan', N'Conchimnon123', N'123 Vu Th? Lan St, Vu Th? Lan City', N'654321987', 0)
SET IDENTITY_INSERT [dbo].[Users] OFF
GO
ALTER TABLE [dbo].[Course]  WITH CHECK ADD FOREIGN KEY([categoryid])
REFERENCES [dbo].[Categories] ([id])
ON UPDATE CASCADE
ON DELETE SET NULL
GO
ALTER TABLE [dbo].[OrderItem]  WITH CHECK ADD  CONSTRAINT [FK_OrderItem_Course] FOREIGN KEY([course_id])
REFERENCES [dbo].[Course] ([id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[OrderItem] CHECK CONSTRAINT [FK_OrderItem_Course]
GO
ALTER TABLE [dbo].[OrderItem]  WITH CHECK ADD  CONSTRAINT [FK_OrderItem_Order] FOREIGN KEY([order_id])
REFERENCES [dbo].[Orders] ([id])
GO
ALTER TABLE [dbo].[OrderItem] CHECK CONSTRAINT [FK_OrderItem_Order]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD FOREIGN KEY([paymentid])
REFERENCES [dbo].[Payments] ([paymentid])
GO
