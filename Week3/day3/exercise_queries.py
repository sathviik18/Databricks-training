# ==========================
# SELECT
# ==========================

--1
df.select("emp_name" , "salary").show(df.count())

--2
df.select("emp_id" , "emp_name" , "department").show(df.count())

--3
df.select("city" , "designation" , "salary").show(df.count())

--4
df.filter(df.department == "IT") \
    .select("emp_id" , "emp_name" , "department").show()

--5
df.select("emp_name" , "joining_date" , "salary").show()

--6
df.select("emp_id", "emp_name", "age", "city", "designation").show()

--7
df.select("emp_id" ,"salary").show()

--8
df.filter(df.city == "Hyderabad") \
    .select("emp_name" , "city").show()

--9
df.select("designation" , "department").show()

--10
df.drop("joining_date").show()


# ==========================
# ALIAS
# ==========================

--11
df.select(df.emp_name.alias("employee_name")).show()

--12
df.select(df.salary.alias("monthly_salary")).show()

--13
df.select(df.department.alias("dept")).show()

--14
df.select(df.joining_date.alias("doj")).show()

--15
df.select(
    df.emp_name.alias("name"),
    df.city.alias("location")
).show()

--16
df.select(df.designation.alias("job_role")).show()

--17
df.select(df.age.alias("employee-age")).show()

--18
df.select(
    df.emp_name.alias("employee_name"),
    df.age.alias("employee_age"),
    df.designation.alias("job_role")
).show()

--19
df.select(
    df.salary.alias("emp_salary"),
    df.department.alias("emp_dept")
).show()

--20
df.select(df.city.alias("work_location")).show()


# ==========================
# FILTER / WHERE
# ==========================

--21
df.filter(df.salary > 70000) \
    .select("emp_name", "salary") \
    .show()

--22
df.filter(df.city == "Hyderabad") \
    .select("emp_name", "city") \
    .show()

--23
df.filter(df.age < 25) \
    .select("emp_name", "age") \
    .show()

--24
df.filter(df.department == "IT") \
    .select("emp_name", "department") \
    .show()

--25
df.filter(df.designation == "Developer") \
    .select("emp_name", "designation") \
    .show()

--26
df.filter(df.salary.between(50000, 80000)) \
    .select("emp_name", "salary") \
    .show()

--27
df.filter(df.city == "Bangalore") \
    .select("emp_name", "city") \
    .show()

--28
df.filter(df.joining_date > "2022-01-01") \
    .select("emp_name", "joining_date") \
    .show()

--29
df.filter(df.age > 30) \
    .select("emp_name", "age") \
    .show()

--30
df.filter(df.salary < 50000) \
    .select("emp_name", "salary") \
    .show()

--31
df.filter((df.city == "Chennai") & (df.salary > 60000)) \
    .select("emp_name", "department", "salary") \
    .show()

--32
df.filter((df.city == "Mumbai") | (df.city == "Pune")) \
    .select("emp_name", "city") \
    .show()

--33
df.filter(df.emp_name.startswith("S")).show()

--34
df.filter(df.emp_name.endswith("a")).show()

--35
df.filter(df.department == "HR").show()

--36
df.filter(df.designation.contains("Engineer")).show()

--37
df.filter(df.city != "Hyderabad").show()

--38
df.filter(df.age.between(25, 30)).show()

--39
df.filter(df.salary > 90000).show()

--40
df.filter(df.department == "Support").show()


# ==========================
# WITHCOLUMNRENAMED
# ==========================

--41
df.withColumnRenamed("emp_name", "employee_name").show()

--42
df.withColumnRenamed("department", "dept").show()

--43
df.withColumnRenamed("joining_date", "doj").show()

--44
df.withColumnRenamed("salary", "monthly_salary").show()

--45
df.withColumnRenamed("designation", "job_role").show()

--46
df.withColumnRenamed("city", "work_location").show()

--47
df.withColumnRenamed("age", "employee_age").show()

--48
df.withColumnRenamed("emp_name", "employee_name") \
    .withColumnRenamed("salary", "monthly_salary") \
    .withColumnRenamed("department", "dept") \
    .show()

--49
df.withColumnRenamed("emp_id", "employee_id").show()

--50
df.withColumnRenamed("department", "business_unit").show()
