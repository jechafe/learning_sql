/* 5-1
Fill in the blanks (denoted by <#>) for the following query to obtain the results that
follow:
mysql> SELECT e.emp_id, e.fname, e.lname, b.name
-> FROM employee e INNER JOIN <1> b
-> ON e.assigned_branch_id = b.<2>;
+--------+----------+-----------+---------------+
| emp_id | fname | lname | name |
+--------+----------+-----------+---------------+
| 1 | Michael | Smith | Headquarters |
| 2 | Susan | Barker | Headquarters |
| 3 | Robert | Tyler | Headquarters |
| 4 | Susan | Hawthorne | Headquarters |
| 5 | John | Gooding | Headquarters |
| 6 | Helen | Fleming | Headquarters |
| 7 | Chris | Tucker | Headquarters |
| 8 | Sarah | Parker | Headquarters |
| 9 | Jane | Grossman | Headquarters |
| 10 | Paula | Roberts | Woburn Branch |
| 11 | Thomas | Ziegler | Woburn Branch |
| 12 | Samantha | Jameson | Woburn Branch |
| 13 | John | Blake | Quincy Branch |
| 14 | Cindy | Mason | Quincy Branch |
| 15 | Frank | Portman | Quincy Branch |
| 16 | Theresa | Markham | So. NH Branch |
| 17 | Beth | Fowler | So. NH Branch |
| 18 | Rick | Tulman | So. NH Branch |
+--------+----------+-----------+---------------+
18 rows in set (0.03 sec) */

/* (1) branch and (2) branch_id */

/* 5-2
Write a query that returns the account ID for each nonbusiness customer
(customer.cust_type_cd = 'I') along with the customer’s federal ID (cus
tomer.fed_id) and the name of the product on which the account is based (prod
uct.name). */

SELECT a.account_id, c.fed_id, p.name
FROM account AS a INNER JOIN customer AS c
	ON a.cust_id = c.cust_id
	INNER JOIN product AS p
	ON a.product_cd = p.product_cd
WHERE c.cust_type_cd = 'I' ;


/*5-3
Construct a query that finds all employees whose supervisor is assigned to a different
department. Retrieve the employees’ ID, first name, and last name.*/

SELECT e.emp_id, e.fname, e.lname
FROM employee AS e INNER JOIN employee AS mgr
	ON e.superior_emp_id = mgr.emp_id
WHERE e.dept_id != mgr.dept_id ;
