-- MUHAMMAD UMAR TARIQ
-- SEAT NO: B23110106048
-- DBMS ASSIGNMENT-03

CREATE DATABASE SQL_JOINS

CREATE TABLE DEPARTMENTS (
	DEPT_ID SERIAL PRIMARY KEY,
	DEPT_NAME VARCHAR(60) UNIQUE NOT NULL,
	LOCATION VARCHAR(100) NOT NULL
);
CREATE TABLE EMPLOYEES (
	EMP_ID SERIAL PRIMARY KEY,
	EMP_NAME VARCHAR(60) NOT NULL,
	SALARY NUMERIC(10, 2) NOT NULL,
	DEPT_ID INTEGER REFERENCES DEPARTMENTS (DEPT_ID),
	cHIRE_DATE DATE NOT NULL
);
CREATE TABLE PROJECTS (
	PROJECT_ID SERIAL PRIMARY KEY,
	PROJECT_NAME VARCHAR(60) NOT NULL,
	BUDGET NUMERIC(10, 2) NOT NULL,
	START_DATE DATE NOT NULL,
	END_DATE DATE NOT NULL
);
CREATE TABLE EMPLOYEE_PROJECTS (
	EMP_ID INTEGER REFERENCES EMPLOYEES (EMP_ID),
	PROJECT_ID INTEGER REFERENCES PROJECTS (PROJECT_ID),
	HOURS_WORKED INTEGER NOT NULL
);


-- Departments
INSERT INTO DEPARTMENTS (DEPT_NAME, LOCATION) 
VALUES
('HR', 'Karachi'),
('IT', 'Lahore'),
('Finance', 'Islamabad'),
('Marketing', 'Peshawar'),
('Operations', 'Quetta');

-- Employees
INSERT INTO EMPLOYEES (EMP_NAME, SALARY, DEPT_ID, cHIRE_DATE) 
VALUES
('Ali Khan', 50000, 1, '2022-01-15'),    
('Sara Ahmed', 60000, 2, '2021-07-01'),   
('John Smith', 70000, 2, '2020-05-20'),   
('Maryam Noor', 55000, 3, '2023-03-10'),  
('Bilal Hassan', 40000, NULL, '2024-06-01'),
('Zain Ali', 65000, 1, '2019-08-12'),    
('Fatima Tariq', 48000, 3, '2022-11-23'),
('Usman Iqbal', 75000, 2, '2018-09-30'),  
('Nida Raza', 42000, NULL, '2024-01-05'), 
('Hamza Farooq', 52000, 4, '2023-05-18');

-- Projects
INSERT INTO PROJECTS (PROJECT_NAME, BUDGET, START_DATE, END_DATE) 
VALUES
('Payroll System', 200000, '2023-01-01', '2023-12-31'),
('E-commerce Website', 500000, '2023-02-15', '2024-02-15'),
('Marketing Campaign', 100000, '2024-01-01', '2024-06-30'),
('Data Migration', 300000, '2024-03-01', '2025-03-01'),
('Mobile App', 400000, '2023-09-01', '2024-09-01'),
('Audit Automation', 250000, '2022-05-01', '2023-05-01');

-- Employee Projects
INSERT INTO EMPLOYEE_PROJECTS (EMP_ID, PROJECT_ID, HOURS_WORKED) 
VALUES
(1, 1, 120),   
(2, 1, 150),  
(2, 2, 200),   
(3, 2, 180),  
(4, 3, 90),   
(6, 5, 210),   
(7, 6, 130),   
(8, 2, 220),   
(8, 5, 160),   
(10, 3, 100);  

-- Part 1: Basic Joins


SELECT E.EMP_NAME, D.DEPT_NAME
FROM EMPLOYEES AS E
LEFT JOIN DEPARTMENTS AS D
ON E.DEPT_ID = D.DEPT_ID


SELECT D.DEPT_NAME, E.EMP_NAME
FROM DEPARTMENTS AS D
LEFT JOIN EMPLOYEES AS E
ON D.DEPT_ID = E.DEPT_ID


SELECT E.EMP_NAME, D.DEPT_NAME
FROM EMPLOYEES AS E
LEFT JOIN DEPARTMENTS AS D
ON E.DEPT_ID = D.DEPT_ID
WHERE D.DEPT_ID IS NULL;


-- Part 2: Complex Joins


SELECT P.PROJECT_NAME, E.EMP_NAME
FROM PROJECTS AS P
LEFT JOIN EMPLOYEE_PROJECTS AS EP
ON EP.PROJECT_ID = P.PROJECT_ID
LEFT JOIN EMPLOYEES AS E
ON E.EMP_ID = EP.EMP_ID


SELECT D.DEPT_NAME,
SUM(EP.HOURS_WORKED) AS TOTAL_HOURS
FROM DEPARTMENTS D
LEFT JOIN EMPLOYEES AS E 
ON D.DEPT_ID = E.DEPT_ID
LEFT JOIN EMPLOYEE_PROJECTS AS EP 
ON E.EMP_ID = EP.EMP_ID
GROUP BY D.DEPT_NAME;


SELECT *
FROM EMPLOYEES AS E
LEFT JOIN EMPLOYEE_PROJECTS AS EP
ON EP.EMP_ID = E.EMP_ID
WHERE EP.PROJECT_ID IS NULL


-- Part 3: Analysis Questions


-- ● What's the difference between INNER JOIN and LEFT JOIN? When would you use each?

/*
  The difference between INNER JOIN and LEFT JOIN is:

  INNER JOIN returns only the rows that have matchin values in both tables where as
  LEFT JOIN returns all rows from the left table, and the matching rows
  from the right table. If no match exists, NULLs are returned for the right table’s columns.

  Use cases:
  INNER JOIN: when you need only the intersection (common data) between two tables.
  LEFT JOIN: when you need all rows from the left table regardless of whether
  they have matching rows in the right table.
*/



-- ● Why might a RIGHT JOIN be less commonly used than a LEFT JOIN?

/*
  RIGHT JOIN is less common because most queries are written with the main table
  on the left, making LEFT JOIN more natural and readable. Also, any RIGHT JOIN
  can be rewritten as a LEFT JOIN by swapping table order, so LEFT JOIN is used
  more consistently in practice.
*/
