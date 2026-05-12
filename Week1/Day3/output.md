**Schema (MySQL v5.7)**

    DROP TABLE IF EXISTS enrollments;
    DROP TABLE IF EXISTS courses;
    DROP TABLE IF EXISTS students;
    DROP TABLE IF EXISTS instructors;
    
    CREATE TABLE instructors (
        instructor_id INT PRIMARY KEY,
        instructor_name VARCHAR(100),
        department VARCHAR(100)
    );
    
    CREATE TABLE students (
        student_id INT PRIMARY KEY,
        student_name VARCHAR(100),
        email VARCHAR(100)
    );
    
    CREATE TABLE courses (
        course_id INT PRIMARY KEY,
        course_name VARCHAR(100),
        instructor_id INT NULL,
        FOREIGN KEY (instructor_id) REFERENCES instructors(instructor_id)
    );
    
    CREATE TABLE enrollments (
        enrollment_id INT PRIMARY KEY,
        student_id INT,
        course_id INT,
        enrollment_date DATE,
        FOREIGN KEY (student_id) REFERENCES students(student_id),
        FOREIGN KEY (course_id) REFERENCES courses(course_id)
    );
    
    -- Insert instructors
    INSERT INTO instructors VALUES
    (1, 'Sarah Connor', 'Databases'),
    (2, 'Michael Scott', 'Programming'),
    (3, 'Tony Stark', 'Cloud Computing'),
    (4, 'Bruce Wayne', 'Cyber Security');
    
    -- Insert students
    INSERT INTO students VALUES
    (1, 'Alice Johnson', 'alice@email.com'),
    (2, 'Bob Smith', 'bob@email.com'),
    (3, 'Charlie Brown', 'charlie@email.com'),
    (4, 'Diana Prince', 'diana@email.com'),
    (5, 'Ethan Hunt', 'ethan@email.com'),
    (6, 'Fiona Green', 'fiona@email.com');
    
    -- Insert courses
    INSERT INTO courses VALUES
    (101, 'SQL Basics', 1),
    (102, 'Python Fundamentals', 2),
    (103, 'Data Analytics', NULL),
    (104, 'Cloud Computing', 3),
    (105, 'Machine Learning', NULL),
    (106, 'Cyber Security', 4);
    
    -- Insert enrollments
    INSERT INTO enrollments VALUES
    (1, 1, 101, '2024-01-10'),
    (2, 1, 102, '2024-01-12'),
    (3, 2, 101, '2024-01-15'),
    (4, 3, 104, '2024-01-20'),
    (5, 4, 106, '2024-01-25');
    
    -- Notes:
    -- Student 5 and 6 are not enrolled in any course.
    -- Courses 103 and 105 have no instructor assigned.
    -- Courses 103 and 105 also have no enrollments.
    -- Instructor 4 teaches one course.

---

**Query #1**

    -- 1
    SELECT s.student_id, s.student_name, c.course_id, c.course_name, e.enrollment_date
    FROM students s
    LEFT JOIN enrollments e ON s.student_id = e.student_id
    LEFT JOIN courses c ON e.course_id = c.course_id
    ORDER BY s.student_id;

| student_id | student_name  | course_id | course_name         | enrollment_date |
| ---------- | ------------- | --------- | ------------------- | --------------- |
| 1          | Alice Johnson | 102       | Python Fundamentals | 2024-01-12      |
| 1          | Alice Johnson | 101       | SQL Basics          | 2024-01-10      |
| 2          | Bob Smith     | 101       | SQL Basics          | 2024-01-15      |
| 3          | Charlie Brown | 104       | Cloud Computing     | 2024-01-20      |
| 4          | Diana Prince  | 106       | Cyber Security      | 2024-01-25      |
| 5          | Ethan Hunt    |           |                     |                 |
| 6          | Fiona Green   |           |                     |                 |

---
**Query #2**

    -- 2
    SELECT c.course_id, c.course_name
    FROM courses c
    LEFT JOIN enrollments e ON c.course_id = e.course_id
    WHERE e.enrollment_id IS NULL;

| course_id | course_name      |
| --------- | ---------------- |
| 103       | Data Analytics   |
| 105       | Machine Learning |

---
**Query #3**

    -- 3
    SELECT i.instructor_id, i.instructor_name, c.course_id, c.course_name
    FROM instructors i
    LEFT JOIN courses c ON i.instructor_id = c.instructor_id
    ORDER BY i.instructor_id;

