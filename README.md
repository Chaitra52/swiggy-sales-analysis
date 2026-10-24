## Swiggy Sales Analysis Using SQL Server

## Project Overview
This project analyzes Swiggy food delivery data using Microsoft SQL Server. It focuses on data quality, dimensional modelling, and SQL-based business analysis to generate meaningful insights into orders, revenue, restaurant performance, cuisine preferences, and ratings.

## Business Objectives
- Clean and validate raw sales data.
- Identify and remove duplicate records.
- Design a star schema for analytical reporting.
- Develop business KPIs using SQL.
- Analyze order trends, locations, food performance, customer spending, and ratings.

## Tools & Technologies
- Microsoft SQL Server
- SQL Server Management Studio (SSMS)
- SQL: JOINs, GROUP BY, aggregate functions, CTEs, window functions, and date functions

## Project Workflow
1. **Data Cleaning:** Check missing values, blank strings, and duplicate records.
2. **Dimensional Modelling:** Build date, location, restaurant, category, and dish dimensions.
3. **Fact Table Development:** Create `fact_swiggy_orders` and establish relationships with dimension tables.
4. **KPI Analysis:** Calculate total orders, total revenue, average dish price, and average rating.
5. **Business Analysis:** Examine monthly and quarterly trends, yearly growth, top cities, state revenue, restaurant rankings, cuisine performance, spending buckets, and ratings.

## Key Business Questions
- Which cities generate the highest order volume?
- Which states contribute the most revenue?
- Which restaurants and dishes perform best?
- How do orders change across months, quarters, and years?
- What is the distribution of spending across price ranges?
- How do ratings vary across cuisines?

## Repository Structure
- `sql/` — SQL scripts for cleaning, modelling, data loading, and analysis.
- `documentation/` — Business requirements and schema documentation.

## How to Run
1. Open SQL Server Management Studio.
2. Connect to your SQL Server instance.
3. Create or select the project database.
4. Execute the SQL scripts in the documented order.
5. Review the result sets for each analysis.

## Project Status
SQL-based business analytics portfolio project.

