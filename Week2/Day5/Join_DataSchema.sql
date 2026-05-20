**Schema (MySQL v8)**

    CREATE TABLE employees (
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(50),
    manager_id INT,
    dept_id INT
    );
    INSERT INTO employees (emp_id, emp_name, manager_id, dept_id) VALUES
    (1, 'Karthik', NULL, 1),
    (2, 'Ajay', 1, 1),
    (3, 'Vijay', 1, 2),
    (4, 'Vinay', 2, 2),
    (5, 'Meena', 3, 3),
    (6, 'Veer', NULL, 4),
    (7, 'Keerthi', 4, 5),
    (8, 'Priya', 4, 5);
    
    
    CREATE TABLE departments (
    dept_id INT PRIMARY KEY,
    dept_name VARCHAR(50)
    );
    
    INSERT INTO departments (dept_id, dept_name) VALUES
    (1, 'HR'),
    (2, 'IT'),
    (3, 'Finance'),
    (4, 'Marketing'),
    (5, 'Sales');
    
    
    CREATE TABLE projects (
    project_id INT PRIMARY KEY,
    project_name VARCHAR(50),
    emp_id INT
    );
    
    INSERT INTO projects (project_id, project_name, emp_id) VALUES
    (1, 'Project A', 1),
    (2, 'Project B', 2),
    (3, 'Project C', 3),
    (4, 'Project D', 4),
    (5, 'Project E', 5);
    -- SALARY TABLE
    CREATE TABLE salary (
        emp_id INT,
        salary DECIMAL(10,2),
        FOREIGN KEY (emp_id) REFERENCES employees(emp_id)
    );
    
    INSERT INTO salary (emp_id, salary) VALUES
    (1, 75000),
    (2, 50000),
    (3, 65000),
    (4, 62000),
    (5, 58000),
    (7, 70000);
    
    -- CONTACTS TABLE
    CREATE TABLE contacts (
        emp_id INT,
        phone_no VARCHAR(15),
        email VARCHAR(100),
        FOREIGN KEY (emp_id) REFERENCES employees(emp_id)
    );
    
    INSERT INTO contacts (emp_id, phone_no, email) VALUES
    (1, '9876543210', 'karthik@gmail.com'),
    (2, '9123456780', 'ajay@gmail.com'),
    (3, '9988776655', 'vijay@gmail.com'),
    (4, '9001122334', 'vinay@gmail.com'),
    (5, '9556677889', 'meena@gmail.com'),
    (8, '9887766554', 'priya@gmail.com');
