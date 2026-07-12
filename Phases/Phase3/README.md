# 📁 Phase 3 – ETL using PySpark and SQL

## 📌 Objective

This phase focuses on learning the ETL (Extract, Transform, Load) process using PySpark and SQL in Databricks. The goal is to ingest CSV data, perform basic data cleaning, and solve business problems using both SQL and PySpark.

---

## 📂 Folder Structure

```
PHASE3/
│
├── PHASE3.ipynb
├── README.md
├── customers_phase3.csv
├── sales_phase3.csv
├── etl_queries.sql
└── etl_pyspark.py
```

---

## 🛠 Technologies Used

- Databricks Community Edition
- Apache Spark (PySpark)
- Spark SQL
- CSV Files

---

## 📊 Datasets

### customers_phase3.csv

Contains customer information.

Columns:
- customer_id
- customer_name
- city
- state
- phone
- email

### sales_phase3.csv

Contains sales transaction details.

Columns:
- sale_id
- customer_id
- product_name
- quantity
- unit_price
- total_amount
- sale_date

---

## 🔄 ETL Workflow

### Extract

- Loaded customer data from CSV.
- Loaded sales data from CSV.

### Transform

- Inspected schemas.
- Displayed sample records.
- Counted rows and columns.
- Checked NULL values.
- Removed records with NULL customer IDs.
- Removed duplicate records.
- Created temporary SQL views.

### Load

- Queried cleaned data using Spark SQL.
- Performed the same operations using PySpark DataFrame API.

---

## 📝 Exercises

### Exercise 1
Calculate the total amount spent by each customer.

### Exercise 2
Display the top 3 customers based on total amount spent.

### Exercise 3
Find customers who have never placed an order.

### Exercise 4
Calculate the total revenue generated from each city.

### Exercise 5
Calculate the average order amount for each customer.

### Exercise 6
Display customers who have placed more than one order.

### Exercise 7
Sort customers by total spend in descending order.

---

## 📄 Files

### etl_queries.sql

Contains all Spark SQL solutions for the exercises.

### etl_pyspark.py

Contains equivalent PySpark DataFrame solutions for the same exercises.

---

## 🎯 Learning Outcomes

After completing this phase, I learned how to:

- Read CSV files using PySpark.
- Explore DataFrames using schema and basic statistics.
- Identify and remove NULL values.
- Detect and remove duplicate records.
- Create temporary SQL views.
- Perform joins using SQL and PySpark.
- Apply aggregation functions such as SUM, AVG, and COUNT.
- Use LEFT ANTI JOIN to identify unmatched records.
- Translate SQL queries into equivalent PySpark DataFrame operations.

---

## 🚀 Author

**Shaik Mahammad Luqman**

B.Tech – Artificial Intelligence & Data Science
