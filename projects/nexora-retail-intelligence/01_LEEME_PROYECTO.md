# Modelo e implementación de NEXORA

## Necesidad de negocio

NEXORA es una cadena minorista ficticia con 8 tiendas en Costa Rica y canales físicos y digitales. El caso plantea centralizar los resultados comerciales para analizar rentabilidad, identificar tiendas y categorías que requieren atención, comparar ventas con metas y estudiar las devoluciones.

Empresa, transacciones, productos y metas corresponden a un ejercicio con datos simulados.

## Fuentes de datos

- [FactVentas_RAW.csv](data/FactVentas_RAW.csv): 4.200 registros transaccionales entre enero de 2024 y septiembre de 2026, con inconsistencias de texto para su preparación.
- [DimProductos.csv](data/DimProductos.csv): 20 productos y 4 categorías.
- [DimTiendas.csv](data/DimTiendas.csv): información de las 8 tiendas.
- [FactMetasMensuales.csv](data/FactMetasMensuales.csv): 264 metas por tienda y mes.

## Implementación en Power BI Desktop

1. Descarga los archivos de [data/](data/) en una carpeta local.
2. Crea el parámetro de texto `pRuta` con la ruta de esa carpeta y su separador final.
3. En Power Query, crea una consulta en blanco por cada bloque de [PowerQuery_M.txt](power-query/PowerQuery_M.txt), respetando los nombres indicados.
4. Aplica las transformaciones y comprueba los recuentos de ventas, productos, tiendas y metas.
5. Crea el calendario y las relaciones descritas en [Medidas_DAX.txt](dax/Medidas_DAX.txt), con filtrado unidireccional de dimensiones a hechos.
6. Incorpora las medidas DAX individualmente y configura los formatos monetarios y porcentuales.
7. Construye las páginas de acuerdo con la [especificación visual](04_Diseno_Dashboard.md).
8. Valida los filtros, los importes de devoluciones y las comparaciones entre periodos equivalentes.

## Arquitectura

El modelo utiliza `FactVentas` como tabla transaccional. `DimTiendas`, `DimProductos` y `DimFecha` actúan como dimensiones.

`FactMetas` contiene las metas con granularidad de tienda y mes. Se relaciona con `DimTiendas`; la medida `Meta Ventas CRC` aplica el filtro de meses mediante `TREATAS`. No se conecta directamente `YearMonth` con el calendario diario.

## Indicadores

- **Ventas netas:** pedidos completados menos devoluciones, excluyendo cancelaciones.
- **Utilidad:** ventas netas menos costo neto, descontando el costo de las devoluciones.
- **Margen:** utilidad dividida entre ventas netas.
- **Tasa de devoluciones:** pedidos devueltos entre pedidos completados y devueltos.
- **Cumplimiento de metas:** ventas netas entre la meta del periodo y las tiendas seleccionadas.

## Criterios de validación

- Comprobar los recuentos de registros y las claves de relación.
- Revisar valores nulos, duplicados y categorías antes y después de la preparación.
- Contrastar totales y medidas con cálculos manuales.
- Revisar los filtros por mes y tienda, las devoluciones y los márgenes negativos.
- Evitar comparaciones interanuales entre periodos parciales no equivalentes.

## Alcance

El caso contempla devoluciones completas y una fila por artículo o pedido. No modela impuestos, envíos ni costos operativos. Las metas son una planificación simulada independiente de las ventas generadas.

Las fuentes CSV no permiten query folding. El repositorio contiene el material técnico de implementación; el reporte `.pbix` no está incluido.
