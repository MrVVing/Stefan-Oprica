-- Create table
CREATE TABLE Sales (
    SaleID INT PRIMARY KEY,
    Product VARCHAR(50),
    Quantity INT,
    Price DECIMAL(10,2),
    SaleDate DATE,
    Region VARCHAR(50)
);

-- Insert example data
INSERT INTO Sales (SaleID, Product, Quantity, Price, SaleDate, Region) VALUES
(1,'Keyboard',5,20.00,'2026-01-10','North'),
(2,'Mouse',10,15.00,'2026-01-11','South'),
(3,'Monitor',2,150.00,'2026-01-12','East'),
(4,'Laptop',1,800.00,'2026-01-13','West'),
(5,'Keyboard',3,20.00,'2026-01-14','North'),
(6,'Mouse',7,15.00,'2026-01-15','South');

-- Total sales per product
SELECT Product, SUM(Quantity*Price) AS TotalSales
FROM Sales
GROUP BY Product
ORDER BY TotalSales DESC;

-- Total sales per region
SELECT Region, SUM(Quantity*Price) AS TotalSales
FROM Sales
GROUP BY Region;

-- Top 3 best-selling products
SELECT Product, SUM(Quantity) AS TotalQuantity
FROM Sales
GROUP BY Product
ORDER BY TotalQuantity DESC
LIMIT 3;