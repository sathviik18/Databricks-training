    SHOW TABLES;

| Tables_in_test |
| -------------- |
| employees      |
| orders         |

---

    SELECT * FROM employees;

| emp_id | emp_name | department | salary | join_date  |
| ------ | -------- | ---------- | ------ | ---------- |
| 1      | Amit     | Chennai    | 2000   | 2023-01-01 |
| 2      | Ravi     | Hyderabad  | 1500   | 2023-01-02 |
| 3      | Sneha    | Chennai    | 3000   | 2023-01-03 |
| 4      | Kiran    | Bangalore  | 2500   | 2023-01-04 |
| 5      | Priya    | Chennai    | 2000   | 2023-01-05 |
| 6      | Arjun    | Hyderabad  | 1800   | 2023-01-06 |
| 7      | Neha     | Bangalore  | 2200   | 2023-01-07 |
| 8      | Vikas    | Chennai    | 3000   | 2023-01-08 |
| 9      | Anjali   | Hyderabad  | 1700   | 2023-01-09 |
| 10     | Rahul    | Bangalore  | 2600   | 2023-01-10 |
| 11     | Suresh   | Chennai    | 2800   | 2023-01-11 |
| 12     | Pooja    | Hyderabad  | 1600   | 2023-01-12 |
| 13     | Manoj    | Bangalore  | 2400   | 2023-01-13 |
| 14     | Divya    | Chennai    | 2100   | 2023-01-14 |
| 15     | Karthik  | Hyderabad  | 1900   | 2023-01-15 |
| 16     | Meena    | Bangalore  | 2300   | 2023-01-16 |
| 17     | Raj      | Chennai    | 2700   | 2023-01-17 |
| 18     | Simran   | Hyderabad  | 2000   | 2023-01-18 |
| 19     | Deepak   | Bangalore  | 2500   | 2023-01-19 |
| 20     | Nisha    | Chennai    | 2600   | 2023-01-20 |

---

    SELECT * FROM orders;

| order_id | name   | city      | amount | order_date |
| -------- | ------ | --------- | ------ | ---------- |
| 101      | Rahul  | Hyderabad | 2500   | 2026-05-10 |
| 102      | Ayesha | Mumbai    | 1800   | 2026-05-11 |
| 103      | Kiran  | Bangalore | 3200   | 2026-05-12 |
| 104      | Sneha  | Chennai   | 1500   | 2026-05-13 |
| 105      | Arjun  | Delhi     | 2750   | 2026-05-14 |
| 106      | Vikram | Hyderabad | 2100   | 2026-05-15 |
| 107      | Meera  | Chennai   | 1900   | 2026-05-16 |
| 108      | Rohit  | Mumbai    | 3000   | 2026-05-17 |
| 109      | Priya  | Bangalore | 2800   | 2026-05-18 |
| 110      | Sanjay | Delhi     | 3500   | 2026-05-19 |

---

**Query #1**

    SELECT EMP_ID , EMP_NAME ,
    SALARY ,
    ROW_NUMBER() OVER(ORDER BY SALARY DESC) AS ROW_NUM
    FROM employees;

| EMP_ID | EMP_NAME | SALARY | ROW_NUM |
| ------ | -------- | ------ | ------- |
| 3      | Sneha    | 3000   | 1       |
| 8      | Vikas    | 3000   | 2       |
| 11     | Suresh   | 2800   | 3       |
| 17     | Raj      | 2700   | 4       |
| 20     | Nisha    | 2600   | 5       |
| 10     | Rahul    | 2600   | 6       |
| 4      | Kiran    | 2500   | 7       |
| 19     | Deepak   | 2500   | 8       |
| 13     | Manoj    | 2400   | 9       |
| 16     | Meena    | 2300   | 10      |
| 7      | Neha     | 2200   | 11      |
| 14     | Divya    | 2100   | 12      |
| 5      | Priya    | 2000   | 13      |
| 18     | Simran   | 2000   | 14      |
| 1      | Amit     | 2000   | 15      |
| 15     | Karthik  | 1900   | 16      |
| 6      | Arjun    | 1800   | 17      |
| 9      | Anjali   | 1700   | 18      |
| 12     | Pooja    | 1600   | 19      |
| 2      | Ravi     | 1500   | 20      |

