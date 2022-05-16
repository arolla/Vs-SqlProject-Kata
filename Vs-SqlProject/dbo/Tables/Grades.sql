CREATE TABLE [dbo].[Grades]
(
	[ProductId] INT NOT NULL,
	[CustomerId] INT NOT NULL,
	[Grade] INT NOT NULL, 
    CONSTRAINT [PK_Grades] PRIMARY KEY ([CustomerId], [ProductId]),
	CONSTRAINT [FK_Grades_Products] FOREIGN KEY ([ProductId]) REFERENCES [dbo].[Products] ([ProductId]),
	CONSTRAINT [FK_Grades_Customers] FOREIGN KEY ([CustomerId]) REFERENCES [dbo].[Customers] ([CustomerId])
)
