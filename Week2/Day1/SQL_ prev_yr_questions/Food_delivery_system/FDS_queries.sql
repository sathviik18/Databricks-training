--1
SELECT r.restaurant_name , f.food_name
FROM Restaurants r 
LEFT JOIN FoodItems f 
ON r.restaurant_id = f.restaurant_id;

--2
SELECT o.order_id , c.customer_id , f.food_name , o.quantity , o.total_amount 
FROM Orders o
LEFT JOIN Customers c 
ON o.customer_id = c.customer_id 
LEFT JOIN FoodItems f
ON o.food_id = f.food_id;

--3
SELECT c.customer_name , SUM(o.total_amount) AS total_spent 
FROM Customers c
LEFT JOIN Orders o 
ON c.customer_id = o.customer_id 
GROUP BY c.customer_name;

--4
SELECT r.restaurant_name , COUNT(f.food_id) AS FOODITEMS
FROM Restaurants r
LEFT JOIN FoodItems f
ON r.restaurant_id = f.restaurant_id
GROUP BY r.restaurant_name
HAVING COUNT(f.food_id) >= 3;

--5
SELECT r.restaurant_name  , AVG(f.price) AS AVG_PRICE 
FROM Restaurants r
LEFT JOIN FoodItems f
ON r.restaurant_id = f.restaurant_id
GROUP BY r.restaurant_name;ame;
