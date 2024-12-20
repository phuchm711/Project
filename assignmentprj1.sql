USE [assignment]
GO
/****** Object:  Table [dbo].[Attendence]    Script Date: 15/10/2024 12:08:01 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Attendence](
	[AttendanceID] [int] NOT NULL,
	[EmployeeScheduleID] [int] NOT NULL,
	[Quantity] [nvarchar](50) NOT NULL,
	[Anpha] [decimal](18, 0) NOT NULL,
 CONSTRAINT [PK_Attendence] PRIMARY KEY CLUSTERED 
(
	[AttendanceID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[department]    Script Date: 15/10/2024 12:08:01 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[department](
	[DepartmentID] [int] NOT NULL,
	[DepartmentName] [nvarchar](100) NOT NULL,
	[DepartmentType] [nchar](255) NOT NULL,
 CONSTRAINT [PK_department] PRIMARY KEY CLUSTERED 
(
	[DepartmentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Employee]    Script Date: 15/10/2024 12:08:01 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Employee](
	[EmployeeID] [int] NOT NULL,
	[EmployeeName] [nvarchar](150) NOT NULL,
	[EmployeeSalaryLevel] [nvarchar](50) NULL,
	[RoleID] [int] NOT NULL,
	[DepartmentID] [int] NOT NULL,
	[CreateBy] [nvarchar](150) NULL,
 CONSTRAINT [PK_Employee] PRIMARY KEY CLUSTERED 
(
	[EmployeeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EmployeeSchedule]    Script Date: 15/10/2024 12:08:01 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EmployeeSchedule](
	[EmployeeScheduleID] [int] NOT NULL,
	[ScheduleID] [int] NOT NULL,
	[EmployeeID] [int] NOT NULL,
	[Quantity] [int] NOT NULL,
 CONSTRAINT [PK_EmployeeSchedule] PRIMARY KEY CLUSTERED 
(
	[EmployeeScheduleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Feature]    Script Date: 15/10/2024 12:08:01 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Feature](
	[FeatureID] [int] NOT NULL,
	[FeatureName] [nvarchar](150) NOT NULL,
	[url] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Feature] PRIMARY KEY CLUSTERED 
(
	[FeatureID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PlanCampagin]    Script Date: 15/10/2024 12:08:01 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PlanCampagin](
	[PlanCampaignID] [int] NOT NULL,
	[PlanID] [int] NOT NULL,
	[ProductID] [int] NOT NULL,
	[PlanCampaignQuantity] [nvarchar](150) NOT NULL,
	[PlanCampaignEPU] [nvarchar](150) NOT NULL,
 CONSTRAINT [PK_PlanCampagin] PRIMARY KEY CLUSTERED 
(
	[PlanCampaignID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product]    Script Date: 15/10/2024 12:08:01 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[ProductID] [int] NOT NULL,
	[ProductName] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Product] PRIMARY KEY CLUSTERED 
(
	[ProductID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductionPlan]    Script Date: 15/10/2024 12:08:01 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductionPlan](
	[PlanID] [int] NOT NULL,
	[PlanName] [nvarchar](150) NOT NULL,
	[PlanDateStart] [date] NOT NULL,
	[PlanDateEnd] [date] NOT NULL,
	[DepartmentID] [int] NOT NULL,
	[Quantity] [varchar](50) NOT NULL,
 CONSTRAINT [PK_ProductionPlan] PRIMARY KEY CLUSTERED 
(
	[PlanID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Role]    Script Date: 15/10/2024 12:08:01 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Role](
	[RoleID] [int] NOT NULL,
	[RoleName] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Role] PRIMARY KEY CLUSTERED 
(
	[RoleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RoleFeature]    Script Date: 15/10/2024 12:08:01 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RoleFeature](
	[FeatureID] [int] NOT NULL,
	[RoleID] [int] NOT NULL,
 CONSTRAINT [PK_RoleFeature] PRIMARY KEY CLUSTERED 
(
	[FeatureID] ASC,
	[RoleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ScheduleCampaign]    Script Date: 15/10/2024 12:08:01 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ScheduleCampaign](
	[ScheduleID] [int] NOT NULL,
	[PlanCampaignID] [int] NOT NULL,
	[Date] [date] NOT NULL,
	[Shift] [nvarchar](50) NULL,
	[Quantity] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_ScheduleCampaign] PRIMARY KEY CLUSTERED 
(
	[ScheduleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User]    Script Date: 15/10/2024 12:08:01 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[UserName] [nvarchar](150) NOT NULL,
	[Pass] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[UserName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserEmployee]    Script Date: 15/10/2024 12:08:01 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserEmployee](
	[UserName] [nvarchar](150) NOT NULL,
	[EmployeeID] [int] NOT NULL,
	[Active] [bit] NOT NULL,
 CONSTRAINT [PK_UserEmployee] PRIMARY KEY CLUSTERED 
(
	[UserName] ASC,
	[EmployeeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserRole]    Script Date: 15/10/2024 12:08:01 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserRole](
	[UserID] [nvarchar](150) NOT NULL,
	[RoleID] [int] NOT NULL,
 CONSTRAINT [PK_UserRole] PRIMARY KEY CLUSTERED 
(
	[UserID] ASC,
	[RoleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[department] ([DepartmentID], [DepartmentName], [DepartmentType]) VALUES (1, N'Human Resources', N'Human Resources Management                                                                                                                                                                                                                                     ')
INSERT [dbo].[department] ([DepartmentID], [DepartmentName], [DepartmentType]) VALUES (2, N'Accounting', N'Finance                                                                                                                                                                                                                                                        ')
INSERT [dbo].[department] ([DepartmentID], [DepartmentName], [DepartmentType]) VALUES (3, N'Planning', N'Production Planning                                                                                                                                                                                                                                            ')
GO
INSERT [dbo].[Employee] ([EmployeeID], [EmployeeName], [EmployeeSalaryLevel], [RoleID], [DepartmentID], [CreateBy]) VALUES (1, N'Nguyễn Minh Hùng', N'', 3, 3, NULL)
INSERT [dbo].[Employee] ([EmployeeID], [EmployeeName], [EmployeeSalaryLevel], [RoleID], [DepartmentID], [CreateBy]) VALUES (2, N'Trần Quang Huy', N'', 3, 3, NULL)
INSERT [dbo].[Employee] ([EmployeeID], [EmployeeName], [EmployeeSalaryLevel], [RoleID], [DepartmentID], [CreateBy]) VALUES (3, N'Lê Thị Thanh', N'', 3, 3, NULL)
INSERT [dbo].[Employee] ([EmployeeID], [EmployeeName], [EmployeeSalaryLevel], [RoleID], [DepartmentID], [CreateBy]) VALUES (4, N'Phạm Văn Nam', N'', 3, 3, NULL)
INSERT [dbo].[Employee] ([EmployeeID], [EmployeeName], [EmployeeSalaryLevel], [RoleID], [DepartmentID], [CreateBy]) VALUES (5, N'Vũ Thị Lan', N'', 3, 3, NULL)
INSERT [dbo].[Employee] ([EmployeeID], [EmployeeName], [EmployeeSalaryLevel], [RoleID], [DepartmentID], [CreateBy]) VALUES (6, N'Bùi Văn Hòa', N'', 3, 3, NULL)
INSERT [dbo].[Employee] ([EmployeeID], [EmployeeName], [EmployeeSalaryLevel], [RoleID], [DepartmentID], [CreateBy]) VALUES (7, N'Nguyễn Thị Hoa', N'', 3, 3, NULL)
INSERT [dbo].[Employee] ([EmployeeID], [EmployeeName], [EmployeeSalaryLevel], [RoleID], [DepartmentID], [CreateBy]) VALUES (8, N'Trần Đức Dũng', N'', 3, 3, NULL)
INSERT [dbo].[Employee] ([EmployeeID], [EmployeeName], [EmployeeSalaryLevel], [RoleID], [DepartmentID], [CreateBy]) VALUES (9, N'Lê Thị Thu', N'', 3, 3, NULL)
INSERT [dbo].[Employee] ([EmployeeID], [EmployeeName], [EmployeeSalaryLevel], [RoleID], [DepartmentID], [CreateBy]) VALUES (10, N'Hoàng Minh Tuấn', N'', 3, 3, NULL)
INSERT [dbo].[Employee] ([EmployeeID], [EmployeeName], [EmployeeSalaryLevel], [RoleID], [DepartmentID], [CreateBy]) VALUES (11, N'Vũ Văn Huy', N'', 3, 3, NULL)
INSERT [dbo].[Employee] ([EmployeeID], [EmployeeName], [EmployeeSalaryLevel], [RoleID], [DepartmentID], [CreateBy]) VALUES (12, N'Trần Thị Hạnh', N'', 3, 3, NULL)
INSERT [dbo].[Employee] ([EmployeeID], [EmployeeName], [EmployeeSalaryLevel], [RoleID], [DepartmentID], [CreateBy]) VALUES (13, N'Phan Thị Tuyết', N'', 3, 3, NULL)
INSERT [dbo].[Employee] ([EmployeeID], [EmployeeName], [EmployeeSalaryLevel], [RoleID], [DepartmentID], [CreateBy]) VALUES (14, N'Lê Đức Hải', N'', 3, 3, NULL)
INSERT [dbo].[Employee] ([EmployeeID], [EmployeeName], [EmployeeSalaryLevel], [RoleID], [DepartmentID], [CreateBy]) VALUES (15, N'Nguyễn Thị Mai', N'', 3, 3, NULL)
INSERT [dbo].[Employee] ([EmployeeID], [EmployeeName], [EmployeeSalaryLevel], [RoleID], [DepartmentID], [CreateBy]) VALUES (16, N'Đỗ Văn Thắng', N'', 3, 3, NULL)
INSERT [dbo].[Employee] ([EmployeeID], [EmployeeName], [EmployeeSalaryLevel], [RoleID], [DepartmentID], [CreateBy]) VALUES (17, N'Lý Thị Ngọc', N'', 3, 3, NULL)
INSERT [dbo].[Employee] ([EmployeeID], [EmployeeName], [EmployeeSalaryLevel], [RoleID], [DepartmentID], [CreateBy]) VALUES (18, N'Trương Minh Hòa', N'', 3, 3, NULL)
INSERT [dbo].[Employee] ([EmployeeID], [EmployeeName], [EmployeeSalaryLevel], [RoleID], [DepartmentID], [CreateBy]) VALUES (19, N'Nguyễn Thị Hương', N'', 3, 3, NULL)
INSERT [dbo].[Employee] ([EmployeeID], [EmployeeName], [EmployeeSalaryLevel], [RoleID], [DepartmentID], [CreateBy]) VALUES (20, N'Phạm Văn Khánh', N'', 3, 3, NULL)
INSERT [dbo].[Employee] ([EmployeeID], [EmployeeName], [EmployeeSalaryLevel], [RoleID], [DepartmentID], [CreateBy]) VALUES (21, N'Vũ Thị Thu Hằng', N'', 3, 3, NULL)
INSERT [dbo].[Employee] ([EmployeeID], [EmployeeName], [EmployeeSalaryLevel], [RoleID], [DepartmentID], [CreateBy]) VALUES (22, N'Trần Thanh Sơn', N'', 3, 3, NULL)
INSERT [dbo].[Employee] ([EmployeeID], [EmployeeName], [EmployeeSalaryLevel], [RoleID], [DepartmentID], [CreateBy]) VALUES (23, N'Đặng Thị Ngọc', N'', 3, 3, NULL)
INSERT [dbo].[Employee] ([EmployeeID], [EmployeeName], [EmployeeSalaryLevel], [RoleID], [DepartmentID], [CreateBy]) VALUES (24, N'Lê Văn Thành', N'', 3, 3, NULL)
INSERT [dbo].[Employee] ([EmployeeID], [EmployeeName], [EmployeeSalaryLevel], [RoleID], [DepartmentID], [CreateBy]) VALUES (25, N'	Nguyễn Thị Thu Huyền', N'', 3, 3, NULL)
INSERT [dbo].[Employee] ([EmployeeID], [EmployeeName], [EmployeeSalaryLevel], [RoleID], [DepartmentID], [CreateBy]) VALUES (26, N'	Đỗ Thị Kim Oanh', N'', 1, 2, NULL)
INSERT [dbo].[Employee] ([EmployeeID], [EmployeeName], [EmployeeSalaryLevel], [RoleID], [DepartmentID], [CreateBy]) VALUES (27, N'Bùi Minh Hoàng', N'', 1, 2, NULL)
INSERT [dbo].[Employee] ([EmployeeID], [EmployeeName], [EmployeeSalaryLevel], [RoleID], [DepartmentID], [CreateBy]) VALUES (28, N'	Trần Thị Bích', N'', 1, 2, NULL)
INSERT [dbo].[Employee] ([EmployeeID], [EmployeeName], [EmployeeSalaryLevel], [RoleID], [DepartmentID], [CreateBy]) VALUES (29, N'Nguyễn Đức Thắng', N'', 2, 1, NULL)
INSERT [dbo].[Employee] ([EmployeeID], [EmployeeName], [EmployeeSalaryLevel], [RoleID], [DepartmentID], [CreateBy]) VALUES (30, N'Phạm Thanh Vân', N'', 2, 1, NULL)
GO
INSERT [dbo].[Product] ([ProductID], [ProductName]) VALUES (1, N'Giỏ')
INSERT [dbo].[Product] ([ProductID], [ProductName]) VALUES (2, N'Thúng')
INSERT [dbo].[Product] ([ProductID], [ProductName]) VALUES (3, N'Mẹt')
GO
INSERT [dbo].[Role] ([RoleID], [RoleName]) VALUES (1, N'Accountant')
INSERT [dbo].[Role] ([RoleID], [RoleName]) VALUES (2, N'Production Workshop Foreman')
INSERT [dbo].[Role] ([RoleID], [RoleName]) VALUES (3, N'Production Worker')
GO
ALTER TABLE [dbo].[Attendence]  WITH CHECK ADD  CONSTRAINT [FK_Attendence_EmployeeSchedule] FOREIGN KEY([EmployeeScheduleID])
REFERENCES [dbo].[EmployeeSchedule] ([EmployeeScheduleID])
GO
ALTER TABLE [dbo].[Attendence] CHECK CONSTRAINT [FK_Attendence_EmployeeSchedule]
GO
ALTER TABLE [dbo].[Employee]  WITH CHECK ADD  CONSTRAINT [FK_Employee_department] FOREIGN KEY([DepartmentID])
REFERENCES [dbo].[department] ([DepartmentID])
GO
ALTER TABLE [dbo].[Employee] CHECK CONSTRAINT [FK_Employee_department]
GO
ALTER TABLE [dbo].[Employee]  WITH CHECK ADD  CONSTRAINT [FK_Employee_Role1] FOREIGN KEY([RoleID])
REFERENCES [dbo].[Role] ([RoleID])
GO
ALTER TABLE [dbo].[Employee] CHECK CONSTRAINT [FK_Employee_Role1]
GO
ALTER TABLE [dbo].[EmployeeSchedule]  WITH CHECK ADD  CONSTRAINT [FK_EmployeeSchedule_Employee] FOREIGN KEY([EmployeeID])
REFERENCES [dbo].[Employee] ([EmployeeID])
GO
ALTER TABLE [dbo].[EmployeeSchedule] CHECK CONSTRAINT [FK_EmployeeSchedule_Employee]
GO
ALTER TABLE [dbo].[EmployeeSchedule]  WITH CHECK ADD  CONSTRAINT [FK_EmployeeSchedule_ScheduleCampaign] FOREIGN KEY([ScheduleID])
REFERENCES [dbo].[ScheduleCampaign] ([ScheduleID])
GO
ALTER TABLE [dbo].[EmployeeSchedule] CHECK CONSTRAINT [FK_EmployeeSchedule_ScheduleCampaign]
GO
ALTER TABLE [dbo].[PlanCampagin]  WITH CHECK ADD  CONSTRAINT [FK_PlanCampagin_Product] FOREIGN KEY([ProductID])
REFERENCES [dbo].[Product] ([ProductID])
GO
ALTER TABLE [dbo].[PlanCampagin] CHECK CONSTRAINT [FK_PlanCampagin_Product]
GO
ALTER TABLE [dbo].[PlanCampagin]  WITH CHECK ADD  CONSTRAINT [FK_PlanCampagin_ProductionPlan] FOREIGN KEY([PlanID])
REFERENCES [dbo].[ProductionPlan] ([PlanID])
GO
ALTER TABLE [dbo].[PlanCampagin] CHECK CONSTRAINT [FK_PlanCampagin_ProductionPlan]
GO
ALTER TABLE [dbo].[ProductionPlan]  WITH CHECK ADD  CONSTRAINT [FK_ProductionPlan_department] FOREIGN KEY([DepartmentID])
REFERENCES [dbo].[department] ([DepartmentID])
GO
ALTER TABLE [dbo].[ProductionPlan] CHECK CONSTRAINT [FK_ProductionPlan_department]
GO
ALTER TABLE [dbo].[RoleFeature]  WITH CHECK ADD  CONSTRAINT [FK_RoleFeature_Feature] FOREIGN KEY([FeatureID])
REFERENCES [dbo].[Feature] ([FeatureID])
GO
ALTER TABLE [dbo].[RoleFeature] CHECK CONSTRAINT [FK_RoleFeature_Feature]
GO
ALTER TABLE [dbo].[RoleFeature]  WITH CHECK ADD  CONSTRAINT [FK_RoleFeature_Role] FOREIGN KEY([RoleID])
REFERENCES [dbo].[Role] ([RoleID])
GO
ALTER TABLE [dbo].[RoleFeature] CHECK CONSTRAINT [FK_RoleFeature_Role]
GO
ALTER TABLE [dbo].[ScheduleCampaign]  WITH CHECK ADD  CONSTRAINT [FK_ScheduleCampaign_PlanCampagin] FOREIGN KEY([PlanCampaignID])
REFERENCES [dbo].[PlanCampagin] ([PlanCampaignID])
GO
ALTER TABLE [dbo].[ScheduleCampaign] CHECK CONSTRAINT [FK_ScheduleCampaign_PlanCampagin]
GO
ALTER TABLE [dbo].[UserEmployee]  WITH CHECK ADD  CONSTRAINT [FK_UserEmployee_Employee] FOREIGN KEY([EmployeeID])
REFERENCES [dbo].[Employee] ([EmployeeID])
GO
ALTER TABLE [dbo].[UserEmployee] CHECK CONSTRAINT [FK_UserEmployee_Employee]
GO
ALTER TABLE [dbo].[UserEmployee]  WITH CHECK ADD  CONSTRAINT [FK_UserEmployee_User] FOREIGN KEY([UserName])
REFERENCES [dbo].[User] ([UserName])
GO
ALTER TABLE [dbo].[UserEmployee] CHECK CONSTRAINT [FK_UserEmployee_User]
GO
ALTER TABLE [dbo].[UserRole]  WITH CHECK ADD  CONSTRAINT [FK_UserRole_Role1] FOREIGN KEY([RoleID])
REFERENCES [dbo].[Role] ([RoleID])
GO
ALTER TABLE [dbo].[UserRole] CHECK CONSTRAINT [FK_UserRole_Role1]
GO
ALTER TABLE [dbo].[UserRole]  WITH CHECK ADD  CONSTRAINT [FK_UserRole_User] FOREIGN KEY([UserID])
REFERENCES [dbo].[User] ([UserName])
GO
ALTER TABLE [dbo].[UserRole] CHECK CONSTRAINT [FK_UserRole_User]
GO
