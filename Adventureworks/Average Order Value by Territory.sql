SELECT 
    st.Name AS Territory,
    AVG(sod.LineTotal) AS AvgOrderValue
FROM Sales.SalesOrderHeader soh
JOIN Sales.SalesOrderDetail sod ON soh.SalesOrderID = sod.SalesOrderID
JOIN Sales.SalesTerritory st ON soh.TerritoryID = st.TerritoryID
GROUP BY st.Name
ORDER BY AvgOrderValue DESC;