---
**Query #2**

    SELECT EMP_ID , EMP_NAME , DEPARTMENT , SALARY ,
    ROW_NUMBER() OVER(PARTITION BY DEPARTMENT ORDER BY SALARY DESC) AS ROW_NUM 
    FROM employees;

| EMP_ID | EMP_NAME | DEPARTMENT | SALARY | ROW_NUM |
| ------ | -------- | ---------- | ------ | ------- |
| 10     | Rahul    | Bangalore  | 2600   | 1       |
| 19     | Deepak   | Bangalore  | 2500   | 2       |
| 4      | Kiran    | Bangalore  | 2500   | 3       |
| 13     | Manoj    | Bangalore  | 2400   | 4       |
| 16     | Meena    | Bangalore  | 2300   | 5       |
| 7      | Neha     | Bangalore  | 2200   | 6       |
| 3      | Sneha    | Chennai    | 3000   | 1       |
| 8      | Vikas    | Chennai    | 3000   | 2       |
| 11     | Suresh   | Chennai    | 2800   | 3       |
| 17     | Raj      | Chennai    | 2700   | 4       |
| 20     | Nisha    | Chennai    | 2600   | 5       |
| 14     | Divya    | Chennai    | 2100   | 6       |
| 5      | Priya    | Chennai    | 2000   | 7       |
| 1      | Amit     | Chennai    | 2000   | 8       |
| 18     | Simran   | Hyderabad  | 2000   | 1       |
| 15     | Karthik  | Hyderabad  | 1900   | 2       |
| 6      | Arjun    | Hyderabad  | 1800   | 3       |
| 9      | Anjali   | Hyderabad  | 1700   | 4       |
| 12     | Pooja    | Hyderabad  | 1600   | 5       |
| 2      | Ravi     | Hyderabad  | 1500   | 6       |

---
**Query #3**

    SELECT EMP_NAME , JOIN_DATE ,
    ROW_NUMBER() OVER(ORDER BY JOIN_DATE DESC) AS ROW_NUM
    FROM employees;

| EMP_NAME | JOIN_DATE  | ROW_NUM |
| -------- | ---------- | ------- |
| Nisha    | 2023-01-20 | 1       |
| Deepak   | 2023-01-19 | 2       |
| Simran   | 2023-01-18 | 3       |
| Raj      | 2023-01-17 | 4       |
| Meena    | 2023-01-16 | 5       |
| Karthik  | 2023-01-15 | 6       |
| Divya    | 2023-01-14 | 7       |
| Manoj    | 2023-01-13 | 8       |
| Pooja    | 2023-01-12 | 9       |
| Suresh   | 2023-01-11 | 10      |
| Rahul    | 2023-01-10 | 11      |
| Anjali   | 2023-01-09 | 12      |
| Vikas    | 2023-01-08 | 13      |
| Neha     | 2023-01-07 | 14      |
| Arjun    | 2023-01-06 | 15      |
| Priya    | 2023-01-05 | 16      |
| Kiran    | 2023-01-04 | 17      |
| Sneha    | 2023-01-03 | 18      |
| Ravi     | 2023-01-02 | 19      |
| Amit     | 2023-01-01 | 20      |

---
**Query #4**

    SELECT EMP_NAME , DEPARTMENT , JOIN_DATE ,
    ROW_NUMBER() OVER(PARTITION BY DEPARTMENT ORDER BY JOIN_DATE ASC) AS ROW_NUM
    FROM employees;

