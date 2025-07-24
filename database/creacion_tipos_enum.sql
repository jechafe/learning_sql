-- Crear tipos ENUM necesarios
CREATE TYPE status_enum AS ENUM ('ACTIVE', 'CLOSED', 'FROZEN');
CREATE TYPE txn_type_enum AS ENUM ('DBT', 'CDT');
CREATE TYPE cust_type_enum AS ENUM ('I', 'B');