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

| department_id | department_name  | department_block_number | yearly_budget |
| ------------- | ---------------- | ----------------------- | ------------- |
| 1             | Computer Science | 101                     | 800000.0      |
| 2             | Mechanical       | 102                     | 600000.0      |
| 3             | Electronics      | 103                     | 550000.0      |
| 4             | Civil            | 104                     | 450000.0      |
| 5             | Mathematics      | 105                     | 300000.0      |
| 6             |                  | 106                     | 200000.0      |
| 7             | Biotechnology    |                         |               |

---

    SELECT * FROM Mark;

| student_id | subject_id | exam_type | marks | exam_date  |
| ---------- | ---------- | --------- | ----- | ---------- |
| 101        | 201        | Final     | 91    | 2024-05-10 |
| 101        | 201        | Mid       | 88    | 2024-03-10 |
| 101        | 202        | Mid       | 75    | 2024-03-11 |
| 102        | 201        | Mid       | 95    | 2024-03-10 |
| 102        | 202        | Final     | 89    | 2024-05-11 |
| 103        | 203        | Mid       | 66    | 2024-03-09 |
| 103        | 204        | Final     | 72    | 2024-05-12 |
| 104        | 203        | Final     | 81    | 2024-05-12 |
| 105        | 205        | Mid       | 98    | 2024-03-14 |
| 105        | 206        | Final     | 94    | 2024-05-14 |
| 106        | 205        | Mid       | 54    | 2024-03-14 |
| 106        | 206        | Final     | 61    | 2024-05-14 |
| 107        | 207        | Mid       | 87    | 2024-03-16 |
| 108        | 207        | Final     |       | 2024-05-16 |
| 109        | 201        | Final     | 99    | 2024-05-10 |
| 109        | 210        | Mid       | 97    | 2024-03-20 |
| 110        | 208        | Mid       | 71    | 2024-03-18 |
| 111        | 208        | Final     | 65    | 2024-05-18 |
| 112        | 209        | Mid       |       | 2024-03-21 |
| 113        | 210        | Final     | 44    | 2024-05-20 |
| 114        | 208        | Mid       | 90    | 2024-03-18 |
| 115        | 209        | Final     | 73    | 2024-05-22 |

---

    SELECT * FROM Staff;

| staff_id | staff_name    | designation         | salary   | hire_date  | department_id |
| -------- | ------------- | ------------------- | -------- | ---------- | ------------- |
| 1        | Alice Johnson | Professor           | 95000.0  | 2015-06-12 | 1             |
| 2        | Bob Smith     | Associate Professor | 82000.0  | 2017-09-01 | 1             |
| 3        | Charlie Brown | Professor           | 91000.0  | 2014-03-21 | 2             |
| 4        | David Lee     | Lecturer            | 55000.0  | 2020-07-15 | 2             |
| 5        | Eva Green     | Professor           | 99000.0  | 2013-11-05 | 3             |
| 6        | Frank Hall    | Lecturer            |          | 2021-01-12 | 3             |
| 7        | Grace Miller  | HOD                 | 120000.0 | 2010-02-28 | 4             |
| 8        |               | Lecturer            | 50000.0  | 2022-08-18 |               |
| 9        | Henry Ford    | Assistant Professor | 65000.0  |            | 5             |
| 10       | Ivy Clark     | Professor           | 98000.0  | 2012-04-17 |               |

---

    SELECT * FROM Student;

| student_id | student_name     | gender | city          | admission_year | department_id | cgpa |
| ---------- | ---------------- | ------ | ------------- | -------------- | ------------- | ---- |
| 101        | John Doe         | Male   | New York      | 2021           | 1             | 8.7  |
| 102        | Mary Jane        | Female | Chicago       | 2020           | 1             | 9.1  |
| 103        | Steve Rogers     | Male   | Dallas        | 2022           | 2             | 7.5  |
| 104        | Natasha Romanoff | Female | Boston        | 2021           | 2             | 8.0  |
| 105        | Bruce Wayne      | Male   | Gotham        | 2019           | 3             | 9.5  |
| 106        | Clark Kent       | Male   | Metropolis    | 2020           | 3             | 6.9  |
| 107        | Diana Prince     | Female | Washington    | 2022           | 4             | 8.4  |
| 108        | Peter Parker     | Male   | Queens        | 2021           | 4             |      |
| 109        | Tony Stark       | Male   | Malibu        | 2019           | 1             | 9.8  |
| 110        | Wanda Maximoff   | Female | Chicago       | 2022           | 5             | 7.2  |
| 111        | Barry Allen      | Male   |               | 2023           | 5             | 6.5  |
| 112        |                  | Female | Seattle       | 2023           |               |      |
| 113        | Scott Lang       | Male   | San Francisco | 2021           |               | 5.8  |
| 114        | Jean Grey        | Female | New York      | 2020           | 6             | 8.8  |
| 115        | Logan Howlett    | Male   | Denver        | 2022           | 7             | 7.7  |

---

    SELECT * FROM Subject;

| subject_id | subject_name            | subject_code | semester | credits | staff_id |
| ---------- | ----------------------- | ------------ | -------- | ------- | -------- |
| 201        | Database Systems        | CS301        | 3        | 4       | 1        |
| 202        | Operating Systems       | CS302        | 3        | 4       | 2        |
| 203        | Machine Design          | ME201        | 4        | 3       | 3        |
| 204        | Thermodynamics          | ME202        | 4        | 4       | 4        |
| 205        | Digital Electronics     | EC301        | 5        | 4       | 5        |
| 206        | Signals and Systems     | EC302        | 5        | 3       | 6        |
| 207        | Structural Engineering  | CV401        | 6        | 4       | 7        |
| 208        | Linear Algebra          | MA101        | 1        | 3       | 9        |
| 209        |                         | GEN999       | 2        | 2       |          |
| 210        | Artificial Intelligence | CS401        | 6        | 5       | 1        |

