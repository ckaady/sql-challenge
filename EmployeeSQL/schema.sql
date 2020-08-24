-- Create schemas

-- Create tables
CREATE TABLE IF NOT EXISTS departments
(
    dept_no VARCHAR(5) NOT NULL,
    dept_name VARCHAR(30),
    PRIMARY KEY(dept_no)
);

DROP TABLE dept_emp 
CREATE TABLE IF NOT EXISTS dept_emp
(
    dept_no VARCHAR(30),
    emp_no VARCHAR(30) NOT NULL    
);

CREATE TABLE IF NOT EXISTS dept_manager
(
    dept_no VARCHAR(5) NOT NULL,
    emp_no INTEGER    
);

CREATE TABLE IF NOT EXISTS employees
(
    emp_no INTEGER NOT NULL,
    emp_title_id VARCHAR(5),
    birth_date DATE,
    first_name VARCHAR(30),
    las_name VARCHAR(30),
    sex CHARACTER(1),
    hire_date DATE,
    PRIMARY KEY(emp_no)
);

CREATE TABLE IF NOT EXISTS salaries
(
    emp_no INTEGER NOT NULL,
    salary INTEGER    
);

CREATE TABLE IF NOT EXISTS titles
(
    title_id VARCHAR(5) NOT NULL,
    title VARCHAR(30),
    PRIMARY KEY(title_id)
);


-- Create FKs
ALTER TABLE employees
    ADD    FOREIGN KEY (emp_title_id)
    REFERENCES titles(title_id)
    MATCH SIMPLE
;
    
    
ALTER TABLE salaries
    ADD    FOREIGN KEY (emp_no)
    REFERENCES employees(emp_no)
    MATCH SIMPLE
;
    
ALTER TABLE dept_manager
    ADD    FOREIGN KEY (emp_no)
    REFERENCES employees(emp_no)
    MATCH SIMPLE
;
    
ALTER TABLE dept_manager
    ADD    FOREIGN KEY (dept_no)
    REFERENCES departments(dept_no)
    MATCH SIMPLE
;
    
ALTER TABLE dept_emp
    ADD    FOREIGN KEY (dept_no)
    REFERENCES departments(dept_no)
    MATCH SIMPLE
;
    

-- Create Indexes

-- CSVs imported in this order: departments, titles, employees, dept_emp, dept_manager, salaries