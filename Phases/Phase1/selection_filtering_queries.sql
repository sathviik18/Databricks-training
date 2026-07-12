--Create a new column 
SELECT * , 
salary + 5000 as updated_salary
FROM employees;
SELECT name , age +1 AS next_year_age 
FROM employees;
--SELECTING ALL COLUMNS EXCEPT ONE
SELECT 
emp_id ,
name,
age,
department,
address_city,
address_state
FROM employees;
--CALCULATE AVG SALARY FOR EACH DEPARTMENT
SELECT
department , 
AVG(SALARY) AS AVG_SALARY
FROM employees
GROUP BY department;
--RETRIEVE SELECTED COLUMNS DYNAMICALLY
SELECT 
name , age , department
FROM employees;

--RETRIEVE EMPLOYEE WITHOUT WITHOUT ADDRESS INFORMATION 
SELECT 
emp_id , 
name , 
age ,
department ,
salary
FROM employees;

--retrieve employee's address fields
SELECT 
NAME , 
address_city , 
address_state
FROM EMPLOYEES;

--RETIREVE EMPLOYEES WHOSE AGE IS ABOVE 30
SELECT * FROM employees
WHERE age > 30;
--RETRIEVE EMPLOYEES IS ABOVE 30 AND SALARY EXCEEDS 50000
SELECT * FROM employees
WHERE age > 30 AND salary > 50000;
--RETRIEVE EMPLOYEES WHOSE ABOVE 30 OR BELONG TO HR
SELECT * FROM employees
where AGE > 30 OR DEPARTMENT = "HR" ;

-- RETRIEVE EMPLOYEES WHOSE NOT BELONG TO HR
SELECT * FROM employees
WHERE DEPARTMENT <> "HR";

--Retrieve employees from the HR and Finance 
SELECT * FROM employees 
WHERE department IN("HR"  , "Finance");
-- Retrieve employees whose names start with 'A'
SELECT * FROM employees 
WHERE name LIKE "A%";

-- Retrieve employees whose names end with 'son'
SELECT * FROM employees
WHERE name LIKE "%n";
-- retrieve employees whose name contain 'son'
SELECT * FROM employees
WHERE name regexp "son";
--   retrieve employees whose age is null
SELECT * FROM employees
WHERE age IS NULL;
-- retrieve employees whose department is not null
SELECT * FROM employees 
WHERE department IS NOT NULL;
-- RETRIEVE EMPLOYEES WITH A SALARY GREATER THAN 60000
SELECT * FROM employees 
WHERE salary > 60000;