| instructor_id | instructor_name | course_id | course_name         |
| ------------- | --------------- | --------- | ------------------- |
| 1             | Sarah Connor    | 101       | SQL Basics          |
| 2             | Michael Scott   | 102       | Python Fundamentals |
| 3             | Tony Stark      | 104       | Cloud Computing     |
| 4             | Bruce Wayne     | 106       | Cyber Security      |

---
**Query #4**

    -- 4
    SELECT c.course_id, c.course_name
    FROM courses c
    LEFT JOIN instructors i ON i.instructor_id = c.instructor_id
    WHERE i.instructor_id IS NULL;

| course_id | course_name      |
| --------- | ---------------- |
| 103       | Data Analytics   |
| 105       | Machine Learning |

---
**Query #5**

    -- 5
    SELECT s.student_id, s.student_name, s.email, e.enrollment_id, e.course_id, e.enrollment_date
    FROM enrollments e
    RIGHT JOIN students s
    ON s.student_id = e.student_id
    ORDER BY s.student_id, e.enrollment_date;

| student_id | student_name  | email             | enrollment_id | course_id | enrollment_date |
| ---------- | ------------- | ----------------- | ------------- | --------- | --------------- |
| 1          | Alice Johnson | alice@email.com   | 1             | 101       | 2024-01-10      |
| 1          | Alice Johnson | alice@email.com   | 2             | 102       | 2024-01-12      |
| 2          | Bob Smith     | bob@email.com     | 3             | 101       | 2024-01-15      |
| 3          | Charlie Brown | charlie@email.com | 4             | 104       | 2024-01-20      |
| 4          | Diana Prince  | diana@email.com   | 5             | 106       | 2024-01-25      |
| 5          | Ethan Hunt    | ethan@email.com   |               |           |                 |
| 6          | Fiona Green   | fiona@email.com   |               |           |                 |

---
**Query #6**

    -- 6
    SELECT s.student_id, s.student_name, s.email
    FROM students s
    LEFT JOIN enrollments e
    ON s.student_id = e.student_id
    WHERE e.enrollment_id IS NULL;

| student_id | student_name | email           |
| ---------- | ------------ | --------------- |
| 5          | Ethan Hunt   | ethan@email.com |
| 6          | Fiona Green  | fiona@email.com |

---
**Query #7**

    -- 7
    SELECT s.student_id, s.student_name, s.email, e.enrollment_id, e.course_id, e.enrollment_date
    FROM students s
    LEFT JOIN enrollments e
    ON s.student_id = e.student_id
    UNION
    SELECT s.student_id, s.student_name, s.email, e.enrollment_id, e.course_id, e.enrollment_date
    FROM students s
    RIGHT JOIN enrollments e
    ON s.student_id = e.student_id;

| student_id | student_name  | email             | enrollment_id | course_id | enrollment_date |
| ---------- | ------------- | ----------------- | ------------- | --------- | --------------- |
| 1          | Alice Johnson | alice@email.com   | 1             | 101       | 2024-01-10      |
| 1          | Alice Johnson | alice@email.com   | 2             | 102       | 2024-01-12      |
| 2          | Bob Smith     | bob@email.com     | 3             | 101       | 2024-01-15      |
| 3          | Charlie Brown | charlie@email.com | 4             | 104       | 2024-01-20      |
| 4          | Diana Prince  | diana@email.com   | 5             | 106       | 2024-01-25      |
| 5          | Ethan Hunt    | ethan@email.com   |               |           |                 |
| 6          | Fiona Green   | fiona@email.com   |               |           |                 |

---
**Query #8**

    -- 8
    SELECT c.course_id, c.course_name, e.enrollment_id
    FROM courses c
    LEFT JOIN enrollments e
    ON c.course_id = e.course_id
    WHERE e.course_id IS NULL;

| course_id | course_name      | enrollment_id |
| --------- | ---------------- | ------------- |
| 103       | Data Analytics   |               |
| 105       | Machine Learning |               |

---
**Query #9**

    -- 9
    SELECT i.instructor_id,i.instructor_name,i.department,c.course_id,c.course_name,c.instructor_id,
    CASE
    WHEN i.instructor_id IS NULL THEN 'Unmatched Course'
    WHEN c.course_id IS NULL THEN 'Unmatched Instructor'
    ELSE 'Matched'
    END AS match_status
    FROM instructors i
    LEFT JOIN courses c
    ON i.instructor_id = c.instructor_id
    UNION ALL
    SELECT i.instructor_id,i.instructor_name,i.department,c.course_id,c.course_name,c.instructor_id,
    CASE
    WHEN i.instructor_id IS NULL THEN 'Unmatched Course'
    WHEN c.course_id IS NULL THEN 'Unmatched Instructor'
    ELSE 'Matched'
    END AS match_status
    FROM instructors i
    RIGHT JOIN courses c
    ON i.instructor_id = c.instructor_id;

