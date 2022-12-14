USE [Test_Paramo]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 11/9/2022 23:28:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](200) NULL,
	[Email] [varchar](200) NULL,
	[Address] [varchar](200) NULL,
	[Phone] [varchar](50) NULL,
	[UserTypeId] [int] NOT NULL,
	[Money] [decimal](18, 0) NULL,
 CONSTRAINT [PK_User] PRIMARY KEY NONCLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserTypes]    Script Date: 11/9/2022 23:28:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserTypes](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Description] [varchar](max) NULL,
 CONSTRAINT [PK_UserTypes] PRIMARY KEY NONCLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [dbo].[Users]  WITH CHECK ADD  CONSTRAINT [FK_User_UserType] FOREIGN KEY([UserTypeId])
REFERENCES [dbo].[UserTypes] ([Id])
GO
ALTER TABLE [dbo].[Users] CHECK CONSTRAINT [FK_User_UserType]
GO
/****** Object:  StoredProcedure [dbo].[ms_User_Add]    Script Date: 11/9/2022 23:28:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[ms_User_Add]
@Name varchar(200),
@Email varchar (200),
@Address varchar(200),
@Phone varchar(50),
@UserTypeId int,
@Money decimal
as

INSERT INTO Users ([Name],Email,[Address],Phone, UserTypeId,Money) values (@Name,@Email,@Address,@Phone,@UserTypeId,@Money)


SELECT @@IDENTITY
GO
/****** Object:  StoredProcedure [dbo].[ms_User_Delete]    Script Date: 11/9/2022 23:28:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[ms_User_Delete]
@Id int

as

Delete from Users
where Id = @Id
GO
/****** Object:  StoredProcedure [dbo].[ms_User_GetAll]    Script Date: 11/9/2022 23:28:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[ms_User_GetAll]

as

SELECT 
* 
FROM Users
GO
/****** Object:  StoredProcedure [dbo].[ms_User_GetByEmail]    Script Date: 11/9/2022 23:28:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[ms_User_GetByEmail]
@Email varchar(200)

AS

SELECT * FROM Users where Email = @Email 
GO
/****** Object:  StoredProcedure [dbo].[ms_User_GetById]    Script Date: 11/9/2022 23:28:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[ms_User_GetById]
@Id INT

AS

SELECT * FROM Users where Id = @Id 

GO
/****** Object:  StoredProcedure [dbo].[ms_User_Update]    Script Date: 11/9/2022 23:28:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[ms_User_Update]
@Id int,
@Name varchar(200),
@Email varchar (200),
@Address varchar(200),
@Phone varchar(50),
@UserTypeId int,
@Money decimal
as

update users set 
[Name] = @Name , 
Email = @Email ,
[Address]  = @Address ,
Phone = @Phone ,
UserTypeId  = @UserTypeId ,
[Money] = @Money  

where Id = @Id
GO
/****** Object:  StoredProcedure [dbo].[ms_UserType_GetById]    Script Date: 11/9/2022 23:28:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE procedure [dbo].[ms_UserType_GetById]
@Id INT

AS

SELECT * FROM UserTypes where Id = @Id 
GO
