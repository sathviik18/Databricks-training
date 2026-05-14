    SHOW TABLES ;

| Tables_in_test |
| -------------- |
| customers      |
| employees      |
| orders         |

---

    SELECT * FROM customers;

| customer_id | customer_name   | city     |
| ----------- | --------------- | -------- |
| 1           | Acme Corp       | New York |
| 2           | Tech Solutions  | Chicago  |
| 3           | Global Retail   | Dallas   |
| 4           | Blue Sky Ltd    | Seattle  |
| 5           | NextGen Systems | Boston   |

---

    SELECT * FROM employees;

| employee_id | employee_name | department | manager_id | salary  | hire_date  |
| ----------- | ------------- | ---------- | ---------- | ------- | ---------- |
| 1           | Alice Johnson | Sales      |            | 70000.0 | 2020-01-15 |
| 2           | Bob Smith     | Sales      | 1          | 65000.0 | 2021-03-20 |
| 3           | Charlie Brown | IT         |            | 90000.0 | 2019-07-01 |
| 4           | Diana Prince  | IT         | 3          | 95000.0 | 2018-11-11 |
| 5           | Ethan Hunt    | HR         |            | 60000.0 | 2022-02-10 |
| 6           | Fiona Green   | HR         | 5          | 58000.0 | 2023-05-12 |
| 7           | George Miller | Finance    |            | 85000.0 | 2017-09-18 |
| 8           | Hannah Lee    | Finance    | 7          | 82000.0 | 2021-08-30 |

---

    SELECT * FROM orders;

| order_id | customer_id | employee_id | order_date | total_amount |
| -------- | ----------- | ----------- | ---------- | ------------ |
| 101      | 1           | 1           | 2024-01-10 | 500.0        |
| 102      | 2           | 2           | 2024-01-11 | 700.0        |
| 103      | 1           | 1           | 2024-01-15 | 1200.0       |
| 104      | 3           | 3           | 2024-01-18 | 300.0        |
| 105      | 4           | 4           | 2024-01-20 | 900.0        |
| 106      | 5           | 2           | 2024-01-25 | 1500.0       |
| 107      | 2           | 1           | 2024-02-01 | 650.0        |
| 108      | 1           | 3           | 2024-02-05 | 1100.0       |
| 109      | 3           | 4           | 2024-02-10 | 400.0        |
| 110      | 4           | 2           | 2024-02-15 | 950.0        |
| 111      | 5           | 1           | 2024-02-20 | 2000.0       |
| 112      | 1           | 4           | 2024-02-25 | 750.0        |

---
**Query #01**

    SELECT employee_id , employee_name , salary , ROW_NUMBER() OVER (ORDER BY salary DESC) AS row_num
    FROM employees ;

| employee_id | employee_name | salary  | row_num |
| ----------- | ------------- | ------- | ------- |
| 4           | Diana Prince  | 95000.0 | 1       |
| 3           | Charlie Brown | 90000.0 | 2       |
| 7           | George Miller | 85000.0 | 3       |
| 8           | Hannah Lee    | 82000.0 | 4       |
| 1           | Alice Johnson | 70000.0 | 5       |
| 2           | Bob Smith     | 65000.0 | 6       |
| 5           | Ethan Hunt    | 60000.0 | 7       |
| 6           | Fiona Green   | 58000.0 | 8       |

---
**Query #02**

    SELECT employee_id , employee_name , salary , RANK() OVER (ORDER BY salary DESC) AS rank_num
    FROM employees;

| employee_id | employee_name | salary  | rank_num |
| ----------- | ------------- | ------- | -------- |
| 4           | Diana Prince  | 95000.0 | 1        |
| 3           | Charlie Brown | 90000.0 | 2        |
| 7           | George Miller | 85000.0 | 3        |
| 8           | Hannah Lee    | 82000.0 | 4        |
| 1           | Alice Johnson | 70000.0 | 5        |
| 2           | Bob Smith     | 65000.0 | 6        |
| 5           | Ethan Hunt    | 60000.0 | 7        |
| 6           | Fiona Green   | 58000.0 | 8        |

---
**Query #03**

    SELECT employee_id , employee_name , salary ,DENSE_RANK() OVER (
      ORDER BY salary DESC) AS rank_by_salary 
      FROM employees;

| employee_id | employee_name | salary  | rank_by_salary |
| ----------- | ------------- | ------- | -------------- |
| 4           | Diana Prince  | 95000.0 | 1              |
| 3           | Charlie Brown | 90000.0 | 2              |
| 7           | George Miller | 85000.0 | 3              |
| 8           | Hannah Lee    | 82000.0 | 4              |
| 1           | Alice Johnson | 70000.0 | 5              |
| 2           | Bob Smith     | 65000.0 | 6              |
| 5           | Ethan Hunt    | 60000.0 | 7              |
| 6           | Fiona Green   | 58000.0 | 8              |

