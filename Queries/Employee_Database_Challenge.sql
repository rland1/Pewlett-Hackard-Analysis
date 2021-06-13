--Part 1: Isolate data for employees that are going to retire based on birth dates
SELECT 
emp.emp_no,
emp.first_name,
emp.last_name,
titles.title,
titles.to_date,
titles.from_date
INTO retirement_titles
FROM employees as emp
inner join titles 
on emp.emp_no = titles.emp_no
where emp.birth_date BETWEEN '1952-01-01' AND '1955-12-31'
order by emp.emp_no

-- Part 2: Use Dictinct with Orderby to remove duplicate rows
SELECT DISTINCT ON (emp_no) emp_no,
first_name,
last_name,
title
INTO unique_titles
FROM retirement_titles
ORDER BY emp_no, to_date DESC;

-- Part 3: select count of each retirement title
SELECT 
COUNT(emp_no),
title
INTO retiring_titles
FROM unique_titles
group by title
order by COUNT(emp_no) desc

--Deliverable 2
-- employees eligible for mentorship program 
SELECT DISTINCT ON (emp.emp_no)
emp.emp_no,
emp.first_name,
emp.last_name,
emp.birth_date,
dept_emp.from_date,
dept_emp.to_date,
titles.title
INTO mentorship_eligibility
FROM employees as emp
INNER JOIN dept_emp on emp.emp_no = dept_emp.emp_no
INNER JOIN titles on emp.emp_no = titles.emp_no
where dept_emp.to_date = '9999-01-01' 
AND emp.birth_date BETWEEN '1965-01-01' AND '1965-12-31'
order by emp.emp_no