| EMP_NAME | DEPARTMENT | JOIN_DATE  | ROW_NUM |
| -------- | ---------- | ---------- | ------- |
| Kiran    | Bangalore  | 2023-01-04 | 1       |
| Neha     | Bangalore  | 2023-01-07 | 2       |
| Rahul    | Bangalore  | 2023-01-10 | 3       |
| Manoj    | Bangalore  | 2023-01-13 | 4       |
| Meena    | Bangalore  | 2023-01-16 | 5       |
| Deepak   | Bangalore  | 2023-01-19 | 6       |
| Amit     | Chennai    | 2023-01-01 | 1       |
| Sneha    | Chennai    | 2023-01-03 | 2       |
| Priya    | Chennai    | 2023-01-05 | 3       |
| Vikas    | Chennai    | 2023-01-08 | 4       |
| Suresh   | Chennai    | 2023-01-11 | 5       |
| Divya    | Chennai    | 2023-01-14 | 6       |
| Raj      | Chennai    | 2023-01-17 | 7       |
| Nisha    | Chennai    | 2023-01-20 | 8       |
| Ravi     | Hyderabad  | 2023-01-02 | 1       |
| Arjun    | Hyderabad  | 2023-01-06 | 2       |
| Anjali   | Hyderabad  | 2023-01-09 | 3       |
| Pooja    | Hyderabad  | 2023-01-12 | 4       |
| Karthik  | Hyderabad  | 2023-01-15 | 5       |
| Simran   | Hyderabad  | 2023-01-18 | 6       |

---
**Query #5**

    SELECT  ORDER_ID , ORDER_DATE ,
    ROW_NUMBER() OVER(ORDER BY ORDER_DATE DESC) AS ROW_NUM
    FROM orders;

| ORDER_ID | ORDER_DATE | ROW_NUM |
| -------- | ---------- | ------- |
| 110      | 2026-05-19 | 1       |
| 109      | 2026-05-18 | 2       |
| 108      | 2026-05-17 | 3       |
| 107      | 2026-05-16 | 4       |
| 106      | 2026-05-15 | 5       |
| 105      | 2026-05-14 | 6       |
| 104      | 2026-05-13 | 7       |
| 103      | 2026-05-12 | 8       |
| 102      | 2026-05-11 | 9       |
| 101      | 2026-05-10 | 10      |

---
**Query #6**

    SELECT ORDER_ID, CITY , AMOUNT ,
    ROW_NUMBER() OVER(PARTITION BY CITY ORDER BY AMOUNT DESC) AS ROW_NUM
    FROM orders;

| ORDER_ID | CITY      | AMOUNT | ROW_NUM |
| -------- | --------- | ------ | ------- |
| 103      | Bangalore | 3200   | 1       |
| 109      | Bangalore | 2800   | 2       |
| 107      | Chennai   | 1900   | 1       |
| 104      | Chennai   | 1500   | 2       |
| 110      | Delhi     | 3500   | 1       |
| 105      | Delhi     | 2750   | 2       |
| 101      | Hyderabad | 2500   | 1       |
| 106      | Hyderabad | 2100   | 2       |
| 108      | Mumbai    | 3000   | 1       |
| 102      | Mumbai    | 1800   | 2       |

---
**Query #7**

    SELECT EMP_NAME , SALARY , 
    ROW_NUMBER() OVER(ORDER BY SALARY ASC) AS ROW_NUM 
    FROM employees;

| EMP_NAME | SALARY | ROW_NUM |
| -------- | ------ | ------- |
| Ravi     | 1500   | 1       |
| Pooja    | 1600   | 2       |
| Anjali   | 1700   | 3       |
| Arjun    | 1800   | 4       |
| Karthik  | 1900   | 5       |
| Amit     | 2000   | 6       |
| Priya    | 2000   | 7       |
| Simran   | 2000   | 8       |
| Divya    | 2100   | 9       |
| Neha     | 2200   | 10      |
| Meena    | 2300   | 11      |
| Manoj    | 2400   | 12      |
| Kiran    | 2500   | 13      |
| Deepak   | 2500   | 14      |
| Nisha    | 2600   | 15      |
| Rahul    | 2600   | 16      |
| Raj      | 2700   | 17      |
| Suresh   | 2800   | 18      |
| Vikas    | 3000   | 19      |
| Sneha    | 3000   | 20      |

