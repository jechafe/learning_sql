/*9-1
Construct a query against the account table that uses a filter condition with a noncorrelated
subquery against the product table to find all loan accounts
(product.product_type_cd = 'LOAN'). Retrieve the account ID, product code, customer
ID, and available balance.*/

SELECT account_id, product_cd, cust_id, avail_balance 
FROM account
WHERE product_cd IN (
    SELECT product_cd
    FROM product
    WHERE product_type_cd = 'LOAN'
);

/* 9-2
Rework the query from Exercise 9-1 using a correlated subquery against the product
table to achieve the same results. */

SELECT a.account_id, a.product_cd, a.cust_id, a.avail_balance
FROM account a
WHERE EXISTS (SELECT 1
	FROM product p
	WHERE p.product_cd = a.product_cd
		AND p.product_type_cd = 'LOAN');
/* 9-3
Join the following query to the employee table to show the experience level of each
employee:
SELECT 'trainee' name, '2004-01-01' start_dt, '2005-12-31' end_dt
UNION ALL
SELECT 'worker' name, '2002-01-01' start_dt, '2003-12-31' end_dt UNION ALL
SELECT 'mentor' name, '2000-01-01' start_dt, '2001-12-31' end_dt

Give the subquery the alias levels, and include the employee’s ID, first name, last name,
and experience level (levels.name). (Hint: build a join condition using an inequality
condition to determine into which level the employee.start_date column falls.) */

SELECT e.emp_id, e.fname, e.lname, levels.name
FROM employee e
INNER JOIN (
    SELECT 'trainee' AS name, '2004-01-01'::DATE AS start_dt, '2005-12-31'::DATE AS end_dt
    UNION ALL
    SELECT 'worker', '2002-01-01'::DATE, '2003-12-31'::DATE
    UNION ALL
    SELECT 'mentor', '2000-01-01'::DATE, '2001-12-31'::DATE
) AS levels
ON e.start_date BETWEEN levels.start_dt AND levels.end_dt;


/*9-4
Construct a query against the employee table that retrieves the employee ID, first name,
and last name, along with the names of the department and branch to which the employee
is assigned. Do not join any tables.*/

SELECT e.emp_id, e.fname, e.lname,
       (SELECT d.name FROM department d
        WHERE d.dept_id = e.dept_id) AS dept_name,
       (SELECT b.name FROM branch b
        WHERE b.branch_id = e.assigned_branch_id) AS branch_name
FROM employee e;
