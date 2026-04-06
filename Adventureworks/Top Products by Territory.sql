-- CTE1: Total sales per product per territory
WITH ProductTerritorySales AS (
    SELECT 
        st.Name AS Territory,
        p.ProductID,
        p.Name AS ProductName,
        SUM(sod.LineTotal) AS TotalSales
    FROM Sales.SalesOrderHeader soh
    JOIN Sales.SalesOrderDetail sod ON soh.SalesOrderID = sod.SalesOrderID
    JOIN Production.Product p ON sod.ProductID = p.ProductID
    JOIN Sales.SalesTerritory st ON soh.TerritoryID = st.TerritoryID
    GROUP BY st.Name, p.ProductID, p.Name
),

-- CTE2: Total sales per territory
TerritoryTotalSales AS (
    SELECT 
        Territory,
        SUM(TotalSales) AS TerritorySales
    FROM ProductTerritorySales
    GROUP BY Territory
),

-- CTE3: Ranking products within each territory
RankedProducts AS (
    SELECT 
        pts.Territory,
        pts.ProductID,
        pts.ProductName,
        pts.TotalSales,
        tts.TerritorySales,
        RANK() OVER (PARTITION BY pts.Territory ORDER BY pts.TotalSales DESC) AS ProductRank
    FROM ProductTerritorySales pts
    JOIN TerritoryTotalSales tts ON pts.Territory = tts.Territory
)

-- Final selection: Top 3 products per territory
SELECT 
    Territory,
    ProductID,
    ProductName,
    TotalSales,
    TerritorySales,
    ProductRank
FROM RankedProducts
WHERE ProductRank <= 3
ORDER BY Territory, ProductRank;