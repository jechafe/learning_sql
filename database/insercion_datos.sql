-- Tabla department
INSERT INTO department (name) VALUES 
  ('Operations'),
  ('Loans'),
  ('Administration');

-- Tabla branch
INSERT INTO branch (name, address, city, state, zip) VALUES 
  ('Headquarters', '3882 Main St.', 'Waltham', 'MA', '02451'),
  ('Woburn Branch', '422 Maple St.', 'Woburn', 'MA', '01801'),
  ('Quincy Branch', '125 Presidential Way', 'Quincy', 'MA', '02169'),
  ('So. NH Branch', '23 Elm St.', 'Salem', 'NH', '03079'),
  ('Portland Branch', '1600 Main St.', 'Portland', 'ME', '04101');

-- Tabla employee
INSERT INTO employee (fname, lname, start_date, title, assigned_branch_id, dept_id) VALUES 
  ('Michael', 'Smith', '2001-06-22', 'President', 1, 3),
  ('Susan', 'Barker', '2002-09-12', 'Vice President', 1, 3),
  ('Robert', 'Tyler', '2000-02-09', 'Treasurer', 1, 3),
  ('Susan', 'Hawthorne', '2002-04-24', 'Operations Manager', 1, 1),
  ('John', 'Gooding', '2003-11-14', 'Loan Manager', 1, 2),
  ('Helen', 'Fleming', '2004-03-17', 'Head Teller', 2, 1),
  ('Chris', 'Tucker', '2004-09-15', 'Teller', 2, 1),
  ('Sarah', 'Parker', '2002-12-02', 'Teller', 2, 1),
  ('Jane', 'Grossman', '2002-05-03', 'Head Teller', 3, 1),
  ('Paula', 'Roberts', '2003-07-27', 'Teller', 3, 1),
  ('Thomas', 'Ziegler', '2002-10-23', 'Teller', 3, 1),
  ('Samantha', 'Jameson', '2003-01-08', 'Head Teller', 4, 1),
  ('John', 'Blake', '2000-05-11', 'Teller', 4, 1),
  ('Cindy', 'Mason', '2002-08-09', 'Teller', 4, 1),
  ('Frank', 'Portman', '2003-04-01', 'Head Teller', 5, 1),
  ('Theresa', 'Markham', '2001-03-15', 'Teller', 5, 1),
  ('Beth', 'Fowler', '2002-06-29', 'Teller', 5, 1);

-- Tabla product_type
INSERT INTO product_type (product_type_cd, name) VALUES 
  ('ACCOUNT', 'Customer Accounts'),
  ('LOAN', 'Individual and Business Loans'),
  ('INSURANCE', 'Insurance Products');

-- Tabla product
INSERT INTO product (product_cd, name, product_type_cd, date_offered, date_retired) VALUES 
  ('CHK', 'Checking Account', 'ACCOUNT', '2000-01-01', NULL),
  ('SAV', 'Savings Account', 'ACCOUNT', '2000-01-01', NULL),
  ('MM', 'Money Market Account', 'ACCOUNT', '2000-01-01', NULL),
  ('CD', 'Certificate of Deposit', 'ACCOUNT', '2000-01-01', NULL),
  ('MRT', 'Home Mortgage', 'LOAN', '2000-01-01', NULL),
  ('AUT', 'Auto Loan', 'LOAN', '2000-01-01', NULL);

-- Tabla customer (cliente general)
INSERT INTO customer (fed_id, cust_type_cd, address, city, state, postal_code) VALUES 
  ('111-11-1111', 'I', '123 Main St.', 'Cambridge', 'MA', '02139'),
  ('222-22-2222', 'I', '11 Oak St.', 'Waltham', 'MA', '02452'),
  ('333-33-3333', 'I', '55 Spruce Ave.', 'Arlington', 'MA', '02476'),
  ('444-44-4444', 'I', '22 2nd Ave.', 'Salem', 'NH', '03079'),
  ('555-55-5555', 'I', '7 Elm St.', 'Portland', 'ME', '04101'),
  ('666-66-6666', 'B', '500 Market St.', 'Boston', 'MA', '02110'),
  ('777-77-7777', 'B', '400 Industrial Way', 'Woburn', 'MA', '01801');

