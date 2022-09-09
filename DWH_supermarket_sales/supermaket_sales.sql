--create table
CREATE TABLE [CleanData] (
    [Invoice ID] varchar(50) primary key,
    [Product line] varchar(50),
    [Unit price] float,
    [Quantity] int,
    [Tax 5%] float,
    [Total] float,
    [Date] date,
    [Time] time(7),
    [Payment] varchar(50),
    [cogs] float,
    [gross margin percentage] float,
    [gross income] float,
    [Rating] float
)

CREATE TABLE [Fact Sales] (
    [Invoice ID] varchar(50) primary key,
    [Date] date,
    [Payment ID] int,
    [Product ID] int,
	[Quantity] int,
	[Total] float,
	[Rating] float
)

go
CREATE TABLE [Dim date] (
    [Date] date primary key,
    [Year] int,
    [Month] int,
    [Day] int,
    [Quater] int,
	[Day_of_week] int
)
go
CREATE TABLE [Dim Product] (
    [Product ID] int primary key,
    [Product line] varchar(50)
)

ISNULL(Unit_price) || ISNULL(Invoice_ID) || ISNULL(Product_line) || ISNULL(Quantity) || ISNULL(Total) || ISNULL(Date) || ISNULL(Payment) || ISNULL(Rating)

go
-- create references


alter table [dbo].[fact sales]
add constraint fk_payment foreign key ( [Payment ID]) references [dbo].[Dim Payment]([Payment ID])
go
alter table [dbo].[fact sales]
add constraint fk_product foreign key ( [Product ID]) references [dbo].[Dim Product]([Product ID])
go
alter table [dbo].[fact sales]
add constraint fk_date foreign key ( [Date]) references [dbo].[Dim date]([Date])
go

-- drop references
alter table [dbo].[fact sales] drop constraint if exists fk_payment
go
alter table [dbo].[fact sales] drop constraint if exists fk_product
go
alter table [dbo].[fact sales] drop constraint if exists fk_date

go
select * from [Fact Sales] where Date = '2019-03-13'
go
select * from CleanData where Date = '2019-03-13'
go
delete from testDate
go
delete  from [Dim date]
go
delete from [Fact Sales]
go
select sum(Quantity) as tong, [Product ID] from [Fact Sales]
group by [Product ID]
go

select * from [Clean Data] where payment = 'Cash'
go