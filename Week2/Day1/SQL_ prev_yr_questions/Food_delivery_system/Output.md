    SHOW TABLES;

| Tables_in_test |
| -------------- |
| Customers      |
| FoodItems      |
| Orders         |
| Restaurants    |

---

    SELECT * FROM Customers;

| customer_id | customer_name   | address      | phone_no   | email_id         |
| ----------- | --------------- | ------------ | ---------- | ---------------- |
| CU1         | Alice Brown     | Chicago Ave  | 9876543210 | alice@cust.com   |
| CU2         | Bob Smith       | Houston Road | 9876543211 | bob@cust.com     |
| CU3         | Charlie Johnson | Miami Blvd   | 9876543212 | charlie@cust.com |

---

    SELECT * FROM FoodItems;

| food_id | food_name        | price | restaurant_id |
| ------- | ---------------- | ----- | ------------- |
| F1      | Margherita Pizza | 12.5  | R1            |
| F2      | Pepperoni Pizza  | 15    | R1            |
| F3      | Cheeseburger     | 10    | R2            |
| F4      | Veggie Burger    | 9     | R2            |
| F5      | Chicken Curry    | 13    | R3            |
| F6      | Paneer Curry     | 11    | R3            |
| F7      | Naan Bread       | 3     | R3            |

---

    SELECT * FROM Orders;

| order_id | customer_id | food_id | order_date | quantity | total_amount |
| -------- | ----------- | ------- | ---------- | -------- | ------------ |
| O1       | CU1         | F1      | 2026-05-10 | 2        | 25           |
| O2       | CU2         | F3      | 2026-05-11 | 1        | 10           |
| O3       | CU1         | F5      | 2026-05-12 | 3        | 39           |
| O4       | CU3         | F2      | 2026-05-12 | 1        | 15           |
| O5       | CU2         | F4      | 2026-05-13 | 2        | 18           |

---

    SELECT * FROM Restaurants;

| restaurant_id | restaurant_name | location    | phone_no   | email_id        |
| ------------- | --------------- | ----------- | ---------- | --------------- |
| R1            | Pizza Palace    | New York    | 9876543213 | pizza@rest.com  |
| R2            | Burger Hub      | Los Angeles | 9876543214 | burger@rest.com |
| R3            | Curry House     | Chicago     | 9876543215 | curry@rest.com  |

---
**Query #1**

    SELECT r.restaurant_name , f.food_name
    FROM Restaurants r 
    LEFT JOIN FoodItems f 
    ON r.restaurant_id = f.restaurant_id;

| restaurant_name | food_name        |
| --------------- | ---------------- |
| Pizza Palace    | Margherita Pizza |
| Pizza Palace    | Pepperoni Pizza  |
| Burger Hub      | Cheeseburger     |
| Burger Hub      | Veggie Burger    |
| Curry House     | Chicken Curry    |
| Curry House     | Paneer Curry     |
| Curry House     | Naan Bread       |

---
**Query #2**

    SELECT o.order_id , c.customer_id , f.food_name , o.quantity , o.total_amount 
    FROM Orders o
    LEFT JOIN Customers c 
    ON o.customer_id = c.customer_id 
    LEFT JOIN FoodItems f
    ON o.food_id = f.food_id;

| order_id | customer_id | food_name        | quantity | total_amount |
| -------- | ----------- | ---------------- | -------- | ------------ |
| O1       | CU1         | Margherita Pizza | 2        | 25           |
| O2       | CU2         | Cheeseburger     | 1        | 10           |
| O3       | CU1         | Chicken Curry    | 3        | 39           |
| O4       | CU3         | Pepperoni Pizza  | 1        | 15           |
| O5       | CU2         | Veggie Burger    | 2        | 18           |

---
**Query #3**

    SELECT c.customer_name , SUM(o.total_amount) AS total_spent 
    FROM Customers c
    LEFT JOIN Orders o 
    ON c.customer_id = o.customer_id 
    GROUP BY c.customer_name;

| customer_name   | total_spent |
| --------------- | ----------- |
| Alice Brown     | 64          |
| Bob Smith       | 28          |
| Charlie Johnson | 15          |

---
**Query #4**

    SELECT r.restaurant_name , COUNT(f.food_id) AS FOODITEMS
    FROM Restaurants r
    LEFT JOIN FoodItems f
    ON r.restaurant_id = f.restaurant_id
    GROUP BY r.restaurant_name
    HAVING COUNT(f.food_id) >= 3;

| restaurant_name | FOODITEMS |
| --------------- | --------- |
| Curry House     | 3         |

---
**Query #5**

    SELECT r.restaurant_name  , AVG(f.price) AS AVG_PRICE 
    FROM Restaurants r
    LEFT JOIN FoodItems f
    ON r.restaurant_id = f.restaurant_id
    GROUP BY r.restaurant_name;

| restaurant_name | AVG_PRICE |
| --------------- | --------- |
| Pizza Palace    | 13.75     |
| Burger Hub      | 9.5       |
| Curry House     | 9         |

---
