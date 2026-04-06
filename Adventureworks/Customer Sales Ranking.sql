WITH CustomerSales AS (
    SELECT 
        c.CustomerID,
        c.CompanyName,
        SUM(sod.LineTotal) AS TotalSpent
    FROM Sales.SalesOrderHeader soh
    JOIN Sales.SalesOrderDetail sod ON soh.SalesOrderID = sod.SalesOrderID
    JOIN Sales.Customer c ON soh.CustomerID = c.CustomerID
    GROUP BY c.CustomerID, c.CompanyName
)
SELECT 
    CustomerID,
    CompanyName,
    TotalSpent,
    RANK() OVER(ORDER BY TotalSpent DESC) AS SalesRank
FROM CustomerSales;