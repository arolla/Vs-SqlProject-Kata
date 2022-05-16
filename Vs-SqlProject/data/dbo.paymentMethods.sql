MERGE dbo.PaymentMethods as Target
USING(
	VALUES (N'Gold')
) as source ([PaymentMethod])
on Target.[PaymentMethod] = source.[PaymentMethod]
WHEN NOT MATCHED THEN
	INSERT ([PaymentMethod]) VALUES (source.[PaymentMethod])
WHEN NOT MATCHED BY SOURCE THEN
    DELETE;