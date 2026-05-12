-- 1
SELECT s.student_id, s.student_name, c.course_id, c.course_name, e.enrollment_date
FROM students s
LEFT JOIN enrollments e ON s.student_id = e.student_id
LEFT JOIN courses c ON e.course_id = c.course_id
ORDER BY s.student_id;

-- 2
SELECT c.course_id, c.course_name
FROM courses c
LEFT JOIN enrollments e ON c.course_id = e.course_id
WHERE e.enrollment_id IS NULL;

-- 3
SELECT i.instructor_id, i.instructor_name, c.course_id, c.course_name
FROM instructors i
LEFT JOIN courses c ON i.instructor_id = c.instructor_id
ORDER BY i.instructor_id;

-- 4
SELECT c.course_id, c.course_name
FROM courses c
LEFT JOIN instructors i ON i.instructor_id = c.instructor_id
WHERE i.instructor_id IS NULL;

-- 5
SELECT s.student_id, s.student_name, s.email, e.enrollment_id, e.course_id, e.enrollment_date
FROM enrollments e
RIGHT JOIN students s
ON s.student_id = e.student_id
ORDER BY s.student_id, e.enrollment_date;

-- 6
SELECT s.student_id, s.student_name, s.email
FROM students s
LEFT JOIN enrollments e
ON s.student_id = e.student_id
WHERE e.enrollment_id IS NULL;

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

-- 8
SELECT c.course_id, c.course_name, e.enrollment_id
FROM courses c
LEFT JOIN enrollments e
ON c.course_id = e.course_id
WHERE e.course_id IS NULL;

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

-- 10
SELECT s.student_name, c.course_name, i.instructor_name
FROM students s
LEFT JOIN enrollments e ON s.student_id = e.student_id
LEFT JOIN courses c ON e.course_id = c.course_id
LEFT JOIN instructors i ON c.instructor_id = i.instructor_id;

-- 11 
SELECT s.student_name, c.course_name
FROM students s
CROSS JOIN courses c
ORDER BY s.student_id;
