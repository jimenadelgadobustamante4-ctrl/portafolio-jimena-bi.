# Especificación del dashboard de NEXORA

**Formato**: 16:9, 1280 × 720 px. Colores: fondo `#0B1220`, tarjetas `#162238`, azul `#38BDF8`, turquesa `#2DD4BF`, texto `#F8FAFC`, gris secundario `#A8B3C7`, advertencia `#F59E0B`. Tipografía Aptos/Segoe UI.

## Página 01 · EXECUTIVE PULSE
Cabecera: NEXORA / RETAIL INTELLIGENCE, subtítulo "Rendimiento comercial · Costa Rica". Segmentadores en fila superior: Año, Mes, Región, Canal (solo visuales FactVentas), Categoría.

**Fila de 5 KPIs**: Ventas netas (CRC), utilidad (CRC), margen %, crecimiento YoY %, cumplimiento meta %. Cada tarjeta con valor grande y contexto pequeño.

**Cuerpo**:
- Izquierda (55%): gráfico de líneas "Ventas netas por mes" (DimFecha[YearMonth] orden ascendente, [Ventas Netas CRC]).
- Derecha (45%): barras horizontales "Ventas por categoría" (DimProductos[Categoria], [Ventas Netas CRC]).
- Abajo izquierda: barras "Cumplimiento por tienda" (DimTiendas[Tienda], [Cumplimiento Meta %]).
- Abajo derecha: tabla semáforo con Tienda, Ventas, Utilidad, Margen %, Cumplimiento % y alerta.

## Página 02 · PROFITABILITY LAB
KPIs: Utilidad CRC, margen %, ticket promedio, clientes únicos.
- Dispersión por producto: X=[Ventas Netas CRC], Y=[Margen %], tamaño=[Pedidos Completados], leyenda Categoría; identifica productos de alto volumen y bajo margen.
- Columnas: utilidad por categoría.
- Tabla de productos con formato condicional en Margen %. Usa tooltip con ventas, devoluciones y coste.
- Panel de texto "Insights accionables" con tres hipótesis a validar: promociones, mezcla de productos y descuentos altos.

## Página 03 · CUSTOMER & OPERATIONS
KPIs: pedidos completados, pedidos devueltos, tasa de devolución %, ticket promedio.
- Barras: tasa de devolución por canal.
- Barras: devoluciones por categoría.
- Tendencia mensual de pedidos devueltos.
- Matriz tienda × canal con [Ventas Netas CRC] y [Tasa Devolucion %].
- Botones de navegación entre las tres páginas, tooltip personalizado y botón de reiniciar filtros.

## Interacciones profesionales
- Slicers sincronizados para Año, Mes, Región y Categoría.
- **No usar Canal para filtrar la tarjeta de meta**; las metas se asignan a tienda-mes y no tienen desglose por canal: deja claro este límite, o desactiva esa interacción sobre cumplimiento.
- Crear tooltip dedicado "Detalle del producto".
- Usar etiquetas breves (`₡1,2 M`, `23,4 %`), no saturar de gráficos circulares ni texto.
- Agregar un pie de página: "Datos simulados | Proyecto demostrativo de BI | Corte: septiembre 2026".
