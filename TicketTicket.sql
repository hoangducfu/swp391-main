create database BookingTicket 
go



use BookingTicket
go

create table Role(
	[RoleID] [int]  IDENTITY(1,1) NOT NULL Primary key,
	[Role_name] [nvarchar](50) NOT NULL,
	)
	go

create table Category(
	[CategoryId] [int]  IDENTITY(1,1) NOT NULL Primary key,
	[Categoryname] [nvarchar] (50) NOT NULL,
	)
go


create table Location(
	[Location_id] [int]  IDENTITY(1,1) NOT NULL Primary key,
	[Location_name][nvarchar] (50) NOT NULL,
	)
go

create table Staff(
	[StaffID][int]  IDENTITY(1,1) NOT NULL Primary key,
	[username][varchar](100) NOT NULL,
	[password][varchar](50) NOT NULL,
	[phoneNumber] [varchar](15) NULL,
	[birthdate] [date] NULL,
	[passwordStatus] [bit] NOT NULL,
	[banStatus] [bit] NULL,
	roleId [int] NOT NULL,
	FOREIGN KEY (roleId) REFERENCES Role(RoleID) ,
	)
	go

create table Customer(
	[CustomerID][int]  IDENTITY(1,1) NOT NULL Primary key,
	[username][varchar](100) NOT NULL,
	[password][varchar](50) NULL,
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
	[Eventname] [nvarchar](150) NOT NULL,
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





create table Payment(
	[PaymentID][int] IDENTITY(1,1) NOT NULL Primary key,
	[EventID] [int] Not Null,
	[Account_Id] [int] NOT NULL,
	[Payment_date][datetime] NULL,
	[Transaction_id][int] NOT NULL,
	[Transaction_description][nvarchar](255)NOT NULL,
	[Amount][decimal](10,2) NOT NULL,
	[Status][nvarchar](255) NOT NULL,
	[Payment_method][nvarchar](255) NOT NULL,
	[Id_seat][int] NOT NULL,
	FOREIGN KEY (Account_Id) REFERENCES Customer(CustomerID),
	)
go

drop table Payment
	create table Ticket(	
	[Ticket_id][int] IDENTITY(1,1) NOT NULL Primary key,
	[Status][bit] NOT NULL,
	[EventID][int]NOT NULL,
	[AreaName][int] NOT NULL,
 	[Price][decimal](10,2) NOT NULL,
	[PaymentID] [int] Null,
	FOREIGN KEY (EventID) REFERENCES Event(EventID),
	FOREIGN KEY (PaymentID) REFERENCES Payment(PaymentID),
	)
go

create table Promotion(
	id [int] IDENTITY(1,1) NOT NULL primary key,
	code [nvarchar](50) not null,
	quantity int not null,
	DiscountPercent  [decimal](5,2) not null,
	EventID int not null,
	FOREIGN KEY (EventID) REFERENCES Event (EventID),

)
go



  CREATE TABLE Cancel_Ticket (
	CancelTicketID [int] IDENTITY(1,1) NOT NULL primary key,
    Account_Id int not null ,
	ID_Pay int,
    ID_event varchar(255),
    ID_seat varchar(255),
    Reason nvarchar(255),
    Status int,
	bank_name nvarchar(255),
	bank_number nvarchar(255),
	FOREIGN KEY (Account_Id) REFERENCES Customer(CustomerID),
    FOREIGN KEY (ID_Pay ) REFERENCES Payment(PaymentID)
)
go

CREATE TRIGGER trg_AfterInsertEvent
ON Event
AFTER INSERT
AS
BEGIN
    DECLARE @EventID INT;
    DECLARE @PriceType1 DECIMAL(10, 2);
    DECLARE @PriceType2 DECIMAL(10, 2);
    DECLARE @PriceType3 DECIMAL(10, 2);
    DECLARE @SeatType1 INT;
    DECLARE @SeatType2 INT;
    DECLARE @SeatType3 INT;

    -- Get the values from the inserted row
    SELECT 
        @EventID = EventID,
        @PriceType1 = PriceType1,
        @PriceType2 = PriceType2,
        @PriceType3 = PriceType3,
        @SeatType1 = SeatType1,
        @SeatType2 = SeatType2,
        @SeatType3 = SeatType3
    FROM inserted;

    -- Insert tickets for SeatType1
    DECLARE @i INT = 1;
    WHILE @i <= @SeatType1
    BEGIN
        INSERT INTO Ticket (Status, EventID, AreaName, Price, PaymentID)
        VALUES (0, @EventID, @i, @PriceType1, NULL);
        SET @i = @i + 1;
    END

    -- Insert tickets for SeatType2
    DECLARE @j INT = 1;
    WHILE @j <= @SeatType2
    BEGIN
        INSERT INTO Ticket (Status, EventID, AreaName, Price, PaymentID)
        VALUES (0, @EventID, @SeatType1 + @j, @PriceType2, NULL);
        SET @j = @j + 1;
    END

    -- Insert tickets for SeatType3
    DECLARE @k INT = 1;
    WHILE @k <= @SeatType3
    BEGIN
        INSERT INTO Ticket (Status, EventID, AreaName, Price, PaymentID)
        VALUES (0, @EventID, @SeatType1 + @SeatType2 + @k, @PriceType3, NULL);
        SET @k = @k + 1;
    END
END;

---------------------------------------------

INSERT INTO Role (Role_name) VALUES ('admin');
INSERT INTO Role (Role_name) VALUES ('staff');


INSERT INTO Category (Categoryname) VALUES ('Talkshow');
INSERT INTO Category (Categoryname) VALUES ('Ca nhạc');
INSERT INTO Category (Categoryname) VALUES ('WorkShop');

INSERT INTO Location (Location_name) VALUES (N'số 57 Phạm Hùng, Mễ Trì, Nam Từ Liêm, Hà Nội');
INSERT INTO Location (Location_name) VALUES (N'số 21 Phan Đăng Lưu, Hòa Cường, Hải Châu, Đà Nẵng');
INSERT INTO Location (Location_name) VALUES (N'số 49 đường Hoa Hồng, phường 4, Đà Lạt');

SELECT TOP 5 EventID, Eventname,  EventImg, TimeStart
FROM Event
WHERE StatusDisable = 0
ORDER BY TimeStart DESC;


