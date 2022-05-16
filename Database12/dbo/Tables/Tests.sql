CREATE TABLE [dbo].[Tests] (
    [Id] INT            IDENTITY (1, 1) NOT NULL,
    [Description]       VARCHAR (50) NOT NULL,
    CONSTRAINT [PK_Tests] PRIMARY KEY CLUSTERED ([Id] ASC)
);


GO