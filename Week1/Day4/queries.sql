-- 1
SELECT employee_id, employee_name, salary,
ROW_NUMBER() OVER (ORDER BY salary DESC) AS row_num
FROM employees;

-- 2
SELECT employee_id, employee_name, salary,
RANK() OVER (ORDER BY salary DESC) AS rank_num
FROM employees;

-- 3
SELECT employee_id, employee_name, salary,
DENSE_RANK() OVER (ORDER BY salary DESC) AS rank_by_salary
FROM employees;

-- 4
SELECT *
FROM (
    SELECT employee_id, employee_name, salary,
    ROW_NUMBER() OVER (ORDER BY salary DESC) AS top3_highest_paid
    FROM employees
) t
WHERE top3_highest_paid <= 3;

-- 5
SELECT employee_id, employee_name, department, salary,
RANK() OVER (PARTITION BY department ORDER BY salary DESC) AS ranking
FROM employees;

-- 6
SELECT *
FROM (
    SELECT department, salary,
    RANK() OVER (PARTITION BY department ORDER BY salary DESC) AS ranking
    FROM employees
) t
WHERE ranking = 1;

-- 7
SELECT order_id, order_date, total_amount,
SUM(total_amount) OVER (ORDER BY order_id, order_date) AS running_total
FROM orders;

-- 8
SELECT o.employee_id, e.employee_name, o.order_id, o.total_amount,
SUM(o.total_amount) OVER (
    PARTITION BY o.employee_id 
    ORDER BY o.order_id, o.order_date
) AS cumulative_sales
FROM orders o
JOIN employees e 
ON o.employee_id = e.employee_id;

-- 9
SELECT o.customer_id, c.customer_name, o.order_id,
SUM(o.total_amount) OVER (
    PARTITION BY o.customer_id 
    ORDER BY o.order_date, o.order_id
) AS total_amount_so_far,
LAG(o.total_amount) OVER (
    PARTITION BY o.customer_id 
    ORDER BY o.order_date, o.order_id
) AS previous_order_amount
FROM orders o
JOIN customers c 
ON o.customer_id = c.customer_id;

-- 10
SELECT o.customer_id, c.customer_name, o.order_id,
SUM(o.total_amount) OVER (
    PARTITION BY o.customer_id 
    ORDER BY o.order_date, o.order_id
) AS total_amount_so_far,
LEAD(o.total_amount) OVER (
    PARTITION BY o.customer_id 
    ORDER BY o.order_date, o.order_id
) AS next_order_amount
FROM orders o
JOIN customers c 
ON o.customer_id = c.customer_id;