---
**Query #8**

    SELECT EMP_NAME , DEPARTMENT , SALARY ,
    ROW_NUMBER() OVER(PARTITION BY DEPARTMENT ORDER BY EMP_NAME) AS ROW_NUM
    FROM employees;

| EMP_NAME | DEPARTMENT | SALARY | ROW_NUM |
| -------- | ---------- | ------ | ------- |
| Deepak   | Bangalore  | 2500   | 1       |
| Kiran    | Bangalore  | 2500   | 2       |
| Manoj    | Bangalore  | 2400   | 3       |
| Meena    | Bangalore  | 2300   | 4       |
| Neha     | Bangalore  | 2200   | 5       |
| Rahul    | Bangalore  | 2600   | 6       |
| Amit     | Chennai    | 2000   | 1       |
| Divya    | Chennai    | 2100   | 2       |
| Nisha    | Chennai    | 2600   | 3       |
| Priya    | Chennai    | 2000   | 4       |
| Raj      | Chennai    | 2700   | 5       |
| Sneha    | Chennai    | 3000   | 6       |
| Suresh   | Chennai    | 2800   | 7       |
| Vikas    | Chennai    | 3000   | 8       |
| Anjali   | Hyderabad  | 1700   | 1       |
| Arjun    | Hyderabad  | 1800   | 2       |
| Karthik  | Hyderabad  | 1900   | 3       |
| Pooja    | Hyderabad  | 1600   | 4       |
| Ravi     | Hyderabad  | 1500   | 5       |
| Simran   | Hyderabad  | 2000   | 6       |

---
**Query #9**

    SELECT EMP_NAME , SALARY ,
    RANK() OVER(ORDER BY SALARY DESC) AS RANKING
    FROM employees;

| EMP_NAME | SALARY | RANKING |
| -------- | ------ | ------- |
| Sneha    | 3000   | 1       |
| Vikas    | 3000   | 1       |
| Suresh   | 2800   | 3       |
| Raj      | 2700   | 4       |
| Nisha    | 2600   | 5       |
| Rahul    | 2600   | 5       |
| Kiran    | 2500   | 7       |
| Deepak   | 2500   | 7       |
| Manoj    | 2400   | 9       |
| Meena    | 2300   | 10      |
| Neha     | 2200   | 11      |
| Divya    | 2100   | 12      |
| Priya    | 2000   | 13      |
| Simran   | 2000   | 13      |
| Amit     | 2000   | 13      |
| Karthik  | 1900   | 16      |
| Arjun    | 1800   | 17      |
| Anjali   | 1700   | 18      |
| Pooja    | 1600   | 19      |
| Ravi     | 1500   | 20      |

---
**Query #10**

    SELECT EMP_NAME , DEPARTMENT , SALARY ,
    RANK() OVER(PARTITION BY DEPARTMENT ORDER BY SALARY DESC) AS RANKING_IN_DEPT
    FROM employees;

| EMP_NAME | DEPARTMENT | SALARY | RANKING_IN_DEPT |
| -------- | ---------- | ------ | --------------- |
| Rahul    | Bangalore  | 2600   | 1               |
| Deepak   | Bangalore  | 2500   | 2               |
| Kiran    | Bangalore  | 2500   | 2               |
| Manoj    | Bangalore  | 2400   | 4               |
| Meena    | Bangalore  | 2300   | 5               |
| Neha     | Bangalore  | 2200   | 6               |
| Sneha    | Chennai    | 3000   | 1               |
| Vikas    | Chennai    | 3000   | 1               |
| Suresh   | Chennai    | 2800   | 3               |
| Raj      | Chennai    | 2700   | 4               |
| Nisha    | Chennai    | 2600   | 5               |
| Divya    | Chennai    | 2100   | 6               |
| Priya    | Chennai    | 2000   | 7               |
| Amit     | Chennai    | 2000   | 7               |
| Simran   | Hyderabad  | 2000   | 1               |
| Karthik  | Hyderabad  | 1900   | 2               |
| Arjun    | Hyderabad  | 1800   | 3               |
| Anjali   | Hyderabad  | 1700   | 4               |
| Pooja    | Hyderabad  | 1600   | 5               |
| Ravi     | Hyderabad  | 1500   | 6               |

