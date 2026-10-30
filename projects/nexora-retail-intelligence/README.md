# NEXORA — Retail Intelligence

**Caso de consultoría BI basado en datos sintéticos.**

## Objetivo
Entender ventas, rentabilidad, devoluciones y cumplimiento de metas en 8 tiendas ficticias de Costa Rica. Incluye 4.200 registros transaccionales, tablas de productos y tiendas, y metas mensuales.

## Estructura
- `data/`: archivos CSV de ejemplo.
- `power-query/PowerQuery_M.txt`: consultas M para limpiar, tipar y enriquecer los datos.
- `dax/Medidas_DAX.txt`: calendario y medidas analíticas.
- `01_LEEME_PROYECTO.md`: instrucciones originales detalladas.
- `04_Diseno_Dashboard.md`: especificación visual.
- `05_Presentacion_Entrevista.md`: guion de presentación.

## Demostración reproducible
1. Descarga los CSV.
2. En Power BI Desktop, crea el parámetro `pRuta` apuntando a `data/` con barra final.
3. Crea una consulta por bloque de `power-query/PowerQuery_M.txt`.
4. Configura relaciones y medidas de `dax/Medidas_DAX.txt` conforme a las instrucciones.
5. Crea las páginas, valida totales, guarda tu `.pbix` y añade capturas reales.

**Estado:** kit de datos, consultas, DAX y especificación; el reporte `.pbix` no está incluido ni se declara terminado.
