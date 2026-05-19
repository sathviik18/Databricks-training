--1
SELECT s.student_id ,s.student_name , d.department_name
FROM Student s
LEFT JOIN Department d
ON s.department_id = d.department_id
GROUP BY s.student_id , s.student_name;

--2
SELECT s.staff_id , s.staff_name , d.department_name 
FROM Staff s
LEFT JOIN Department d
ON s.department_id = d.department_id 
GROUP BY s.staff_id , s.staff_name;

--3
SELECT d.department_id ,d.department_name 
FROM Department d
LEFT JOIN Student s
ON d.DEPARTMENT_ID = s.DEPARTMENT_ID
WHERE s.student_id IS NULL;

--4
SELECT s.student_id , s.student_name , m.MARKS
FROM Student s
LEFT JOIN Mark m 
ON s.student_id = m.student_id
WHERE m.marks IS NULL;

--5
SELECT subject_id , subject_name
FROM Subject 
WHERE staff_id IS NULL;

--6
SELECT d.department_name , AVG(s.cgpa) AS AVG_CGPA 
FROM Department d
LEFT JOIN Student s
ON d.department_id = s.department_id
GROUP BY d.department_name;

--7
SELECT d.department_NAME , AVG(s.cgpa) AS AVG_CPGA 
FROM Department d
LEFT JOIN Student s
ON d.department_id = s.department_id 
GROUP BY d.department_name
HAVING AVG(s.cgpa) > 8.0;

--8
SELECT d.department_name , COUNT(s.student_id) AS NO_OF_STUDENTS
FROM Department d
LEFT JOIN Student s
ON d.department_ID = s.department_id
GROUP BY d.department_name;

--9
SELECT s.subject_name , MAX(m.marks) AS HIGHEST_MARKS , MIN(m.marks) AS LOWEST_MARKS 
FROM Subject s
LEFT JOIN Mark m
ON s.subject_id = m.subject_id 
GROUP BY s.subject_name;

--10
SELECT s.student_name , m.marks 
FROM Student s
LEFT JOIN Mark m 
ON s.student_id = m.student_id 
WHERE m.marks > 90;

--11
SELECT s.student_name , d.department_name 
FROM Student s
LEFT JOIN Department d
ON s.department_id = d.department_id
WHERE d.department_NAME = 'Computer Science';

--12
SELECT s.staff_name , COUNT(sub.subject_id) AS SUBJECTS_HANDLED
FROM Staff s
LEFT JOIN Subject sub 
ON s.staff_id = sub.staff_id 
GROUP BY s.staff_name;

--13
SELECT s.student_name , SUM(m.marks) AS TOTAL_MARKS 
FROM Student s
LEFT JOIN Mark m 
ON s.student_id = m.student_id
GROUP BY s.student_name;

--14
SELECT d.department_name , COUNT(s.staff_id) AS STAFF_COUNT 
FROM Department d
LEFT JOIN Staff s
ON d.department_id = s.staff_id
GROUP BY d.department_name
HAVING COUNT(s.staff_id) > 2;

--15
SELECT STUDENT_NAME , CGPA 
FROM Student 
WHERE CGPA > (SELECT AVG(CGPA) FROM Student);

--16
SELECT st.staff_name , st.salary 
FROM Staff st
WHERE st.salary > (SELECT AVG(SALARY)
                   FROM Staff
                   WHERE department_id = st.staff_id);

--17
SELECT MAX(salary) AS second_highest_salary
FROM Staff
WHERE salary <
(
    SELECT MAX(salary)
    FROM Staff
);

--18
SELECT * FROM (
  SELECT s.student_name , sub.subject_name ,m.marks , RANK() OVER(PARTITION BY sub.subject_id ORDER BY m.marks DESC) AS student_rank
FROM Mark m 
LEFT JOIN Student s
ON m.student_id = s.student_id 
LEFT JOIN Subject sub 
ON m.subject_id = sub.subject_id
  )t
  WHERE student_rank = 1;

--19
SELECT s.student_id, s.student_name , m.marks 
FROM Student s
LEFT JOIN Mark m 
ON s.student_id = m.student_id;

--20
SELECT s.subject_name , AVG(m.marks) AS AVG_MARKS 
FROM Subject s
LEFT JOIN Mark m 
ON s.subject_id = m.subject_id
GROUP BY s.subject_name 
HAVING AVG(m.marks) < 70;

--21
SELECT Student_name , cgpa 
FROM Student 
ORDER BY CGPA DESC;

--22
SELECT d.department_name , SUM(s.salary) AS TOTAL_EXPENDITURE
FROM Department d
LEFT JOIN Staff s
ON d.department_id = s.department_id
GROUP BY d.department_name;

--23
SELECT d.department_name , SUM(s.salary) AS TOTAL_EXPENDITURE
FROM Department d
LEFT JOIN Staff s
ON d.department_id = s.department_id
GROUP BY d.department_name
HAVING SUM(s.salary) > 200000;