---
**Query #11**

    SELECT EMP_NAME , JOIN_DATE , 
    RANK() OVER(ORDER BY JOIN_DATE DESC) AS RANKING
    FROM employees;

| EMP_NAME | JOIN_DATE  | RANKING |
| -------- | ---------- | ------- |
| Nisha    | 2023-01-20 | 1       |
| Deepak   | 2023-01-19 | 2       |
| Simran   | 2023-01-18 | 3       |
| Raj      | 2023-01-17 | 4       |
| Meena    | 2023-01-16 | 5       |
| Karthik  | 2023-01-15 | 6       |
| Divya    | 2023-01-14 | 7       |
| Manoj    | 2023-01-13 | 8       |
| Pooja    | 2023-01-12 | 9       |
| Suresh   | 2023-01-11 | 10      |
| Rahul    | 2023-01-10 | 11      |
| Anjali   | 2023-01-09 | 12      |
| Vikas    | 2023-01-08 | 13      |
| Neha     | 2023-01-07 | 14      |
| Arjun    | 2023-01-06 | 15      |
| Priya    | 2023-01-05 | 16      |
| Kiran    | 2023-01-04 | 17      |
| Sneha    | 2023-01-03 | 18      |
| Ravi     | 2023-01-02 | 19      |
| Amit     | 2023-01-01 | 20      |

---
**Query #12**

    SELECT ORDER_ID , AMOUNT ,
    RANK() OVER(ORDER BY AMOUNT DESC) AS RANKING
    FROM orders;

| ORDER_ID | AMOUNT | RANKING |
| -------- | ------ | ------- |
| 110      | 3500   | 1       |
| 103      | 3200   | 2       |
| 108      | 3000   | 3       |
| 109      | 2800   | 4       |
| 105      | 2750   | 5       |
| 101      | 2500   | 6       |
| 106      | 2100   | 7       |
| 107      | 1900   | 8       |
| 102      | 1800   | 9       |
| 104      | 1500   | 10      |

---
**Query #13**

    SELECT ORDER_ID , CITY , AMOUNT ,
    RANK() OVER(PARTITION BY CITY ORDER BY AMOUNT DESC) AS RANKING_BY_CITY
    FROM orders;

| ORDER_ID | CITY      | AMOUNT | RANKING_BY_CITY |
| -------- | --------- | ------ | --------------- |
| 103      | Bangalore | 3200   | 1               |
| 109      | Bangalore | 2800   | 2               |
| 107      | Chennai   | 1900   | 1               |
| 104      | Chennai   | 1500   | 2               |
| 110      | Delhi     | 3500   | 1               |
| 105      | Delhi     | 2750   | 2               |
| 101      | Hyderabad | 2500   | 1               |
| 106      | Hyderabad | 2100   | 2               |
| 108      | Mumbai    | 3000   | 1               |
| 102      | Mumbai    | 1800   | 2               |

---
**Query #14**

    SELECT EMP_NAME , DEPARTMENT , SALARY ,
    RANK() OVER(PARTITION BY DEPARTMENT ORDER BY SALARY ASC) AS ASCENDING_RANKING
    FROM employees;

