USE [master]
GO
/****** Object:  Database [BlazorAppDB]    Script Date: 06-04-2024 14:18:09 ******/
CREATE DATABASE [BlazorAppDB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'BlazorAppDB', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER01\MSSQL\DATA\BlazorAppDB.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'BlazorAppDB_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER01\MSSQL\DATA\BlazorAppDB_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [BlazorAppDB] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [BlazorAppDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [BlazorAppDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [BlazorAppDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [BlazorAppDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [BlazorAppDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [BlazorAppDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [BlazorAppDB] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [BlazorAppDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [BlazorAppDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [BlazorAppDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [BlazorAppDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [BlazorAppDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [BlazorAppDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [BlazorAppDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [BlazorAppDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [BlazorAppDB] SET  DISABLE_BROKER 
GO
ALTER DATABASE [BlazorAppDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [BlazorAppDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [BlazorAppDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [BlazorAppDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [BlazorAppDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [BlazorAppDB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [BlazorAppDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [BlazorAppDB] SET RECOVERY FULL 
GO
ALTER DATABASE [BlazorAppDB] SET  MULTI_USER 
GO
ALTER DATABASE [BlazorAppDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [BlazorAppDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [BlazorAppDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [BlazorAppDB] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [BlazorAppDB] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [BlazorAppDB] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'BlazorAppDB', N'ON'
GO
ALTER DATABASE [BlazorAppDB] SET QUERY_STORE = OFF
GO
USE [BlazorAppDB]
GO
/****** Object:  UserDefinedTableType [dbo].[IntList]    Script Date: 06-04-2024 14:18:10 ******/
CREATE TYPE [dbo].[IntList] AS TABLE(
	[Id] [int] NULL
)
GO
/****** Object:  Table [dbo].[Employee]    Script Date: 06-04-2024 14:18:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Employee](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
	[Department] [nvarchar](100) NOT NULL,
	[DOB] [date] NOT NULL,
	[Gender] [nvarchar](10) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Employee] ON 

INSERT [dbo].[Employee] ([Id], [Name], [Department], [DOB], [Gender]) VALUES (1, N'vk k', N'HR', CAST(N'1990-05-15' AS Date), N'Male')
INSERT [dbo].[Employee] ([Id], [Name], [Department], [DOB], [Gender]) VALUES (5, N'David Lee', N'IT', CAST(N'1987-09-30' AS Date), N'Male')
INSERT [dbo].[Employee] ([Id], [Name], [Department], [DOB], [Gender]) VALUES (9, N'Ashok K', N'IT', CAST(N'2024-03-16' AS Date), N'Male')
INSERT [dbo].[Employee] ([Id], [Name], [Department], [DOB], [Gender]) VALUES (10, N'Asha BH', N'HR', CAST(N'2024-03-18' AS Date), N'Male')
INSERT [dbo].[Employee] ([Id], [Name], [Department], [DOB], [Gender]) VALUES (11, N'Mayank', N'HR', CAST(N'2024-03-18' AS Date), N'Female')
INSERT [dbo].[Employee] ([Id], [Name], [Department], [DOB], [Gender]) VALUES (12, N'Kinjal', N'HR', CAST(N'2024-03-18' AS Date), N'Female')
INSERT [dbo].[Employee] ([Id], [Name], [Department], [DOB], [Gender]) VALUES (13, N'Shubham', N'Finance', CAST(N'2024-02-09' AS Date), N'Male')
INSERT [dbo].[Employee] ([Id], [Name], [Department], [DOB], [Gender]) VALUES (15, N'Ronak M', N'Finance', CAST(N'2024-03-19' AS Date), N'Male')
INSERT [dbo].[Employee] ([Id], [Name], [Department], [DOB], [Gender]) VALUES (16, N'Rishi S', N'IT', CAST(N'2024-03-19' AS Date), N'Male')
INSERT [dbo].[Employee] ([Id], [Name], [Department], [DOB], [Gender]) VALUES (17, N'Priya', N'IT', CAST(N'2024-03-19' AS Date), N'Male')
INSERT [dbo].[Employee] ([Id], [Name], [Department], [DOB], [Gender]) VALUES (18, N'Rina Patel', N'IT', CAST(N'2024-03-06' AS Date), N'Female')
INSERT [dbo].[Employee] ([Id], [Name], [Department], [DOB], [Gender]) VALUES (19, N'Amit S', N'IT', CAST(N'2024-03-19' AS Date), N'Female')
SET IDENTITY_INSERT [dbo].[Employee] OFF
GO
/****** Object:  StoredProcedure [dbo].[DeleteEmployee]    Script Date: 06-04-2024 14:18:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[DeleteEmployee]
    @Id INT
AS
BEGIN
    DELETE FROM Employee WHERE Id = @Id
END
GO
/****** Object:  StoredProcedure [dbo].[EmployeeList]    Script Date: 06-04-2024 14:18:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[EmployeeList]
AS
BEGIN
    SELECT * FROM Employee
END
GO
/****** Object:  StoredProcedure [dbo].[GetEmployeesByIds]    Script Date: 06-04-2024 14:18:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetEmployeesByIds]
    @Ids IntList READONLY
AS
BEGIN
    SET NOCOUNT ON;

    SELECT *
    FROM Employee
    WHERE Id IN (SELECT Id FROM @Ids);
END;
GO
/****** Object:  StoredProcedure [dbo].[InsertOrUpdateEmployee]    Script Date: 06-04-2024 14:18:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[InsertOrUpdateEmployee]
    @Id INT,
    @Name NVARCHAR(100),
    @Department NVARCHAR(100),
    @DOB DATE,
    @Gender NVARCHAR(10)
AS
BEGIN
    -- Check if the employee exists based on the provided ID
    IF EXISTS (SELECT 1 FROM Employee WHERE Id = @Id)
    BEGIN
        -- Update the existing employee record
        UPDATE Employee
        SET Name = @Name,
            Department = @Department,
            DOB = @DOB,
            Gender = @Gender
        WHERE Id = @Id;
    END
    ELSE
    BEGIN
        -- Insert a new employee record
        INSERT INTO Employee (Name, Department, DOB, Gender)
        VALUES (@Name, @Department, @DOB, @Gender);
    END
END;
GO
USE [master]
GO
ALTER DATABASE [BlazorAppDB] SET  READ_WRITE 
GO
