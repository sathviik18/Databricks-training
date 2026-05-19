    SHOW TABLES;

| Tables_in_test |
| -------------- |
| Employees      |
| Orders         |
| Products       |

---

    SELECT * FROM Employees;

| emp_id | name  | salary | bonus | manager_id |
| ------ | ----- | ------ | ----- | ---------- |
| 1      | Amit  | 50000  |       | 101        |
| 2      | John  |        | 5000  | 102        |
| 3      | Sara  | 60000  |       |            |
| 4      | David |        |       | 103        |
| 5      | Priya | 45000  | 3000  | 101        |
| 6      | Kiran |        |       |            |
| 7      | Ravi  | 70000  | 7000  | 102        |
| 8      | Neha  |        | 2000  |            |

---

    SELECT * FROM Orders;

| order_id | customer_name | amount | discount | coupon_code |
| -------- | ------------- | ------ | -------- | ----------- |
| 101      | Amit          | 1000   |          | DISC10      |
| 102      | John          |        | 50       |             |
| 103      | Sara          | 2000   |          | DISC20      |
| 104      | David         |        |          |             |
| 105      | Priya         | 1500   | 100      |             |
| 106      | Kiran         |        |          | DISC5       |
| 107      | Ravi          | 3000   |          |             |
| 108      | Neha          |        | 200      | DISC15      |

---

    SELECT * FROM Products;

| product_id | product_name | price | category    | stock |
| ---------- | ------------ | ----- | ----------- | ----- |
| 1          | Laptop       | 50000 | Electronics | 10    |
| 2          | Phone        |       | Electronics |       |
| 3          | Tablet       | 30000 |             | 5     |
| 4          | Headphones   |       |             |       |
| 5          | Monitor      | 20000 | Electronics | 0     |
| 6          | Keyboard     |       | Accessories | 15    |
| 7          | Mouse        | 500   |             |       |
| 8          | Printer      |       | Electronics | 3     |

---

**Query #1**

    SELECT * FROM Employees
    WHERE salary IS NULL;

| emp_id | name  | salary | bonus | manager_id |
| ------ | ----- | ------ | ----- | ---------- |
| 2      | John  |        | 5000  | 102        |
| 4      | David |        |       | 103        |
| 6      | Kiran |        |       |            |
| 8      | Neha  |        | 2000  |            |

---
**Query #2**

    SELECT * FROM Employees 
    WHERE bonus IS NOT NULL;

| emp_id | name  | salary | bonus | manager_id |
| ------ | ----- | ------ | ----- | ---------- |
| 2      | John  |        | 5000  | 102        |
| 5      | Priya | 45000  | 3000  | 101        |
| 7      | Ravi  | 70000  | 7000  | 102        |
| 8      | Neha  |        | 2000  |            |

---
**Query #3**

    SELECT COUNT(*) AS NO_MANAGER 
    FROM Employees 
    WHERE MANAGER_ID IS NULL;

| NO_MANAGER |
| ---------- |
| 3          |

---
**Query #4**

    SELECT * FROM Employees
    WHERE SALARY IS NULL AND BONUS IS NULL;

| emp_id | name  | salary | bonus | manager_id |
| ------ | ----- | ------ | ----- | ---------- |
| 4      | David |        |       | 103        |
| 6      | Kiran |        |       |            |

---
**Query #5**

    SELECT * FROM Employees
    WHERE SALARY IS NULL AND MANAGER_ID IS NOT NULL;

| emp_id | name  | salary | bonus | manager_id |
| ------ | ----- | ------ | ----- | ---------- |
| 2      | John  |        | 5000  | 102        |
| 4      | David |        |       | 103        |

---
**Query #6**

    SELECT EMP_ID , NAME , IFNULL(SALARY,0) AS SALARY 
    FROM Employees;

| EMP_ID | NAME  | SALARY |
| ------ | ----- | ------ |
| 1      | Amit  | 50000  |
| 2      | John  | 0      |
| 3      | Sara  | 60000  |
| 4      | David | 0      |
| 5      | Priya | 45000  |
| 6      | Kiran | 0      |
| 7      | Ravi  | 70000  |
| 8      | Neha  | 0      |

---
**Query #7**

    SELECT EMP_ID , NAME , IFNULL(BONUS,1000) AS BONUS
    FROM Employees;

| EMP_ID | NAME  | BONUS |
| ------ | ----- | ----- |
| 1      | Amit  | 1000  |
| 2      | John  | 5000  |
| 3      | Sara  | 1000  |
| 4      | David | 1000  |
| 5      | Priya | 3000  |
| 6      | Kiran | 1000  |
| 7      | Ravi  | 7000  |
| 8      | Neha  | 2000  |

