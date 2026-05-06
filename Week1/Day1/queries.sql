
-- Basic Queries (5)

-- 1. Select all columns from the Employee table.
SELECT * FROM Employee;

-- 2. Select only the name and salary columns from the Employee table.
SELECT name, salary FROM Employee;

-- 3. Select employees who are older than 30.
SELECT * FROM Employee WHERE age > 30;

-- 4. Select the names of all departments.
SELECT name FROM Department;

-- 5. Select employees who work in the IT department.
SELECT * FROM Employee WHERE department_id = (SELECT department_id FROM Department WHERE name = 'IT');


-- String Matching Queries (5)

-- 6. Select employees whose names start with 'J'.
SELECT * FROM Employee WHERE name LIKE 'J%';

-- 7. Select employees whose names end with 'e'.
SELECT * FROM Employee WHERE name LIKE '%e';

-- 8. Select employees whose names contain 'a'.
SELECT * FROM Employee WHERE name LIKE '%a%';

-- 9. Select employees whose names are exactly 9 characters long.
SELECT * FROM Employee WHERE LENGTH(name) = 9;

-- 10. Select employees whose names have 'o' as the second character.
SELECT * FROM Employee WHERE name LIKE '_o%';


-- Date Queries (5)

-- 11. Select employees hired in the year 2020.
SELECT * FROM Employee WHERE EXTRACT(YEAR FROM hire_date) = 2020;

-- 12. Select employees hired in January of any year.
SELECT * FROM Employee WHERE EXTRACT(MONTH FROM hire_date) = 1;

-- 13. Select employees hired before 2019.
SELECT * FROM Employee WHERE hire_date < '2019-01-01';

-- 14. Select employees hired on or after March 1, 2021.
SELECT * FROM Employee WHERE hire_date >= '2021-03-01';

-- 15. Select employees hired in the last 2 years.
SELECT * FROM Employee WHERE hire_date >= CURRENT_DATE - INTERVAL '2 years';


-- Aggregate Queries (5)

-- 16. Select the total salary of all employees.
SELECT SUM(salary) FROM Employee;

-- 17. Select the average salary of employees.
SELECT AVG(salary) FROM Employee;

-- 18. Select the minimum salary in the Employee table.
SELECT MIN(salary) FROM Employee;

-- 19. Select the number of employees in each department.
SELECT department_id, COUNT(*) FROM Employee GROUP BY department_id;

-- 20. Select the average salary of employees in each department.
SELECT department_id, AVG(salary) FROM Employee GROUP BY department_id;


-- Group By Queries (5)

-- 21. Select the total salary for each department.
SELECT department_id, SUM(salary) FROM Employee GROUP BY department_id;

-- 22. Select the average age of employees in each department.
SELECT department_id, AVG(age) FROM Employee GROUP BY department_id;

-- 23. Select the number of employees hired in each year.
SELECT EXTRACT(YEAR FROM hire_date) AS hire_year, COUNT(*) FROM Employee GROUP BY EXTRACT(YEAR FROM hire_date);

-- 24. Select the highest salary in each department.
SELECT department_id, MAX(salary) FROM Employee GROUP BY department_id;

-- 25. Select the department with the highest average salary.
SELECT department_id FROM Employee GROUP BY department_id ORDER BY AVG(salary) DESC LIMIT 1;


-- Having Queries (5)

-- 26. Select departments with more than 2 employees.
SELECT department_id FROM Employee GROUP BY department_id HAVING COUNT(*) > 2;

-- 27. Select departments with an average salary greater than 55000.
SELECT department_id FROM Employee GROUP BY department_id HAVING AVG(salary) > 55000;

-- 28. Select years with more than 1 employee hired.
SELECT EXTRACT(YEAR FROM hire_date) AS hire_year FROM Employee GROUP BY EXTRACT(YEAR FROM hire_date) HAVING COUNT(*) > 1;

-- 29. Select departments with a total salary expense less than 100000.
SELECT department_id FROM Employee GROUP BY department_id HAVING SUM(salary) < 100000;

-- 30. Select departments with the maximum salary above 75000.
SELECT department_id FROM Employee GROUP BY department_id HAVING MAX(salary) > 75000;


-- Order By Queries (5)

-- 31. Select all employees ordered by their salary in ascending order.
SELECT * FROM Employee ORDER BY salary ASC;

-- 32. Select all employees ordered by their age in descending order.
SELECT * FROM Employee ORDER BY age DESC;

-- 33. Select all employees ordered by their hire date in ascending order.
SELECT * FROM Employee ORDER BY hire_date ASC;

-- 34. Select employees ordered by their department and then by their salary.
SELECT * FROM Employee ORDER BY department_id ASC, salary ASC;

-- 35. Select departments ordered by the total salary of their employees.
SELECT department_id FROM Employee GROUP BY department_id ORDER BY SUM(salary) ASC;


-- Join Queries (10)

-- 36. Select employee names along with their department names.
SELECT e.name, d.name FROM Employee e JOIN Department d ON e.department_id = d.department_id;

-- 37. Select project names along with the department names they belong to.
SELECT p.name, d.name FROM Project p JOIN Department d ON p.department_id = d.department_id;

-- 38. Select employee names and their corresponding project names.
SELECT e.name, p.name FROM Employee e JOIN Project p ON e.department_id = p.department_id;

-- 39. Select all employees and their departments, including those without a department.
SELECT e.name, d.name FROM Employee e LEFT JOIN Department d ON e.department_id = d.department_id;

-- 40. Select all departments and their employees, including departments without employees.
SELECT d.name, e.name FROM Department d LEFT JOIN Employee e ON d.department_id = e.department_id;

-- 41. Select employees who are not assigned to any project.
SELECT e.name FROM Employee e LEFT JOIN Project p ON e.department_id = p.department_id WHERE p.project_id IS NULL;

-- 42. Select employees and the number of projects their department is working on.
SELECT e.name, COUNT(p.project_id) FROM Employee e LEFT JOIN Project p ON e.department_id = p.department_id GROUP BY e.emp_id, e.name;

-- 43. Select the departments that have no employees.
SELECT d.name FROM Department d LEFT JOIN Employee e ON d.department_id = e.department_id WHERE e.emp_id IS NULL;

-- 44. Select employee names who share the same department with 'John Doe'.
SELECT e1.name FROM Employee e1 JOIN Employee e2 ON e1.department_id = e2.department_id WHERE e2.name = 'John Doe' AND e1.name <> 'John Doe';

-- 45. Select the department name with the highest average salary.
SELECT d.name FROM Department d JOIN Employee e ON d.department_id = e.department_id GROUP BY d.department_id, d.name ORDER BY AVG(e.salary) DESC LIMIT 1;
