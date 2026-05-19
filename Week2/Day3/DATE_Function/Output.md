**Query #1**

    SELECT CURDATE() , CURRENT_DATE() , CURTIME() , CURRENT_TIME() , NOW() , CURRENT_TIMESTAMP();

| CURDATE()  | CURRENT_DATE() | CURTIME() | CURRENT_TIME() | NOW()               | CURRENT_TIMESTAMP() |
| ---------- | -------------- | --------- | -------------- | ------------------- | ------------------- |
| 2026-05-17 | 2026-05-17     | 18:26:42  | 18:26:42       | 2026-05-17 18:26:42 | 2026-05-17 18:26:42 |

---
**Query #2**

    SELECT 
    YEAR(ORDER_DATE) , MONTH(ORDER_DATE) , DAY(ORDER_DATE)
    FROM orders;

| YEAR(ORDER_DATE) | MONTH(ORDER_DATE) | DAY(ORDER_DATE) |
| ---------------- | ----------------- | --------------- |
| 2024             | 1                 | 15              |
| 2024             | 2                 | 18              |
| 2024             | 3                 | 2               |
| 2024             | 3                 | 9               |
| 2024             | 1                 | 7               |

---
**Query #3**

    SELECT 
    EXTRACT( YEAR FROM ORDER_DATE),
    EXTRACT(MONTH FROM ORDER_DATE)
    FROM orders;

| EXTRACT( YEAR FROM ORDER_DATE) | EXTRACT(MONTH FROM ORDER_DATE) |
| ------------------------------ | ------------------------------ |
| 2024                           | 1                              |
| 2024                           | 2                              |
| 2024                           | 3                              |
| 2024                           | 3                              |
| 2024                           | 1                              |

---
**Query #4**

    SELECT MONTHNAME(ORDER_DATE) ,
    DAYNAME(ORDER_DATE) 
    FROM orders;

| MONTHNAME(ORDER_DATE) | DAYNAME(ORDER_DATE) |
| --------------------- | ------------------- |
| January               | Monday              |
| February              | Sunday              |
| March                 | Saturday            |
| March                 | Saturday            |
| January               | Sunday              |

---
**Query #5**

    SELECT DAYNAME(ORDER_DATE) ,WEEKDAY(ORDER_DATE) ,
    DAYOFWEEK(ORDER_DATE)
    FROM orders;

| DAYNAME(ORDER_DATE) | WEEKDAY(ORDER_DATE) | DAYOFWEEK(ORDER_DATE) |
| ------------------- | ------------------- | --------------------- |
| Monday              | 0                   | 2                     |
| Sunday              | 6                   | 1                     |
| Saturday            | 5                   | 7                     |
| Saturday            | 5                   | 7                     |
| Sunday              | 6                   | 1                     |

---
**Query #6**

    SELECT ORDER_ID , ORDER_DATE ,DAYNAME(ORDER_DATE) AS Day
    FROM orders
    WHERE DAYNAME(ORDER_DATE) IN ('Saturday' , 'Sunday');

| ORDER_ID | ORDER_DATE | Day      |
| -------- | ---------- | -------- |
| 2        | 2024-02-18 | Sunday   |
| 3        | 2024-03-02 | Saturday |
| 4        | 2024-03-09 | Saturday |
| 5        | 2024-01-07 | Sunday   |

---
**Query #7**

    SELECT ORDER_ID , ORDER_DATE ,DAYNAME(ORDER_DATE) AS Day
    FROM orders
    WHERE DAYOFWEEK(ORDER_DATE) BETWEEN 2 AND 6;

| ORDER_ID | ORDER_DATE | Day    |
| -------- | ---------- | ------ |
| 1        | 2024-01-15 | Monday |

---
**Query #8**

    SELECT DATE_ADD(ORDER_DATE , INTERVAL 5 DAY) AS DATE_ADDED,
    DATE_SUB(ORDER_DATE , INTERVAL 1 YEAR) YEAR_SUBTRACTED,
    DATE_ADD(ORDER_DATE , INTERVAL 3 MONTH) AS MONTH_ADDED
    FROM orders;

