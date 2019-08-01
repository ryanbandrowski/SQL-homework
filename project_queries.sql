-- List the following details of each employee: employee number, last name, first name, gender, and salary
SELECT e.emp_no, e.last_name, e.first_name, e.gender, s.salary
FROM employees e
LEFT JOIN salaries s
ON e.emp_no=s.emp_no

-- List employees who were hired in 1986
SELECT emp_no, last_name, first_name
FROM employees
WHERE hire_date >= '1986-01-01' AND hire_date <= '1986-12-31';

-- List the manager of each department with the following information: department number, department name, 
-- the manager's employee number, last name, first name, and start and end employment dates
SELECT m.dept_no, d.dept_name, m.emp_no, e.last_name, e.first_name, p.from_date, p.to_date
FROM dept_managers m
LEFT JOIN departments d
ON m.dept_no=d.dept_no
LEFT JOIN employees e
ON m.emp_no=e.emp_no
LEFT JOIN dept_employees p
ON m.emp_no=p.emp_no;

-- List the department of each employee with the following information: employee number, last name, first name, and department name
SELECT p.emp_no, e.last_name, e.first_name, d.dept_name
FROM dept_employees p
LEFT JOIN employees e
ON p.emp_no=e.emp_no
LEFT JOIN departments d
ON p.dept_no=d.dept_no;

-- List all employees whose first name is "Hercules" and last names begin with "B"
SELECT emp_no, last_name, first_name
FROM employees
WHERE first_name='Hercules' AND last_name LIKE 'B%';

-- List all employees in the Sales department, including their employee number, last name, first name, and department name
SELECT p.emp_no, e.last_name, e.first_name, d.dept_name
FROM dept_employees p
LEFT JOIN employees e
ON p.emp_no=e.emp_no
LEFT JOIN departments d
ON p.dept_no=d.dept_no
WHERE d.dept_name ='Sales';

-- List all employees in the Sales and Development departments, including their employee number, 
-- last name, first name, and department name
SELECT p.emp_no, e.last_name, e.first_name, d.dept_name
FROM dept_employees p
LEFT JOIN employees e
ON p.emp_no=e.emp_no
LEFT JOIN departments d
ON p.dept_no=d.dept_no
WHERE d.dept_name ='Sales' OR d.dept_name='Development';

-- In descending order, list the frequency count of employee last names, i.e., how many employees share each last name
SELECT last_name, COUNT(last_name) AS "Count of Names"
FROM employees
GROUP BY last_name
ORDER BY "Count of Names" DESC;