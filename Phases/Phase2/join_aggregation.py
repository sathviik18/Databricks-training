customers = spark.read.csv("/Workspace/Users/iluqmanshaik255@gmail.com/Drafts/customers.csv" , inferSchema=True , header = True)
orders = spark.read.csv("/Workspace/Users/iluqmanshaik255@gmail.com/Drafts/orders.csv" , inferSchema = True , header = True)
customers.createOrReplaceTempView("customers")
orders.createOrReplaceTempView("orders")





display(customers)
display(orders)



customers.join(
    orders,
    on="customer_id", 
    how = "inner" 
).show()



customers.join(orders,
               on = "customer_id",
               how = "inner").show()



customers.join(orders,
               on = "customer_id",
               how = "right").show()



customers.join(orders,
               on = "customer_id",
               how = "outer").show()



customers.crossJoin(orders).show()



customers.join(orders,
               on = "customer_id",
               how = "leftsemi").show()



customers.join( orders ,
               on = "customer_id",
               how = "left_anti").show()



customers.join(orders, 
               customers.customer_id == orders.customer_id,
               "inner").show()



customers.join(orders,"customer_id") \
    .select(
        customers["customer_name"],
        orders["order_id"],
        orders["order_amount"]
    ).show()





from pyspark.sql.functions import sum
customers.join(orders , on = "customer_id" , how = "inner") \
    .groupBy("customer_id" , "customer_name") \
    .agg(sum("order_amount").alias("total_amount")) \
    .show()



from pyspark.sql.functions import avg
customers.join(orders, on = "customer_id" , how= "inner") \
    .groupBy("customer_id" , "customer_name") \
    .agg(avg("order_amount").alias("AVG_AMOUNT")) \
    .show()



from pyspark.sql.functions import count
orders.groupBy("customer_id") \
    .agg(count("*").alias("total_orders")) \
    .show()



from pyspark.sql.functions import max
orders.groupBy("customer_id") \
    .agg(max("order_amount").alias("highest_amount_paid")) \
    .orderBy("highest_amount_paid" , ascending = False) \
    .show()



from pyspark.sql.functions import min
orders.groupBy("customer_id") \
    .agg(min("order_amount").alias("LOWEST_ORDER_AMOUNT")) \
    .orderBy("LOWEST_ORDER_AMOUNT" , ascending=True) \
    .show()



from pyspark.sql.functions import first
orders.groupBy("customer_id") \
    .agg(first("payment_method").alias("first_payment_method")) \
        .show()



from pyspark.sql.functions import last
orders.groupBy("customer_id") \
    .agg(last("payment_method").alias("last_payment_method")) \
        .show()



from pyspark.sql.functions import stddev
orders.groupBy("customer_id") \
    .agg(stddev("order_amount").alias('std_amount')) \
        .show()



from pyspark.sql.functions import variance
orders.groupBy("customer_id") \
    .agg(variance("order_amount").alias("var_amount")) \
        .show()