| EMP_NAME | DEPARTMENT | SALARY | ASCENDING_RANKING |
| -------- | ---------- | ------ | ----------------- |
| Neha     | Bangalore  | 2200   | 1                 |
| Meena    | Bangalore  | 2300   | 2                 |
| Manoj    | Bangalore  | 2400   | 3                 |
| Deepak   | Bangalore  | 2500   | 4                 |
| Kiran    | Bangalore  | 2500   | 4                 |
| Rahul    | Bangalore  | 2600   | 6                 |
| Priya    | Chennai    | 2000   | 1                 |
| Amit     | Chennai    | 2000   | 1                 |
| Divya    | Chennai    | 2100   | 3                 |
| Nisha    | Chennai    | 2600   | 4                 |
| Raj      | Chennai    | 2700   | 5                 |
| Suresh   | Chennai    | 2800   | 6                 |
| Vikas    | Chennai    | 3000   | 7                 |
| Sneha    | Chennai    | 3000   | 7                 |
| Ravi     | Hyderabad  | 1500   | 1                 |
| Pooja    | Hyderabad  | 1600   | 2                 |
| Anjali   | Hyderabad  | 1700   | 3                 |
| Arjun    | Hyderabad  | 1800   | 4                 |
| Karthik  | Hyderabad  | 1900   | 5                 |
| Simran   | Hyderabad  | 2000   | 6                 |

---
**Query #15**

    SELECT EMP_NAME ,
    RANK() OVER(ORDER BY EMP_NAME) AS RANKING
    FROM employees;

| EMP_NAME | RANKING |
| -------- | ------- |
| Amit     | 1       |
| Anjali   | 2       |
| Arjun    | 3       |
| Deepak   | 4       |
| Divya    | 5       |
| Karthik  | 6       |
| Kiran    | 7       |
| Manoj    | 8       |
| Meena    | 9       |
| Neha     | 10      |
| Nisha    | 11      |
| Pooja    | 12      |
| Priya    | 13      |
| Rahul    | 14      |
| Raj      | 15      |
| Ravi     | 16      |
| Simran   | 17      |
| Sneha    | 18      |
| Suresh   | 19      |
| Vikas    | 20      |

---
**Query #16**

    SELECT ORDER_ID ,CITY, ORDER_DATE ,
    RANK() OVER(PARTITION BY CITY ORDER BY ORDER_DATE DESC) AS RANKING
    FROM orders;

| ORDER_ID | CITY      | ORDER_DATE | RANKING |
| -------- | --------- | ---------- | ------- |
| 109      | Bangalore | 2026-05-18 | 1       |
| 103      | Bangalore | 2026-05-12 | 2       |
| 107      | Chennai   | 2026-05-16 | 1       |
| 104      | Chennai   | 2026-05-13 | 2       |
| 110      | Delhi     | 2026-05-19 | 1       |
| 105      | Delhi     | 2026-05-14 | 2       |
| 106      | Hyderabad | 2026-05-15 | 1       |
| 101      | Hyderabad | 2026-05-10 | 2       |
| 108      | Mumbai    | 2026-05-17 | 1       |
| 102      | Mumbai    | 2026-05-11 | 2       |

---
**Query #17**

    SELECT EMP_NAME , SALARY , 
    DENSE_RANK() OVER(ORDER BY SALARY DESC) AS DENSE_RANKING
    FROM employees;

| EMP_NAME | SALARY | DENSE_RANKING |
| -------- | ------ | ------------- |
| Sneha    | 3000   | 1             |
| Vikas    | 3000   | 1             |
| Suresh   | 2800   | 2             |
| Raj      | 2700   | 3             |
| Nisha    | 2600   | 4             |
| Rahul    | 2600   | 4             |
| Kiran    | 2500   | 5             |
| Deepak   | 2500   | 5             |
| Manoj    | 2400   | 6             |
| Meena    | 2300   | 7             |
| Neha     | 2200   | 8             |
| Divya    | 2100   | 9             |
| Priya    | 2000   | 10            |
| Simran   | 2000   | 10            |
| Amit     | 2000   | 10            |
| Karthik  | 1900   | 11            |
| Arjun    | 1800   | 12            |
| Anjali   | 1700   | 13            |
| Pooja    | 1600   | 14            |
| Ravi     | 1500   | 15            |

---
**Query #18**

    SELECT EMP_NAME , DEPARTMENT , SALARY ,
    DENSE_RANK() OVER(PARTITION BY DEPARTMENT ORDER BY SALARY DESC) AS DENSE_RANKING
    FROM employees;

