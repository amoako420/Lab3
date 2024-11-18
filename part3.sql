use lab3;

CREATE TABLE Products (
ProductID integer primary key,
ProductName varchar(255),
StockQuantity integer
);

INSERT INTO Products (ProductID, ProductName, StockQuantity) VALUES (101,'TechCorp Smart Speaker',10);

-- Alex's Transaction
start TRANSACTION;

-- Lock the productID row
SELECT * FROM Products 
WHERE ProductID = 101
FOR UPDATE;

-- Perform the update
UPDATE Products 
SET StockQuantity = StockQuantity - 5
WHERE ProductID = 101;

COMMIT;

-- Taylor Transactions
start TRANSACTION;
SELECT * 
FROM Products
WHERE ProductID = 101
FOR UPDATE; 

select StockQuantity from Products
WHERE ProductID = 101;

DELIMITER //
IF(StockQuantity >= 5) THEN 
 UPDATE Products
 SET StockQuantity = StockQuantity - 5
 WHERE ProductID = 101;
    
ELSE
	ROLLBACK;
END IF;
DELIMITER ;

COMMIT;

SELECT * FROM Products;