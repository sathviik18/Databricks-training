    SHOW TABLES;

| Tables_in_test |
| -------------- |
| Department     |
| Mark           |
| Staff          |
| Student        |
| Subject        |

---

    SELECT * FROM Department;

| department_id | department_name  | department_block_number |
| ------------- | ---------------- | ----------------------- |
| 1             | Computer Science | 101                     |
| 2             | Mechanical       | 102                     |

---

    SELECT * FROM Mark;

| value | subject_id | student_id |
| ----- | ---------- | ---------- |
| 85    | 1          | 1          |
| 78    | 1          | 3          |
| 90    | 2          | 2          |

---

    SELECT * FROM Staff;

| staff_id | staff_name | department_id |
| -------- | ---------- | ------------- |
| 1        | Dr. Smith  | 1             |
| 2        | Dr. John   | 2             |

---

| student_id | student_name | address  | city  | department_id |
| ---------- | ------------ | -------- | ----- | ------------- |
| 1          | Alice        | Street 1 | CityA | 1             |
| 2          | Bob          | Street 2 | CityB | 2             |
| 3          | Charlie      | Street 3 | CityA | 1             |

---

| subject_id | subject_name   | subject_code | staff_id |
| ---------- | -------------- | ------------ | -------- |
| 1          | DBMS           | CS101        | 1        |
| 2          | Thermodynamics | ME102        | 2        |

---
**Query #1**

    SELECT s.student_name , d.department_name 
    FROM Student s
    LEFT JOIN  Department d
    ON s.department_id = d.department_id ;

| student_name | department_name  |
| ------------ | ---------------- |
| Alice        | Computer Science |
| Bob          | Mechanical       |
| Charlie      | Computer Science |

---
**Query #2**

    SELECT s.subject_id , s.subject_name , AVG(m.value) AS avg_marks 
    FROM Subject s 
    LEFT JOIN Mark m 
    ON s.subject_id = m.subject_id
    GROUP BY s.subject_id , s.subject_name;

| subject_id | subject_name   | avg_marks |
| ---------- | -------------- | --------- |
| 1          | DBMS           | 81.5      |
| 2          | Thermodynamics | 90.0      |

---
**Query #3**

    SELECT st.staff_name , s.subject_name 
    FROM Staff st 
    LEFT JOIN Subject s 
    ON st.staff_id = s.staff_id;

| staff_name | subject_name   |
| ---------- | -------------- |
| Dr. Smith  | DBMS           |
| Dr. John   | Thermodynamics |

---
**Query #4**

    SELECT s.student_id , s.student_name , sub.subject_name , m.value 
    FROM Mark m
    LEFT JOIN Student s
    ON m.student_id = s.student_id 
    LEFT JOIN Subject sub 
    ON m.subject_id = sub.subject_id;

| student_id | student_name | subject_name   | value |
| ---------- | ------------ | -------------- | ----- |
| 1          | Alice        | DBMS           | 85    |
| 3          | Charlie      | DBMS           | 78    |
| 2          | Bob          | Thermodynamics | 90    |

---
**Query #5**

    SELECT d.department_name , COUNT(s.student_id) AS NO_OF_STUDENTS
    FROM Department d
    LEFT JOIN Student s
    ON d.department_id = s.department_id 
    GROUP BY d.department_id;

| department_name  | NO_OF_STUDENTS |
| ---------------- | -------------- |
| Computer Science | 2              |
| Mechanical       | 1              |

---
