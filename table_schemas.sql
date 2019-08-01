CREATE TABLE employees(
	emp_no INT,
	birth_date DATE,
	first_name VARCHAR(50),
	last_name VARCHAR(50),
	gender VARCHAR(1),
	hire_date DATE,
	PRIMARY KEY (emp_no)
);

CREATE TABLE departments(
	dept_no VARCHAR(10),
	dept_name VARCHAR(50),
	PRIMARY KEY (dept_no)
);

CREATE TABLE dept_employees(
	emp_no INT,
	dept_no VARCHAR(10),
	from_date DATE,
	to_date DATE,
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
	FOREIGN KEY (dept_no) REFERENCES departments(dept_no)
);

CREATE TABLE dept_managers(
	dept_no VARCHAR(10),
	emp_no INT,
	from_date DATE,
	to_date DATE,
	FOREIGN KEY (dept_no) REFERENCES departments(dept_no),
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no)
);

CREATE TABLE salaries(
	emp_no INT,
	salary INT,
	from_date DATE,
	to_date DATE,
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no)
);

CREATE TABLE titles(
	emp_no INT,
	title VARCHAR(50),
	from_date DATE,
	to_date DATE,
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no)
);