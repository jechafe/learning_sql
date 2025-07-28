
/* The following exercises test your understanding of filter conditions. Please see Appendix
C for solutions.
The following transaction data is used for the first two exercises:
Txn_id Txn_date Account_id Txn_type_cd Amount
1 2005-02-22 101 CDT 1000.00
2 2005-02-23 102 CDT 525.75
3 2005-02-24 101 DBT 100.00
4 2005-02-24 103 CDT 55
5 2005-02-25 101 DBT 50
6 2005-02-25 103 DBT 25
7 2005-02-25 102 CDT 125.37
8 2005-02-26 103 DBT 10
9 2005-02-27 101 CDT 75 */

/* Exercise 4-1
Which of the transaction IDs would be returned by the following filter conditions?
txn_date < '2005-02-26' AND (txn_type_cd = 'DBT' OR amount > 100) */

/* 1, 2, 3, 5, 6 and 7 */


/* Exercise 4-2
Which of the transaction IDs would be returned by the following filter conditions?
account_id IN (101,103) AND NOT (txn_type_cd = 'DBT' OR amount > 100) */

/* 4 and 9 */

/* Exercise 4-3
Construct a query that retrieves all accounts opened in 2002. */

SELECT account_id, open_date
FROM account
WHERE open_Date BETWEEN '2002-01-01' AND '2002-12-31';

/* Exercise 4-4
Construct a query that finds all nonbusiness customers whose last name contains an
a in the second position and an e anywhere after the a. */

SELECT cust_id, lname, fname
FROM individual
WHERE lname LIKE '_a%e%'