---
**Query #1**

    SELECT s.student_id ,s.student_name , d.department_name
    FROM Student s
    LEFT JOIN Department d
    ON s.department_id = d.department_id
    GROUP BY s.student_id , s.student_name;

| student_id | student_name     | department_name  |
| ---------- | ---------------- | ---------------- |
| 101        | John Doe         | Computer Science |
| 102        | Mary Jane        | Computer Science |
| 103        | Steve Rogers     | Mechanical       |
| 104        | Natasha Romanoff | Mechanical       |
| 105        | Bruce Wayne      | Electronics      |
| 106        | Clark Kent       | Electronics      |
| 107        | Diana Prince     | Civil            |
| 108        | Peter Parker     | Civil            |
| 109        | Tony Stark       | Computer Science |
| 110        | Wanda Maximoff   | Mathematics      |
| 111        | Barry Allen      | Mathematics      |
| 112        |                  |                  |
| 113        | Scott Lang       |                  |
| 114        | Jean Grey        |                  |
| 115        | Logan Howlett    | Biotechnology    |

---
**Query #2**

    SELECT s.staff_id , s.staff_name , d.department_name 
    FROM Staff s
    LEFT JOIN Department d
    ON s.department_id = d.department_id 
    GROUP BY s.staff_id , s.staff_name;

| staff_id | staff_name    | department_name  |
| -------- | ------------- | ---------------- |
| 1        | Alice Johnson | Computer Science |
| 2        | Bob Smith     | Computer Science |
| 3        | Charlie Brown | Mechanical       |
| 4        | David Lee     | Mechanical       |
| 5        | Eva Green     | Electronics      |
| 6        | Frank Hall    | Electronics      |
| 7        | Grace Miller  | Civil            |
| 8        |               |                  |
| 9        | Henry Ford    | Mathematics      |
| 10       | Ivy Clark     |                  |

---
**Query #3**

    SELECT d.department_id ,d.department_name 
    FROM Department d
    LEFT JOIN Student s
    ON d.DEPARTMENT_ID = s.DEPARTMENT_ID
    WHERE s.student_id IS NULL;

There are no results to be displayed.

---
**Query #4**

    SELECT s.student_id , s.student_name , m.MARKS
    FROM Student s
    LEFT JOIN Mark m 
    ON s.student_id = m.student_id
    WHERE m.marks IS NULL;

| student_id | student_name | MARKS |
| ---------- | ------------ | ----- |
| 108        | Peter Parker |       |
| 112        |              |       |

---
**Query #5**

    SELECT subject_id , subject_name
    FROM Subject 
    WHERE staff_id IS NULL;

| subject_id | subject_name |
| ---------- | ------------ |
| 209        |              |

---
**Query #6**

    SELECT d.department_name , AVG(s.cgpa) AS AVG_CGPA 
    FROM Department d
    LEFT JOIN Student s
    ON d.department_id = s.department_id
    GROUP BY d.department_name;

| department_name  | AVG_CGPA |
| ---------------- | -------- |
| Computer Science | 9.2      |
| Mechanical       | 7.75     |
| Electronics      | 8.2      |
| Civil            | 8.4      |
| Mathematics      | 6.85     |
|                  | 8.8      |
| Biotechnology    | 7.7      |

---
**Query #7**

    SELECT d.department_NAME , AVG(s.cgpa) AS AVG_CPGA 
    FROM Department d
    LEFT JOIN Student s
    ON d.department_id = s.department_id 
    GROUP BY d.department_name
    HAVING AVG(s.cgpa) > 8.0;

| department_NAME  | AVG_CPGA |
| ---------------- | -------- |
| Computer Science | 9.2      |
| Electronics      | 8.2      |
| Civil            | 8.4      |
|                  | 8.8      |

---
**Query #8**

    SELECT d.department_name , COUNT(s.student_id) AS NO_OF_STUDENTS
    FROM Department d
    LEFT JOIN Student s
    ON d.department_ID = s.department_id
    GROUP BY d.department_name;

| department_name  | NO_OF_STUDENTS |
| ---------------- | -------------- |
| Computer Science | 3              |
| Mechanical       | 2              |
| Electronics      | 2              |
| Civil            | 2              |
| Mathematics      | 2              |
|                  | 1              |
| Biotechnology    | 1              |

---
**Query #9**

    SELECT s.subject_name , MAX(m.marks) AS HIGHEST_MARKS , MIN(m.marks) AS LOWEST_MARKS 
    FROM Subject s
    LEFT JOIN Mark m
    ON s.subject_id = m.subject_id 
    GROUP BY s.subject_name;

| subject_name            | HIGHEST_MARKS | LOWEST_MARKS |
| ----------------------- | ------------- | ------------ |
| Database Systems        | 99            | 88           |
| Operating Systems       | 89            | 75           |
| Machine Design          | 81            | 66           |
| Thermodynamics          | 72            | 72           |
| Digital Electronics     | 98            | 54           |
| Signals and Systems     | 94            | 61           |
| Structural Engineering  | 87            | 87           |
| Linear Algebra          | 90            | 65           |
|                         | 73            | 73           |
| Artificial Intelligence | 97            | 44           |

---
**Query #10**

    SELECT s.student_name , m.marks 
    FROM Student s
    LEFT JOIN Mark m 
    ON s.student_id = m.student_id 
    WHERE m.marks > 90;

