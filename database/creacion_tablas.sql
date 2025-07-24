-- Tabla de departamentos internos de la empresa (por ejemplo: Operaciones, Préstamos, etc.)
CREATE TABLE department (
  dept_id smallint GENERATED ALWAYS AS IDENTITY PRIMARY KEY,  -- ID autogenerado del departamento
  name varchar(20) NOT NULL                                   -- Nombre del departamento
);

-- Tabla de sucursales físicas del banco
CREATE TABLE branch (
  branch_id smallint GENERATED ALWAYS AS IDENTITY PRIMARY KEY,  -- ID autogenerado de la sucursal
  name varchar(20) NOT NULL,                                    -- Nombre de la sucursal
  address varchar(30),                                          -- Dirección
  city varchar(20),                                             -- Ciudad
  state varchar(2),                                             -- Estado (abreviado)
  zip varchar(12)                                               -- Código postal
);

-- Tabla de empleados del banco
CREATE TABLE employee (
  emp_id smallint GENERATED ALWAYS AS IDENTITY PRIMARY KEY,     -- ID del empleado
  fname varchar(20) NOT NULL,                                   -- Nombre
  lname varchar(20) NOT NULL,                                   -- Apellido
  start_date date NOT NULL,                                     -- Fecha de inicio
  end_date date,                                                -- Fecha de baja (si aplica)
  superior_emp_id smallint,                                     -- ID de su superior (jerarquía interna)
  dept_id smallint,                                             -- Departamento asignado
  title varchar(20),                                            -- Cargo (ej: "Teller", "Manager")
  assigned_branch_id smallint,                                  -- Sucursal donde trabaja
  CONSTRAINT fk_e_emp_id FOREIGN KEY (superior_emp_id)
    REFERENCES employee (emp_id),                               -- Autorreferencia para jerarquía
  CONSTRAINT fk_dept_id FOREIGN KEY (dept_id)
    REFERENCES department (dept_id),                            -- Vinculación al departamento
  CONSTRAINT fk_e_branch_id FOREIGN KEY (assigned_branch_id)
    REFERENCES branch (branch_id)                               -- Sucursal asignada
);

-- Tipos de producto disponibles (cuentas, préstamos, seguros, etc.)
CREATE TABLE product_type (
  product_type_cd varchar(10) PRIMARY KEY,                      -- Código de tipo de producto
  name varchar(50) NOT NULL                                     -- Nombre descriptivo
);

-- Productos específicos que se ofrecen a los clientes (ej: Cuenta corriente, Hipoteca)
CREATE TABLE product (
  product_cd varchar(10) PRIMARY KEY,                           -- Código de producto
  name varchar(50) NOT NULL,                                    -- Nombre del producto
  product_type_cd varchar(10) NOT NULL,                         -- Tipo (ej: ACCOUNT, LOAN)
  date_offered date,                                            -- Fecha en que se ofreció por primera vez
  date_retired date,                                            -- Fecha en que dejó de estar disponible
  CONSTRAINT fk_product_type_cd FOREIGN KEY (product_type_cd)
    REFERENCES product_type (product_type_cd)                   -- Vinculación al tipo
);

-- Tabla de clientes (tanto personas como empresas)
CREATE TABLE customer (
  cust_id integer GENERATED ALWAYS AS IDENTITY PRIMARY KEY,     -- ID del cliente
  fed_id varchar(12) NOT NULL,                                  -- NIF/NIE o código fiscal
  cust_type_cd cust_type_enum NOT NULL,                         -- Tipo: 'I' (individuo) o 'B' (empresa)
  address varchar(30),                                          -- Dirección
  city varchar(20),                                             -- Ciudad
  state varchar(20),                                            -- Estado/Provincia
  postal_code varchar(10)                                       -- Código postal
);

-- Detalles adicionales de clientes individuales (personas físicas)
CREATE TABLE individual (
  cust_id integer PRIMARY KEY,                                  -- ID del cliente (coincide con customer)
  fname varchar(30) NOT NULL,                                   -- Nombre
  lname varchar(30) NOT NULL,                                   -- Apellido
  birth_date date,                                              -- Fecha de nacimiento
  CONSTRAINT fk_i_cust_id FOREIGN KEY (cust_id)
    REFERENCES customer (cust_id)                               -- Vinculado a la tabla customer
);

