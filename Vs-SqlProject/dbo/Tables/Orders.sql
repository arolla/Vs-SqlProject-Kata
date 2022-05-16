﻿CREATE TABLE [dbo].[Orders] (
    [OrderId]         INT            IDENTITY (1, 1) NOT NULL,
    [CustomerId]      INT            NOT NULL,
    [DeliveryAddress] NVARCHAR (500) NOT NULL,
    [PaymentMethod]   NVARCHAR (50)  NOT NULL,
    CONSTRAINT [PK_Orders] PRIMARY KEY CLUSTERED ([OrderId] ASC),
    CONSTRAINT [FK_Orders_Customers] FOREIGN KEY ([CustomerId]) REFERENCES [dbo].[Customers] ([CustomerId]),
    CONSTRAINT [FK_Orders_PaymentMethods] FOREIGN KEY ([PaymentMethod]) REFERENCES [dbo].[PaymentMethods] ([PaymentMethod])
);