| student_name | marks |
| ------------ | ----- |
| John Doe     | 91    |
| Mary Jane    | 95    |
| Bruce Wayne  | 98    |
| Bruce Wayne  | 94    |
| Tony Stark   | 99    |
| Tony Stark   | 97    |

---
**Query #11**

    SELECT s.student_name , d.department_name 
    FROM Student s
    LEFT JOIN Department d
    ON s.department_id = d.department_id
    WHERE d.department_NAME = 'Computer Science';

| student_name | department_name  |
| ------------ | ---------------- |
| John Doe     | Computer Science |
| Mary Jane    | Computer Science |
| Tony Stark   | Computer Science |

---
**Query #12**

    SELECT s.staff_name , COUNT(sub.subject_id) AS SUBJECTS_HANDLED
    FROM Staff s
    LEFT JOIN Subject sub 
    ON s.staff_id = sub.staff_id 
    GROUP BY s.staff_name;

| staff_name    | SUBJECTS_HANDLED |
| ------------- | ---------------- |
| Alice Johnson | 2                |
| Bob Smith     | 1                |
| Charlie Brown | 1                |
| David Lee     | 1                |
| Eva Green     | 1                |
| Frank Hall    | 1                |
| Grace Miller  | 1                |
|               | 0                |
| Henry Ford    | 1                |
| Ivy Clark     | 0                |

---
**Query #13**

    SELECT s.student_name , SUM(m.marks) AS TOTAL_MARKS 
    FROM Student s
    LEFT JOIN Mark m 
    ON s.student_id = m.student_id
    GROUP BY s.student_name;

| student_name     | TOTAL_MARKS |
| ---------------- | ----------- |
| John Doe         | 254         |
| Mary Jane        | 184         |
| Steve Rogers     | 138         |
| Natasha Romanoff | 81          |
| Bruce Wayne      | 192         |
| Clark Kent       | 115         |
| Diana Prince     | 87          |
| Peter Parker     |             |
| Tony Stark       | 196         |
| Wanda Maximoff   | 71          |
| Barry Allen      | 65          |
|                  |             |
| Scott Lang       | 44          |
| Jean Grey        | 90          |
| Logan Howlett    | 73          |

---
**Query #14**

    SELECT d.department_name , COUNT(s.staff_id) AS STAFF_COUNT 
    FROM Department d
    LEFT JOIN Staff s
    ON d.department_id = s.staff_id
    GROUP BY d.department_name
    HAVING COUNT(s.staff_id) > 2;

There are no results to be displayed.

---
**Query #15**

    SELECT STUDENT_NAME , CGPA 
    FROM Student 
    WHERE CGPA > (SELECT AVG(CGPA) FROM Student);

| STUDENT_NAME     | CGPA |
| ---------------- | ---- |
| John Doe         | 8.7  |
| Mary Jane        | 9.1  |
| Natasha Romanoff | 8.0  |
| Bruce Wayne      | 9.5  |
| Diana Prince     | 8.4  |
| Tony Stark       | 9.8  |
| Jean Grey        | 8.8  |

---
**Query #16**

    SELECT st.staff_name , st.salary 
    FROM Staff st
    WHERE st.salary > (SELECT AVG(SALARY)
                       FROM Staff
                       WHERE department_id = st.staff_id);

| staff_name    | salary  |
| ------------- | ------- |
| Alice Johnson | 95000.0 |
| Bob Smith     | 82000.0 |
| Eva Green     | 99000.0 |

---
**Query #17**

    SELECT MAX(salary) AS second_highest_salary
    FROM Staff
    WHERE salary <
    (
        SELECT MAX(salary)
        FROM Staff
    );

| second_highest_salary |
| --------------------- |
| 99000.0               |

---
**Query #18**

    SELECT * FROM (
      SELECT s.student_name , sub.subject_name ,m.marks , RANK() OVER(PARTITION BY sub.subject_id ORDER BY m.marks DESC) AS student_rank
    FROM Mark m 
    LEFT JOIN Student s
    ON m.student_id = s.student_id 
    LEFT JOIN Subject sub 
    ON m.subject_id = sub.subject_id
      )t
      WHERE student_rank = 1;

| student_name     | subject_name            | marks | student_rank |
| ---------------- | ----------------------- | ----- | ------------ |
| Tony Stark       | Database Systems        | 99    | 1            |
| Mary Jane        | Operating Systems       | 89    | 1            |
| Natasha Romanoff | Machine Design          | 81    | 1            |
| Steve Rogers     | Thermodynamics          | 72    | 1            |
| Bruce Wayne      | Digital Electronics     | 98    | 1            |
| Bruce Wayne      | Signals and Systems     | 94    | 1            |
| Diana Prince     | Structural Engineering  | 87    | 1            |
| Jean Grey        | Linear Algebra          | 90    | 1            |
| Logan Howlett    |                         | 73    | 1            |
| Tony Stark       | Artificial Intelligence | 97    | 1            |

---
**Query #19**

    SELECT s.student_id, s.student_name , m.marks 
    FROM Student s
    LEFT JOIN Mark m 
    ON s.student_id = m.student_id;

