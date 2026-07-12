from pyspark.sql.functions import sum

# Exercise 1: Calculate the total amount spent by each customer
customers.join(sales ,
            on = "customer_id" ,
            how = "inner") \
            .groupBy("customer_id" ,"customer_name") \
            .agg(sum("total_amount").alias("total_amount_spent")) \
             .orderBy("total_amount_spent" , ascending = False) \
             .show()

# Exercise 2: Display the top 3 customers based on total amount spent
from pyspark.sql.functions import sum
customers.join(sales , on = "customer_id" , how = "inner") \
    .groupBy("customer_id" , "customer_name" ) \
        .agg(sum("total_amount").alias("total_amount_spent")) \
        .orderBy("total_amount_spent" , ascending = False) \
        .limit(3) \
        .show()

# Exercise 3: Find customers who have never placed an order
customers.join(sales,
               on = "customer_id",
               how = "left_anti").show()

# Exercise 4: Calculate the total revenue generated from each city.
from pyspark.sql.functions import sum
customers.join(sales , on = "customer_id" , how = "inner") \
    .groupBy("city") \
    .agg(sum("total_amount").alias("total_revenue")) \
    .orderBy("total_revenue" , ascending = False) \
    .show()

# Exercise 5: Calculate the average order amount for each customer
from pyspark.sql.functions import avg
customers.join(sales , on ="customer_id" , how = "inner") \
    .groupBy("customer_id" , "customer_name") \
        .agg(avg("total_amount").alias("average_amount_spent")) \
            .orderBy("average_amount_spent" , ascending = False) \
            .show()

# Exercise 6: Display customers who have placed more than one order.
from pyspark.sql.functions import count
customers.join(sales , on = "customer_id" , how = "inner") \
    .groupBy("customer_id" , "customer_name") \
    .agg(count("sale_id").alias("orders_placed")) \
    .where("orders_placed > 1") \
    .orderBy("customer_id" , ascending = True) \
    .show()

# Exercise 7: Sort customers by total spend descending
from pyspark.sql.functions import sum
customers.join(sales ,
            on = "customer_id" ,
            how = "inner") \
            .groupBy("customer_id" ,"customer_name") \
            .agg(sum("total_amount").alias("total_amount_spent")) \
             .orderBy("total_amount_spent" , ascending = False) \
             .show()