-- Detalles adicionales de clientes empresariales (personas jurídicas)
CREATE TABLE business (
  cust_id integer PRIMARY KEY,                                  -- ID del cliente
  name varchar(40) NOT NULL,                                    -- Nombre de la empresa
  state_id varchar(10) NOT NULL,                                -- Código fiscal de la empresa
  incorp_date date,                                             -- Fecha de constitución
  CONSTRAINT fk_b_cust_id FOREIGN KEY (cust_id)
    REFERENCES customer (cust_id)
);

-- Directivos o cargos dentro de las empresas cliente
CREATE TABLE officer (
  officer_id smallint GENERATED ALWAYS AS IDENTITY PRIMARY KEY, -- ID del directivo
  cust_id integer NOT NULL,                                     -- ID de la empresa a la que pertenece
  fname varchar(30) NOT NULL,                                   -- Nombre del directivo
  lname varchar(30) NOT NULL,                                   -- Apellido
  title varchar(20),                                            -- Cargo (ej: Presidente, Tesorero)
  start_date date NOT NULL,                                     -- Fecha de inicio
  end_date date,                                                -- Fecha de fin (si aplica)
  CONSTRAINT fk_o_cust_id FOREIGN KEY (cust_id)
    REFERENCES business (cust_id)
);

-- Cuentas bancarias abiertas por los clientes
CREATE TABLE account (
  account_id integer GENERATED ALWAYS AS IDENTITY PRIMARY KEY,  -- ID de la cuenta
  product_cd varchar(10) NOT NULL,                              -- Código de producto asociado
  cust_id integer NOT NULL,                                     -- Cliente titular
  open_date date NOT NULL,                                      -- Fecha de apertura
  close_date date,                                              -- Fecha de cierre (si aplica)
  last_activity_date date,                                      -- Último movimiento (si se registra)
  status status_enum,                                           -- Estado: ACTIVE, CLOSED, FROZEN...
  open_branch_id smallint,                                      -- Sucursal de apertura
  open_emp_id smallint,                                         -- Empleado que abrió la cuenta
  avail_balance numeric(10,2),                                  -- Saldo disponible
  pending_balance numeric(10,2),                                -- Saldo pendiente de liberar
  CONSTRAINT fk_product_cd FOREIGN KEY (product_cd)
    REFERENCES product (product_cd),
  CONSTRAINT fk_a_cust_id FOREIGN KEY (cust_id)
    REFERENCES customer (cust_id),
  CONSTRAINT fk_a_branch_id FOREIGN KEY (open_branch_id)
    REFERENCES branch (branch_id),
  CONSTRAINT fk_a_emp_id FOREIGN KEY (open_emp_id)
    REFERENCES employee (emp_id)
);

-- Movimientos realizados en cuentas bancarias
CREATE TABLE transaction (
  txn_id integer GENERATED ALWAYS AS IDENTITY PRIMARY KEY,      -- ID del movimiento
  txn_date timestamp NOT NULL,                                  -- Fecha y hora de la transacción
  account_id integer NOT NULL,                                  -- Cuenta afectada
  txn_type_cd txn_type_enum,                                    -- Tipo: 'CDT' (abono), 'DBT' (cargo), etc.
  amount numeric(10,2) NOT NULL,                                -- Monto de la operación
  teller_emp_id smallint,                                       -- Empleado que la ejecutó
  execution_branch_id smallint,                                 -- Sucursal donde se realizó
  funds_avail_date timestamp,                                   -- Fecha en que los fondos quedaron disponibles
  CONSTRAINT fk_t_account_id FOREIGN KEY (account_id)
    REFERENCES account (account_id),
  CONSTRAINT fk_teller_emp_id FOREIGN KEY (teller_emp_id)
    REFERENCES employee (emp_id),
  CONSTRAINT fk_exec_branch_id FOREIGN KEY (execution_branch_id)
    REFERENCES branch (branch_id)
);