| student_id | student_name     | marks |
| ---------- | ---------------- | ----- |
| 101        | John Doe         | 91    |
| 101        | John Doe         | 88    |
| 101        | John Doe         | 75    |
| 102        | Mary Jane        | 95    |
| 102        | Mary Jane        | 89    |
| 103        | Steve Rogers     | 66    |
| 103        | Steve Rogers     | 72    |
| 104        | Natasha Romanoff | 81    |
| 105        | Bruce Wayne      | 98    |
| 105        | Bruce Wayne      | 94    |
| 106        | Clark Kent       | 54    |
| 106        | Clark Kent       | 61    |
| 107        | Diana Prince     | 87    |
| 108        | Peter Parker     |       |
| 109        | Tony Stark       | 99    |
| 109        | Tony Stark       | 97    |
| 110        | Wanda Maximoff   | 71    |
| 111        | Barry Allen      | 65    |
| 112        |                  |       |
| 113        | Scott Lang       | 44    |
| 114        | Jean Grey        | 90    |
| 115        | Logan Howlett    | 73    |

---
**Query #20**

    SELECT s.subject_name , AVG(m.marks) AS AVG_MARKS 
    FROM Subject s
    LEFT JOIN Mark m 
    ON s.subject_id = m.subject_id
    GROUP BY s.subject_name 
    HAVING AVG(m.marks) < 70;

There are no results to be displayed.

---
**Query #21**

    SELECT Student_name , cgpa 
    FROM Student 
    ORDER BY CGPA DESC;

| Student_name     | cgpa |
| ---------------- | ---- |
| Tony Stark       | 9.8  |
| Bruce Wayne      | 9.5  |
| Mary Jane        | 9.1  |
| Jean Grey        | 8.8  |
| John Doe         | 8.7  |
| Diana Prince     | 8.4  |
| Natasha Romanoff | 8.0  |
| Logan Howlett    | 7.7  |
| Steve Rogers     | 7.5  |
| Wanda Maximoff   | 7.2  |
| Clark Kent       | 6.9  |
| Barry Allen      | 6.5  |
| Scott Lang       | 5.8  |
| Peter Parker     |      |
|                  |      |

---
**Query #22**

    SELECT d.department_name , SUM(s.salary) AS TOTAL_EXPENDITURE
    FROM Department d
    LEFT JOIN Staff s
    ON d.department_id = s.department_id
    GROUP BY d.department_name;

| department_name  | TOTAL_EXPENDITURE |
| ---------------- | ----------------- |
| Computer Science | 177000.0          |
| Mechanical       | 146000.0          |
| Electronics      | 99000.0           |
| Civil            | 120000.0          |
| Mathematics      | 65000.0           |
|                  |                   |
| Biotechnology    |                   |

---
**Query #23**

    SELECT d.department_name , SUM(s.salary) AS TOTAL_EXPENDITURE
    FROM Department d
    LEFT JOIN Staff s
    ON d.department_id = s.department_id
    GROUP BY d.department_name
    HAVING SUM(s.salary) > 200000;

There are no results to be displayed.

---
**Query #24**

    SELECT STUDENT_NAME , ADMISSION_YEAR , CGPA 
    FROM Student
    HAVING ADMISSION_YEAR > 2021 AND CGPA > 7.5;

| STUDENT_NAME  | ADMISSION_YEAR | CGPA |
| ------------- | -------------- | ---- |
| Diana Prince  | 2022           | 8.4  |
| Logan Howlett | 2022           | 7.7  |

---
**Query #25**

    SELECT ADMISSION_YEAR , COUNT(*) AS STUDENT_ADMITTED 
    FROM Student 
    GROUP BY ADMISSION_YEAR;

| ADMISSION_YEAR | STUDENT_ADMITTED |
| -------------- | ---------------- |
| 2021           | 4                |
| 2020           | 3                |
| 2022           | 4                |
| 2019           | 2                |
| 2023           | 2                |

---
**Query #26**

    SELECT CITY , COUNT(*) AS TOTAL_STUDENTS
    FROM Student 
    GROUP BY CITY 
    ORDER BY TOTAL_STUDENTS DESC
    LIMIT 1;

| CITY     | TOTAL_STUDENTS |
| -------- | -------------- |
| New York | 2              |

---
**Query #27**

    SELECT d.department_name , COUNT(s.staff_id) AS TOTAL_STAFF 
    FROM Department d
    LEFT JOIN Staff s 
    ON d.department_id = s.department_id
    GROUP BY d.department_name;

| department_name  | TOTAL_STAFF |
| ---------------- | ----------- |
| Computer Science | 2           |
| Mechanical       | 2           |
| Electronics      | 2           |
| Civil            | 1           |
| Mathematics      | 1           |
|                  | 0           |
| Biotechnology    | 0           |

---
**Query #28**

    SELECT s.student_name , m.marks 
    FROM Student s
    LEFT JOIN Mark m 
    ON s.student_id = m.student_id 
    WHERE m.marks < 50 ;

| student_name | marks |
| ------------ | ----- |
| Scott Lang   | 44    |

---
**Query #29**

    SELECT staff_name , hire_date 
    FROM Staff 
    HAVING hire_date < '2018-01-01';

| staff_name    | hire_date  |
| ------------- | ---------- |
| Alice Johnson | 2015-06-12 |
| Bob Smith     | 2017-09-01 |
| Charlie Brown | 2014-03-21 |
| Eva Green     | 2013-11-05 |
| Grace Miller  | 2010-02-28 |
| Ivy Clark     | 2012-04-17 |

---
**Query #30**

    SELECT d.department_name 
    FROM Department d 
    LEFT JOIN Staff s
    ON d.department_id = s.department_id
    GROUP BY d.department_name 
    HAVING COUNT(CASE WHEN s.SALARY IS NULL THEN 1 END) = 0;

| department_name  |
| ---------------- |
| Computer Science |
| Mechanical       |
| Civil            |
| Mathematics      |

