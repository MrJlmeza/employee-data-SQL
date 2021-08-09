-- 1. Details of each employee: employee number, last name, first name, gender, and salary.

SELECT employees.emp_no, employees.last_name, employees.first_name, employees.sex,
salaries.salary
FROM employees
INNER JOIN salaries ON
employees.emp_no = salaries.emp_no;

-- 2. Employees hired in 1986
SELECT first_name, last_name, hire_date
FROM employees
WHERE hire_date BETWEEN '1986-01-01' AND '1986-12-31';


-- 3. Manager of each department

SELECT dept_manager.dept_no, 
	   departments.dept_name,
	   dept_manager.emp_no,
	   employees.last_name,
	   employees.first_name
FROM dept_manager
INNER JOIN departments 
ON (dept_manager.dept_no = departments.dept_no)
INNER JOIN employees 
ON (dept_manager.emp_no = employees.emp_no);

-- 4. List the department of each employee with the following information: 
	-- employee number, last name, first name, and department name.
	
SELECT  employees.emp_no,
        employees.last_name,
        employees.first_name,
        departments.dept_name
FROM employees
INNER JOIN dept_employee
ON (employees.emp_no = dept_employee.emp_no)
INNER JOIN departments
ON (dept_employee.dept_no = departments.dept_no)
ORDER BY employees.emp_no;


-- 5. Employees whose first name is "Hercules" and last name begins with "B"
SELECT first_name,
	   last_name, 
	   birth_date, sex
FROM employees
WHERE first_name = 'Hercules'
AND last_name LIKE 'B%';

-- .6 Employees in the Sales department
SELECT  employees.emp_no,
        employees.last_name,
        employees.first_name,
        departments.dept_name
FROM employees
INNER JOIN dept_employee
ON (employees.emp_no = dept_employee.emp_no)
INNER JOIN departments
ON (dept_employee.dept_no = departments.dept_no)
WHERE departments.dept_name = 'Sales'
ORDER BY employees.emp_no;