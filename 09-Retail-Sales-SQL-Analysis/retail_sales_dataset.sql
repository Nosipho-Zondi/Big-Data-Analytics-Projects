CREATE DATABASE retail_sales;
USE retail_sales;

-- data inspection
SELECT * FROM retail_sales_dataset;

-- Checking for nulls
SELECT * FROM retail_sales_dataset WHERE customer_satisfaction IS NULL;
-- mysql returns the column names because there are no nulls in the original data, empty cells are not real nulls

-- looking for empty strings since there are no real nulls
SELECT * FROM retail_sales_dataset WHERE customer_satisfaction = '';
SELECT * FROM retail_sales_dataset WHERE discount_pct = '';

-- filling empty strings for data consistency and clean reporting
-- mysql prevents to accidentally update/delete the table, using sql safe updates unlocks the safe update mode
SET SQL_SAFE_UPDATES = 0;
UPDATE retail_sales_dataset SET discount_pct = 'Unknown' WHERE discount_pct = '';
SET SQL_SAFE_UPDATES = 1;

-- the gender and customer satisfaction column is inconsistent
SET SQL_SAFE_UPDATES = 0;
UPDATE retail_sales_dataset SET gender = 'Female' WHERE gender = 'F' OR gender ='f';
UPDATE retail_sales_dataset SET gender = 'Male' WHERE gender = 'M' OR gender ='m';
UPDATE retail_sales_dataset SET gender = 'Female' WHERE gender = 'female' OR gender = 'FEMALE';
UPDATE retail_sales_dataset SET gender = 'Male' WHERE gender = 'male' OR gender = 'MALE';
UPDATE retail_sales_dataset SET customer_satisfaction = 'Unknown' WHERE customer_satisfaction = '';
SET SQL_SAFE_UPDATEs = 1;
SELECT customer_satisfaction FROM retail_sales_dataset;

-- Total sales per region
SELECT region, SUM(sales_amount) AS total FROM retail_sales_dataset GROUP BY region; 

-- Sales by city
SELECT city, SUM(sales_amount) AS total FROM retail_sales_dataset GROUP BY city;

-- Top 5 profitable product category
SELECT product_category, SUM(profit) AS total FROM retail_sales_dataset GROUP BY product_category ORDER BY total DESC limit 5;

-- Gender buying behaviour
SELECT gender, SUM(profit) AS total FROM retail_sales_dataset GROUP BY gender;

-- Discount vs profit
-- finding products that were not sold on discount
SELECT product_category, SUM(profit) AS total FROM retail_sales_dataset WHERE discount_pct = 'Unknown' GROUP BY product_category ORDER BY total DESC;

-- finding products that were sold on discount
SELECT product_category, SUM(profit) AS total FROM retail_sales_dataset WHERE discount_pct > 0 GROUP BY product_category ORDER BY total DESC;

-- Monthly sales trend
SELECT 
  YEAR(order_date) AS yr,
  MONTH(order_date) AS mth,
  SUM(sales_amount) AS total_orders
FROM retail_sales_dataset
GROUP BY yr, mth
ORDER BY yr, mth;

SELECT * FROM retail_sales_dataset;

-- finding returned orders to investigate why they were returned
SELECT COUNT(*) FROM retail_sales_dataset
WHERE order_status = 'Returned' 
OR order_status = 'Pending' 
OR order_status = 'Cancelled'
GROUP BY order_status;

-- finding the average number of days it takes to ship a product
SELECT product_category, AVG(days_to_ship) AS avg_days_to_ship 
FROM retail_sales_dataset 
GROUP BY product_category 
ORDER BY avg_days_to_ship DESC LIMIT 10;


