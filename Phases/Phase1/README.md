# Phase 1 – SQL to PySpark Basics

## 📌 Overview

This phase focuses on understanding the fundamentals of converting SQL queries into their equivalent PySpark DataFrame operations. The exercises cover column selection, filtering techniques, and commonly used DataFrame transformations.

The objective is to build a strong foundation before moving on to joins, aggregations, and ETL pipelines.

---

## 📊 Dataset

**employees.csv**

The dataset contains employee information with the following columns:

| Column | Description |
|---------|-------------|
| emp_id | Employee ID |
| name | Employee Name |
| age | Employee Age |
| department | Department |
| salary | Employee Salary |
| address_city | City |
| address_state | State |

---

## 📚 Topics Covered

### Selection Operations

- Select single and multiple columns
- Select columns using `col()`
- Create new columns using `withColumn()`
- Rename columns using `alias()`
- Rename existing columns using `withColumnRenamed()`
- Use SQL expressions with `expr()`
- Select all columns except specific columns
- Dynamic column selection
- Execute SQL queries using temporary views

### Filtering Operations

- `filter()` and `where()`
- AND (`&`) condition
- OR (`|`) condition
- NOT (`~`) condition
- `isin()`
- `startswith()`
- `endswith()`
- `like()`
- `rlike()`
- `isNull()`
- `isNotNull()`

---

## 💻 Files

### `selection_filtering_queries.sql`

Contains SQL queries for all selection and filtering exercises.

### `selection_filtering.py`

Contains the equivalent PySpark DataFrame implementations for every SQL query.

### `Phase1.ipynb`

Databricks notebook containing the complete implementation and outputs.

---

## 🛠 Technologies Used

- Apache Spark (PySpark)
- SQL
- Databricks Community Edition

---

## 🎯 Learning Outcome

After completing this phase, I gained hands-on experience with:

- Writing SQL queries
- Converting SQL queries into PySpark DataFrame operations
- Working with DataFrame transformations
- Performing data filtering using multiple techniques
- Understanding the relationship between SQL and PySpark syntax

---
