/*  12-1
Generate a transaction to transfer $50 from Frank Tucker’s money market account to
his checking account. You will need to insert two rows into the transaction table and
update two rows in the account table. */

DO $$
DECLARE
  cst_id INTEGER;
  mm_id INTEGER;
  chk_id INTEGER;
BEGIN
  -- Obtener los IDs
  SELECT i.cust_id,
         (SELECT a.account_id FROM account a WHERE a.cust_id = i.cust_id AND a.product_cd = 'MM' LIMIT 1),
         (SELECT a.account_id FROM account a WHERE a.cust_id = i.cust_id AND a.product_cd = 'chk' LIMIT 1)
  INTO cst_id, mm_id, chk_id
  FROM individual i
  WHERE i.fname = 'Frank' AND i.lname = 'Tucker';

  -- Validar que ambos IDs existen
  IF mm_id IS NULL OR chk_id IS NULL THEN
    RAISE NOTICE 'Cuenta MM o CHK no encontrada para el cliente Frank Tucker. Operación cancelada.';
    RETURN;
  END IF;

  -- Insertar transacciones
  INSERT INTO transaction (txn_date, account_id, txn_type_cd, amount)
  VALUES (now(), mm_id, 'CDT', 50);

  INSERT INTO transaction (txn_date, account_id, txn_type_cd, amount)
  VALUES (now(), chk_id, 'DBT', 50);

  -- Actualizar cuentas
  UPDATE account
  SET last_activity_date = now(),
      avail_balance = avail_balance - 50
  WHERE account_id = mm_id;

  UPDATE account
  SET last_activity_date = now(),
      avail_balance = avail_balance + 50
  WHERE account_id = chk_id;

END $$;

