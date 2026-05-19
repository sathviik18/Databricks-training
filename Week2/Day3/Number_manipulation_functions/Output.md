    SELECT * FROM employee_salary;

| emp_id | emp_name | base_salary | bonus   | tax_percent | experience_years |
| ------ | -------- | ----------- | ------- | ----------- | ---------------- |
| 1      | Karthik  | 75000.75    | 5000.5  | 10.0        | 6                |
| 2      | Veena    | 65000.4     | 4000.25 | 8.5         | 4                |
| 3      | Ravi     | 85000.9     | 6000.75 | 12.0        | 8                |
| 4      | Anil     | 70000.1     |         | 9.0         | 5                |
| 5      | Suresh   | 60000.55    | 3000.3  | 7.5         | 3                |

---

**Query #1**

    SELECT ABS(-100);

| ABS(-100) |
| --------- |
| 100       |

---
**Query #2**

    SELECT EMP_NAME , ROUND(BASE_SALARY,0) AS ROUNDED_SALARY
    FROM employee_salary;

| EMP_NAME | ROUNDED_SALARY |
| -------- | -------------- |
| Karthik  | 75001          |
| Veena    | 65000          |
| Ravi     | 85001          |
| Anil     | 70000          |
| Suresh   | 60001          |

---
**Query #3**

    SELECT ROUND(BASE_SALARY , 2)
    FROM employee_salary;

| ROUND(BASE_SALARY , 2) |
| ---------------------- |
| 75000.75               |
| 65000.4                |
| 85000.9                |
| 70000.1                |
| 60000.55               |

---
**Query #4**

    SELECT CEIL(BASE_SALARY) 
    FROM employee_salary;

| CEIL(BASE_SALARY) |
| ----------------- |
| 75001             |
| 65001             |
| 85001             |
| 70001             |
| 60001             |

---
**Query #5**

    SELECT FLOOR(BASE_SALARY) 
    FROM employee_salary;

| FLOOR(BASE_SALARY) |
| ------------------ |
| 75000              |
| 65000              |
| 85000              |
| 70000              |
| 60000              |

---
**Query #6**

    SELECT TRUNCATE(BASE_SALARY,0)
    FROM employee_salary;

| TRUNCATE(BASE_SALARY,0) |
| ----------------------- |
| 75000                   |
| 65000                   |
| 85000                   |
| 70000                   |
| 60000                   |

---
**Query #7**

    SELECT MOD(experiencE_years,2) FROM employee_salary;

| MOD(experiencE_years,2) |
| ----------------------- |
| 0                       |
| 0                       |
| 0                       |
| 1                       |
| 1                       |

---
**Query #8**

    SELECT POWER(2,3);

| POWER(2,3) |
| ---------- |
| 8          |

---
**Query #9**

    SELECT POW(3,2);

| POW(3,2) |
| -------- |
| 9        |

---
**Query #10**

    SELECT SQRT(64);

| SQRT(64) |
| -------- |
| 8        |

---
**Query #11**

    SELECT SIGN(BASE_SALARY) FROM employee_salary;

| SIGN(BASE_SALARY) |
| ----------------- |
| 1                 |
| 1                 |
| 1                 |
| 1                 |
| 1                 |

---
**Query #12**

    SELECT RAND();

| RAND()              |
| ------------------- |
| 0.04511809912055554 |

---
**Query #13**

    SELECT FORMAT(BASE_SALARY , 2) FROM employee_salary;

| FORMAT(BASE_SALARY , 2) |
| ----------------------- |
| 75,000.75               |
| 65,000.40               |
| 85,000.90               |
| 70,000.10               |
| 60,000.55               |

---
**Query #14**

    SELECT EMP_NAME , 
    GREATEST(BASE_SALARY , IFNULL(BONUS,0))
    FROM employee_salary;

| EMP_NAME | GREATEST(BASE_SALARY , IFNULL(BONUS,0)) |
| -------- | --------------------------------------- |
| Karthik  | 75000.75                                |
| Veena    | 65000.4                                 |
| Ravi     | 85000.9                                 |
| Anil     | 70000.1                                 |
| Suresh   | 60000.55                                |

---
**Query #15**

    SELECT EMP_NAME , 
    LEAST(BASE_SALARY , IFNULL(BONUS ,0))
    FROM employee_salary;

| EMP_NAME | LEAST(BASE_SALARY , IFNULL(BONUS ,0)) |
| -------- | ------------------------------------- |
| Karthik  | 5000.5                                |
| Veena    | 4000.25                               |
| Ravi     | 6000.75                               |
| Anil     | 0.0                                   |
| Suresh   | 3000.3                                |

---
