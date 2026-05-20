-- SCHEMA 1
CREATE TABLE orders_delivery (
    order_id INT,
    customer_name VARCHAR(50),
    order_amount DECIMAL(10,2),
    order_date DATE,
    delivery_date DATE
);

INSERT INTO orders_delivery VALUES
(101,'ravi',2500.75,'2025-01-10','2025-01-12'),
(102,'anita',5200.40,'2025-01-15',NULL),
(103,'kiran',1500.99,'2025-01-18','2025-01-20');

-- SCHEMA 2
CREATE TABLE employee_records (
    emp_id INT,
    emp_name VARCHAR(50),
    salary DECIMAL(10,2),
    joining_date DATE
);

INSERT INTO employee_records VALUES
(1,'karthik',75000.75,'2020-06-15'),
(2,'veena',65000.40,'2019-03-10'),
(3,'ravi',85000.90,'2021-08-20');

-- SCHEMA 3
CREATE TABLE customer_feedback (
    customer_id INT,
    customer_name VARCHAR(50),
    feedback_score INT,
    feedback_date DATE
);

INSERT INTO customer_feedback VALUES
(1,'arjun',5,'2025-01-10'),
(2,'meena',3,'2025-01-12'),
(3,'suresh',1,'2025-01-15');

-- SCHEMA 4
CREATE TABLE user_accounts (
    user_id INT,
    username VARCHAR(50),
    user_email VARCHAR(100),
    created_date DATE
);

INSERT INTO user_accounts VALUES
(1,'karthik123','karthik@gmail.com','2025-01-01'),
(2,'veena456','veena@yahoo.com','2025-01-05'),
(3,'ravi789','ravi@hotmail.com','2025-01-08');

-- SCHEMA 5
CREATE TABLE loan_details (
    loan_id INT,
    customer_name VARCHAR(50),
    loan_amount DECIMAL(12,2),
    interest_rate DECIMAL(5,2),
    loan_date DATE
);

INSERT INTO loan_details VALUES
(1,'ravi',500000,8.5,'2024-01-01'),
(2,'veena',300000,7.2,'2023-06-15'),
(3,'anil',700000,9.1,'2022-09-10');

-- SCHEMA 6
CREATE TABLE attendance (
    emp_id INT,
    emp_name VARCHAR(50),
    total_days INT,
    present_days INT,
    record_date DATE
);

INSERT INTO attendance VALUES
(1,'karthik',30,28,'2025-01-31'),
(2,'veena',30,22,'2025-01-31'),
(3,'ravi',30,18,'2025-01-31');

-- SCHEMA 7
CREATE TABLE product_sales (
    product_id INT,
    product_name VARCHAR(50),
    mrp DECIMAL(10,2),
    selling_price DECIMAL(10,2),
    sale_date DATE
);

INSERT INTO product_sales VALUES
(1,'Laptop',75000.75,68000.50,'2025-01-10'),
(2,'Mobile',35000.40,33000.25,'2025-01-12'),
(3,'Tablet',25000.90,26000.75,'2025-01-15');

-- SCHEMA 8
CREATE TABLE insurance_policies (
    policy_id INT,
    holder_name VARCHAR(50),
    premium_amount DECIMAL(10,2),
    policy_start DATE,
    policy_end DATE
);

INSERT INTO insurance_policies VALUES
(301,'arjun',12000.50,'2023-01-01','2026-01-01'),
(302,'megha',8500.75,'2022-06-15','2025-06-15'),
(303,'vinod',15000.90,'2021-03-01','2024-03-01');

-- SCHEMA 9
CREATE TABLE salary_revision (
    emp_id INT,
    emp_name VARCHAR(50),
    current_salary DECIMAL(10,2),
    rating INT,
    last_hike DATE
);

INSERT INTO salary_revision VALUES
(1,'karthik',75000.75,5,'2023-01-01'),
(2,'veena',65000.40,4,'2024-01-01'),
(3,'ravi',85000.90,3,'2022-01-01');

-- SCHEMA 10
CREATE TABLE bank_accounts (
    account_id INT,
    customer_name VARCHAR(50),
    balance DECIMAL(12,2),
    last_transaction DATE,
    branch VARCHAR(30)
);

INSERT INTO bank_accounts VALUES
(501,'ramesh',125000.75,'2024-12-20','hyderabad'),
(502,'sita',8500.40,'2023-06-15','delhi'),
(503,'manoj',-2500.90,'2025-01-05','mumbai');
