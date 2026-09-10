# SQL Inventory Management System

Retail order and inventory analysis using SQL — queries, sub-queries, stored procedures, and views.

## Project Overview
Built a SQL-based inventory management system to retrieve, summarize, and analyze retail order data. Demonstrates core database skills: filtering, aggregation, updates with sub-queries, stored procedures, and JOINed views for business insights.

## Key Queries & Features

**1. Order Retrieval & Summary**
- Retrieved full order listings: Order ID, Customer ID, Order Date, Total Amount
- Summarized total quantity sold and revenue by item using GROUP BY and aggregate functions

**2. Price Update with Sub-query**
- Applied a 10% price increase to all items in the Furniture category using UPDATE with a sub-query

**3. Stored Procedures**
- BestSellingItem: Identifies the best-selling item by total sales amount
- CustomerTotalSpent: Calculates total amount spent per customer

**4. Customer Insights View**
- Created a view with JOIN to surface the customer with the highest total orders
- Displays Customer ID, first name, last name, and total amount spent

## Skills Demonstrated
- SQL: SELECT, WHERE, GROUP BY, ORDER BY, aggregate functions
- Sub-queries, UPDATE statements
- Stored Procedures
- Views and JOINs
- Business logic translation into queries

## Files
- inventory_queries.sql — all queries, procedures, and view definitions
- README.md — project documentation

## Tools
- SQL (MySQL / SQL Server compatible)
- GitHub for version control
