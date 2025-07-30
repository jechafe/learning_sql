/* 11-1
Rewrite the following query, which uses a simple case expression, so that the same
results are achieved using a searched case expression. Try to use as few when clauses as
possible.
SELECT emp_id,
CASE title
WHEN 'President' THEN 'Management'
WHEN 'Vice President' THEN 'Management'
WHEN 'Treasurer' THEN 'Management'
WHEN 'Loan Manager' THEN 'Management'
WHEN 'Operations Manager' THEN 'Operations'
WHEN 'Head Teller' THEN 'Operations'
WHEN 'Teller' THEN 'Operations'
ELSE 'Unknown'
END
FROM employee;  */

SELECT emp_id,
	CASE
		WHEN title LIKE '%President' OR title = 'Loan Manager'
			OR title = 'Treasurer'
			THEN 'Management'
		WHEN title LIKE '%Teller' OR title = 'Operations Manager'
			THEN 'Operations'
		ELSE 'Unknown'
	END
FROM employee;

/* 11-2
Rewrite the following query so that the result set contains a single row with four columns
(one for each branch). Name the four columns branch_1 through branch_4.
mysql> SELECT open_branch_id, COUNT(*)
-> FROM account
-> GROUP BY open_branch_id;
+----------------+----------+
| open_branch_id | COUNT(*) |
+----------------+----------+
| 1 | 8 |
| 2 | 7 |
| 3 | 3 |
| 4 | 6 |  */

SELECT
	SUM(CASE WHEN open_branch_id = 1 THEN 1 ELSE 0 END) branch_1,
	SUM(CASE WHEN open_branch_id = 2 THEN 1 ELSE 0 END) branch_2,
	SUM(CASE WHEN open_branch_id = 3 THEN 1 ELSE 0 END) branch_3,
	SUM(CASE WHEN open_branch_id = 4 THEN 1 ELSE 0 END) branch_4
FROM account;








/*   */








/*   */





/*   */