df = spark.read.csv("/Workspace/Users/iluqmanshaik255@gmail.com/Drafts/PHASE1DATA.csv",
                    header=True)
display(df)
df.createOrReplaceTempView("employees")




selected_df = df.select("name")
display(selected_df)




selected_df = df.select("name" , "age" , "department")
display(selected_df)


from pyspark.sql.functions import col
selected_df = df.select(col("name") , col("age"))
display(selected_df)



from pyspark.sql.functions import col
df.withColumn("updated_salary" , col("salary") +5000).show()




from pyspark.sql.functions import col
df.select(
          col("name").alias("employee_name"),
          col("salary").alias("employee_salary")
          ).show()




df.withColumnRenamed("name" , "EMPLOYEE_NAME") \
    .withColumnRenamed("salary" , "employee_salary") \
        .show()



from pyspark.sql.functions import expr
df.select("name" , expr("age + 1  AS next_year_age")).show()



df.select("*").drop("salary").show()



spark.sql("""
          SELECT department ,
          AVG(SALARY) AS AVG_SALARY
          FROM employees
          GROUP BY department""").show()



columns = ["name" , "age" , "department"]
df.select(*columns).show()



df.drop("address-city" , "address_state").show()



df.select(
    "name" , 
    "address_city",
    "address_state"
).show()


emp_df = spark.read.csv("/Workspace/Users/iluqmanshaik255@gmail.com/Drafts/employees.csv" ,
                   header = True)
emp_df.createOrReplaceTempView("employees")



emp_df.filter(emp_df.age > 30 ).show()


emp_df.where("age > 30").show()



emp_df.filter((emp_df.age > 30) & (emp_df.salary > 50000)).show()



emp_df.filter((emp_df.age > 30) | (emp_df.department == "HR")).show()



from pyspark.sql.functions import col

emp_df.filter(~(col("department") == "HR")).show()



emp_df.filter(emp_df.department.isin("HR" , "Finance")).show()



emp_df.filter(emp_df.name.startswith("A")).show()



emp_df.filter(emp_df.name.endswith("n")).show()


emp_df.filter(emp_df.name.like("A%")).show()



emp_df.filter(emp_df.name.rlike("son")).show()



emp_df.filter(emp_df.age.isNull()).show()



emp_df.filter(emp_df.department.isNotNull()).show()



emp_df.filter(emp_df.salary > 60000).show()
