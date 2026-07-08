# ==========================
# WITHCOLUMN
# ==========================

--51
df.withColumn(
    "is_high_salary",
    when(col("salary") > 70000, True).otherwise(False)
).show()

--52
df.withColumn(
    "joining_year",
    year(to_date(col("joining_date")))
).show()

--53
df.withColumn(
    "salary_after_tax",
    col("salary") - (col("salary") * 0.05)
).show()

--54
df.withColumn(
    "department_code",
    substring(col("department"), 1, 3)
).show()

--55
df.withColumn(
    "double_salary",
    col("salary") * 2
).show()


# ==========================
# TYPECASTING
# ==========================

--56
df.withColumn(
    "salary",
    col("salary").cast("string")
).show()

--57
df.withColumn(
    "age",
    col("age").cast("double")
).show()

--58
df.withColumn(
    "joining_date",
    col("joining_date").cast("date")
).show()

--59
df.withColumn(
    "emp_id",
    col("emp_id").cast("string")
).show()

--60
df.withColumn(
    "salary",
    col("salary").cast("int")
).show()

--61
df.withColumn(
    "age",
    col("age").cast("string")
).show()

--62
df.withColumn(
    "joining_date",
    col("joining_date").cast("timestamp")
).show()

--63
df.withColumn(
    "salary",
    col("salary").cast("float")
).show()

--64
df.withColumn(
    "emp_id",
    col("emp_id").cast("long")
).show()

--65
df.withColumn("emp_id", col("emp_id").cast("long")) \
  .withColumn("age", col("age").cast("string")) \
  .withColumn("joining_date", col("joining_date").cast("timestamp")) \
  .show()


# ==========================
# SORT / ORDERBY
# ==========================

--66
df.orderBy("salary").show()

--67
df.orderBy(col("salary").desc()).show()

--68
df.orderBy(col("age").desc()).show()

--69
df.orderBy("emp_name").show()

--70
df.orderBy("city", col("salary").desc()).show()

--71
df.orderBy("joining_date").show()

--72
df.orderBy("department").show()

--73
df.orderBy(col("designation").desc()).show()

--74
df.orderBy("city", "age").show()

--75
df.orderBy(col("salary").desc()) \
  .limit(10) \
  .show()

--76
df.orderBy(col("emp_id").desc()).show()

--77
df.filter(df.department == "IT") \
  .orderBy(col("salary").desc()) \
  .show()

--78
df.orderBy(col("joining_date").desc()).show()

--79
df.orderBy("emp_name").show()

--80
df.orderBy("department", "emp_name", col("salary").desc()).show()


# ==========================
# LIMIT
# ==========================

--81
df.show(5)

--82
df.limit(10).show()

--83
df.filter(df.department == "IT") \
  .limit(3) \
  .show()

--84
df.orderBy(col("salary").desc()) \
  .limit(5) \
  .show()

--85
df.orderBy("salary") \
  .limit(5) \
  .show()

--86
df.orderBy("age") \
  .limit(7) \
  .show()

--87
df.filter(df.city == "Hyderabad") \
  .limit(2) \
  .show()

--88
df.limit(15).show()

--89
df.orderBy("age") \
  .limit(5) \
  .show()

--90
df.filter(df.salary > 60000) \
  .limit(8) \
  .show()
