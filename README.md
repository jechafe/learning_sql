# learning_sql

# 🏦 Base de Datos Bancaria (Proyecto SQL)

Este repositorio contiene los scripts necesarios para crear y poblar una base de datos bancaria ficticia en PostgreSQL, diseñada para fines didácticos y ejercicios de práctica SQL.

---
## 📁 Estructura del repositorio

database/
├── creacion_tipos_enum.sql # Definición de tipos ENUM (status, tipo de cliente, etc.)
├── creacion_tablas.sql # Creación de todas las tablas con claves primarias y foráneas
├── insercion_datos.sql # Inserción de datos ficticios de ejemplo
└── README.md # Descripción y guía del proyecto


---

## 🧱 Descripción de las tablas

- `department`, `branch`, `employee`: estructura interna del banco (departamentos, oficinas, personal)
- `product_type`, `product`: catálogo de productos financieros
- `customer`, `individual`, `business`: clientes individuales y corporativos
- `officer`: responsables de empresas
- `account`: cuentas bancarias de los clientes
- `transaction`: movimientos en cuentas (ingresos, reintegros, etc.)

---

## ▶️ Instrucciones de uso

1. Crea una base de datos vacía en PostgreSQL.
2. Ejecuta los scripts **en este orden**:

   ```sql
   \i 'database/creacion_tipos_enum.sql'
   \i 'database/creacion_tablas.sql'
   \i 'database/insercion_datos.sql'