| DATE_ADDED | YEAR_SUBTRACTED | MONTH_ADDED |
| ---------- | --------------- | ----------- |
| 2024-01-20 | 2023-01-15      | 2024-04-15  |
| 2024-02-23 | 2023-02-18      | 2024-05-18  |
| 2024-03-07 | 2023-03-02      | 2024-06-02  |
| 2024-03-14 | 2023-03-09      | 2024-06-09  |
| 2024-01-12 | 2023-01-07      | 2024-04-07  |

---
**Query #9**

    SELECT DATEDIFF(DELIVERY_DATE ,ORDER_DATE) AS DELIVERY_DAYS
    FROM orders;

| DELIVERY_DAYS |
| ------------- |
| 5             |
| 4             |
| 6             |
| 6             |
| 5             |

---
**Query #10**

    SELECT TIMESTAMPDIFF(MONTH , ORDER_DATE , DELIVERY_DATE ) AS MONTHS_DIFF ,
    TIMESTAMPDIFF(DAY , ORDER_DATE , DELIVERY_DATE ) AS DAYS_DIFF
    FROM orders;

| MONTHS_DIFF | DAYS_DIFF |
| ----------- | --------- |
| 0           | 5         |
| 0           | 4         |
| 0           | 6         |
| 0           | 6         |
| 0           | 5         |

---
**Query #11**

    SELECT DATE_SUB(ORDER_DATE , INTERVAL DAY(ORDER_DATE) -1 DAY) AS FIRST_DAY 
    FROM orders;

| FIRST_DAY  |
| ---------- |
| 2024-01-01 |
| 2024-02-01 |
| 2024-03-01 |
| 2024-03-01 |
| 2024-01-01 |

---
**Query #12**

    SELECT LAST_DAY(ORDER_DATE) FROM orders;

| LAST_DAY(ORDER_DATE) |
| -------------------- |
| 2024-01-31           |
| 2024-02-29           |
| 2024-03-31           |
| 2024-03-31           |
| 2024-01-31           |

---
**Query #13**

    SELECT DATE_FORMAT(ORDER_DATE , '%d-%m-%Y') FROM orders;

| DATE_FORMAT(ORDER_DATE , '%d-%m-%Y') |
| ------------------------------------ |
| 15-01-2024                           |
| 18-02-2024                           |
| 02-03-2024                           |
| 09-03-2024                           |
| 07-01-2024                           |

---
**Query #14**

    SELECT STR_TO_DATE('15-01-2024' , '%d-%m-%Y');

| STR_TO_DATE('15-01-2024' , '%d-%m-%Y') |
| -------------------------------------- |
| 2024-01-15                             |

---
**Query #15**

    SELECT DATE_FORMAT(ORDER_DATE , '%d-%m-%Y %H:%i:%s')
    FROM orders;

| DATE_FORMAT(ORDER_DATE , '%d-%m-%Y %H:%i:%s') |
| --------------------------------------------- |
| 15-01-2024 00:00:00                           |
| 18-02-2024 00:00:00                           |
| 02-03-2024 00:00:00                           |
| 09-03-2024 00:00:00                           |
| 07-01-2024 00:00:00                           |

---
**Query #16**

    SELECT order_date ,
    CASE 
    WHEN MONTH(ORDER_DATE) >=4
    THEN CONCAT(
      YEAR(ORDER_DATE),'-' ,YEAR(ORDER_DATE)+1
    ) 
    ELSE CONCAT(YEAR(ORDER_DATE)-1 , '-' ,YEAR(ORDER_DATE))
    END AS FINANCIAL_YEAR
    FROM orders;

| order_date | FINANCIAL_YEAR |
| ---------- | -------------- |
| 2024-01-15 | 2023-2024      |
| 2024-02-18 | 2023-2024      |
| 2024-03-02 | 2023-2024      |
| 2024-03-09 | 2023-2024      |
| 2024-01-07 | 2023-2024      |

---

[View on DB Fiddle](https://www.db-fiddle.com/f/eSnxh3Wzd51GpaoxWrkZaL/5)