-- Tabla individual (solo clientes tipo 'I')
INSERT INTO individual (cust_id, fname, lname, birth_date) VALUES 
  (1, 'James', 'Hadley', '1972-04-22'),
  (2, 'Susan', 'Tingley', '1968-08-15'),
  (3, 'Frank', 'Tucker', '1958-02-06'),
  (4, 'John', 'Hayward', '1966-12-22'),
  (5, 'Charles', 'Frasier', '1971-05-27');

-- Tabla business (solo clientes tipo 'B')
INSERT INTO business (cust_id, name, state_id, incorp_date) VALUES 
  (6, 'Chilton Engineering', '12-345-678', '1995-05-01'),
  (7, 'NE Cooling & Heating', '98-765-432', '2001-01-15');

-- Tabla officer (vinculados a cliente de tipo business)
INSERT INTO officer (cust_id, fname, lname, title, start_date) VALUES 
  (6, 'John', 'Chilton', 'President', '1995-05-01'),
  (7, 'William', 'Taylor', 'President', '2001-01-15');

-- Tabla account
INSERT INTO account (product_cd, cust_id, open_date, status, open_branch_id, open_emp_id, avail_balance, pending_balance) VALUES
  ('CHK', 1, '2000-01-15', 'ACTIVE', 1, 1, 1057.75, NULL),
  ('SAV', 1, '2000-01-15', 'ACTIVE', 1, 1, 500.00, NULL),
  ('CD', 1, '2000-06-30', 'ACTIVE', 1, 1, 3000.00, NULL),
  ('MM', 2, '2001-03-12', 'ACTIVE', 1, 2, 1540.00, NULL),
  ('CHK', 3, '2002-11-23', 'ACTIVE', 3, 10, 1057.75, NULL),
  ('SAV', 3, '2002-11-23', 'ACTIVE', 3, 10, 2212.50, NULL),
  ('MM', 4, '2001-07-30', 'ACTIVE', 4, 13, 10250.00, NULL),
  ('CHK', 5, '2002-09-28', 'ACTIVE', 5, 15, 225.00, NULL),
  ('CHK', 6, '2003-12-10', 'ACTIVE', 2, 6, 122.37, NULL),
  ('SAV', 6, '2003-12-10', 'ACTIVE', 2, 6, 500.00, NULL),
  ('SAV', 7, '2004-01-27', 'ACTIVE', 2, 7, 2212.50, NULL);

-- Tabla transaction
INSERT INTO transaction (txn_date, account_id, txn_type_cd, amount, teller_emp_id, execution_branch_id, funds_avail_date) VALUES
  ('2000-01-15 09:30:00', 1, 'CDT', 1000.00, 1, 1, '2000-01-15 09:30:00'),
  ('2000-01-15 12:00:00', 1, 'CDT', 57.75, 1, 1, '2000-01-15 12:00:00'),
  ('2000-01-16 10:00:00', 2, 'CDT', 500.00, 1, 1, '2000-01-16 10:00:00'),
  ('2000-06-30 14:00:00', 3, 'CDT', 3000.00, 1, 1, '2000-06-30 14:00:00'),
  ('2001-03-12 10:00:00', 4, 'CDT', 1540.00, 2, 1, '2001-03-12 10:00:00'),
  ('2002-11-23 09:45:00', 5, 'CDT', 1057.75, 10, 3, '2002-11-23 09:45:00'),
  ('2002-11-23 10:15:00', 6, 'CDT', 2212.50, 10, 3, '2002-11-23 10:15:00'),
  ('2001-07-30 11:00:00', 7, 'CDT', 10250.00, 13, 4, '2001-07-30 11:00:00'),
  ('2002-09-28 15:00:00', 8, 'CDT', 225.00, 15, 5, '2002-09-28 15:00:00'),
  ('2003-12-10 13:00:00', 9, 'CDT', 122.37, 6, 2, '2003-12-10 13:00:00'),
  ('2003-12-10 13:20:00', 10, 'CDT', 500.00, 6, 2, '2003-12-10 13:20:00'),
  ('2004-01-27 09:00:00', 11, 'CDT', 2212.50, 7, 2, '2004-01-27 09:00:00');