"""Análisis reproducible con biblioteca estándar de Python."""
import csv
from pathlib import Path
from collections import defaultdict
path = Path(__file__).resolve().parents[1] / 'data' / 'ventas_sinteticas.csv'
with path.open(encoding='utf-8', newline='') as f:
    rows = list(csv.DictReader(f))
by_category = defaultdict(lambda: [0, 0])
for r in rows:
    by_category[r['categoria']][0] += int(r['ingreso_neto_cop'])
    by_category[r['categoria']][1] += int(r['costo_total_cop'])
print(f'Transacciones: {len(rows)}')
for cat, (revenue, cost) in sorted(by_category.items()):
    print(f'{cat}: ingresos COP {revenue:,} | margen bruto {(revenue-cost)/revenue:.1%}')
