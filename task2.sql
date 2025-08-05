create database employees;

use employees;

CREATE TABLE employees (
    id INT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    department VARCHAR(100),
    salary INT DEFAULT 30000,
    email VARCHAR(100) UNIQUE
);

-- INSERTING DATA (full data)
INSERT INTO employees (id, name, department, salary, email)
VALUES (1, 'Alice', 'HR', 50000, 'alice@example.com');

-- INSERTING DATA (with NULL and default)
INSERT INTO employees (id, name, department, email)
VALUES (2, 'Bob', NULL, 'bob@example.com');  -- salary = default 30000
INSERT INTO employees (id, name, department)
VALUES (3, 'Charlie', 'Finance');  -- email = NULL, salary = default

-- INSERTING PARTIAL VALUES (some columns only)
INSERT INTO employees (id, name)
VALUES (4, 'David');  -- department, salary = default/NULL, email = NULL

set SQL_SAFE_UPDATES = 0;

-- UPDATE RECORD (update salary of Bob)
UPDATE employees
SET salary = 35000
WHERE name = 'Bob';

-- UPDATE MULTIPLE COLUMNS
UPDATE employees
SET department = 'IT', salary = 60000
WHERE name = 'David';

-- DELETE A RECORD (delete Charlie)
DELETE FROM employees
WHERE id = 3;

-- INSERTING USING SELECT (clone Alice as new employee)
INSERT INTO employees (id, name, department, salary, email)
SELECT 5, CONCAT(name, ' Jr.'), department, salary, 'alice.jr@example.com'
FROM employees
WHERE id = 1;

-- SELECT ROWS WITH NULL EMAIL
SELECT * FROM employees
WHERE email IS NULL;

-- BONUS: Use transaction for deletion + rollback
START TRANSACTION;

DELETE FROM employees
WHERE id = 2;



