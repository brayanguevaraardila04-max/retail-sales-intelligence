# Retail Sales Intelligence | SQL + Python + Power BI

**Caso de estudio de portafolio — datos 100% sintéticos.** No corresponde a una empresa ni a experiencia laboral real.

## Problema de negocio
Una cadena ficticia con tres sucursales necesita entender sus ingresos, utilidad bruta, categorías y tendencias mensuales para apoyar decisiones comerciales.

## Datos
1.500 transacciones simuladas durante 2025. Valores en pesos colombianos (COP). Los precios, costos y descuentos son supuestos ilustrativos. No hay información personal.

## Indicadores
- Ingreso neto = cantidad × precio unitario × (1 − descuento).
- Utilidad bruta = ingreso neto − costo total (no incluye gastos fijos ni impuestos).
- Margen bruto = utilidad bruta / ingreso neto.
- Ticket promedio = ingreso neto / número de transacciones.

## Reproducir
1. Ejecutar `python python/resumen.py` (Python 3, sin dependencias).
2. Crear la tabla con `sql/crear_tabla.sql` en MySQL 8 e importar el CSV con Workbench.
3. Ejecutar `sql/analisis.sql`.
4. En Power BI Desktop: Obtener datos > Texto/CSV; cargar `data/ventas_sinteticas.csv`.
5. Crear tarjetas de ingresos, utilidad bruta, margen, ventas mensuales, ingresos por categoría y sucursal.

### Medidas DAX sugeridas
```dax
Ingresos = SUM(ventas_sinteticas[ingreso_neto_cop])
Utilidad Bruta = [Ingresos] - SUM(ventas_sinteticas[costo_total_cop])
Margen Bruto % = DIVIDE([Utilidad Bruta], [Ingresos])
Transacciones = DISTINCTCOUNT(ventas_sinteticas[id_venta])
Ticket Promedio = DIVIDE([Ingresos], [Transacciones])
```

## Resultados
Ver `docs/hallazgos.md`. Los resultados describen únicamente el conjunto simulado.

## Pendiente
Agregar archivo `.pbix` y capturas **después de construir el dashboard**. No se incluye un dashboard inexistente.

## Autor
Brayan Fernando Guevara Ardila — proyecto de aprendizaje y portafolio.