| instructor_id | instructor_name | department      | course_id | course_name         | instructor_id | match_status     |
| ------------- | --------------- | --------------- | --------- | ------------------- | ------------- | ---------------- |
| 1             | Sarah Connor    | Databases       | 101       | SQL Basics          | 1             | Matched          |
| 2             | Michael Scott   | Programming     | 102       | Python Fundamentals | 2             | Matched          |
| 3             | Tony Stark      | Cloud Computing | 104       | Cloud Computing     | 3             | Matched          |
| 4             | Bruce Wayne     | Cyber Security  | 106       | Cyber Security      | 4             | Matched          |
| 1             | Sarah Connor    | Databases       | 101       | SQL Basics          | 1             | Matched          |
| 2             | Michael Scott   | Programming     | 102       | Python Fundamentals | 2             | Matched          |
| 3             | Tony Stark      | Cloud Computing | 104       | Cloud Computing     | 3             | Matched          |
| 4             | Bruce Wayne     | Cyber Security  | 106       | Cyber Security      | 4             | Matched          |
|               |                 |                 | 103       | Data Analytics      |               | Unmatched Course |
|               |                 |                 | 105       | Machine Learning    |               | Unmatched Course |

---
**Query #10**

    -- 10
    SELECT s.student_name, c.course_name, i.instructor_name
    FROM students s
    LEFT JOIN enrollments e ON s.student_id = e.student_id
    LEFT JOIN courses c ON e.course_id = c.course_id
    LEFT JOIN instructors i ON c.instructor_id = i.instructor_id;

| student_name  | course_name         | instructor_name |
| ------------- | ------------------- | --------------- |
| Alice Johnson | SQL Basics          | Sarah Connor    |
| Alice Johnson | Python Fundamentals | Michael Scott   |
| Bob Smith     | SQL Basics          | Sarah Connor    |
| Charlie Brown | Cloud Computing     | Tony Stark      |
| Diana Prince  | Cyber Security      | Bruce Wayne     |
| Ethan Hunt    |                     |                 |
| Fiona Green   |                     |                 |

---
**Query #11**

    -- 11 
    SELECT s.student_name, c.course_name
    FROM students s
    CROSS JOIN courses c
    ORDER BY s.student_id;

| student_name  | course_name         |
| ------------- | ------------------- |
| Alice Johnson | Cyber Security      |
| Alice Johnson | SQL Basics          |
| Alice Johnson | Python Fundamentals |
| Alice Johnson | Data Analytics      |
| Alice Johnson | Cloud Computing     |
| Alice Johnson | Machine Learning    |
| Bob Smith     | SQL Basics          |
| Bob Smith     | Python Fundamentals |
| Bob Smith     | Data Analytics      |
| Bob Smith     | Cloud Computing     |
| Bob Smith     | Machine Learning    |
| Bob Smith     | Cyber Security      |
| Charlie Brown | SQL Basics          |
| Charlie Brown | Python Fundamentals |
| Charlie Brown | Data Analytics      |
| Charlie Brown | Cloud Computing     |
| Charlie Brown | Machine Learning    |
| Charlie Brown | Cyber Security      |
| Diana Prince  | SQL Basics          |
| Diana Prince  | Python Fundamentals |
| Diana Prince  | Data Analytics      |
| Diana Prince  | Cloud Computing     |
| Diana Prince  | Machine Learning    |
| Diana Prince  | Cyber Security      |
| Ethan Hunt    | SQL Basics          |
| Ethan Hunt    | Python Fundamentals |
| Ethan Hunt    | Data Analytics      |
| Ethan Hunt    | Cloud Computing     |
| Ethan Hunt    | Machine Learning    |
| Ethan Hunt    | Cyber Security      |
| Fiona Green   | Data Analytics      |
| Fiona Green   | Cloud Computing     |
| Fiona Green   | Machine Learning    |
| Fiona Green   | Cyber Security      |
| Fiona Green   | SQL Basics          |
| Fiona Green   | Python Fundamentals |

---

[View on DB Fiddle](https://www.db-fiddle.com/)
