    SHOW TABLES;

| Tables_in_test |
| -------------- |
| contacts       |
| departments    |
| employees      |
| projects       |
| salary         |

---

    SELECT * FROM contacts;

| emp_id | phone_no   | email             |
| ------ | ---------- | ----------------- |
| 1      | 9876543210 | karthik@gmail.com |
| 2      | 9123456780 | ajay@gmail.com    |
| 3      | 9988776655 | vijay@gmail.com   |
| 4      | 9001122334 | vinay@gmail.com   |
| 5      | 9556677889 | meena@gmail.com   |
| 8      | 9887766554 | priya@gmail.com   |

---

    SELECT * FROM departments;

| dept_id | dept_name |
| ------- | --------- |
| 1       | HR        |
| 2       | IT        |
| 3       | Finance   |
| 4       | Marketing |
| 5       | Sales     |

---

    SELECT * FROM employees;

| emp_id | emp_name | manager_id | dept_id |
| ------ | -------- | ---------- | ------- |
| 1      | Karthik  |            | 1       |
| 2      | Ajay     | 1          | 1       |
| 3      | Vijay    | 1          | 2       |
| 4      | Vinay    | 2          | 2       |
| 5      | Meena    | 3          | 3       |
| 6      | Veer     |            | 4       |
| 7      | Keerthi  | 4          | 5       |
| 8      | Priya    | 4          | 5       |

---

    SELECT * FROM projects;

| project_id | project_name | emp_id |
| ---------- | ------------ | ------ |
| 1          | Project A    | 1      |
| 2          | Project B    | 2      |
| 3          | Project C    | 3      |
| 4          | Project D    | 4      |
| 5          | Project E    | 5      |

---

    SELECT * FROM salary;

| emp_id | salary  |
| ------ | ------- |
| 1      | 75000.0 |
| 2      | 50000.0 |
| 3      | 65000.0 |
| 4      | 62000.0 |
| 5      | 58000.0 |
| 7      | 70000.0 |

---

**Query #1**

    SELECT e.emp_name AS Employee_name , 
    m.emp_name AS Manager_name 
    FROM employees e
    LEFT JOIN employees m
    ON e.manager_id = m.emp_id ;

| Employee_name | Manager_name |
| ------------- | ------------ |
| Karthik       |              |
| Ajay          | Karthik      |
| Vijay         | Karthik      |
| Vinay         | Ajay         |
| Meena         | Vijay        |
| Veer          |              |
| Keerthi       | Vinay        |
| Priya         | Vinay        |

---
**Query #2**

    SELECT e.emp_name , d.dept_name
    FROM employees e
    LEFT JOIN departments d
    ON e.dept_id = d.dept_id;

| emp_name | dept_name |
| -------- | --------- |
| Karthik  | HR        |
| Ajay     | HR        |
| Vijay    | IT        |
| Vinay    | IT        |
| Meena    | Finance   |
| Veer     | Marketing |
| Keerthi  | Sales     |
| Priya    | Sales     |

---
**Query #3**

    SELECT e.emp_name AS EMP_NAME ,
    m.emp_name AS MANAGER_NAME
    FROM employees e
    INNER JOIN employees m
    ON e.manager_id = m.emp_id;

| EMP_NAME | MANAGER_NAME |
| -------- | ------------ |
| Ajay     | Karthik      |
| Vijay    | Karthik      |
| Vinay    | Ajay         |
| Meena    | Vijay        |
| Keerthi  | Vinay        |
| Priya    | Vinay        |

---
**Query #4**

    SELECT d.dept_name , SUM(s.salary) AS TOTAL_SALARY 
    FROM departments d
    LEFT JOIN employees e
    ON d.dept_id = e.dept_id 
    LEFT JOIN salary s
    ON e.emp_id = s.emp_id 
    GROUP BY d.dept_name;

| dept_name | TOTAL_SALARY |
| --------- | ------------ |
| HR        | 125000.0     |
| IT        | 127000.0     |
| Finance   | 58000.0      |
| Marketing |              |
| Sales     | 70000.0      |

