CREATE DATABASE IF NOT EXISTS retail_portfolio;
USE retail_portfolio;
CREATE TABLE IF NOT EXISTS ventas (
 id_venta INT PRIMARY KEY, fecha DATE, sucursal VARCHAR(30), producto VARCHAR(80),
 categoria VARCHAR(40), cantidad INT, precio_unitario_cop INT,
 costo_unitario_cop INT, descuento_pct DECIMAL(5,2),
 ingreso_neto_cop INT, costo_total_cop INT
);
-- Importar data/ventas_sinteticas.csv usando MySQL Workbench Table Data Import Wizard.
