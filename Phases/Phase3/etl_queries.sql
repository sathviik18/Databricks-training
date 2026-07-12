-- Exercise 1: Calculate the total amount spent by each customer
SELECT c.customer_name ,
SUM(s.total_amount) AS total_amount_spent
FROM customers c
INNER JOIN sales s
ON c.customer_id = s.customer_id
GROUP BY c.customer_id , c.customer_name
ORDER BY total_amount_spent DESC;

-- Exercise 2: Display the top 3 customers based on total amount spent
SELECT c.customer_id ,
c.customer_name,
SUM(s.total_amount) AS total_amount_spent
FROM customers c
INNER JOIN sales s
ON c.customer_id = s.customer_id
GROUP BY c.customer_id , c.customer_name
ORDER BY total_amount_spent DESC
LIMIT 3;

-- Exercise 3: Find customers who have never placed an order
SELECT * FROM customers
WHERE customer_id NOT IN (
    SELECT customer_id
    FROM sales
);

-- Exercise 4: Calculate the total revenue generated from each city.
SELECT c.city ,
SUM(s.total_amount) AS total_revenue
FROM customers c
INNER JOIN sales s
ON c.customer_id = s.customer_id
GROUP BY c.city
ORDER BY total_revenue DESC;

-- Exercise 5: Calculate the average order amount for each customer
SELECT c.customer_id , c.customer_name ,
AVG(s.total_amount) AS average_amount_spent
FROM customers c
INNER JOIN sales s
ON c.customer_id = s.customer_id
GROUP BY c.customer_id , c.customer_name
ORDER BY average_amount_spent DESC;

-- Exercise 6: Display customers who have placed more than one order.
SELECT c.customer_id , c.customer_name,
COUNT(s.sale_id) AS orders_placed
FROM customers c
INNER JOIN sales s
ON c.customer_id = s.customer_id
GROUP BY c.customer_id , c.customer_name
HAVING COUNT(s.sale_id) > 1
ORDER BY c.customer_id;

-- Exercise 7: Sort customers by total spend descending
SELECT c.customer_id ,
c.customer_name,
SUM(s.total_amount) AS total_amount_spent
FROM customers c
INNER JOIN sales s
ON c.customer_id = s.customer_id
GROUP BY c.customer_id , c.customer_name
ORDER BY total_amount_spent DESC;