---
**Query #5**

    SELECT e.emp_name 
    FROM employees e 
    LEFT JOIN departments d
    ON e.dept_id = d.dept_id
    WHERE d.dept_id IS NULL;

There are no results to be displayed.

---
**Query #6**

    SELECT e.emp_name , p.project_name
    FROM employees e
    LEFT JOIN projects p
    ON e.emp_id = p.emp_id ;

| emp_name | project_name |
| -------- | ------------ |
| Karthik  | Project A    |
| Ajay     | Project B    |
| Vijay    | Project C    |
| Vinay    | Project D    |
| Meena    | Project E    |
| Veer     |              |
| Keerthi  |              |
| Priya    |              |

---
**Query #7**

    SELECT e.emp_name,
    p.project_name
    FROM employees e
    INNER JOIN projects p
    ON e.emp_id = p.emp_id;

| emp_name | project_name |
| -------- | ------------ |
| Karthik  | Project A    |
| Ajay     | Project B    |
| Vijay    | Project C    |
| Vinay    | Project D    |
| Meena    | Project E    |

---
**Query #8**

    SELECT e.emp_name , p.project_name
    FROM employees e
    RIGHT JOIN projects p
    ON e.emp_id = p.emp_id ;

| emp_name | project_name |
| -------- | ------------ |
| Karthik  | Project A    |
| Ajay     | Project B    |
| Vijay    | Project C    |
| Vinay    | Project D    |
| Meena    | Project E    |

---
**Query #9**

    SELECT e.emp_name , s.salary
    FROM employees e
    LEFT JOIN salary s
    ON e.emp_id = s.emp_id;

| emp_name | salary  |
| -------- | ------- |
| Karthik  | 75000.0 |
| Ajay     | 50000.0 |
| Vijay    | 65000.0 |
| Vinay    | 62000.0 |
| Meena    | 58000.0 |
| Veer     |         |
| Keerthi  | 70000.0 |
| Priya    |         |

---
**Query #10**

    SELECT e.emp_name , d.dept_name 
    FROM employees e
    LEFT JOIN departments d
    ON e.dept_id = d.dept_id;

| emp_name | dept_name |
| -------- | --------- |
| Karthik  | HR        |
| Ajay     | HR        |
| Vijay    | IT        |
| Vinay    | IT        |
| Meena    | Finance   |
| Veer     | Marketing |
| Keerthi  | Sales     |
| Priya    | Sales     |

---
**Query #11**

    SELECT d.dept_name , e.emp_name 
    FROM employees e
    RIGHT JOIN departments d
    ON e.dept_id = d.dept_id;

| dept_name | emp_name |
| --------- | -------- |
| HR        | Ajay     |
| HR        | Karthik  |
| IT        | Vinay    |
| IT        | Vijay    |
| Finance   | Meena    |
| Marketing | Veer     |
| Sales     | Priya    |
| Sales     | Keerthi  |

---
**Query #12**

    SELECT e.emp_name , c.phone_no , c.email
    FROM employees e
    LEFT JOIN contacts c
    ON e.emp_id = c.emp_id;

| emp_name | phone_no   | email             |
| -------- | ---------- | ----------------- |
| Karthik  | 9876543210 | karthik@gmail.com |
| Ajay     | 9123456780 | ajay@gmail.com    |
| Vijay    | 9988776655 | vijay@gmail.com   |
| Vinay    | 9001122334 | vinay@gmail.com   |
| Meena    | 9556677889 | meena@gmail.com   |
| Veer     |            |                   |
| Keerthi  |            |                   |
| Priya    | 9887766554 | priya@gmail.com   |

---
**Query #13**

    SELECT e.emp_name , d.dept_name 
    FROM employees e
    LEFT JOIN departments d
    ON e.dept_id = d.dept_id
    UNION ALL
    SELECT e.emp_name , d.dept_name 
    FROM employees e
    RIGHT JOIN departments d
    ON e.dept_id = d.dept_id;

