/*8-1
Construct a query that counts the number of rows in the account table.*/

SELECT COUNT(*)
FROM account;

/*8-2
Modify your query from Exercise 8-1 to count the number of accounts held by each
customer. Show the customer ID and the number of accounts for each customer.*/

SELECT cust_id, COUNT(*)
FROM account
GROUP BY cust_id;

/*8-3
Modify your query from Exercise 8-2 to include only those customers having at least
two accounts.*/

SELECT cust_id, COUNT(*)
FROM account
GROUP BY cust_id
HAVING COUNT(*)>=2 ;


/*8-4 (Extra Credit)
Find the total available balance by product and branch where there is more than one
account per product and branch. Order the results by total balance (highest to lowest).*/

SELECT product_cd, open_branch_id, SUM(avail_balance)
FROM account
GROUP BY product_cd, open_branch_id
HAVING COUNT(*) > 1
ORDER BY 3 DESC;
