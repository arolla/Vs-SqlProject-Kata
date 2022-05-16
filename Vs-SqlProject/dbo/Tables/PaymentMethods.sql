CREATE TABLE [dbo].[PaymentMethods] (
    [PaymentMethodId] INT NOT NULL,
    [Name] NVARCHAR(50) NOT NULL, 
    CONSTRAINT [PK_PaymentMethods] PRIMARY KEY CLUSTERED ([PaymentMethodId] ASC)
);