---
**Query #31**

    SELECT student_id ,student_name , cgpa , ROW_NUMBER() OVER(ORDER BY CGPA DESC) AS row_num
    FROM Student ;

| student_id | student_name     | cgpa | row_num |
| ---------- | ---------------- | ---- | ------- |
| 109        | Tony Stark       | 9.8  | 1       |
| 105        | Bruce Wayne      | 9.5  | 2       |
| 102        | Mary Jane        | 9.1  | 3       |
| 114        | Jean Grey        | 8.8  | 4       |
| 101        | John Doe         | 8.7  | 5       |
| 107        | Diana Prince     | 8.4  | 6       |
| 104        | Natasha Romanoff | 8.0  | 7       |
| 115        | Logan Howlett    | 7.7  | 8       |
| 103        | Steve Rogers     | 7.5  | 9       |
| 110        | Wanda Maximoff   | 7.2  | 10      |
| 106        | Clark Kent       | 6.9  | 11      |
| 111        | Barry Allen      | 6.5  | 12      |
| 113        | Scott Lang       | 5.8  | 13      |
| 108        | Peter Parker     |      | 14      |
| 112        |                  |      | 15      |

---
**Query #32**

    SELECT student_name , cgpa , RANK() OVER(ORDER BY CGPA DESC) AS STUDENT_RANK
    FROM Student;

| student_name     | cgpa | STUDENT_RANK |
| ---------------- | ---- | ------------ |
| Tony Stark       | 9.8  | 1            |
| Bruce Wayne      | 9.5  | 2            |
| Mary Jane        | 9.1  | 3            |
| Jean Grey        | 8.8  | 4            |
| John Doe         | 8.7  | 5            |
| Diana Prince     | 8.4  | 6            |
| Natasha Romanoff | 8.0  | 7            |
| Logan Howlett    | 7.7  | 8            |
| Steve Rogers     | 7.5  | 9            |
| Wanda Maximoff   | 7.2  | 10           |
| Clark Kent       | 6.9  | 11           |
| Barry Allen      | 6.5  | 12           |
| Scott Lang       | 5.8  | 13           |
| Peter Parker     |      | 14           |
|                  |      | 14           |

---
**Query #33**

    SELECT Staff_name , salary , DENSE_RANK() OVER(ORDER BY SALARY DESC) AS SALARY_DENSE_RANKK
    FROM Staff;

| Staff_name    | salary   | SALARY_DENSE_RANKK |
| ------------- | -------- | ------------------ |
| Grace Miller  | 120000.0 | 1                  |
| Eva Green     | 99000.0  | 2                  |
| Ivy Clark     | 98000.0  | 3                  |
| Alice Johnson | 95000.0  | 4                  |
| Charlie Brown | 91000.0  | 5                  |
| Bob Smith     | 82000.0  | 6                  |
| Henry Ford    | 65000.0  | 7                  |
| David Lee     | 55000.0  | 8                  |
|               | 50000.0  | 9                  |
| Frank Hall    |          | 10                 |

---
**Query #34**

    SELECT s.student_id, s.student_name , SUM(m.marks) AS TOTAL_MARKS , RANK() OVER(ORDER BY SUM(m.marks) DESC) AS STUDENT_RANKING 
    FROM Student s
    LEFT JOIN Mark m 
    ON s.student_id = m.student_id
    GROUP BY s.STUDENT_ID ,s.student_name 
    ORDER BY SUM(m.marks) DESC
    LIMIT 3;

| student_id | student_name | TOTAL_MARKS | STUDENT_RANKING |
| ---------- | ------------ | ----------- | --------------- |
| 101        | John Doe     | 254         | 1               |
| 109        | Tony Stark   | 196         | 2               |
| 105        | Bruce Wayne  | 192         | 3               |

---
**Query #35**

    SELECT s.student_name , sub.subject_name , m.EXAM_DATE ,m.marks , SUM(m.marks) OVER(PARTITION BY s.student_id ORDER BY m.exam_date) AS RUNNING_TOTALS
    FROM Mark m 
    LEFT JOIN Student s
    ON m.student_id = s.student_id 
    LEFT JOIN Subject sub
    ON m.subject_id = sub.subject_id;

| student_name     | subject_name            | EXAM_DATE  | marks | RUNNING_TOTALS |
| ---------------- | ----------------------- | ---------- | ----- | -------------- |
| John Doe         | Database Systems        | 2024-03-10 | 88    | 88             |
| John Doe         | Operating Systems       | 2024-03-11 | 75    | 163            |
| John Doe         | Database Systems        | 2024-05-10 | 91    | 254            |
| Mary Jane        | Database Systems        | 2024-03-10 | 95    | 95             |
| Mary Jane        | Operating Systems       | 2024-05-11 | 89    | 184            |
| Steve Rogers     | Machine Design          | 2024-03-09 | 66    | 66             |
| Steve Rogers     | Thermodynamics          | 2024-05-12 | 72    | 138            |
| Natasha Romanoff | Machine Design          | 2024-05-12 | 81    | 81             |
| Bruce Wayne      | Digital Electronics     | 2024-03-14 | 98    | 98             |
| Bruce Wayne      | Signals and Systems     | 2024-05-14 | 94    | 192            |
| Clark Kent       | Digital Electronics     | 2024-03-14 | 54    | 54             |
| Clark Kent       | Signals and Systems     | 2024-05-14 | 61    | 115            |
| Diana Prince     | Structural Engineering  | 2024-03-16 | 87    | 87             |
| Peter Parker     | Structural Engineering  | 2024-05-16 |       |                |
| Tony Stark       | Artificial Intelligence | 2024-03-20 | 97    | 97             |
| Tony Stark       | Database Systems        | 2024-05-10 | 99    | 196            |
| Wanda Maximoff   | Linear Algebra          | 2024-03-18 | 71    | 71             |
| Barry Allen      | Linear Algebra          | 2024-05-18 | 65    | 65             |
|                  |                         | 2024-03-21 |       |                |
| Scott Lang       | Artificial Intelligence | 2024-05-20 | 44    | 44             |
| Jean Grey        | Linear Algebra          | 2024-03-18 | 90    | 90             |
| Logan Howlett    |                         | 2024-05-22 | 73    | 73             |

