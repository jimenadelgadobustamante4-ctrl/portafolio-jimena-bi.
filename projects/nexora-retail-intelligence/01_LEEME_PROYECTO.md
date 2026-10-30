# NEXORA | Retail Intelligence
## Caso de consultoría BI · Power BI Desktop + Power Query + DAX

**Propósito:** mostrar competencias técnicas y pensamiento de negocio para un puesto de Consultor(a) Junior de Business Intelligence.

**Aviso ético:** empresa, tiendas, clientes, pedidos, precios y metas son **datos sintéticos** creados para este ejercicio. No presentarlos como cifras reales de una empresa.

### El reto del cliente
NEXORA, una cadena minorista ficticia con 8 tiendas en Costa Rica y canales físicos/digitales, no tiene un panel unificado de resultados. La dirección necesita ver dónde gana dinero, qué tiendas y categorías requieren atención, si alcanza sus metas y si las devoluciones erosionan la rentabilidad.

### Qué contiene el paquete
- `FactVentas_RAW.csv`: 4.200 registros de 2024-01-01 a 2026-09-30 con inconsistencias reales de texto (espacios, mayúsculas, etiquetas).
- `DimProductos.csv`: 20 productos y 4 categorías.
- `DimTiendas.csv`: 8 tiendas y 4 provincias adicionales a San José, segmentadas por región.
- `FactMetasMensuales.csv`: 264 metas de tienda/mes.
- `02_PowerQuery_M.txt`: limpieza, estandarización, tipado, cálculos de importes y desduplicación.
- `03_Medidas_DAX.txt`: modelo calendario y medidas de ventas, rentabilidad, devoluciones, comparación interanual, metas y alertas.
- `04_Diseno_Dashboard.md`: layout detallado de 3 páginas.
- `05_Presentacion_Entrevista.md`: discurso de portafolio y validación de calidad.

### Construcción en Power BI Desktop (paso a paso)
1. Descomprime los CSV en una carpeta local, por ejemplo `C:\BI\NEXORA_BI\`.
2. En **Transformar datos > Administrar parámetros**, crea `pRuta` de tipo Texto con el valor de esa carpeta terminando en `\`.
3. En Power Query, **Nueva fuente > Consulta en blanco > Editor avanzado**, pega cada bloque M de `02_PowerQuery_M.txt` en una consulta diferente, respetando los nombres indicados. **No pegues el archivo completo como una sola consulta.**
4. **Cerrar y aplicar**. Comprueba que FactVentas tenga 4.200 filas, 20 productos, 8 tiendas y 264 metas.
5. En **Modelado**, crea la tabla DimFecha y establece las cuatro relaciones especificadas en `03_Medidas_DAX.txt`, siempre con filtrado **unidireccional** de dimensión a hechos.
6. Crea las medidas DAX individualmente. Nota: `FactMetas` **no** debe conectarse por YearMonth con DimFecha, ya que un mes se repite a diario; la medida `Meta Ventas CRC` utiliza TREATAS para respetar el filtro de meses.
7. Ajusta moneda CRC, porcentajes y tema visual. Diseña las páginas según `04_Diseno_Dashboard.md`.
8. Crea medidas en una tabla dedicada opcional `Medidas = {0}` y oculta la columna Value, o guárdalas en FactVentas.
9. Verifica que los filtros entre páginas funcionen, que 2024 no muestre crecimiento interanual y que los ingresos netos resten devoluciones. Evita comparaciones YoY con periodos parciales no equivalentes.
10. Guarda como **NEXORA_Retail_Intelligence.pbix** desde Power BI Desktop y toma capturas del dashboard y del modelo para tu portafolio.

### Arquitectura y decisiones
Modelo estrella: FactVentas es la tabla transaccional; DimTiendas, DimProductos y DimFecha filtran sus análisis. FactMetas es una segunda tabla de hechos a granularidad de tienda-mes, conectada con DimTiendas y filtrada temporalmente mediante TREATAS.

**Definiciones de indicadores:**
- Ventas netas: pedidos completados descontando importe de devoluciones, excluyendo cancelaciones.
- Utilidad: ventas netas menos costo neto, descontando el costo correspondiente a devoluciones.
- Margen: utilidad / ventas netas.
- Tasa de devoluciones: pedidos devueltos / (completados + devueltos).
- Cumplimiento: ventas netas / meta del periodo y tiendas seleccionados.

**Límites:** el caso presupone devoluciones completas, sin devoluciones parciales; cada venta representa un artículo/pedido. No se modelan impuestos, envíos ni costes operativos. Las metas son una planificación simulada e independientes de las ventas generadas.

### Valor que demuestra al reclutador
Ingesta de datos, calidad y transformación (M), esquema estrella, DAX, métricas de negocio, segmentaciones, storytelling, priorización de oportunidades y comunicación ejecutiva.

### Buenas prácticas y referencia
https://learn.microsoft.com/es-es/power-bi/guidance/star-schema
https://learn.microsoft.com/en-us/power-bi/guidance/power-query-folding

> Los CSV no tienen motor SQL: no esperes query folding en estas fuentes; para escalar a producción se recomienda SQL Server/warehouse y preparación optimizada en origen.
