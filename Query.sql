-- Monthly Sales Trend Analysis: Revenue and Order Volume
SELECT 
    YEAR(OrderDate) AS order_year,
    MONTH(OrderDate) AS order_month,
    SUM(Amount) AS total_revenue,
    COUNT(DISTINCT OrderID) AS order_volume
FROM 
    Orders
GROUP BY 
    YEAR(OrderDate), MONTH(OrderDate)
ORDER BY 
    order_year ASC, order_month ASC;

-- Optional: Limit to Specific Time Period
SELECT 
    YEAR(OrderDate) AS order_year,
    MONTH(OrderDate) AS order_month,
    SUM(Amount) AS total_revenue,
    COUNT(DISTINCT OrderID) AS order_volume
FROM 
    Orders
WHERE YEAR(OrderDate) = 2018
GROUP BY 
    YEAR(OrderDate), MONTH(OrderDate)
ORDER BY 
    order_year ASC, order_month ASC;

-- Or for a range, like 2022–2024
SELECT 
    YEAR(OrderDate) AS order_year,
    MONTH(OrderDate) AS order_month,
    SUM(Amount) AS total_revenue,
    COUNT(DISTINCT OrderID) AS order_volume
FROM 
    Orders
WHERE OrderDate BETWEEN '2018-01-01' AND '2018-10-31'
GROUP BY 
    YEAR(OrderDate), MONTH(OrderDate)
ORDER BY 
    order_year ASC, order_month ASC;
