/*  13-1
Modify the account table so that customers may not have more than one account for
each product. */

ALTER TABLE account
ADD CONSTRAINT account_unq1 UNIQUE (cust_id, product_cd);

/* 13-2
Generate a multicolumn index on the transaction table that could be used by both of
the following queries:
SELECT txn_date, account_id, txn_type_cd, amount
FROM transaction
WHERE txn_date > cast('2008-12-31 23:59:59' as datetime);
SELECT txn_date, account_id, txn_type_cd, amount
FROM transaction
WHERE txn_date > cast('2008-12-31 23:59:59' as datetime)
AND amount < 1000; */

CREATE INDEX txn_idx01
ON transaction (txn_date, amount);