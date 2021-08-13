-- DELIVERABLE 1: -------------- DELIVERABLE 1: -------------- DELIVERABLE 1: -------------- DELIVERABLE 1: --

-- 1. Get the emp_no, first_name, and last_name from the EMPLOYEES table
-- 2. Get the title, from_date, and to_date from the TITLES table
DROP TABLE retirement_titles;

SELECT em.emp_no, 
    em.first_name, 
    em.last_name, 
    ti.title, 
    ti.from_date, 
    ti.to_date
-- 3. Use the INTO clause to create a new table   
INTO retirement_titles
FROM employees AS em
INNER JOIN titles AS ti
-- 4. Join the tables on their primary keys
ON(em.emp_no = ti.emp_no)
--5. Filter the data on the birth_date column to retrieve the employees who were born between 1952 and 1955. 
WHERE (em.birth_date BETWEEN '1952-01-01' AND '1955-12-31')
--Then, order by the employee number.
ORDER BY em.emp_no;
--6. Export the table into retirement_titles.csv to the data folder
--7. Verify the table looks like the module example.
SELECT * FROM retirement_titles;

--8. Add the starter code from Employee_Challenge_starter_code.sql
-- Use Dictinct with Orderby to remove duplicate rows
-- 9-12: 
DROP TABLE retirement_titles_distinct;

-- Use DISTINCT ON the emp_no to filter select its first occurence
SELECT DISTINCT ON (rt.emp_no) rt.emp_no,
rt.first_name,
rt.last_name,
rt.title
-- Create a new table titled retirement_titles_distinct
INTO retirement_titles_distinct
FROM retirement_titles AS rt
-- ORDER BY emp_no and to_date(most recent job title for each specific employee)
ORDER BY rt.emp_no, rt.to_date DESC;

SELECT * FROM retirement_titles_distinct;

--13: Export the new table as unique_titles.csv

--15-21: COUNT the number of employees that are about to retire and group by title in DESCENDING order
DROP TABLE retirement_titles_count;

SELECT COUNT(rt.title), rt.title
INTO retirement_titles_count
FROM retirement_titles_distinct AS rt
GROUP BY rt.title
ORDER BY COUNT(rt.title) DESC;

SELECT * FROM retirement_titles_count;


-- DELIVERABLE 2: -------------- DELIVERABLE 2: -------------- DELIVERABLE 2: -------------- DELIVERABLE 2: --

--1. Retrieve the emp_no, first_name, last_name, and birth_date columns from the Employees table.
--2. Retrieve the from_date and to_date columns from the Department Employee table.
--3. Retrieve the title column from the Titles table.

-- This is a join of 3 tables:
DROP TABLE mentorship_eligibility;

SELECT DISTINCT ON (em.emp_no) em.emp_no,
    em.first_name,
    em.last_name,
    em.birth_date,
    de.from_date,
    de.to_date,
    ti.title
-- New talbe name with all the new data
INTO mentorship_eligibility
-- FROM the first table employees and set alias as em
FROM employees AS em
-- INNER JOIN dept_emp table with employee table ON emp_no
INNER JOIN dept_emp AS de
ON (em.emp_no = de.emp_no)
-- INNER JOIN new table with titles ON emp_no
INNER JOIN titles AS ti
ON (em.emp_no = ti.emp_no)
--8. get all the employees whose birth dates are between January 1, 1965 and December 31, 1965.
-- AND to date = '9999-01-01'
WHERE (em.birth_date BETWEEN '1965-01-01' AND '1965-12-31')
AND (de.to_date = '9999-01-01')
--9. ORDER BY emp_no
ORDER BY em.emp_no;

SELECT * FROM mentorship_eligibility;

-- Extra queries: -------------- Extra queries: -------------- Extra queries: -------------- Extra queries: --

-- Create a table to get the number of employees retiring by dept_name
SELECT rt.emp_no,
	d.dept_name
INTO retiremtent_dept
FROM retirement_info AS rt
INNER JOIN dept_emp AS de
ON (rt.emp_no = de.emp_no)
INNER JOIN departments AS d
ON (de.dept_no =d.dept_no);


SELECT COUNT (emp_no), dept_name
INTO retirement_dept_count
FROM retiremtent_dept
GROUP BY dept_name;

-- How many roles will need to be filled to fill the 'silver tsunami' gap?
SELECT COUNT (emp_no)
FROM retirement_titles_distinct
-- 90398

-- How many mentors are eligible?
SELECT COUNT (emp_no)
FROM mentorship_eligibility
-- 1549