--## SQL Challenge Homework ##
--Once I had determined the details of the database (see Schema.txt, ERD.png and Table_Set_up_Post_Gres.Code.sql)
--and loaded this into Post Gres, I realised I needed to do some cleaning up of the table and column naming

--Rename tables so all lowercase for easier SQL coding use
ALTER TABLE "Employees"
RENAME TO employees

ALTER TABLE "Departments"
RENAME TO depts

ALTER TABLE "Dept_Emp"
RENAME TO dept_emp

ALTER TABLE "Dept_Manager"
RENAME TO dept_mgr

ALTER TABLE "Salaries"
RENAME TO sals

ALTER TABLE "Titles"
RENAME TO titles

--Rename the columns in each table to be all lower case for easier SQL coding
ALTER TABLE depts
RENAME COLUMN "Dept_no" TO dept_no

ALTER TABLE depts
RENAME COLUMN "Deptarment_Name" TO dept_name

ALTER TABLE dept_emp
RENAME COLUMN "Dept_Emp_ID" TO dept_emp_id

ALTER TABLE dept_emp
RENAME COLUMN "Emp_no" TO emp_no

ALTER TABLE dept_emp
RENAME COLUMN "Dept_no" TO dept_no

ALTER TABLE dept_mgr
RENAME COLUMN "Manager_ID" TO mgr_id

ALTER TABLE dept_mgr
RENAME COLUMN "Emp_no" TO emp_no

ALTER TABLE dept_mgr
RENAME COLUMN "Dept_no" TO dept_no

ALTER TABLE employees
RENAME COLUMN "Emp_no" TO emp_no

ALTER TABLE employees
RENAME COLUMN "Emp_Title_id" TO emp_title_id

ALTER TABLE employees
RENAME COLUMN "Birth_date" TO birth_date

ALTER TABLE employees
RENAME COLUMN "First_Name" TO first_name

ALTER TABLE employees
RENAME COLUMN "Last_Name" TO last_name

ALTER TABLE employees
RENAME COLUMN "Sex" TO sex

ALTER TABLE employees
RENAME COLUMN "Hire_date" TO hire_date

ALTER TABLE sals
RENAME COLUMN "Salary_ID" TO sal_id

ALTER TABLE sals
RENAME COLUMN "Emp_no" TO emp_no

ALTER TABLE sals
RENAME COLUMN "Salary" TO salary

ALTER TABLE titles
RENAME COLUMN "Title_id" TO title_id

ALTER TABLE titles
RENAME COLUMN "Title" TO title

--## BELOW ARE MY QUERIES FOR EACH OF THE 8 HOMEWORK QUESTIONS ##

--1.List the following details of each employee: employee number, last name, first name, sex, and salary.
SELECT employees.emp_no,
 employees.last_name,
 employees.first_name,
 employees.sex,
 sals.salary
FROM employees
JOIN sals ON
employees.emp_no = sals.emp_no;

--2.List first name, last name, and hire date for employees who were hired in 1986
SELECT employees.first_name,
 employees.last_name,
 employees.hire_date
FROM employees
WHERE employees.hire_date >= '01/01/1986' AND 
employees.hire_date < '01/01/1987'

--3.List the manager of each department with the following information: department number, 
--department name, the manager's employee number, last name, first name.
SELECT
 depts.dept_no, 
 depts.dept_name,
 employees.emp_no,
 employees.last_name,
 employees.first_name
FROM employees
JOIN dept_mgr
  ON employees.emp_no = dept_mgr.emp_no
JOIN depts
  ON depts.dept_no = dept_mgr.dept_no;


--4.List the department of each employee with the following information: 
--employee number, last name, first name, and department name.
SELECT
 depts.dept_name,
 employees.emp_no,
 employees.last_name,
 employees.first_name
FROM employees
JOIN dept_emp
  ON employees.emp_no = dept_emp.emp_no
JOIN depts
  ON depts.dept_no = dept_emp.dept_no;

  --5.List first name, last name, and sex for employees whose first name is "Hercules" and last names begin with "B." 
SELECT 
 employees.first_name,
 employees.last_name,
 employees.sex
FROM employees
WHERE employees.first_name = 'Hercules' 
AND employees.last_name LIKE 'B%'
;

--6.List all employees in the Sales department, including their employee number, last name, first name, and department name.
SELECT
 depts.dept_name,
 employees.emp_no,
 employees.last_name,
 employees.first_name
FROM employees
JOIN dept_emp
  ON employees.emp_no = dept_emp.emp_no
JOIN depts
  ON depts.dept_no = dept_emp.dept_no
WHERE depts.dept_name = 'Sales'
;

--7.List all employees in the Sales and Development departments, 
--including their employee number, last name, first name, and department name.
SELECT
 depts.dept_name,
 employees.emp_no,
 employees.last_name,
 employees.first_name
FROM employees
JOIN dept_emp
  ON employees.emp_no = dept_emp.emp_no
JOIN depts
  ON depts.dept_no = dept_emp.dept_no
WHERE depts.dept_name = 'Sales'
OR depts.dept_name = 'Development'
;

--8.In descending order, list the frequency count of employee last names, 
--i.e., how many employees share each last name.
SELECT 
 employees.last_name, 
COUNT(last_name) AS "Count Last_Names"
FROM employees
GROUP BY employees.last_name
ORDER BY "Count Last_Names" DESC
;