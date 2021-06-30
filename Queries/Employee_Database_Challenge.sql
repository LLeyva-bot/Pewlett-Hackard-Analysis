-- Deliverable 1: The Number of Retiring Employees by Title.
-- Create a retirement_titles table that holds all the titles of current employees who were born between January 1, 1952 and December 31, 1955. 
-- Retrieve the emp_no, first_name, and last_name columns from the Employees table.
SELECT e.emp_no,
	e.first_name,
	e.last_name,
-- Retrieve the title, from_date, and to_date columns from the titles table.
	tl.title,
	tl.from_date,
	tl.to_date
-- Create a table using the INTO clause.
INTO retirement_titles
-- Join both tables on the primary key.
FROM employees AS e
LEFT JOIN titles AS tl
ON e.emp_no = tl.emp_no
-- Filter the data on the birth_date column to retrieve the employees who were born between 1952 and 1955. Then, order by the employee number.
WHERE e.birth_date BETWEEN '1952-01-01' AND '1955-12-31'
ORDER BY e.emp_no;
-- Check the table to export.
SELECT * FROM retirement_titles;

-- Use Dictinct with Orderby to remove duplicate rows from the retirement_titles table.
-- Retrieve the emp_no, first_name, last_name, and title columns from retirement_titles table.
SELECT DISTINCT ON (rt.emp_no) rt.emp_no,
	rt.first_name,
	rt.last_name,
	rt.title
-- Create a unique_titles table using the INTO clause.
INTO unique_titles
FROM retirement_titles AS rt
-- Sort the Unique Titles table in ascending order by the employee number and descending order by the last date (i.e. to_date) of the most recent title.
ORDER BY rt.emp_no, rt.t_date DESC;
-- Check the table to export.
SELECT * FROM unique_titles;

-- Write another query to retrieve the number of employees by their most recent job title who are about to retire.
-- Retrieve retrieve the number of titles from the unique_titles table.
SELECT COUNT(ut.emp_no), ut.title
-- Create a retiring_titles table using the INTO clause.
INTO retiring_titles
FROM unique_titles as ut
-- Group the table by title, then sort the count column in descending order.
GROUP BY ut.title
ORDER BY COUNT(ut.emp_no) DESC;
-- Check the table to export.
SELECT * FROM retiring_titles;

-- Deliverable 2: The Employees Eligible for the Mentorship Program.
-- Write a query to create a Mentorship Eligibility table that holds the employees who are eligible to participate in a mentorship program.
-- Retrieve the emp_no, first_name, last_name and birth_date columns from the employees table.
SELECT DISTINCT ON(e.emp_no) e.emp_no,
	e.first_name,
	e.last_name,
	e.birth_date,
-- Retrieve the from_date and to_date columns from the dept_emp table.
	de.from_date,
	de.to_date,
-- Retrive the  title column from the titles table
	tt.title
-- Create a table using the INTO clause.
INTO mentorship_eligibility
-- Join the Employees and the Department Employee tables on the primary key.
FROM employees AS e
INNER JOIN dept_emp AS de
ON (e.emp_no = de.emp_no)
-- Join the Employees and the Titles tables on the primary key.
INNER JOIN titles AS tt
ON (e.emp_no = tt.emp_no)
-- Filter the data on the to_date column to all the current employees, then filter the data on the birth_date columns to get all the employees whose birth dates are between January 1, 1965 and December 31, 1965.
WHERE (de.to_date = '9999-01-01') AND (e.birth_date BETWEEN '1965-01-01' AND '1965-12-31')
-- Order the table by the employee number.
ORDER BY e.emp_no;
-- Check the table to export.
SELECT * FROM mentorship_eligibility;

-- Additional queries

-- Copy the mentor_elgibility query from Deliverable 2 and update the date to get all the employees whose birth dates are between January 1, 1964 and December 31, 1964
SELECT DISTINCT ON(e.emp_no) e.emp_no,
	e.first_name,
	e.last_name,
	e.birth_date,
	de.from_date,
	de.to_date,
	tt.title
INTO mentorship_eligibility_1964
FROM employees AS e
INNER JOIN dept_emp AS de
ON (e.emp_no = de.emp_no)
INNER JOIN titles AS tt
ON (e.emp_no = tt.emp_no)
WHERE (de.to_date = '9999-01-01') AND (e.birth_date BETWEEN '1964-01-01' AND '1964-12-31')
ORDER BY e.emp_no;

-- Copy the mentor_elgibility query from Deliverable 2 and update the date to get all the employees whose birth dates are between January 1, 1966 and December 31, 1966
SELECT DISTINCT ON(e.emp_no) e.emp_no,
	e.first_name,
	e.last_name,
	e.birth_date,
	de.from_date,
	de.to_date,
	tt.title
INTO mentorship_eligibility_1966
FROM employees AS e
INNER JOIN dept_emp AS de
ON (e.emp_no = de.emp_no)
INNER JOIN titles AS tt
ON (e.emp_no = tt.emp_no)
WHERE (de.to_date = '9999-01-01') AND (e.birth_date BETWEEN '1966-01-01' AND '1966-12-31')
ORDER BY e.emp_no;