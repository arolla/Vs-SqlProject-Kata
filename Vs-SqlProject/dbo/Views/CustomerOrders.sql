CREATE VIEW [dbo].[CustomerOrders] AS
(
    SELECT c.CustomerId, c.Username, o.OrderId, o.DeliveryAddress, o.PaymentMethod
        , SUM(p.UnitPrice * ol.Quantity) OVER ( PARTITION BY o.OrderId ) OrderTotal
        , p.ProductId, p.Name ProductName, cat.Name CategoryName, p.UnitPrice, ol.Quantity, p.UnitPrice * ol.Quantity TotalPrice
    FROM Customers c
    INNER JOIN Orders o ON o.CustomerId = c.CustomerId
    INNER JOIN OrderLines ol ON ol.OrderId = o.OrderId
    INNER JOIN Products p ON p.ProductId = ol.ProductId
    INNER JOIN Categories cat ON cat.CategoryId = p.CategoryId
)