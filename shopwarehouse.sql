USE [ShopWarehouse]
GO
/****** Object:  User [shopadmin]    Script Date: 2018/1/7 19:46:49 ******/
CREATE USER [shopadmin] FOR LOGIN [shopadmin] WITH DEFAULT_SCHEMA=[dbo]
GO
ALTER ROLE [db_owner] ADD MEMBER [shopadmin]
GO
ALTER ROLE [db_accessadmin] ADD MEMBER [shopadmin]
GO
ALTER ROLE [db_securityadmin] ADD MEMBER [shopadmin]
GO
ALTER ROLE [db_ddladmin] ADD MEMBER [shopadmin]
GO
ALTER ROLE [db_backupoperator] ADD MEMBER [shopadmin]
GO
ALTER ROLE [db_datareader] ADD MEMBER [shopadmin]
GO
ALTER ROLE [db_datawriter] ADD MEMBER [shopadmin]
GO
/****** Object:  Table [dbo].[goods]    Script Date: 2018/1/7 19:46:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[goods](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](20) NOT NULL,
	[factory] [varchar](20) NOT NULL,
	[model] [varchar](20) NOT NULL,
	[specification] [varchar](20) NOT NULL,
	[price] [int] NOT NULL,
	[quantity] [int] NOT NULL,
 CONSTRAINT [PK__goods__3213E83FB8DCB5BA] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[orders]    Script Date: 2018/1/7 19:46:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[orders](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[good_id] [int] NOT NULL,
	[quantity] [int] NOT NULL,
	[month_time] [date] NULL,
	[clock_time] [time](7) NULL,
	[corp_name] [varchar](50) NOT NULL,
	[operator] [varchar](50) NOT NULL,
 CONSTRAINT [PK__orders__3213E83F2D80A1A7] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[users]    Script Date: 2018/1/7 19:46:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[users](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[username] [varchar](20) NOT NULL,
	[password] [varchar](50) NOT NULL,
	[age] [int] NOT NULL,
	[sex] [varchar](2) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[goods] ON 

INSERT [dbo].[goods] ([id], [name], [factory], [model], [specification], [price], [quantity]) VALUES (18, N'Kobe-AD', N'NIKE', N'AD', N'43', 1299, 40)
INSERT [dbo].[goods] ([id], [name], [factory], [model], [specification], [price], [quantity]) VALUES (19, N'桌子', N'桌子工厂', N'xx50', N'x-5', 321, 0)
INSERT [dbo].[goods] ([id], [name], [factory], [model], [specification], [price], [quantity]) VALUES (20, N'相机', N'Canon', N'mm5', N'I7', 2999, 0)
INSERT [dbo].[goods] ([id], [name], [factory], [model], [specification], [price], [quantity]) VALUES (21, N'笔记本', N'Hp', N'暗影精灵', N'1', 4999, 90)
INSERT [dbo].[goods] ([id], [name], [factory], [model], [specification], [price], [quantity]) VALUES (22, N'显示器', N'DELL', N'x2417', N'24', 1599, 0)
INSERT [dbo].[goods] ([id], [name], [factory], [model], [specification], [price], [quantity]) VALUES (23, N'a', N'a', N'a', N'a', 12, 0)
SET IDENTITY_INSERT [dbo].[goods] OFF
SET IDENTITY_INSERT [dbo].[orders] ON 

INSERT [dbo].[orders] ([id], [good_id], [quantity], [month_time], [clock_time], [corp_name], [operator]) VALUES (3, 18, 10, CAST(N'2018-01-07' AS Date), CAST(N'12:13:00' AS Time), N'BoTao', N'li')
INSERT [dbo].[orders] ([id], [good_id], [quantity], [month_time], [clock_time], [corp_name], [operator]) VALUES (6, 21, 5, CAST(N'2018-01-07' AS Date), CAST(N'12:14:00' AS Time), N'Dian', N'zhang')
INSERT [dbo].[orders] ([id], [good_id], [quantity], [month_time], [clock_time], [corp_name], [operator]) VALUES (7, 21, 15, CAST(N'2018-01-08' AS Date), CAST(N'14:14:20' AS Time), N'test_corp', N'test_web')
INSERT [dbo].[orders] ([id], [good_id], [quantity], [month_time], [clock_time], [corp_name], [operator]) VALUES (8, 21, 15, CAST(N'2018-01-08' AS Date), CAST(N'14:14:20' AS Time), N'test_corp', N'test_web')
INSERT [dbo].[orders] ([id], [good_id], [quantity], [month_time], [clock_time], [corp_name], [operator]) VALUES (9, 21, 15, CAST(N'2018-01-08' AS Date), CAST(N'14:14:20' AS Time), N'test_corp', N'test_web')
INSERT [dbo].[orders] ([id], [good_id], [quantity], [month_time], [clock_time], [corp_name], [operator]) VALUES (10, 21, 15, CAST(N'2018-01-08' AS Date), CAST(N'14:14:20' AS Time), N'test_corp', N'test_web')
INSERT [dbo].[orders] ([id], [good_id], [quantity], [month_time], [clock_time], [corp_name], [operator]) VALUES (11, 21, 15, CAST(N'2018-01-08' AS Date), CAST(N'14:14:20' AS Time), N'test_corp', N'test_web')
INSERT [dbo].[orders] ([id], [good_id], [quantity], [month_time], [clock_time], [corp_name], [operator]) VALUES (12, 21, 15, CAST(N'2018-01-08' AS Date), CAST(N'14:14:20' AS Time), N'test_corp', N'test_web')
INSERT [dbo].[orders] ([id], [good_id], [quantity], [month_time], [clock_time], [corp_name], [operator]) VALUES (13, 21, 15, CAST(N'2018-01-08' AS Date), CAST(N'14:14:20' AS Time), N'test_corp', N'test_web')
INSERT [dbo].[orders] ([id], [good_id], [quantity], [month_time], [clock_time], [corp_name], [operator]) VALUES (14, 21, -15, CAST(N'2018-01-08' AS Date), CAST(N'14:14:20' AS Time), N'test_corp', N'test_web')
INSERT [dbo].[orders] ([id], [good_id], [quantity], [month_time], [clock_time], [corp_name], [operator]) VALUES (15, 21, -35, CAST(N'2018-01-08' AS Date), CAST(N'14:14:20' AS Time), N'test_corp', N'test_web')
INSERT [dbo].[orders] ([id], [good_id], [quantity], [month_time], [clock_time], [corp_name], [operator]) VALUES (16, 21, 15, CAST(N'2018-01-07' AS Date), CAST(N'15:17:13' AS Time), N'test_corp', N'test_web')
INSERT [dbo].[orders] ([id], [good_id], [quantity], [month_time], [clock_time], [corp_name], [operator]) VALUES (17, 21, 15, CAST(N'2018-01-07' AS Date), CAST(N'15:58:24' AS Time), N'test_corp', N'test_web')
INSERT [dbo].[orders] ([id], [good_id], [quantity], [month_time], [clock_time], [corp_name], [operator]) VALUES (20, 21, 15, CAST(N'2018-01-07' AS Date), CAST(N'16:03:06' AS Time), N'test_corp', N'test_web')
INSERT [dbo].[orders] ([id], [good_id], [quantity], [month_time], [clock_time], [corp_name], [operator]) VALUES (21, 21, 15, CAST(N'2018-01-07' AS Date), CAST(N'16:03:39' AS Time), N'test_corp', N'test_web')
INSERT [dbo].[orders] ([id], [good_id], [quantity], [month_time], [clock_time], [corp_name], [operator]) VALUES (22, 18, 20, CAST(N'2018-01-07' AS Date), CAST(N'16:07:21' AS Time), N'test_corp', N'test_web')
INSERT [dbo].[orders] ([id], [good_id], [quantity], [month_time], [clock_time], [corp_name], [operator]) VALUES (23, 18, 30, CAST(N'2018-01-07' AS Date), CAST(N'16:08:17' AS Time), N'servlet_corp', N'servlet_web')
INSERT [dbo].[orders] ([id], [good_id], [quantity], [month_time], [clock_time], [corp_name], [operator]) VALUES (24, 18, -10, CAST(N'2018-01-07' AS Date), CAST(N'17:20:07' AS Time), N'test', N'test')
SET IDENTITY_INSERT [dbo].[orders] OFF
SET IDENTITY_INSERT [dbo].[users] ON 

INSERT [dbo].[users] ([id], [username], [password], [age], [sex]) VALUES (3, N'test1', N'123123', 1, N'm')
SET IDENTITY_INSERT [dbo].[users] OFF
SET ANSI_PADDING ON

GO
/****** Object:  Index [uniquename]    Script Date: 2018/1/7 19:46:49 ******/
ALTER TABLE [dbo].[goods] ADD  CONSTRAINT [uniquename] UNIQUE NONCLUSTERED 
(
	[name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [UQ__users__F3DBC5722E2B5809]    Script Date: 2018/1/7 19:46:49 ******/
ALTER TABLE [dbo].[users] ADD UNIQUE NONCLUSTERED 
(
	[username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[users]  WITH CHECK ADD CHECK  (([sex]='m' OR [sex]='w'))
GO
