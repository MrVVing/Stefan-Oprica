SELECT TOP 5
    c.CustomerID,
    c.PersonID,
    c.CompanyName,
    SUM(sod.LineTotal) AS TotalSpent
FROM Sales.SalesOrderHeader soh
JOIN Sales.SalesOrderDetail sod ON soh.SalesOrderID = sod.SalesOrderID
JOIN Sales.Customer c ON soh.CustomerID = c.CustomerID
GROUP BY c.CustomerID, c.PersonID, c.CompanyName
ORDER BY TotalSpent DESC;