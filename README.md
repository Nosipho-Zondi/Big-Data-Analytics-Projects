# Excel Functions and Sales Dashboard

First Excel project in my data analytics portfolio. Built to solve a sales performance assessment and a cost optimization case using core Excel functions, PivotTables, and Solver.

## File
Excel Functions and Sales Dashboard.xlsx – contains 3 sheets: Dashboard, Sales, Projects

## Business Problem
1.  **Sales Analysis:** Analyze ~20 customer transactions to track sales, profit, and profitability by city and product.
2.  **Project Optimization:** Minimize total project costs across Projects A-H using Excel Solver under production, fixed, and extra cost constraints.

## Sheets Breakdown

### 1. Dashboard
- PivotTable summarizing **Sum of Sales by City Code** (CT, DB, EL, JH, LT, NW, NP, PE, PL, PT)
- Bar Chart: **Sales Per City** for quick regional comparison
- Grand Total Sales: ~R8.13M

### 2. Sales
Core calculation engine:
- Sales = Quantity * Product Price
- Profit = Sales - Total Cost
- Profit Category using nested IF:
  excel
  =IF(Profit>500000,"High Profit",
   IF(Profit>=300000,"Medium High Profit",
   IF(Profit>=100000,"Medium Low Profit","Low Profit")))