| EMP_NAME | DEPARTMENT | SALARY | DENSE_RANKING |
| -------- | ---------- | ------ | ------------- |
| Rahul    | Bangalore  | 2600   | 1             |
| Deepak   | Bangalore  | 2500   | 2             |
| Kiran    | Bangalore  | 2500   | 2             |
| Manoj    | Bangalore  | 2400   | 3             |
| Meena    | Bangalore  | 2300   | 4             |
| Neha     | Bangalore  | 2200   | 5             |
| Sneha    | Chennai    | 3000   | 1             |
| Vikas    | Chennai    | 3000   | 1             |
| Suresh   | Chennai    | 2800   | 2             |
| Raj      | Chennai    | 2700   | 3             |
| Nisha    | Chennai    | 2600   | 4             |
| Divya    | Chennai    | 2100   | 5             |
| Priya    | Chennai    | 2000   | 6             |
| Amit     | Chennai    | 2000   | 6             |
| Simran   | Hyderabad  | 2000   | 1             |
| Karthik  | Hyderabad  | 1900   | 2             |
| Arjun    | Hyderabad  | 1800   | 3             |
| Anjali   | Hyderabad  | 1700   | 4             |
| Pooja    | Hyderabad  | 1600   | 5             |
| Ravi     | Hyderabad  | 1500   | 6             |

---
**Query #19**

    SELECT EMP_NAME , JOIN_DATE ,
    DENSE_RANK() OVER(ORDER BY JOIN_DATE DESC) AS DENSE_RANKING
    FROM employees;

| EMP_NAME | JOIN_DATE  | DENSE_RANKING |
| -------- | ---------- | ------------- |
| Nisha    | 2023-01-20 | 1             |
| Deepak   | 2023-01-19 | 2             |
| Simran   | 2023-01-18 | 3             |
| Raj      | 2023-01-17 | 4             |
| Meena    | 2023-01-16 | 5             |
| Karthik  | 2023-01-15 | 6             |
| Divya    | 2023-01-14 | 7             |
| Manoj    | 2023-01-13 | 8             |
| Pooja    | 2023-01-12 | 9             |
| Suresh   | 2023-01-11 | 10            |
| Rahul    | 2023-01-10 | 11            |
| Anjali   | 2023-01-09 | 12            |
| Vikas    | 2023-01-08 | 13            |
| Neha     | 2023-01-07 | 14            |
| Arjun    | 2023-01-06 | 15            |
| Priya    | 2023-01-05 | 16            |
| Kiran    | 2023-01-04 | 17            |
| Sneha    | 2023-01-03 | 18            |
| Ravi     | 2023-01-02 | 19            |
| Amit     | 2023-01-01 | 20            |

---
**Query #20**

    SELECT ORDER_ID , AMOUNT,
    DENSE_RANK() OVER(ORDER BY AMOUNT DESC) AS DENSE_RANKING
    FROM orders;

| ORDER_ID | AMOUNT | DENSE_RANKING |
| -------- | ------ | ------------- |
| 110      | 3500   | 1             |
| 103      | 3200   | 2             |
| 108      | 3000   | 3             |
| 109      | 2800   | 4             |
| 105      | 2750   | 5             |
| 101      | 2500   | 6             |
| 106      | 2100   | 7             |
| 107      | 1900   | 8             |
| 102      | 1800   | 9             |
| 104      | 1500   | 10            |

---
**Query #21**

    SELECT ORDER_ID , CITY , AMOUNT ,
    DENSE_RANK() OVER(PARTITION BY CITY ORDER BY AMOUNT DESC) AS DENSE_RANKING
    FROM orders;

| ORDER_ID | CITY      | AMOUNT | DENSE_RANKING |
| -------- | --------- | ------ | ------------- |
| 103      | Bangalore | 3200   | 1             |
| 109      | Bangalore | 2800   | 2             |
| 107      | Chennai   | 1900   | 1             |
| 104      | Chennai   | 1500   | 2             |
| 110      | Delhi     | 3500   | 1             |
| 105      | Delhi     | 2750   | 2             |
| 101      | Hyderabad | 2500   | 1             |
| 106      | Hyderabad | 2100   | 2             |
| 108      | Mumbai    | 3000   | 1             |
| 102      | Mumbai    | 1800   | 2             |

