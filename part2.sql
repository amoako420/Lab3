BEGIN TRANSACTION;
    --The x is placeholder
    --Add Items to Order
    INSERT INTO Orders (OrderID, ProductID, Quantity, Price)
    VALUES (x, x, x, x);

    --Calculate Order Total
    UPDATE Orders SET TotalPrice = (SELECT SUM(Price * Quantity) FROM Order WHERE OrderID = x)
    WHERE OrderID = x;

    --Process Payment
    INSERT INTO Payments (OrderID, Amount, PaymentMethod)
    VALUES (x, x, x);

    --Update Inventory
    UPDATE Products SET Quantity = Quantity - x
    WHERE ProductID = x;

COMMIT TRANSACTION;