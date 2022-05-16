CREATE TABLE [dbo].[Customers] (
    [CustomerId] INT            IDENTITY (1, 1) NOT NULL,
    [Username]   NVARCHAR (500) NOT NULL,
    CONSTRAINT [PK_Customers] PRIMARY KEY CLUSTERED ([CustomerId] ASC)
);


GO
CREATE UNIQUE NONCLUSTERED INDEX [UIX_Customers_Username]
    ON [dbo].[Customers]([Username] ASC);

