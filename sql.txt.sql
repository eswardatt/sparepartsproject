USE [medicalshop]
GO
/****** Object:  UserDefinedFunction [dbo].[getcolumnname]    Script Date: 02-12-2020 19:46:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE function [dbo].[getcolumnname](@count int)
returns nvarchar(max)
as begin
declare @columnname nvarchar(max)
set @columnname = cast('wholesaler'+cast( @count as nvarchar(max)) as nvarchar(max))
return @columnname
end;
GO
/****** Object:  UserDefinedFunction [dbo].[getpricecolumnname]    Script Date: 02-12-2020 19:46:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE function [dbo].[getpricecolumnname](@count int)
returns nvarchar(max)
as begin
declare @columnname nvarchar(max)
set @columnname = cast('Wholesale'+cast(@count as nvarchar(max))+'price' as nvarchar(max))
return @columnname
end;
GO
/****** Object:  Table [dbo].[Branch_table]    Script Date: 02-12-2020 19:46:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Branch_table](
	[branch_code] [bigint] NOT NULL,
	[branch_name] [nvarchar](20) NOT NULL,
	[Branch_city_code] [bigint] NULL,
PRIMARY KEY CLUSTERED 
(
	[branch_code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[City_table]    Script Date: 02-12-2020 19:46:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[City_table](
	[city_code] [bigint] NOT NULL,
	[city_name] [nvarchar](20) NOT NULL,
	[City_state_code] [bigint] NULL,
PRIMARY KEY CLUSTERED 
(
	[city_code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[holesaler]    Script Date: 02-12-2020 19:46:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[holesaler](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Language_table]    Script Date: 02-12-2020 19:46:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Language_table](
	[language_code] [bigint] NOT NULL,
	[language_name] [nvarchar](20) NULL,
PRIMARY KEY CLUSTERED 
(
	[language_code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[medicalshopdummy]    Script Date: 02-12-2020 19:46:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[medicalshopdummy](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NULL,
	[e] [nvarchar](2) NULL,
	[email1] [nvarchar](max) NULL,
	[email2] [nvarchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[product]    Script Date: 02-12-2020 19:46:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[product](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[code] [nvarchar](max) NOT NULL,
	[spareparttype] [nvarchar](max) NOT NULL,
	[sparename] [nvarchar](max) NOT NULL,
	[salepercentage] [decimal](5, 2) NOT NULL,
	[stockdetails] [int] NOT NULL,
	[updatedvalue] [int] NULL,
	[wholesaler1] [varchar](250) NULL,
	[Wholesale1price] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[State_table]    Script Date: 02-12-2020 19:46:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[State_table](
	[State_code] [bigint] NOT NULL,
	[StateName] [nvarchar](20) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[State_code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tempbilldetails]    Script Date: 02-12-2020 19:46:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tempbilldetails](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Product_id] [int] NOT NULL,
	[Productcode] [nvarchar](max) NULL,
	[Productname] [nvarchar](max) NULL,
	[producttype] [nvarchar](max) NULL,
	[productcount] [int] NULL,
	[product_price] [money] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  UserDefinedFunction [dbo].[getcolumnnames]    Script Date: 02-12-2020 19:46:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[getcolumnnames]()
RETURNS TABLE
AS
RETURN (select column_name from information_schema.columns where table_name='product' and column_name LIKE '%Wholesale1price')

GO
ALTER TABLE [dbo].[Branch_table]  WITH CHECK ADD FOREIGN KEY([Branch_city_code])
REFERENCES [dbo].[City_table] ([city_code])
GO
ALTER TABLE [dbo].[City_table]  WITH CHECK ADD FOREIGN KEY([City_state_code])
REFERENCES [dbo].[State_table] ([State_code])
GO
/****** Object:  StoredProcedure [dbo].[medicalshopdata]    Script Date: 02-12-2020 19:46:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[medicalshopdata](
@hs_Name nvarchar(max)=null,
@sql nvarchar(max)=null,
@id int =0,
@stockdetails int =0,
@saleperc decimal(5,2)=0.0,
@flag int =0,
@Productcode nvarchar(max)=null,
@Productname nvarchar(max)=null,
@producttype nvarchar(max)=null,
@productcount int =0,
@product_price money = 0

)
as 
begin
if(@flag=0)
begin

select Id,Name from holesaler ;
end
else if(@flag=1)
begin
declare @namecount int set @namecount=(select count(Name) from holesaler where Name=@hs_Name)
if(@namecount=0)
begin
insert into holesaler(Name)values(@hs_Name);
declare @columnname nvarchar(max)
 declare @columnprice nvarchar(max)
 declare @sql_1 nvarchar(max)
 declare @sql_2 nvarchar(max)
 declare @currentId int
 set @currentId = IDENT_CURRENT('holesaler')
 
 set @columnname =  dbo.getcolumnname( @currentId)
 set @columnprice =  dbo.getpricecolumnname( @currentId)
 SET @sql_1 = 'ALTER TABLE product ADD ' + @columnname + ' varchar(250);';
 SET @sql_2 = 'ALTER TABLE product ADD ' + @columnprice + ' int;';
 exec (@sql_1) exec (@sql_2)
 end
end
else if(@flag=2)
begin

SELECT * INTO #TemporaryTable FROM product where Id=0

ALTER TABLE #TemporaryTable DROP COLUMN Id

SELECT * FROM #TemporaryTable 

DROP TABLE #TemporaryTable 

end
else if (@flag=3)
begin
exec(@sql)
end
else if(@flag=4)
begin

select Id, code,sparename as name ,salepercentage as sale, stockdetails as items,spareparttype as type from product

end
else if(@flag=5)
begin
declare @hcount int DECLARE @Counter INT 
declare @qry nvarchar(max) Declare @sql_3 nvarchar(max) 
set @hcount= (select count(*) from [dbo].[holesaler])
SET @Counter=1 
WHILE @Counter <= @hcount
begin
set @qry=concat(@qry,(select concat(concat('wholesaler',@Counter),',','cast(','(((','Wholesale',@Counter,'price' ,'*salepercentage',')/100))',
'+',concat('Wholesale',@Counter,'price'),' ','as decimal(10,2))','as ',' ',concat('price',@Counter),',' )) )

set @Counter=@Counter+1
end
set @sql_3=@qry
set @sql_3=Left(@sql_3,len(@sql_3)-1)
declare @finalquery nvarchar(max)
set @finalquery=concat('select ' ,@sql_3,' from product where Id = ',' ', @id)
exec( @finalquery)

 


end
else if (@flag=6)
begin
 update product set [salepercentage]=@saleperc where Id =@id
end
else if (@flag=7)
begin
 update product set [stockdetails]=([stockdetails]-@stockdetails),updatedvalue=@stockdetails where Id =@id
end

else if (@flag=8)
begin
 update product set [stockdetails]=([stockdetails]+@stockdetails) where Id =@id
end

else if(@flag=9)
begin

select Id, code,sparename as name ,salepercentage as sale, stockdetails as items,spareparttype as type,updatedvalue from product where Id=@id

end
else if(@flag=10)
begin
declare @p_count int
set @p_count = (select count(Product_id) from tempbilldetails where Product_id=@id)

if(@p_count=0)
begin
insert into tempbilldetails values (@id,@Productcode,@Productname, @producttype , @productcount,@product_price  )
										
end
else if(@p_count>0)
begin
declare @pastcount int set @pastcount=(select productcount from tempbilldetails where Product_id=@id)
update  tempbilldetails set Productcode=@Productcode,Productname=@Productname, producttype=@producttype,  productcount= @productcount +@pastcount 
where Product_id=@id																			
end

end
else if(@flag=11)
begin
select Product_id , Productcode, Productname,producttype,  productcount,[product_price] from tempbilldetails
	  
end	  

else if(@flag=12)
begin
truncate table tempbilldetails
	  
end	 
else if(@flag=13)
begin
declare @stockcount int set @stockcount =(select productcount from tempbilldetails where Product_id=@id)
update tempbilldetails set product_price=@product_price*@stockcount where Product_id=@id 	
	  
end	 
else if(@flag=14) 
begin
select count(Name) from holesaler where Name=@hs_Name
end
end;   





GO
