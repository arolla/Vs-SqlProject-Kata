SET IDENTITY_INSERT dbo.Categories ON
MERGE dbo.Categories as Target
USING(
	VALUES (1, N'Computers'),
		   (2, N'Phones'),
		   (3, N'TV'),
		   (4, N'Minitels'),
		   (5, N'Cameras'),
		   (6, N'Audio'),
		   (7, N'Accessories'),
		   (8, N'DVD and Blu-rays')
) as source ([CategoryId], [Name])
on Target.[CategoryId] = source.[CategoryId]
WHEN NOT MATCHED THEN
	INSERT ([CategoryId], [Name]) VALUES (source.[CategoryId], source.[Name])
WHEN MATCHED THEN
	UPDATE SET [name] = source.[Name]
WHEN NOT MATCHED BY SOURCE THEN
    DELETE;
SET IDENTITY_INSERT dbo.Categories OFF