---
**Query #04**

    SELECT * FROM (
      SELECT EMPLOYEE_ID , EMPLOYEE_NAME , SALARY , ROW_NUMBER() OVER(ORDER BY SALARY DESC) AS TOP3_HIGHEST_PAID 
      FROM employees ) t
      WHERE TOP3_HIGHEST_PAID <= 3;

| EMPLOYEE_ID | EMPLOYEE_NAME | SALARY  | TOP3_HIGHEST_PAID |
| ----------- | ------------- | ------- | ----------------- |
| 4           | Diana Prince  | 95000.0 | 1                 |
| 3           | Charlie Brown | 90000.0 | 2                 |
| 7           | George Miller | 85000.0 | 3                 |

---
**Query #05**

    SELECT EMPLOYEE_ID , EMPLOYEE_NAME , DEPARTMENT ,SALARY , RANK() OVER(PARTITION BY DEPARTMENT ORDER BY SALARY DESC) AS RANKING 
    FROM employees;

| EMPLOYEE_ID | EMPLOYEE_NAME | DEPARTMENT | SALARY  | RANKING |
| ----------- | ------------- | ---------- | ------- | ------- |
| 7           | George Miller | Finance    | 85000.0 | 1       |
| 8           | Hannah Lee    | Finance    | 82000.0 | 2       |
| 5           | Ethan Hunt    | HR         | 60000.0 | 1       |
| 6           | Fiona Green   | HR         | 58000.0 | 2       |
| 4           | Diana Prince  | IT         | 95000.0 | 1       |
| 3           | Charlie Brown | IT         | 90000.0 | 2       |
| 1           | Alice Johnson | Sales      | 70000.0 | 1       |
| 2           | Bob Smith     | Sales      | 65000.0 | 2       |

---
**Query #06**

    SELECT * FROM (
      SELECT DEPARTMENT , SALARY , RANK() OVER (PARTITION BY DEPARTMENT ORDER BY SALARY DESC ) AS RANKING
    FROM employees )t
      WHERE RANKING = 1;

| DEPARTMENT | SALARY  | RANKING |
| ---------- | ------- | ------- |
| Finance    | 85000.0 | 1       |
| HR         | 60000.0 | 1       |
| IT         | 95000.0 | 1       |
| Sales      | 70000.0 | 1       |

---
**Query #07**

    SELECT ORDER_ID , ORDER_DATE , TOTAL_AMOUNT , SUM(TOTAL_AMOUNT) OVER(ORDER BY ORDER_ID , ORDER_DATE) AS RUNNING_TOTAL 
    FROM orders;

| ORDER_ID | ORDER_DATE | TOTAL_AMOUNT | RUNNING_TOTAL |
| -------- | ---------- | ------------ | ------------- |
| 101      | 2024-01-10 | 500.0        | 500.0         |
| 102      | 2024-01-11 | 700.0        | 1200.0        |
| 103      | 2024-01-15 | 1200.0       | 2400.0        |
| 104      | 2024-01-18 | 300.0        | 2700.0        |
| 105      | 2024-01-20 | 900.0        | 3600.0        |
| 106      | 2024-01-25 | 1500.0       | 5100.0        |
| 107      | 2024-02-01 | 650.0        | 5750.0        |
| 108      | 2024-02-05 | 1100.0       | 6850.0        |
| 109      | 2024-02-10 | 400.0        | 7250.0        |
| 110      | 2024-02-15 | 950.0        | 8200.0        |
| 111      | 2024-02-20 | 2000.0       | 10200.0       |
| 112      | 2024-02-25 | 750.0        | 10950.0       |

---
**Query #08**

    SELECT o.employee_id , e.employee_name , o.order_id , o.total_amount , SUM(o.total_amount) OVER (PARTITION BY o.employee_id ORDER BY o.order_id , o.order_date) AS CUMMULATIVE_SALES
    FROM orders o 
    JOIN employees e ON o.employee_id = e.employee_id;

| employee_id | employee_name | order_id | total_amount | CUMMULATIVE_SALES |
| ----------- | ------------- | -------- | ------------ | ----------------- |
| 1           | Alice Johnson | 101      | 500.0        | 500.0             |
| 1           | Alice Johnson | 103      | 1200.0       | 1700.0            |
| 1           | Alice Johnson | 107      | 650.0        | 2350.0            |
| 1           | Alice Johnson | 111      | 2000.0       | 4350.0            |
| 2           | Bob Smith     | 102      | 700.0        | 700.0             |
| 2           | Bob Smith     | 106      | 1500.0       | 2200.0            |
| 2           | Bob Smith     | 110      | 950.0        | 3150.0            |
| 3           | Charlie Brown | 104      | 300.0        | 300.0             |
| 3           | Charlie Brown | 108      | 1100.0       | 1400.0            |
| 4           | Diana Prince  | 105      | 900.0        | 900.0             |
| 4           | Diana Prince  | 109      | 400.0        | 1300.0            |
| 4           | Diana Prince  | 112      | 750.0        | 2050.0            |

