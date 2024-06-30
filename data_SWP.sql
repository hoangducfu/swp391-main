create database BookingTicket 
go

use BookingTicket
go

create table Role(
	[RoleID] [int] NOT NULL Primary key,
	[Role_name] [nvarchar](50) NOT NULL,
	)
	go

create table Category(
	[CategoryId] [int] NOT NULL Primary key,
	[Categoryname] [nvarchar] NOT NULL,
	)
go


create table Location(
	[Location_id] [int] NOT NULL Primary key,
	[Location_name][nvarchar] NOT NULL,
	)
go

create table Staff(
	[StaffID][int] NOT NULL Primary key,
	[username][nvarchar](100) NOT NULL,
	[password][nvarchar](50) NOT NULL,
	[phoneNumber] [varchar](15) NULL,
	[birthdate] [date] NULL,
	[passwordStatus] [bit] NOT NULL,
	[banStatus] [bit] NULL,
	roleId [int] NOT NULL,
	FOREIGN KEY (roleId) REFERENCES Role(RoleID) ,
	)
	go

create table Customer(
	[CustomerID][int] NOT NULL Primary key,
	[username][nvarchar](100) NOT NULL,
	[password][nvarchar](50) NOT NULL,
	[phoneNumber] [varchar](15) NULL,
	[birthdate] [date] NULL,
	[GoogleStatus] [bit] NOT NULL,
	[passwordStatus] [bit] NOT NULL,
	[banStatus] [bit] NULL,
	)
	go

create table Event(
	[EventID] [int] IDENTITY(1,1) NOT NULL Primary key,
	[CategoryID] [int] NOT NULL, 
	[Eventname] [nvarchar](100) NOT NULL,
	[Description] [nvarchar](2000) NOT NULL,
	[EventImg] [varchar](500)Not NULL,
	[LocationID] [int] NOT NULL,
	[TimeStart] [datetime] NULL,
	[TimeEnd][datetime] NULL,
	[PriceType1][decimal](10,2) NULL,
	[PriceType2][decimal](10,2) NULL,
	[PriceType3][decimal](10,2) NULL,
	[StaffID] [int] NOT NULL,
	[SeatType1][int]NOT NULL,
	[SeatType2][int]NOT NULL,
	[SeatType3][int]NOT NULL,
	[StatusDisable] [bit] NOT NULL,
    FOREIGN KEY (LocationID) REFERENCES Location(Location_id),
	FOREIGN KEY (CategoryID) REFERENCES Category(CategoryID),
    FOREIGN KEY (StaffID) REFERENCES Staff(StaffID)
	)
go

create table Promotion(
	[Id][int] IDENTITY(1,1) NOT NULL Primary key,
	[Code][nvarchar](20) NOT NULL,
	[Quantity][int]NOT NULL,
	[EventID][int]NOT NULL,
	FOREIGN KEY (EventID) REFERENCES Event(EventID),
	)
go

create table Ticket(	
	[Ticket_id][int] IDENTITY(1,1) NOT NULL Primary key,
	[Status][bit] NOT NULL,
	[EventID][int]NOT NULL,
	[Price][decimal](10,2) NOT NULL,
	[AreaName][nvarchar](50) NOT NULL,
	[CustomerID][int] NOT NULL,
	FOREIGN KEY (EventID) REFERENCES Event(EventID),
	FOREIGN KEY (CustomerID) REFERENCES Customer(CustomerID),
	)
go

create table Payment(
	[PaymentID][int] IDENTITY(1,1) NOT NULL Primary key,
	[CustomerID] [int] NOT NULL,
	[Payment_date][datetime] NULL,
	[Transaction_id][int] NOT NULL,
	[Transaction_description][nvarchar](255)NOT NULL,
	[Amount][decimal](10,2) NOT NULL,
	[Payment_method][nvarchar](255) NOT NULL,
	[Ticket_id][int] NOT NULL,
	FOREIGN KEY (Ticket_id) REFERENCES Ticket(Ticket_id),
	)
go

create table PaymentHistory(
	[PaymentHistoryID] [int] IDENTITY(1,1) NOT NULL Primary key,
	[CustomerID] [int] NOT NULL,
	[PaymentID][int] NOT NULL,
	[Ticket_id][int] NOT NULL,
	[Amount][decimal](10,2) NOT NULL,
	[Status][bit] NOT NULL,
	FOREIGN KEY (CustomerID) REFERENCES Customer(CustomerID),
	FOREIGN KEY (PaymentID) REFERENCES Payment(PaymentID),
	FOREIGN KEY (Ticket_id) REFERENCES Ticket(Ticket_id),
	)
go

create table PaymentCancel(
	[PaymentCancelID]  [int] IDENTITY(1,1) NOT NULL Primary key,
	[PaymentHistoryID][int] NOT NULL,
	[Reason][nvarchar](1000) NOT NULL,
	FOREIGN KEY (PaymentHistoryID) REFERENCES PaymentHistory(PaymentHistoryID),
	)
go


INSERT INTO [dbo].[Role] ([RoleID],[Role_name])  VALUES (1,N'Admin')
INSERT INTO [dbo].[Role] ([RoleID],[Role_name])  VALUES (2, N'Staff')





