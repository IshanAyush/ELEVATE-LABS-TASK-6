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

---

## 1️⃣ Query: Monthly Sales Trend
