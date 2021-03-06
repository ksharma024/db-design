USE [Welp]
GO
/****** Object:  Table [dbo].[Admins]    Script Date: 7/22/2016 5:51:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Admins](
	[AdminBusinessID] [int] IDENTITY(1,1) NOT NULL,
	[UserName] [nvarchar](50) NOT NULL,
	[Password] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Admins] PRIMARY KEY CLUSTERED 
(
	[AdminBusinessID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Businesses]    Script Date: 7/22/2016 5:51:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Businesses](
	[BusinessID] [int] IDENTITY(1,1) NOT NULL,
	[TypeID] [int] NOT NULL,
	[BusinessName] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Businesses] PRIMARY KEY CLUSTERED 
(
	[BusinessID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[BusinessLocations]    Script Date: 7/22/2016 5:51:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BusinessLocations](
	[BusinessAddressID] [int] IDENTITY(1,1) NOT NULL,
	[BusinessID] [int] NOT NULL,
	[OwnerID] [int] NOT NULL,
	[Address] [nvarchar](50) NOT NULL,
	[PhoneNumber] [nvarchar](10) NOT NULL,
	[HoursofOperation] [nvarchar](50) NOT NULL,
	[MenuURL] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_BusinessLocations] PRIMARY KEY CLUSTERED 
(
	[BusinessAddressID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Owners]    Script Date: 7/22/2016 5:51:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Owners](
	[OwnerID] [int] IDENTITY(1,1) NOT NULL,
	[AdminID] [int] NOT NULL,
	[FirstName] [nvarchar](50) NOT NULL,
	[LastName] [nvarchar](50) NOT NULL,
	[Email] [nvarchar](50) NOT NULL,
	[Phone] [nvarchar](50) NULL,
 CONSTRAINT [PK_Owners] PRIMARY KEY CLUSTERED 
(
	[OwnerID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Reviews]    Script Date: 7/22/2016 5:51:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Reviews](
	[ReviewID] [int] IDENTITY(1,1) NOT NULL,
	[BusinessAddressID] [int] NOT NULL,
	[UserID] [int] NOT NULL,
	[TextReview] [nvarchar](200) NULL,
	[StarRatingID] [int] NULL,
 CONSTRAINT [PK_Reviews] PRIMARY KEY CLUSTERED 
(
	[ReviewID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Types]    Script Date: 7/22/2016 5:51:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Types](
	[TypeID] [int] IDENTITY(1,1) NOT NULL,
	[TypeName] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Types] PRIMARY KEY CLUSTERED 
(
	[TypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Users]    Script Date: 7/22/2016 5:51:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[UserID] [int] IDENTITY(1,1) NOT NULL,
	[Username] [nvarchar](50) NOT NULL,
	[UserPassword] [nvarchar](50) NOT NULL,
	[UserEmail] [nvarchar](50) NOT NULL,
	[UserZipCode] [int] NOT NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
ALTER TABLE [dbo].[Businesses]  WITH CHECK ADD  CONSTRAINT [FK_Businesses_Types] FOREIGN KEY([TypeID])
REFERENCES [dbo].[Types] ([TypeID])
GO
ALTER TABLE [dbo].[Businesses] CHECK CONSTRAINT [FK_Businesses_Types]
GO
ALTER TABLE [dbo].[BusinessLocations]  WITH CHECK ADD  CONSTRAINT [FK_BusinessLocations_Businesses] FOREIGN KEY([BusinessID])
REFERENCES [dbo].[Businesses] ([BusinessID])
GO
ALTER TABLE [dbo].[BusinessLocations] CHECK CONSTRAINT [FK_BusinessLocations_Businesses]
GO
ALTER TABLE [dbo].[BusinessLocations]  WITH CHECK ADD  CONSTRAINT [FK_BusinessLocations_BusinessLocations3] FOREIGN KEY([BusinessAddressID])
REFERENCES [dbo].[BusinessLocations] ([BusinessAddressID])
GO
ALTER TABLE [dbo].[BusinessLocations] CHECK CONSTRAINT [FK_BusinessLocations_BusinessLocations3]
GO
ALTER TABLE [dbo].[BusinessLocations]  WITH CHECK ADD  CONSTRAINT [FK_BusinessLocations_Owners] FOREIGN KEY([OwnerID])
REFERENCES [dbo].[Owners] ([OwnerID])
GO
ALTER TABLE [dbo].[BusinessLocations] CHECK CONSTRAINT [FK_BusinessLocations_Owners]
GO
ALTER TABLE [dbo].[Owners]  WITH CHECK ADD  CONSTRAINT [FK_Owners_Admins] FOREIGN KEY([AdminID])
REFERENCES [dbo].[Admins] ([AdminBusinessID])
GO
ALTER TABLE [dbo].[Owners] CHECK CONSTRAINT [FK_Owners_Admins]
GO
ALTER TABLE [dbo].[Reviews]  WITH CHECK ADD  CONSTRAINT [FK_Reviews_BusinessLocations] FOREIGN KEY([BusinessAddressID])
REFERENCES [dbo].[BusinessLocations] ([BusinessAddressID])
GO
ALTER TABLE [dbo].[Reviews] CHECK CONSTRAINT [FK_Reviews_BusinessLocations]
GO
ALTER TABLE [dbo].[Reviews]  WITH CHECK ADD  CONSTRAINT [FK_Reviews_Users] FOREIGN KEY([UserID])
REFERENCES [dbo].[Users] ([UserID])
GO
ALTER TABLE [dbo].[Reviews] CHECK CONSTRAINT [FK_Reviews_Users]
GO