---
**Query #36**

    SELECT DISTINCT s.subject_name , AVG(m.marks) OVER(PARTITION BY s.subject_id) AS AVG_MARKS
    FROM Mark m
    LEFT JOIN Subject s
    ON m.subject_id = s.subject_id;

| subject_name            | AVG_MARKS |
| ----------------------- | --------- |
| Database Systems        | 93.25     |
| Operating Systems       | 82.0      |
| Machine Design          | 73.5      |
| Thermodynamics          | 72.0      |
| Digital Electronics     | 76.0      |
| Signals and Systems     | 77.5      |
| Structural Engineering  | 87.0      |
| Linear Algebra          | 75.3333   |
|                         | 73.0      |
| Artificial Intelligence | 70.5      |

---
**Query #37**

    SELECT s.student_name , m.exam_date , m.marks ,LAG(m.marks) OVER(PARTITION BY s.student_id ORDER BY m.exam_date) AS PREVIOUS_EXAM_MARKS
    FROM Mark m 
    LEFT JOIN Student s
    ON m.student_id = s.student_id ;

| student_name     | exam_date  | marks | PREVIOUS_EXAM_MARKS |
| ---------------- | ---------- | ----- | ------------------- |
| John Doe         | 2024-03-10 | 88    |                     |
| John Doe         | 2024-03-11 | 75    | 88                  |
| John Doe         | 2024-05-10 | 91    | 75                  |
| Mary Jane        | 2024-03-10 | 95    |                     |
| Mary Jane        | 2024-05-11 | 89    | 95                  |
| Steve Rogers     | 2024-03-09 | 66    |                     |
| Steve Rogers     | 2024-05-12 | 72    | 66                  |
| Natasha Romanoff | 2024-05-12 | 81    |                     |
| Bruce Wayne      | 2024-03-14 | 98    |                     |
| Bruce Wayne      | 2024-05-14 | 94    | 98                  |
| Clark Kent       | 2024-03-14 | 54    |                     |
| Clark Kent       | 2024-05-14 | 61    | 54                  |
| Diana Prince     | 2024-03-16 | 87    |                     |
| Peter Parker     | 2024-05-16 |       |                     |
| Tony Stark       | 2024-03-20 | 97    |                     |
| Tony Stark       | 2024-05-10 | 99    | 97                  |
| Wanda Maximoff   | 2024-03-18 | 71    |                     |
| Barry Allen      | 2024-05-18 | 65    |                     |
|                  | 2024-03-21 |       |                     |
| Scott Lang       | 2024-05-20 | 44    |                     |
| Jean Grey        | 2024-03-18 | 90    |                     |
| Logan Howlett    | 2024-05-22 | 73    |                     |

---
**Query #38**

    SELECT s.student_name , m.exam_date , m.marks ,LEAD(m.marks) OVER(PARTITION BY s.student_id ORDER BY m.exam_date) AS NEXT_EXAM_MARKS
    FROM Mark m 
    LEFT JOIN Student s
    ON m.student_id = s.student_id ;

| student_name     | exam_date  | marks | NEXT_EXAM_MARKS |
| ---------------- | ---------- | ----- | --------------- |
| John Doe         | 2024-03-10 | 88    | 75              |
| John Doe         | 2024-03-11 | 75    | 91              |
| John Doe         | 2024-05-10 | 91    |                 |
| Mary Jane        | 2024-03-10 | 95    | 89              |
| Mary Jane        | 2024-05-11 | 89    |                 |
| Steve Rogers     | 2024-03-09 | 66    | 72              |
| Steve Rogers     | 2024-05-12 | 72    |                 |
| Natasha Romanoff | 2024-05-12 | 81    |                 |
| Bruce Wayne      | 2024-03-14 | 98    | 94              |
| Bruce Wayne      | 2024-05-14 | 94    |                 |
| Clark Kent       | 2024-03-14 | 54    | 61              |
| Clark Kent       | 2024-05-14 | 61    |                 |
| Diana Prince     | 2024-03-16 | 87    |                 |
| Peter Parker     | 2024-05-16 |       |                 |
| Tony Stark       | 2024-03-20 | 97    | 99              |
| Tony Stark       | 2024-05-10 | 99    |                 |
| Wanda Maximoff   | 2024-03-18 | 71    |                 |
| Barry Allen      | 2024-05-18 | 65    |                 |
|                  | 2024-03-21 |       |                 |
| Scott Lang       | 2024-05-20 | 44    |                 |
| Jean Grey        | 2024-03-18 | 90    |                 |
| Logan Howlett    | 2024-05-22 | 73    |                 |

---
**Query #39**

    SELECT DISTINCT s.subject_name , MAX(m.marks) OVER(PARTITION BY s.subject_id) 
    FROM Mark m 
    LEFT JOIN Subject s
    ON m.subject_id = s.subject_id;

