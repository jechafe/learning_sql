/* 14-1
Create a view that queries the employee table and generates the following output when
queried with no where clause:
+-----------------+------------------+
| supervisor_name | employee_name |
+-----------------+------------------+
| NULL | Michael Smith |
| Michael Smith | Susan Barker |
| Michael Smith | Robert Tyler |
| Robert Tyler | Susan Hawthorne |
| Susan Hawthorne | John Gooding |
| Susan Hawthorne | Helen Fleming |
| Helen Fleming | Chris Tucker |
| Helen Fleming | Sarah Parker |
| Helen Fleming | Jane Grossman |
| Susan Hawthorne | Paula Roberts |
| Paula Roberts | Thomas Ziegler |
| Paula Roberts | Samantha Jameson |
| Susan Hawthorne | John Blake |
| John Blake | Cindy Mason |
| John Blake | Frank Portman |
| Susan Hawthorne | Theresa Markham |
| Theresa Markham | Beth Fowler |
| Theresa Markham | Rick Tulman |  */

CREATE VIEW supervisor_vw
(supervisor_name,
employee_name)
AS
SELECT concat(spr.fname, ' ', spr.lname),
	concat(emp.fname, ' ', emp.lname)
FROM employee emp LEFT OUTER JOIN employee spr
	ON emp.superior_emp_id = spr.emp_id;

/* 14-2
The bank president would like to have a report showing the name and city of each
branch, along with the total balances of all accounts opened at the branch. Create a
view to generate the data.  */

CREATE VIEW branch_summary_vw
	(branch_name,
	branch_city,
	total_balance)
AS
SELECT b.name, b.city, sum(a.avail_balance)
FROM branch b INNER JOIN account a
	ON b.branch_id = a.open_branch_id
GROUP BY b.name, b.city;