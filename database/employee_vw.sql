CREATE VIEW employee_vw AS
SELECT emp_id, fname, lname,
EXTRACT(YEAR FROM start_date) AS start_year
FROM employee;

