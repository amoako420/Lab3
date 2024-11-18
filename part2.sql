BEGIN TRANSACTION;

TRY:
    -- Step 1: Add a new order
    INSERT a new record into the Orders table with OrderID, CustomerID, and current date.

    -- Step 2: Loop through each item in the order
    FOR each item (ItemID, Quantity) in the OrderItems list:
        -- Add the item to the OrderDetails table
        INSERT a record into OrderDetails with the OrderID, ProductID, and Quantity.

        -- Reduce the stock quantity for the product
        UPDATE the Products table:
            Subtract the Quantity from StockQuantity for the ProductID.

        -- Check stock consistency
        IF StockQuantity for the ProductID < 0:
            THROW an error and terminate the transaction.

    END FOR.

    -- Commit the transaction
    COMMIT TRANSACTION;
    PRINT "Transaction completed successfully."

CATCH:
    -- Rollback the transaction in case of an error
    ROLLBACK TRANSACTION;
    PRINT "An error occurred: " + ERROR_MESSAGE;

END TRY;
