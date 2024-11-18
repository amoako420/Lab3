BEGIN TRANSACTION;

    --Add Items to Order
    INSERT INTO OrderItems (OrderID, ProductID, Quantity, Price)
    VALUES (x, x, x, x);

    --Calculate Order Total
    UPDATE Orders SET TotalPrice = (SELECT SUM(Price * Quantity) FROM OrderItems WHERE OrderID = x)
    WHERE OrderID = x;

    --Process Payment
    INSERT INTO Payments (OrderID, Amount, PaymentMethod)
    VALUES (x, x, x);

    --Update Inventory
    UPDATE Products SET Quantity = Quantity - x
    WHERE ProductID = x;

COMMIT TRANSACTION;