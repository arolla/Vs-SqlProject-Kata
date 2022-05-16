SET IDENTITY_INSERT dbo.Products ON
MERGE dbo.Products as Target
USING(
	VALUES 
	(2, N'Minitel 5 Matra', 4, N'Pour avoir ses notes de bac', 200.0000, 2198),
	(3, N'Minitel 1b Telic Alcatel', 4, N'Pour consulter les horaires de train', 180.0000, 412),
	(5, N'Coffret le Seigneur des Anneaux La trilogie', 8, N'https://fr.wikipedia.org/wiki/Le_Seigneur_des_anneaux', 89.9900, 561),
	(6, N'Télé avec lecteur Blu-ray intégré', 3, NULL, 390.0000, 3)

) as source ([ProductId], [Name], [CategoryId], [Description], [UnitPrice], [Stock])
on Target.[ProductId] = source.[ProductId]
WHEN NOT MATCHED THEN
	INSERT ([ProductId], [Name], [CategoryId], [Description], [UnitPrice], [Stock]) VALUES (source.[ProductId], source.[Name], source.[CategoryId], source.[Description], source.[UnitPrice], source.[Stock])
WHEN MATCHED THEN
	update set [Name] = source.[Name], [CategoryId] = source.[CategoryId], [Description] = source.[Description], [UnitPrice] = source.[UnitPrice], [Stock] = source.[Stock]
WHEN NOT MATCHED BY SOURCE THEN
    DELETE;

SET IDENTITY_INSERT dbo.Products OFF