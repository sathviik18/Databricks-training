SELECT * FROM customers;
SELECT * FROM orders;
--RETRIEVE CUSTOMERS WHO HAVE PLACED ATLEAST ONE ORDER
SELECT c.customer_id ,
c.customer_name ,
o.order_id ,
o.order_amount
FROM customers c
INNER JOIN orders O
ON c.customer_id = o.customer_id;
-- retrieve all customers including those without orders
SELECT * FROM customers c
LEFT JOIN orders o
ON c.customer_id = o.customer_id;
-- RETRIEVE ALL ORDERS INCLUDING UNMATCHED CUSTOMERS
SELECT * FROM customers c
RIGHT JOIN orders o
ON c.customer_id = o.customer_id;
-- RETRIEVE ALL RECORDS FROM BOTH TABLES
SELECT * FROM customers c
FULL OUTER JOIN orders o
ON c.customer_id = o.customer_id;
--generate all possible cystomer-order combinations
SELECT * FROM customers 
CROSS JOIN orders;
--RETRIEVE CUSTOMERS WHO HAVE PLACED ORDERS
SELECT * FROM customers 
WHERE customer_id IN 
(
SELECT customer_id 
FROM orders
);
--RETRIEVE CUSTOMERS WHO HAVE NOT PLACED ANY ORDERS
SELECT * FROM customers 
WHERE customer_id NOT IN 
(
SELECT customer_id
FROM orders 
);
--JOINN customers and ordersusing a custom join condition
SELECT * FROM customers c 
INNER JOIN orders o 
ON c.customer_id = o.customer_id;
--RETRIEVE CUSTOMER DETAILS ALONG WITH ORDER AMOUNT
SELECT c.customer_name,
o.order_id,
o.order_amount 
FROM customers c 
INNER JOIN orders o  
ON c.customer_id = o.customer_id;
--CALCULATE TOTAL ORDER AMOUNT FOR EACH CUSTOMER
SELECT c.customer_name ,
SUM(o.order_amount) AS total_amount
FROM customers c  
INNER JOIN orders o 
ON c.customer_id = o.customer_id
GROUP BY c.customer_id , c.customer_name;
-- Calculate the average order amount for each customer.
SELECT c.customer_name , 
AVG(o.order_amount) AS AVG_AMOUNT
FROM customers c  
INNER JOIN orders o  
ON c.customer_id = o.customer_id
GROUP BY c.customer_id , c.customer_name;
-- Count the number of orders placed by each customer
SELECT customer_id ,
COUNT(*) AS total_orders
FROM orders
GROUP BY customer_id;
--Find the highest order amount for each customer
SELECT customer_id ,
MAX(ORDER_AMOUNT) AS highest_amount_paid
FROM orders
GROUP BY customer_id
ORDER BY highest_amount_paid DESC;
--Find the lowest order amount for each customer
SELECT customer_id ,
MIN(ORDER_AMOUNT) AS lowest_amount_paid
FROM orders
GROUP BY customer_id
ORDER  BY lowest_amount_paid ASC;

-- DISPLAY FIRST PAYMENT METHOD USED BY EACH CUSTOMER
SELECT customer_id ,
FIRST(payment_method) AS first_payment_method
FROM orders 
GROUP BY customer_id;
-- Display the last payment method used by each customer
SELECT customer_id , 
LAST(PAYMENT_METHOD) AS last_payment_method
FROM orders
GROUP BY customer_id;
-- Calculate the standard deviation of order amounts
SELECT customer_id , 
STDDEV(order_amount) AS std_amount
FROM orders  
GROUP BY customer_id;
-- Calculate the variance of order amounts
SELECT customer_id , 
VAR(order_amount) AS var_amount
FROM orders
GROUP BY customer_id;