--24
SELECT STUDENT_NAME , ADMISSION_YEAR , CGPA 
FROM Student
HAVING ADMISSION_YEAR > 2021 AND CGPA > 7.5;

--25
SELECT ADMISSION_YEAR , COUNT(*) AS STUDENT_ADMITTED 
FROM Student 
GROUP BY ADMISSION_YEAR;

--26
SELECT CITY , COUNT(*) AS TOTAL_STUDENTS
FROM Student 
GROUP BY CITY 
ORDER BY TOTAL_STUDENTS DESC
LIMIT 1;

--27
SELECT d.department_name , COUNT(s.staff_id) AS TOTAL_STAFF 
FROM Department d
LEFT JOIN Staff s 
ON d.department_id = s.department_id
GROUP BY d.department_name;

--28
SELECT s.student_name , m.marks 
FROM Student s
LEFT JOIN Mark m 
ON s.student_id = m.student_id 
WHERE m.marks < 50 ;

--29
SELECT staff_name , hire_date 
FROM Staff 
HAVING hire_date < '2018-01-01';

--30
SELECT d.department_name 
FROM Department d 
LEFT JOIN Staff s
ON d.department_id = s.department_id
GROUP BY d.department_name 
HAVING COUNT(CASE WHEN s.SALARY IS NULL THEN 1 END) = 0;

--31
SELECT student_id ,student_name , cgpa , ROW_NUMBER() OVER(ORDER BY CGPA DESC) AS row_num
FROM Student ;

--32
SELECT student_name , cgpa , RANK() OVER(ORDER BY CGPA DESC) AS STUDENT_RANK
FROM Student;

--33
SELECT Staff_name , salary , DENSE_RANK() OVER(ORDER BY SALARY DESC) AS SALARY_DENSE_RANKK
FROM Staff;

--34
SELECT s.student_id, s.student_name , SUM(m.marks) AS TOTAL_MARKS , RANK() OVER(ORDER BY SUM(m.marks) DESC) AS STUDENT_RANKING 
FROM Student s
LEFT JOIN Mark m 
ON s.student_id = m.student_id
GROUP BY s.STUDENT_ID ,s.student_name 
ORDER BY SUM(m.marks) DESC
LIMIT 3;

--35
SELECT s.student_name , sub.subject_name , m.EXAM_DATE ,m.marks , SUM(m.marks) OVER(PARTITION BY s.student_id ORDER BY m.exam_date) AS RUNNING_TOTALS
FROM Mark m 
LEFT JOIN Student s
ON m.student_id = s.student_id 
LEFT JOIN Subject sub
ON m.subject_id = sub.subject_id;

--36
SELECT DISTINCT s.subject_name , AVG(m.marks) OVER(PARTITION BY s.subject_id) AS AVG_MARKS
FROM Mark m
LEFT JOIN Subject s
ON m.subject_id = s.subject_id;

--37
SELECT s.student_name , m.exam_date , m.marks ,LAG(m.marks) OVER(PARTITION BY s.student_id ORDER BY m.exam_date) AS PREVIOUS_EXAM_MARKS
FROM Mark m 
LEFT JOIN Student s
ON m.student_id = s.student_id ;

--38
SELECT s.student_name , m.exam_date , m.marks ,LEAD(m.marks) OVER(PARTITION BY s.student_id ORDER BY m.exam_date) AS NEXT_EXAM_MARKS
FROM Mark m 
LEFT JOIN Student s
ON m.student_id = s.student_id ;

--39
SELECT DISTINCT s.subject_name , MAX(m.marks) OVER(PARTITION BY s.subject_id) 
FROM Mark m 
LEFT JOIN Subject s
ON m.subject_id = s.subject_id;

--40
SELECT DISTINCT EXAM_DATE , AVG(MARKS) OVER(ORDER BY EXAM_DATE) AS CUMMULATIVE_AVERAGE
FROM Mark ;

--41
SELECT * FROM (
  SELECT d.department_name , s.student_name ,s.admission_year , ROW_NUMBER() OVER(PARTITION BY d.department_id ORDER BY s.admission_year) AS ADMISSION_NUMBER
FROM Department d
LEFT JOIN Student s
ON d.department_id = s.department_id) t
WHERE ADMISSION_NUMBER =1 ;

--42
SELECT * FROM (
  SELECT Staff_name , department_id , hire_date , ROW_NUMBER() OVER(PARTITION BY department_id ORDER BY hire_date DESC ) AS JOINING_NUMBER
  FROM Staff )t
  WHERE JOINING_NUMBER =1;

--43
SELECT student_name, cgpa,
NTILE(4) OVER (ORDER BY cgpa) AS quartile
FROM Student;

--44
SELECT student_name,
       cgpa,
       PERCENT_RANK() OVER (ORDER BY cgpa DESC) AS percentage_rank
FROM Student
WHERE cgpa IS NOT NULL;

--45
SELECT staff_name, salary,
CUME_DIST() OVER (ORDER BY salary) AS cumulative_distribution
FROM Staff;

--46
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

--47
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

--48
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

--49
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