| subject_name            | MAX(m.marks) OVER(PARTITION BY s.subject_id) |
| ----------------------- | -------------------------------------------- |
| Database Systems        | 99                                           |
| Operating Systems       | 89                                           |
| Machine Design          | 81                                           |
| Thermodynamics          | 72                                           |
| Digital Electronics     | 98                                           |
| Signals and Systems     | 94                                           |
| Structural Engineering  | 87                                           |
| Linear Algebra          | 90                                           |
|                         | 73                                           |
| Artificial Intelligence | 97                                           |

---
**Query #40**

    SELECT DISTINCT EXAM_DATE , AVG(MARKS) OVER(ORDER BY EXAM_DATE) AS CUMMULATIVE_AVERAGE
    FROM Mark ;

| EXAM_DATE  | CUMMULATIVE_AVERAGE |
| ---------- | ------------------- |
| 2024-03-09 | 66.0                |
| 2024-03-10 | 83.0                |
| 2024-03-11 | 81.0                |
| 2024-03-14 | 79.3333             |
| 2024-03-16 | 80.4286             |
| 2024-03-18 | 80.4444             |
| 2024-03-20 | 82.1                |
| 2024-03-21 | 82.1                |
| 2024-05-10 | 84.25               |
| 2024-05-11 | 84.6154             |
| 2024-05-12 | 83.5333             |
| 2024-05-14 | 82.8235             |
| 2024-05-16 | 82.8235             |
| 2024-05-18 | 81.8333             |
| 2024-05-20 | 79.8421             |
| 2024-05-22 | 79.5                |

---
**Query #41**

    SELECT * FROM (
      SELECT d.department_name , s.student_name ,s.admission_year , ROW_NUMBER() OVER(PARTITION BY d.department_id ORDER BY s.admission_year) AS ADMISSION_NUMBER
    FROM Department d
    LEFT JOIN Student s
    ON d.department_id = s.department_id) t
    WHERE ADMISSION_NUMBER =1 ;

| department_name  | student_name     | admission_year | ADMISSION_NUMBER |
| ---------------- | ---------------- | -------------- | ---------------- |
| Computer Science | Tony Stark       | 2019           | 1                |
| Mechanical       | Natasha Romanoff | 2021           | 1                |
| Electronics      | Bruce Wayne      | 2019           | 1                |
| Civil            | Peter Parker     | 2021           | 1                |
| Mathematics      | Wanda Maximoff   | 2022           | 1                |
|                  | Jean Grey        | 2020           | 1                |
| Biotechnology    | Logan Howlett    | 2022           | 1                |

---
**Query #42**

    SELECT * FROM (
      SELECT Staff_name , department_id , hire_date , ROW_NUMBER() OVER(PARTITION BY department_id ORDER BY hire_date DESC ) AS JOINING_NUMBER
      FROM Staff )t
      WHERE JOINING_NUMBER =1;

| Staff_name   | department_id | hire_date  | JOINING_NUMBER |
| ------------ | ------------- | ---------- | -------------- |
|              |               | 2022-08-18 | 1              |
| Bob Smith    | 1             | 2017-09-01 | 1              |
| David Lee    | 2             | 2020-07-15 | 1              |
| Frank Hall   | 3             | 2021-01-12 | 1              |
| Grace Miller | 4             | 2010-02-28 | 1              |
| Henry Ford   | 5             |            | 1              |

---
**Query #43**

    SELECT student_name, cgpa,
    NTILE(4) OVER (ORDER BY cgpa) AS quartile
    FROM Student;

| student_name     | cgpa | quartile |
| ---------------- | ---- | -------- |
| Peter Parker     |      | 1        |
|                  |      | 1        |
| Scott Lang       | 5.8  | 1        |
| Barry Allen      | 6.5  | 1        |
| Clark Kent       | 6.9  | 2        |
| Wanda Maximoff   | 7.2  | 2        |
| Steve Rogers     | 7.5  | 2        |
| Logan Howlett    | 7.7  | 2        |
| Natasha Romanoff | 8.0  | 3        |
| Diana Prince     | 8.4  | 3        |
| John Doe         | 8.7  | 3        |
| Jean Grey        | 8.8  | 3        |
| Mary Jane        | 9.1  | 4        |
| Bruce Wayne      | 9.5  | 4        |
| Tony Stark       | 9.8  | 4        |

---
**Query #44**

    SELECT student_name,
           cgpa,
           PERCENT_RANK() OVER (ORDER BY cgpa DESC) AS percentage_rank
    FROM Student
    WHERE cgpa IS NOT NULL;

| student_name     | cgpa | percentage_rank     |
| ---------------- | ---- | ------------------- |
| Tony Stark       | 9.8  | 0                   |
| Bruce Wayne      | 9.5  | 0.08333333333333333 |
| Mary Jane        | 9.1  | 0.16666666666666666 |
| Jean Grey        | 8.8  | 0.25                |
| John Doe         | 8.7  | 0.3333333333333333  |
| Diana Prince     | 8.4  | 0.4166666666666667  |
| Natasha Romanoff | 8.0  | 0.5                 |
| Logan Howlett    | 7.7  | 0.5833333333333334  |
| Steve Rogers     | 7.5  | 0.6666666666666666  |
| Wanda Maximoff   | 7.2  | 0.75                |
| Clark Kent       | 6.9  | 0.8333333333333334  |
| Barry Allen      | 6.5  | 0.9166666666666666  |
| Scott Lang       | 5.8  | 1                   |

---
**Query #45**

    SELECT staff_name, salary,
    CUME_DIST() OVER (ORDER BY salary) AS cumulative_distribution
    FROM Staff;

