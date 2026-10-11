# 09 - Retail Sales Analysis with SQL

## 🎯 Objective
Analyze retail order data to understand order status distribution and shipping efficiency. Focus on fixing common SQL logic errors and using GROUP BY for business insights.

## 📁 Files in this folder
- `retail_sales_dataset.csv` - raw dataset
- `retail_sales_queries.sql` - all queries used
- `screenshots/` - result grids from MySQL Workbench

## 🛠️ Queries & Methods

**1. Count orders by status (Fixing AND vs OR logic)**
```sql
SELECT COUNT(*)
FROM retail_sales_dataset
WHERE order_status = 'Pending'
OR order_status = 'Cancelled'
OR order_status = 'Returned';
