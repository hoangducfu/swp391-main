  ALTER TABLE [BookingTicket].[dbo].[Cancel_Ticket]
ADD [bank_name] NVARCHAR(100),
    [bank_number] NVARCHAR(100);

	ALTER TABLE [BookingTicket].[dbo].[PaymentHistory]
ADD [Account_id] NVARCHAR(100);