| staff_name    | salary   | cumulative_distribution |
| ------------- | -------- | ----------------------- |
| Frank Hall    |          | 0.1                     |
|               | 50000.0  | 0.2                     |
| David Lee     | 55000.0  | 0.3                     |
| Henry Ford    | 65000.0  | 0.4                     |
| Bob Smith     | 82000.0  | 0.5                     |
| Charlie Brown | 91000.0  | 0.6                     |
| Alice Johnson | 95000.0  | 0.7                     |
| Ivy Clark     | 98000.0  | 0.8                     |
| Eva Green     | 99000.0  | 0.9                     |
| Grace Miller  | 120000.0 | 1                       |

---
**Query #46**

    SELECT s.student_name, sub.subject_name, m.marks
    FROM Mark m
    JOIN Student s
    ON m.student_id = s.student_id
    JOIN Subject sub
    ON m.subject_id = sub.subject_id
    WHERE m.marks >
    (
        SELECT AVG(m2.marks)
        FROM Mark m2
        WHERE m2.subject_id = m.subject_id
    );

| student_name     | subject_name            | marks |
| ---------------- | ----------------------- | ----- |
| Mary Jane        | Database Systems        | 95    |
| Mary Jane        | Operating Systems       | 89    |
| Natasha Romanoff | Machine Design          | 81    |
| Bruce Wayne      | Digital Electronics     | 98    |
| Bruce Wayne      | Signals and Systems     | 94    |
| Tony Stark       | Database Systems        | 99    |
| Tony Stark       | Artificial Intelligence | 97    |
| Jean Grey        | Linear Algebra          | 90    |

---
**Query #47**

    SELECT d.department_name, AVG(st.salary) AS avg_salary
    FROM Department d
    JOIN Staff st
    ON d.department_id = st.department_id
    GROUP BY d.department_name
    HAVING AVG(st.salary) >
    (
        SELECT AVG(salary)
        FROM Staff
    );

| department_name  | avg_salary |
| ---------------- | ---------- |
| Computer Science | 88500.0    |
| Electronics      | 99000.0    |
| Civil            | 120000.0   |

---
**Query #48**

    SELECT s.student_name, m.marks
    FROM Student s
    JOIN Mark m
    ON s.student_id = m.student_id
    WHERE m.marks >
    (
        SELECT AVG(m2.marks)
        FROM Mark m2
        JOIN Student s2
        ON m2.student_id = s2.student_id
        WHERE s2.department_id = s.department_id
    );

| student_name     | marks |
| ---------------- | ----- |
| John Doe         | 91    |
| Mary Jane        | 95    |
| Natasha Romanoff | 81    |
| Bruce Wayne      | 98    |
| Bruce Wayne      | 94    |
| Tony Stark       | 99    |
| Tony Stark       | 97    |
| Wanda Maximoff   | 71    |

---
**Query #49**

    SELECT
    s.student_name,
    d.department_name,
    sub.subject_name,
    m.exam_type,
    m.marks,
    AVG(m.marks) OVER (PARTITION BY d.department_id) AS dept_avg,
    RANK() OVER (ORDER BY m.marks DESC) AS overall_rank
    FROM Mark m
    JOIN Student s
    ON m.student_id = s.student_id
    JOIN Department d
    ON s.department_id = d.department_id
    JOIN Subject sub
    ON m.subject_id = sub.subject_id;

| student_name     | department_name  | subject_name            | exam_type | marks | dept_avg | overall_rank |
| ---------------- | ---------------- | ----------------------- | --------- | ----- | -------- | ------------ |
| Tony Stark       | Computer Science | Database Systems        | Final     | 99    | 90.5714  | 1            |
| Bruce Wayne      | Electronics      | Digital Electronics     | Mid       | 98    | 76.75    | 2            |
| Tony Stark       | Computer Science | Artificial Intelligence | Mid       | 97    | 90.5714  | 3            |
| Mary Jane        | Computer Science | Database Systems        | Mid       | 95    | 90.5714  | 4            |
| Bruce Wayne      | Electronics      | Signals and Systems     | Final     | 94    | 76.75    | 5            |
| John Doe         | Computer Science | Database Systems        | Final     | 91    | 90.5714  | 6            |
| Jean Grey        |                  | Linear Algebra          | Mid       | 90    | 90.0     | 7            |
| Mary Jane        | Computer Science | Operating Systems       | Final     | 89    | 90.5714  | 8            |
| John Doe         | Computer Science | Database Systems        | Mid       | 88    | 90.5714  | 9            |
| Diana Prince     | Civil            | Structural Engineering  | Mid       | 87    | 87.0     | 10           |
| Natasha Romanoff | Mechanical       | Machine Design          | Final     | 81    | 73.0     | 11           |
| John Doe         | Computer Science | Operating Systems       | Mid       | 75    | 90.5714  | 12           |
| Logan Howlett    | Biotechnology    |                         | Final     | 73    | 73.0     | 13           |
| Steve Rogers     | Mechanical       | Thermodynamics          | Final     | 72    | 73.0     | 14           |
| Wanda Maximoff   | Mathematics      | Linear Algebra          | Mid       | 71    | 68.0     | 15           |
| Steve Rogers     | Mechanical       | Machine Design          | Mid       | 66    | 73.0     | 16           |
| Barry Allen      | Mathematics      | Linear Algebra          | Final     | 65    | 68.0     | 17           |
| Clark Kent       | Electronics      | Signals and Systems     | Final     | 61    | 76.75    | 18           |
| Clark Kent       | Electronics      | Digital Electronics     | Mid       | 54    | 76.75    | 19           |
| Peter Parker     | Civil            | Structural Engineering  | Final     |       | 87.0     | 20           |

---
