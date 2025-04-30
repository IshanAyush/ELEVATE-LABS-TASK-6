# 📊 SQL Query Documentation: Monthly Sales Trend Analysis

This README explains each SQL query used to analyze the sales data stored in the `Orders` table. The goal is to track revenue and order volume trends over time, optionally filtering by year or a specific date range.

---

## 🧾 Table Structure

We are using a table named `Orders` with the following relevant columns:

- `OrderID` (VARCHAR): Unique identifier for each order  
- `OrderDate` (DATE): Date the order was placed  
- `Amount` (DECIMAL): Total amount spent on the order  
- `Profit` (DECIMAL): Profit from the order (not used in these queries, but available)  
- `Quantity` (INT): Quantity of items ordered  
- `Category`, `SubCategory`, `PaymentMode` (VARCHAR): Additional details  

---

## 1️⃣ Query: Monthly Sales Trend

```sql
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

```

---

## 🔍 Explanation:
Purpose: Analyze monthly revenue and number of unique orders over the full dataset.

SUM(Amount): Calculates the total revenue for each month.

COUNT(DISTINCT OrderID): Measures the number of individual orders (order volume).

Grouping: Data is grouped by both YEAR and MONTH of OrderDate.

Ordering: Ensures output is sorted from earliest to latest month.

---

## 2️⃣ Query: Filter by Specific Year (e.g., 2023)

```sql
Copy
Edit
SELECT 
    YEAR(OrderDate) AS order_year,
    MONTH(OrderDate) AS order_month,
    SUM(Amount) AS total_revenue,
    COUNT(DISTINCT OrderID) AS order_volume
FROM 
    Orders
WHERE YEAR(OrderDate) = 2023
GROUP BY 
    YEAR(OrderDate), MONTH(OrderDate)
ORDER BY 
    order_year ASC, order_month ASC;
```

---

## 🔍 Explanation:
Purpose: Get monthly revenue and order volume for a single year (2023 in this example).

WHERE YEAR(OrderDate) = 2023: Filters the dataset to include only orders placed in 2023.

Remaining logic is identical to the previous query.

---

## 3️⃣ Query: Filter by Date Range (e.g., 2022–2024)

```sql
Copy
Edit
SELECT 
    YEAR(OrderDate) AS order_year,
    MONTH(OrderDate) AS order_month,
    SUM(Amount) AS total_revenue,
    COUNT(DISTINCT OrderID) AS order_volume
FROM 
    Orders
WHERE OrderDate BETWEEN '2022-01-01' AND '2024-12-31'
GROUP BY 
    YEAR(OrderDate), MONTH(OrderDate)
ORDER BY 
    order_year ASC, order_month ASC;
```

---

## 🔍 Explanation:
Purpose: Analyze monthly trends for a custom multi-year period (e.g., 2022 to 2024).

WHERE OrderDate BETWEEN ...: Filters orders within the date range.

Other logic is the same as before — aggregates revenue and order volume per month.
