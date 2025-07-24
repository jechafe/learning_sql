
# 📊 Equivalencias MySQL ↔ PostgreSQL

## 🔹 1. Comandos del sistema

| Acción                        | MySQL                      | PostgreSQL                     |
|-----------------------------|----------------------------|--------------------------------|
| Ver bases de datos          | `SHOW DATABASES;`          | `\l` o `SELECT datname FROM pg_database;` |
| Conectarse a una base       | `USE nombre_db;`           | `\c nombre_db`                |
| Ver tablas                  | `SHOW TABLES;`             | `\dt` o consulta a `information_schema.tables` |
| Ver estructura de tabla     | `DESCRIBE tabla;`          | `\d tabla` o `information_schema.columns` |
| Salir del cliente           | `exit` o `quit`            | `\q`                          |

---

## 🔹 2. Tipos de datos

| Concepto                   | MySQL                   | PostgreSQL                   |
|---------------------------|-------------------------|------------------------------|
| Autoincremento            | `AUTO_INCREMENT`        | `SERIAL`, `BIGSERIAL`, `GENERATED` |
| Texto largo               | `TEXT`                  | `TEXT`                       |
| Cadena corta              | `VARCHAR(n)`            | `VARCHAR(n)`                 |
| Booleano                  | `TINYINT(1)` o `BOOL`   | `BOOLEAN` (`TRUE`/`FALSE`)   |
| Fecha y hora              | `DATETIME`, `TIMESTAMP` | `TIMESTAMP`                  |
| Nulo por defecto          | `NOT NULL`              | `NOT NULL`                   |

---

## 🔹 3. Funciones

| Función / Expresión         | MySQL                | PostgreSQL                  |
|----------------------------|----------------------|-----------------------------|
| Nulos                      | `IFNULL(x, y)`       | `COALESCE(x, y)`            |
| Concatenar cadenas         | `CONCAT(a, b)`       | `a || b` o `CONCAT(a, b)`   |
| Longitud string            | `LENGTH(cadena)`     | `LENGTH(cadena)`            |
| Substring                  | `SUBSTRING(c,1,3)`   | `SUBSTRING(c FROM 1 FOR 3)` |
| Fecha actual               | `NOW()`              | `NOW()` o `CURRENT_TIMESTAMP` |
| Formatear fecha            | `DATE_FORMAT()`      | `TO_CHAR(fecha, 'YYYY-MM')` |
| Extraer parte de fecha     | `YEAR(fecha)`        | `EXTRACT(YEAR FROM fecha)`  |

---

## 🔹 4. Auto incremento y PK

| Acción                  | MySQL                      | PostgreSQL                          |
|------------------------|----------------------------|-------------------------------------|
| PK autoincremental     | `id INT AUTO_INCREMENT`     | `id SERIAL PRIMARY KEY`             |
| Último ID insertado    | `LAST_INSERT_ID()`          | `RETURNING id` (en `INSERT`)        |

---

## 🔹 5. Otros elementos clave

| Elemento                | MySQL                 | PostgreSQL                     |
|------------------------|-----------------------|--------------------------------|
| Limitar resultados     | `LIMIT 10 OFFSET 5`   | `LIMIT 10 OFFSET 5` ✅ Igual   |
| Comentarios            | `--`, `#`, `/* */`    | `--`, `/* */`                  |
| Clave foránea          | `FOREIGN KEY (...)`   | Igual                          |
| Vistas                 | `CREATE VIEW`         | `CREATE VIEW`                  |
| Transacciones          | `START TRANSACTION`   | `BEGIN` o `START TRANSACTION`  |

---

## 🔹 6. DDL y DML (igual en ambos)

| Acción                 | Comando SQL                     |
|------------------------|---------------------------------|
| Crear tabla            | `CREATE TABLE ...`              |
| Insertar datos         | `INSERT INTO ...`               |
| Actualizar datos       | `UPDATE tabla SET ...`          |
| Eliminar datos         | `DELETE FROM tabla WHERE ...`   |