---
**Query #22**

    SELECT EMP_NAME , SALARY ,
    DENSE_RANK() OVER(ORDER BY SALARY ASC) AS DENSE_RANKING
    FROM employees;

| EMP_NAME | SALARY | DENSE_RANKING |
| -------- | ------ | ------------- |
| Ravi     | 1500   | 1             |
| Pooja    | 1600   | 2             |
| Anjali   | 1700   | 3             |
| Arjun    | 1800   | 4             |
| Karthik  | 1900   | 5             |
| Amit     | 2000   | 6             |
| Priya    | 2000   | 6             |
| Simran   | 2000   | 6             |
| Divya    | 2100   | 7             |
| Neha     | 2200   | 8             |
| Meena    | 2300   | 9             |
| Manoj    | 2400   | 10            |
| Kiran    | 2500   | 11            |
| Deepak   | 2500   | 11            |
| Nisha    | 2600   | 12            |
| Rahul    | 2600   | 12            |
| Raj      | 2700   | 13            |
| Suresh   | 2800   | 14            |
| Vikas    | 3000   | 15            |
| Sneha    | 3000   | 15            |

---
**Query #23**

    SELECT EMP_NAME , DEPARTMENT ,JOIN_DATE,
    DENSE_RANK() OVER(PARTITION BY DEPARTMENT ORDER BY JOIN_DATE ASC) AS DENSE_RANKING
    FROM employees;

| EMP_NAME | DEPARTMENT | JOIN_DATE  | DENSE_RANKING |
| -------- | ---------- | ---------- | ------------- |
| Kiran    | Bangalore  | 2023-01-04 | 1             |
| Neha     | Bangalore  | 2023-01-07 | 2             |
| Rahul    | Bangalore  | 2023-01-10 | 3             |
| Manoj    | Bangalore  | 2023-01-13 | 4             |
| Meena    | Bangalore  | 2023-01-16 | 5             |
| Deepak   | Bangalore  | 2023-01-19 | 6             |
| Amit     | Chennai    | 2023-01-01 | 1             |
| Sneha    | Chennai    | 2023-01-03 | 2             |
| Priya    | Chennai    | 2023-01-05 | 3             |
| Vikas    | Chennai    | 2023-01-08 | 4             |
| Suresh   | Chennai    | 2023-01-11 | 5             |
| Divya    | Chennai    | 2023-01-14 | 6             |
| Raj      | Chennai    | 2023-01-17 | 7             |
| Nisha    | Chennai    | 2023-01-20 | 8             |
| Ravi     | Hyderabad  | 2023-01-02 | 1             |
| Arjun    | Hyderabad  | 2023-01-06 | 2             |
| Anjali   | Hyderabad  | 2023-01-09 | 3             |
| Pooja    | Hyderabad  | 2023-01-12 | 4             |
| Karthik  | Hyderabad  | 2023-01-15 | 5             |
| Simran   | Hyderabad  | 2023-01-18 | 6             |

---
**Query #24**

    SELECT ORDER_ID , ORDER_DATE ,
    DENSE_RANK() OVER(ORDER BY ORDER_DATE DESC) AS DENSE_RANKING
    FROM orders;

| ORDER_ID | ORDER_DATE | DENSE_RANKING |
| -------- | ---------- | ------------- |
| 110      | 2026-05-19 | 1             |
| 109      | 2026-05-18 | 2             |
| 108      | 2026-05-17 | 3             |
| 107      | 2026-05-16 | 4             |
| 106      | 2026-05-15 | 5             |
| 105      | 2026-05-14 | 6             |
| 104      | 2026-05-13 | 7             |
| 103      | 2026-05-12 | 8             |
| 102      | 2026-05-11 | 9             |
| 101      | 2026-05-10 | 10            |

---
