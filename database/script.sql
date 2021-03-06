USE [master]
GO
/****** Object:  Database [RajEnterprise]    Script Date: 6/30/2018 4:13:47 PM ******/
CREATE DATABASE [RajEnterprise]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'RajEnterprise', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\RajEnterprise.mdf' , SIZE = 3264KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'RajEnterprise_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\RajEnterprise_log.ldf' , SIZE = 832KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [RajEnterprise] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [RajEnterprise].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [RajEnterprise] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [RajEnterprise] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [RajEnterprise] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [RajEnterprise] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [RajEnterprise] SET ARITHABORT OFF 
GO
ALTER DATABASE [RajEnterprise] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [RajEnterprise] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [RajEnterprise] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [RajEnterprise] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [RajEnterprise] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [RajEnterprise] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [RajEnterprise] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [RajEnterprise] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [RajEnterprise] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [RajEnterprise] SET  ENABLE_BROKER 
GO
ALTER DATABASE [RajEnterprise] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [RajEnterprise] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [RajEnterprise] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [RajEnterprise] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [RajEnterprise] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [RajEnterprise] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [RajEnterprise] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [RajEnterprise] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [RajEnterprise] SET  MULTI_USER 
GO
ALTER DATABASE [RajEnterprise] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [RajEnterprise] SET DB_CHAINING OFF 
GO
ALTER DATABASE [RajEnterprise] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [RajEnterprise] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [RajEnterprise] SET DELAYED_DURABILITY = DISABLED 
GO
USE [RajEnterprise]
GO
/****** Object:  UserDefinedTableType [dbo].[stockTypeForSale]    Script Date: 6/30/2018 4:13:47 PM ******/
CREATE TYPE [dbo].[stockTypeForSale] AS TABLE(
	[sid] [int] NULL,
	[stock] [int] NULL
)
GO
/****** Object:  Table [dbo].[collection]    Script Date: 6/30/2018 4:13:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[collection](
	[coll] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[coll] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[companies]    Script Date: 6/30/2018 4:13:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[companies](
	[cid] [int] IDENTITY(1,1) NOT NULL,
	[company_name] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[cid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[customers]    Script Date: 6/30/2018 4:13:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[customers](
	[custId] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](50) NULL,
	[address] [varchar](50) NULL,
	[email] [varchar](50) NULL,
	[mobile] [int] NULL,
	[panGst] [varchar](50) NULL,
	[isActive] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[custId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[invoice]    Script Date: 6/30/2018 4:13:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[invoice](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[data] [varchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[products]    Script Date: 6/30/2018 4:13:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[products](
	[pid] [int] IDENTITY(1,1) NOT NULL,
	[cid] [int] NULL,
	[coll] [int] NULL,
	[weight] [varchar](50) NULL,
	[details] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[pid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[question]    Script Date: 6/30/2018 4:13:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[question](
	[qid] [int] IDENTITY(1,1) NOT NULL,
	[question] [varchar](90) NULL,
PRIMARY KEY CLUSTERED 
(
	[qid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[registration]    Script Date: 6/30/2018 4:13:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[registration](
	[regid] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](50) NULL,
	[address] [varchar](100) NULL,
	[email] [varchar](50) NULL,
	[contactno] [varchar](50) NOT NULL,
	[password] [varchar](50) NULL,
	[businessname] [varchar](50) NULL,
	[businessaddress] [varchar](100) NULL,
	[gst] [varchar](50) NULL,
	[panno] [varchar](50) NULL,
	[qid] [int] NULL,
	[role] [int] NULL,
	[answer] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[contactno] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[sales]    Script Date: 6/30/2018 4:13:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sales](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[invoiceId] [int] NULL,
	[customerId] [int] NULL,
	[date] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[stocks]    Script Date: 6/30/2018 4:13:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[stocks](
	[sid] [int] IDENTITY(1,1) NOT NULL,
	[pid] [int] NULL,
	[mrp] [varchar](40) NULL,
	[rate] [varchar](40) NULL,
	[stock] [int] NULL,
	[sgst] [varchar](40) NULL,
	[cgst] [varchar](40) NULL,
	[igst] [varchar](40) NULL,
PRIMARY KEY CLUSTERED 
(
	[sid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  StoredProcedure [dbo].[_updateStockAfterSale]    Script Date: 6/30/2018 4:13:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[_updateStockAfterSale]
@saleTable stockTypeForSale READONLY
as 
begin
SET NOCOUNT ON;
 
      MERGE INTO stocks st
      USING @saleTable stTable
      ON stTable.sid=st.sid
      WHEN MATCHED THEN
      UPDATE SET st.stock = stTable.stock;
end
GO
/****** Object:  StoredProcedure [dbo].[generate_invoice]    Script Date: 6/30/2018 4:13:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[generate_invoice](@custid int,@xmlData varchar(max),@id int output)
as
begin
insert into invoice(data) values(@xmlData);
declare @invoiveID int;
set @invoiveID=SCOPE_IDENTITY();
set @id=@invoiveID;
insert into sales(invoiceId,customerId,date) values(@invoiveID,@custid,SYSDATETIME());
end



GO
/****** Object:  StoredProcedure [dbo].[increaseStock]    Script Date: 6/30/2018 4:13:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[increaseStock](@coll int,@cid int,@weigth varchar(50),@details varchar(50),@mrp varchar(50),@rate varchar(50),@stock int,@sgst varchar(50),@cgst varchar(50),@igst varchar(50))
as
begin
declare @pid int;
set @pid=0;
select @pid=pid from products where  cid=@cid and coll=@coll and weight=@weigth;
if(@pid=0)
begin
insert into products values(@cid,@coll,@weigth,@details);
set @pid=SCOPE_IDENTITY();
insert into stocks values(@pid,@mrp,@rate,@stock,@sgst,@cgst,@igst);
end
else
begin
declare @currentStock int; declare @result varchar(50);
select @currentStock= stock from stocks where  pid=@pid;
set @result=CONVERT(int, @stock) + @currentStock;
update stocks set mrp=@mrp,rate=@rate,stock=@result,sgst=@sgst,cgst=@cgst,igst=@igst where pid=@pid;
end
end
GO
/****** Object:  StoredProcedure [dbo].[removeStock]    Script Date: 6/30/2018 4:13:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create proc [dbo].[removeStock](@sid int)
as
begin
declare @pid int;
select @pid=pid from stocks where sid=@sid;
delete stocks where sid=@sid;
delete products where pid=@pid;
end


GO
/****** Object:  StoredProcedure [dbo].[updateStock]    Script Date: 6/30/2018 4:13:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE proc [dbo].[updateStock](@sid int,@coll int,@cid int,@weigth varchar(50),@details varchar(50),@mrp varchar(50),@rate varchar(50),@stock int,@sgst varchar(50),@cgst varchar(50),@igst varchar(50))
as
begin
declare @pid int;
select @pid=pid from stocks where sid=@sid;
update products set coll=@coll,cid=@cid,weight=@weigth,details=@details where pid=@pid;
update stocks set pid=@pid,mrp=@mrp,rate=@rate,stock=@stock,sgst=@sgst,cgst=@cgst,igst=@igst where sid=@sid;
end

GO
USE [master]
GO
ALTER DATABASE [RajEnterprise] SET  READ_WRITE 
GO
