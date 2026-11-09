-- MySQL 8+: importar CSV en tabla ventas con tipos apropiados.
-- KPI general
SELECT COUNT(*) transacciones, SUM(ingreso_neto_cop) ingresos,
 SUM(ingreso_neto_cop-costo_total_cop) utilidad_bruta,
 ROUND(100*SUM(ingreso_neto_cop-costo_total_cop)/NULLIF(SUM(ingreso_neto_cop),0),2) margen_pct
FROM ventas;

-- Sucursales y rentabilidad
SELECT sucursal, COUNT(*) transacciones, SUM(ingreso_neto_cop) ingresos,
 SUM(ingreso_neto_cop-costo_total_cop) utilidad_bruta
FROM ventas GROUP BY sucursal ORDER BY ingresos DESC;

-- Tendencia mensual
SELECT DATE_FORMAT(fecha,'%Y-%m') mes, SUM(ingreso_neto_cop) ingresos
FROM ventas GROUP BY DATE_FORMAT(fecha,'%Y-%m') ORDER BY mes;

-- Ranking de productos por sucursal (función ventana)
WITH ventas_producto AS (
 SELECT sucursal, producto, SUM(ingreso_neto_cop) ingresos
 FROM ventas GROUP BY sucursal,producto
)
SELECT *, DENSE_RANK() OVER (PARTITION BY sucursal ORDER BY ingresos DESC) posicion
FROM ventas_producto;
