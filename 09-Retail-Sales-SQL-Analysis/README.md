# 09 - Retail Sales Analysis with SQL

## 🎯 Objective
The objective is to analyze retail orders data to understand order status distribution and shipping efficiency. Focus on fixing common SQL logic errors and using GROUP BY for business insights.

## 📁 Files in this folder
- `retail_sales_dataset.csv` - raw dataset
- `retail_sales_queries.sql` - all queries used

## 🛠️ Queries & Methods

**1. Count orders by status (Fixing AND vs OR logic)**
```sql
SELECT COUNT(*)
FROM retail_sales_dataset
WHERE order_status = 'Pending'
OR order_status = 'Cancelled'
OR order_status = 'Returned';

**2. Breakdown per status **
SELECT 
  order_status, 
  COUNT(*) AS total_orders
FROM retail_sales_dataset
WHERE order_status IN ('Returned', 'Pending', 'Cancelled')
GROUP BY order_status
ORDER BY total_orders DESC;

**3. Shipping performance **
-- Overall average
SELECT AVG(days_to_ship) AS avg_days_to_ship
FROM retail_sales_dataset;

-- Average by status (business insight)
SELECT order_status, AVG(days_to_ship) AS avg_days
FROM retail_sales_dataset
GROUP BY order_status;