| emp_name | dept_name |
| -------- | --------- |
| Karthik  | HR        |
| Ajay     | HR        |
| Vijay    | IT        |
| Vinay    | IT        |
| Meena    | Finance   |
| Veer     | Marketing |
| Keerthi  | Sales     |
| Priya    | Sales     |
| Ajay     | HR        |
| Karthik  | HR        |
| Vinay    | IT        |
| Vijay    | IT        |
| Meena    | Finance   |
| Veer     | Marketing |
| Priya    | Sales     |
| Keerthi  | Sales     |

---
**Query #14**

    SELECT e.emp_name,
    p.project_name
    FROM employees e
    LEFT JOIN projects p
    ON e.emp_id = p.emp_id
    WHERE p.project_id is NULL;

| emp_name | project_name |
| -------- | ------------ |
| Veer     |              |
| Keerthi  |              |
| Priya    |              |

---
**Query #15**

    SELECT e.emp_name,
    p.project_name
    FROM employees e
    LEFT JOIN projects p
    ON e.emp_id = p.emp_id;

| emp_name | project_name |
| -------- | ------------ |
| Karthik  | Project A    |
| Ajay     | Project B    |
| Vijay    | Project C    |
| Vinay    | Project D    |
| Meena    | Project E    |
| Veer     |              |
| Keerthi  |              |
| Priya    |              |

---
**Query #16**

    SELECT p.project_name,
    e.emp_name
    FROM projects p
    LEFT JOIN employees e
    ON p.emp_id = e.emp_id;

| project_name | emp_name |
| ------------ | -------- |
| Project A    | Karthik  |
| Project B    | Ajay     |
| Project C    | Vijay    |
| Project D    | Vinay    |
| Project E    | Meena    |

---
**Query #17**

    SELECT p.project_name,
    e.emp_name
    FROM projects p
    LEFT JOIN employees e
    ON p.emp_id = e.emp_id;

| project_name | emp_name |
| ------------ | -------- |
| Project A    | Karthik  |
| Project B    | Ajay     |
| Project C    | Vijay    |
| Project D    | Vinay    |
| Project E    | Meena    |

---
**Query #18**

    SELECT e.emp_name AS Employee_name ,
    m.emp_name AS Manager_name , p.project_name 
    FROM employees e
    INNER JOIN employees m
    ON e.manager_id = m.emp_id
    INNER JOIN projects p
    ON e.emp_id = p.emp_id;

| Employee_name | Manager_name | project_name |
| ------------- | ------------ | ------------ |
| Ajay          | Karthik      | Project B    |
| Vijay         | Karthik      | Project C    |
| Vinay         | Ajay         | Project D    |
| Meena         | Vijay        | Project E    |

---
**Query #19**

    SELECT e.emp_name , d.dept_name 
    FROM employees e
    INNER JOIN departments d
    ON e.dept_id = d.dept_id;

| emp_name | dept_name |
| -------- | --------- |
| Karthik  | HR        |
| Ajay     | HR        |
| Vijay    | IT        |
| Vinay    | IT        |
| Meena    | Finance   |
| Veer     | Marketing |
| Keerthi  | Sales     |
| Priya    | Sales     |

---
**Query #20**

    SELECT d.dept_name,
    e.emp_name
    FROM departments d
    LEFT JOIN employees e
    ON d.dept_id = e.dept_id;

| dept_name | emp_name |
| --------- | -------- |
| HR        | Ajay     |
| HR        | Karthik  |
| IT        | Vinay    |
| IT        | Vijay    |
| Finance   | Meena    |
| Marketing | Veer     |
| Sales     | Priya    |
| Sales     | Keerthi  |

---
**Query #21**

    SELECT e.emp_name,
    p.project_name
    FROM employees e
    INNER JOIN projects p
    ON e.emp_id = p.emp_id
    WHERE e.dept_id IS NULL;

There are no results to be displayed.

---
**Query #22**

    SELECT d.dept_name , COUNT(e.emp_id) AS TOTAL_EMPLOYEES 
    FROM employees e
    LEFT JOIN departments d
    ON e.dept_id = d.dept_id
    GROUP BY d.dept_name;

