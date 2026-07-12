# Phase 2 – SQL to PySpark Intermediate (Joins & Aggregations)

## 📌 Overview

This phase focuses on translating SQL join and aggregation queries into equivalent PySpark DataFrame operations. The exercises use customer and order datasets to perform real-world business analysis through joins, grouping, and aggregation functions.

The objective is to strengthen SQL-to-PySpark conversion skills and understand how relational operations are implemented using the PySpark DataFrame API.

---

## 📂 Folder Structure

```
PHASE2/
│
├── PHASE2.ipynb
├── README.md
├── customers.csv
├── orders.csv
├── join_aggregation.py
└── join_aggregation_queries.sql
```

---

## 📊 Datasets

### customers.csv

Contains customer information.

| Column | Description |
|---------|-------------|
| customer_id | Unique Customer ID |
| customer_name | Customer Name |
| city | Customer City |
| state | Customer State |
| phone | Contact Number |

### orders.csv

Contains order details.

| Column | Description |
|---------|-------------|
| order_id | Unique Order ID |
| customer_id | Customer ID |
| product | Product Name |
| order_amount | Order Amount |
| payment_method | Payment Method |
| order_date | Order Date |

---

## 📚 Topics Covered

### Join Operations

- Inner Join
- Left Join
- Right Join
- Full Outer Join
- Cross Join
- Left Semi Join
- Left Anti Join
- Join using Explicit Conditions
- Selecting Specific Columns after Join

### Aggregation Operations

- SUM()
- AVG()
- COUNT()
- MAX()
- MIN()
- FIRST()
- LAST()
- STDDEV()
- VARIANCE()
- GROUP BY
- ORDER BY with Aggregations

---

## 💻 Files

### `join_aggregation_queries.sql`

Contains SQL implementations for all join and aggregation exercises.

### `join_aggregation.py`

Contains equivalent PySpark DataFrame implementations for every SQL query.

### `PHASE2.ipynb`

Databricks notebook containing complete implementations and outputs.

---

## 🛠 Technologies Used

- Apache Spark (PySpark)
- SQL
- Databricks Community Edition

---

## 🎯 Learning Outcome

After completing this phase, I gained hands-on experience with:

- Performing different types of SQL joins in PySpark
- Converting SQL joins into DataFrame operations
- Using aggregation functions with `groupBy()`
- Applying multiple aggregations using `agg()`
- Writing business-oriented analytical queries
- Understanding the mapping between SQL and PySpark transformations

---