---
**Query #8**

    SELECT ORDER_ID , CUSTOMER_NAME , IFNULL(AMOUNT , 500) AS AMOUNT
    FROM Orders;

| ORDER_ID | CUSTOMER_NAME | AMOUNT |
| -------- | ------------- | ------ |
| 101      | Amit          | 1000   |
| 102      | John          | 500    |
| 103      | Sara          | 2000   |
| 104      | David         | 500    |
| 105      | Priya         | 1500   |
| 106      | Kiran         | 500    |
| 107      | Ravi          | 3000   |
| 108      | Neha          | 500    |

---
**Query #9**

    SELECT PRODUCT_ID , PRODUCT_NAME , IFNULL(STOCK , 0) AS STOCK
    FROM Products;

| PRODUCT_ID | PRODUCT_NAME | STOCK |
| ---------- | ------------ | ----- |
| 1          | Laptop       | 10    |
| 2          | Phone        | 0     |
| 3          | Tablet       | 5     |
| 4          | Headphones   | 0     |
| 5          | Monitor      | 0     |
| 6          | Keyboard     | 15    |
| 7          | Mouse        | 0     |
| 8          | Printer      | 3     |

---
**Query #10**

    SELECT EMP_ID , NAME , COALESCE(SALARY , BONUS) AS EARNINGS
    FROM Employees;

| EMP_ID | NAME  | EARNINGS |
| ------ | ----- | -------- |
| 1      | Amit  | 50000    |
| 2      | John  | 5000     |
| 3      | Sara  | 60000    |
| 4      | David |          |
| 5      | Priya | 45000    |
| 6      | Kiran |          |
| 7      | Ravi  | 70000    |
| 8      | Neha  | 2000     |

---
**Query #11**

    SELECT EMP_ID , NAME ,COALESCE(SALARY , BONUS , 0) AS INCOME
    FROM Employees;

| EMP_ID | NAME  | INCOME |
| ------ | ----- | ------ |
| 1      | Amit  | 50000  |
| 2      | John  | 5000   |
| 3      | Sara  | 60000  |
| 4      | David | 0      |
| 5      | Priya | 45000  |
| 6      | Kiran | 0      |
| 7      | Ravi  | 70000  |
| 8      | Neha  | 2000   |

---
**Query #12**

    SELECT PRODUCT_ID , PRODUCT_NAME , COALESCE(PRICE , 1000) AS PRICE 
    FROM Products;

| PRODUCT_ID | PRODUCT_NAME | PRICE |
| ---------- | ------------ | ----- |
| 1          | Laptop       | 50000 |
| 2          | Phone        | 1000  |
| 3          | Tablet       | 30000 |
| 4          | Headphones   | 1000  |
| 5          | Monitor      | 20000 |
| 6          | Keyboard     | 1000  |
| 7          | Mouse        | 500   |
| 8          | Printer      | 1000  |

---
**Query #13**

    SELECT ORDER_ID , CUSTOMER_NAME , COALESCE(AMOUNT , DISCOUNT , 0) AS PAYMENT
    FROM Orders;

| ORDER_ID | CUSTOMER_NAME | PAYMENT |
| -------- | ------------- | ------- |
| 101      | Amit          | 1000    |
| 102      | John          | 50      |
| 103      | Sara          | 2000    |
| 104      | David         | 0       |
| 105      | Priya         | 1500    |
| 106      | Kiran         | 0       |
| 107      | Ravi          | 3000    |
| 108      | Neha          | 200     |

---
**Query #14**

    SELECT emp_id , name ,NULLIF(SALARY , 0) AS SALARY 
    FROM Employees;

| emp_id | name  | SALARY |
| ------ | ----- | ------ |
| 1      | Amit  | 50000  |
| 2      | John  |        |
| 3      | Sara  | 60000  |
| 4      | David |        |
| 5      | Priya | 45000  |
| 6      | Kiran |        |
| 7      | Ravi  | 70000  |
| 8      | Neha  |        |

---
**Query #15**

    SELECT order_id , customer_name , NULLIF(DISCOUNT , 0) AS DISCOUNT 
    FROM Orders;

| order_id | customer_name | DISCOUNT |
| -------- | ------------- | -------- |
| 101      | Amit          |          |
| 102      | John          | 50       |
| 103      | Sara          |          |
| 104      | David         |          |
| 105      | Priya         | 100      |
| 106      | Kiran         |          |
| 107      | Ravi          |          |
| 108      | Neha          | 200      |