---
**Query #09**

    SELECT o.customer_id , c.customer_name , o.order_id  , SUM(o.total_amount) OVER (PARTITION BY o.customer_id ORDER BY o.order_date , o.order_id ) AS TOTAL_AMOUNT_SO_FAR , LAG(o.total_amount) OVER (PARTITION BY o.customer_id ORDER BY ORDER_DATE , ORDER_ID ) AS PREVIOUS_ORDER_AMOUNT
    FROM orders o 
    JOIN customers c ON o.customer_id = c.customer_id;

| customer_id | customer_name   | order_id | TOTAL_AMOUNT_SO_FAR | PREVIOUS_ORDER_AMOUNT |
| ----------- | --------------- | -------- | ------------------- | --------------------- |
| 1           | Acme Corp       | 101      | 500.0               |                       |
| 1           | Acme Corp       | 103      | 1700.0              | 500.0                 |
| 1           | Acme Corp       | 108      | 2800.0              | 1200.0                |
| 1           | Acme Corp       | 112      | 3550.0              | 1100.0                |
| 2           | Tech Solutions  | 102      | 700.0               |                       |
| 2           | Tech Solutions  | 107      | 1350.0              | 700.0                 |
| 3           | Global Retail   | 104      | 300.0               |                       |
| 3           | Global Retail   | 109      | 700.0               | 300.0                 |
| 4           | Blue Sky Ltd    | 105      | 900.0               |                       |
| 4           | Blue Sky Ltd    | 110      | 1850.0              | 900.0                 |
| 5           | NextGen Systems | 106      | 1500.0              |                       |
| 5           | NextGen Systems | 111      | 3500.0              | 1500.0                |

---
**Query #10**

    SELECT o.customer_id , c.customer_name , o.order_id  , SUM(o.total_amount) OVER (PARTITION BY o.customer_id ORDER BY o.order_date , o.order_id ) AS TOTAL_AMOUNT_SO_FAR , LEAD(o.total_amount) OVER (PARTITION BY o.customer_id ORDER BY ORDER_DATE , ORDER_ID ) AS NEXT_ORDER_AMOUNT
    FROM orders o 
    JOIN customers c ON o.customer_id = c.customer_id;

| customer_id | customer_name   | order_id | TOTAL_AMOUNT_SO_FAR | NEXT_ORDER_AMOUNT |
| ----------- | --------------- | -------- | ------------------- | ----------------- |
| 1           | Acme Corp       | 101      | 500.0               | 1200.0            |
| 1           | Acme Corp       | 103      | 1700.0              | 1100.0            |
| 1           | Acme Corp       | 108      | 2800.0              | 750.0             |
| 1           | Acme Corp       | 112      | 3550.0              |                   |
| 2           | Tech Solutions  | 102      | 700.0               | 650.0             |
| 2           | Tech Solutions  | 107      | 1350.0              |                   |
| 3           | Global Retail   | 104      | 300.0               | 400.0             |
| 3           | Global Retail   | 109      | 700.0               |                   |
| 4           | Blue Sky Ltd    | 105      | 900.0               | 950.0             |
| 4           | Blue Sky Ltd    | 110      | 1850.0              |                   |
| 5           | NextGen Systems | 106      | 1500.0              | 2000.0            |
| 5           | NextGen Systems | 111      | 3500.0              |                   |

---
**Query #11**

    SELECT order_id , order_date , total_amount , LAG(total_amount) OVER (ORDER BY order_date , order_id) AS PREVIOUS_ORDER_AMOUNT , total_amount - LAG(total_amount) OVER (ORDER BY order_date , order_id) AS DIFFERENCE_BTW_CURRENT_AND_PREVIOUS_ORDER
    FROM orders;

| order_id | order_date | total_amount | PREVIOUS_ORDER_AMOUNT | DIFFERENCE_BTW_CURRENT_AND_PREVIOUS_ORDER |
| -------- | ---------- | ------------ | --------------------- | ----------------------------------------- |
| 101      | 2024-01-10 | 500.0        |                       |                                           |
| 102      | 2024-01-11 | 700.0        | 500.0                 | 200.0                                     |
| 103      | 2024-01-15 | 1200.0       | 700.0                 | 500.0                                     |
| 104      | 2024-01-18 | 300.0        | 1200.0                | -900.0                                    |
| 105      | 2024-01-20 | 900.0        | 300.0                 | 600.0                                     |
| 106      | 2024-01-25 | 1500.0       | 900.0                 | 600.0                                     |
| 107      | 2024-02-01 | 650.0        | 1500.0                | -850.0                                    |
| 108      | 2024-02-05 | 1100.0       | 650.0                 | 450.0                                     |
| 109      | 2024-02-10 | 400.0        | 1100.0                | -700.0                                    |
| 110      | 2024-02-15 | 950.0        | 400.0                 | 550.0                                     |
| 111      | 2024-02-20 | 2000.0       | 950.0                 | 1050.0                                    |
| 112      | 2024-02-25 | 750.0        | 2000.0                | -1250.0                                   |

---
