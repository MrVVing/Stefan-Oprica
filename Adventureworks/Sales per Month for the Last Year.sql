SELECT 
    YEAR(soh.OrderDate) AS SalesYear,
    MONTH(soh.OrderDate) AS SalesMonth,
    SUM(sod.LineTotal) AS MonthlySales
FROM Sales.SalesOrderHeader soh
JOIN Sales.SalesOrderDetail sod ON soh.SalesOrderID = sod.SalesOrderID
WHERE soh.OrderDate >= DATEADD(YEAR, -1, GETDATE())
GROUP BY YEAR(soh.OrderDate), MONTH(soh.OrderDate)
ORDER BY SalesYear, SalesMonth;