| dept_name | TOTAL_EMPLOYEES |
| --------- | --------------- |
| HR        | 2               |
| IT        | 2               |
| Finance   | 1               |
| Marketing | 1               |
| Sales     | 2               |

---
**Query #23**

    SELECT e.emp_name AS EMPLOYEE_NAME , m.emp_name AS MANAGER_NAME
    FROM employees e
    INNER JOIN employees m
    ON e.manager_id = m.emp_id;

| EMPLOYEE_NAME | MANAGER_NAME |
| ------------- | ------------ |
| Ajay          | Karthik      |
| Vijay         | Karthik      |
| Vinay         | Ajay         |
| Meena         | Vijay        |
| Keerthi       | Vinay        |
| Priya         | Vinay        |

---
**Query #24**

    SELECT e.emp_name AS EMPLOYEE_NAME , m.emp_name AS MANAGER_NAME
    FROM employees e
    left JOIN employees m
    ON e.manager_id = m.emp_id;

| EMPLOYEE_NAME | MANAGER_NAME |
| ------------- | ------------ |
| Karthik       |              |
| Ajay          | Karthik      |
| Vijay         | Karthik      |
| Vinay         | Ajay         |
| Meena         | Vijay        |
| Veer          |              |
| Keerthi       | Vinay        |
| Priya         | Vinay        |

---
**Query #25**

    SELECT d.dept_name,
    COUNT(e.emp_id) AS employee_count
    FROM departments d
    LEFT JOIN employees e
    ON d.dept_id = e.dept_id
    GROUP BY d.dept_name;

| dept_name | employee_count |
| --------- | -------------- |
| HR        | 2              |
| IT        | 2              |
| Finance   | 1              |
| Marketing | 1              |
| Sales     | 2              |

---
**Query #26**

    SELECT e.emp_name,
    d.dept_name
    FROM departments d
    LEFT JOIN employees e
    ON d.dept_id = e.dept_id;

| emp_name | dept_name |
| -------- | --------- |
| Ajay     | HR        |
| Karthik  | HR        |
| Vinay    | IT        |
| Vijay    | IT        |
| Meena    | Finance   |
| Veer     | Marketing |
| Priya    | Sales     |
| Keerthi  | Sales     |

---
**Query #27**

    SELECT e.emp_name 
    FROM employees e
    LEFT JOIN salary s
    ON e.emp_id = s.emp_id
    WHERE s.salary is NULL;

| emp_name |
| -------- |
| Veer     |
| Priya    |

---
**Query #28**

    SELECT e.emp_name,
    p.project_name
    FROM employees e
    LEFT JOIN projects p
    ON e.emp_id = p.emp_id;

| emp_name | project_name |
| -------- | ------------ |
| Karthik  | Project A    |
| Ajay     | Project B    |
| Vijay    | Project C    |
| Vinay    | Project D    |
| Meena    | Project E    |
| Veer     |              |
| Keerthi  |              |
| Priya    |              |

---
**Query #29**

    SELECT e.emp_name , d.dept_name , p.project_name
    FROM employees e
    LEFT JOIN departments d
    ON e.dept_id = d.dept_id 
    LEFT JOIN projects p
    ON e.emp_id = p.emp_id;

| emp_name | dept_name | project_name |
| -------- | --------- | ------------ |
| Karthik  | HR        | Project A    |
| Ajay     | HR        | Project B    |
| Vijay    | IT        | Project C    |
| Vinay    | IT        | Project D    |
| Meena    | Finance   | Project E    |
| Veer     | Marketing |              |
| Keerthi  | Sales     |              |
| Priya    | Sales     |              |

---
**Query #30**

    SELECT e.emp_name,
    d.dept_name
    FROM employees e
    LEFT JOIN departments d
    ON e.dept_id = d.dept_id;

| emp_name | dept_name |
| -------- | --------- |
| Karthik  | HR        |
| Ajay     | HR        |
| Vijay    | IT        |
| Vinay    | IT        |
| Meena    | Finance   |
| Veer     | Marketing |
| Keerthi  | Sales     |
| Priya    | Sales     |

---