---
**Query #16**

    SELECT amount / NULLIF(discount , 0)
    FROM Orders;

| amount / NULLIF(discount , 0) |
| ----------------------------- |
|                               |
|                               |
|                               |
|                               |
| 15.0                          |
|                               |
|                               |
|                               |

---
**Query #17**

    SELECT ORDER_ID , CUSTOMER_NAME , NULLIF(COUPON_CODE , 'DISC10') AS COUPON_CODE
    FROM Orders;

| ORDER_ID | CUSTOMER_NAME | COUPON_CODE |
| -------- | ------------- | ----------- |
| 101      | Amit          |             |
| 102      | John          |             |
| 103      | Sara          | DISC20      |
| 104      | David         |             |
| 105      | Priya         |             |
| 106      | Kiran         | DISC5       |
| 107      | Ravi          |             |
| 108      | Neha          | DISC15      |

---
**Query #18**

    SELECT EMP_ID , NAME , COALESCE(SALARY,0) + COALESCE(BONUS , 0) AS EARNINGS
    FROM Employees;

| EMP_ID | NAME  | EARNINGS |
| ------ | ----- | -------- |
| 1      | Amit  | 50000    |
| 2      | John  | 5000     |
| 3      | Sara  | 60000    |
| 4      | David | 0        |
| 5      | Priya | 48000    |
| 6      | Kiran | 0        |
| 7      | Ravi  | 77000    |
| 8      | Neha  | 2000     |

---
**Query #19**

    SELECT * FROM Employees 
    WHERE SALARY IS NULL AND BONUS IS NULL;

| emp_id | name  | salary | bonus | manager_id |
| ------ | ----- | ------ | ----- | ---------- |
| 4      | David |        |       | 103        |
| 6      | Kiran |        |       |            |

---
**Query #20**

    SELECT *  FROM Products
    WHERE PRICE IS NULL AND CATEGORY IS NOT NULL;

| product_id | product_name | price | category    | stock |
| ---------- | ------------ | ----- | ----------- | ----- |
| 2          | Phone        |       | Electronics |       |
| 6          | Keyboard     |       | Accessories | 15    |
| 8          | Printer      |       | Electronics | 3     |

---
**Query #21**

    SELECT * FROM Orders
    WHERE AMOUNT IS NULL AND DISCOUNT IS NULL;

| order_id | customer_name | amount | discount | coupon_code |
| -------- | ------------- | ------ | -------- | ----------- |
| 104      | David         |        |          |             |
| 106      | Kiran         |        |          | DISC5       |

---
**Query #22**

    SELECT EMP_ID , NAME , COALESCE(SALARY , BONUS , 1000) AS INCOME 
    FROM Employees;

| EMP_ID | NAME  | INCOME |
| ------ | ----- | ------ |
| 1      | Amit  | 50000  |
| 2      | John  | 5000   |
| 3      | Sara  | 60000  |
| 4      | David | 1000   |
| 5      | Priya | 45000  |
| 6      | Kiran | 1000   |
| 7      | Ravi  | 70000  |
| 8      | Neha  | 2000   |

---
**Query #23**

    SELECT ORDER_ID , CUSTOMER_NAME , NULLIF(AMOUNT , 0) AS AMOUNT 
    FROM Orders;

| ORDER_ID | CUSTOMER_NAME | AMOUNT |
| -------- | ------------- | ------ |
| 101      | Amit          | 1000   |
| 102      | John          |        |
| 103      | Sara          | 2000   |
| 104      | David         |        |
| 105      | Priya         | 1500   |
| 106      | Kiran         |        |
| 107      | Ravi          | 3000   |
| 108      | Neha          |        |

---
**Query #24**

    SELECT order_id,ABS(
    COALESCE(amount, 0) - COALESCE(discount, 0) 
      )AS payable
    FROM Orders;

| order_id | payable |
| -------- | ------- |
| 101      | 1000    |
| 102      | 50      |
| 103      | 2000    |
| 104      | 0       |
| 105      | 1400    |
| 106      | 0       |
| 107      | 3000    |
| 108      | 200     |

---
**Query #25**

    SELECT * FROM Employees
    WHERE SALARY IS NULL AND MANAGER_ID IS NOT NULL;

| emp_id | name  | salary | bonus | manager_id |
| ------ | ----- | ------ | ----- | ---------- |
| 2      | John  |        | 5000  | 102        |
| 4      | David |        |       | 103        |

---
