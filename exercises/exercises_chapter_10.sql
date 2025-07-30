/*  10-1
Write a query that returns all product names along with the accounts based on that
product (use the product_cd column in the account table to link to the product table).
Include all products, even if no accounts have been opened for that product. */

SELECT p.product_cd, a.account_id, a.cust_id, a.avail_balance
FROM product p LEFT OUTER JOIN account a
	ON p.product_cd = a.product_cd;

/* 10-2
Reformulate your query from Exercise 10-1 to use the other outer join type (e.g., if you
used a left outer join in Exercise 10-1, use a right outer join this time) such that the
results are identical to Exercise 10-1  */

SELECT p.product_cd, a.account_id, a.cust_id, a.avail_balance
FROM account a RIGHT OUTER JOIN product p
	ON p.product_cd = a.product_cd;

/*  10-3
Outer-join the account table to both the individual and business tables (via the
account.cust_id column) such that the result set contains one row per account. Columns
to include are account.account_id, account.product_cd, individual.fname,
individual.lname, and business.name. */

SELECT a.account_id, a.product_cd, i.fname, i.lname, b.name
FROM account a LEFT OUTER JOIN business b
	ON a.cust_id = b.cust_id
	LEFT OUTER JOIN individual i
		ON a.cust_id = i.cust_id;

/*  10-4 (Extra Credit)
Devise a query that will generate the set {1, 2, 3,..., 99, 100}. (Hint: use a cross join
with at least two from clause subqueries.) */

SELECT ones.x + tens.x + 1
FROM
(SELECT 0 x UNION ALL
SELECT 1 x UNION ALL
SELECT 2 x UNION ALL
SELECT 3 x UNION ALL
SELECT 4 x UNION ALL
SELECT 5 x UNION ALL
SELECT 6 x UNION ALL
SELECT 7 x UNION ALL
SELECT 8 x UNION ALL
SELECT 9 x) ones
CROSS JOIN
(SELECT 0 x UNION ALL
SELECT 10 x UNION ALL
SELECT 20 x UNION ALL
SELECT 30 x UNION ALL
SELECT 40 x UNION ALL
SELECT 50 x UNION ALL
SELECT 60 x UNION ALL
SELECT 70 x UNION ALL
SELECT 80 x UNION ALL
SELECT 90 x) tens;