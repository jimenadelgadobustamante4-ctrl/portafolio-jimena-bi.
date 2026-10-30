# Cómo presentar NEXORA en una entrevista (90 segundos)

Guion de práctica para adaptar únicamente a los pasos que se hayan implementado y validado en Power BI Desktop. Este repositorio contiene el kit de implementación; no incluye un reporte `.pbix` terminado.

"Desarrollé NEXORA Retail Intelligence como caso integral de Business Intelligence para una cadena minorista simulada en Costa Rica. El objetivo no era solamente diseñar un dashboard, sino convertir información transaccional en decisiones de negocio.

Empecé con más de cuatro mil registros y varias tablas de productos, tiendas y metas. En Power Query realicé limpieza y normalización de canales y estados, definí tipos de datos y construí indicadores de ventas netas, costos y utilidad contemplando devoluciones y cancelaciones. Después modelé las relaciones en un esquema estrella y creé medidas DAX para rentabilidad, crecimiento interanual, devolución y cumplimiento de metas.

Organicé la solución en tres vistas: una ejecutiva para dirección, otra de rentabilidad para detectar productos estratégicos y una operativa para identificar posibles fricciones. Mi enfoque fue que cualquier gerente pudiera entender qué sucede, dónde sucede y qué conviene investigar. Como siguiente paso propondría conectarlo a SQL Server, establecer refresco automático y validar las definiciones de KPI con el negocio." 

## Preguntas que pueden hacerte
**¿Por qué Power Query y no todo en DAX?** Porque la estandarización y preparación se realizan una vez en actualización; las medidas DAX se recalculan según filtros de usuario. Separar ambas capas da claridad al modelo.

**¿Por qué esquema estrella?** Simplifica las relaciones y la propagación del filtro, facilita el mantenimiento y favorece rendimiento.

**¿Cómo validaste la data?** Recuento antes/después (4200), identificadores únicos, nulos en claves, conteo por estado, pruebas con cálculos manuales y totales globales; revisar filtros de mes/tienda y casos de margen negativo.

**¿Cómo interpretarías que una tienda incumple metas?** No concluiría inmediatamente un problema: comprobaría estacionalidad, mezcla de productos, cambios de precios, devolución, calidad de meta y disponibilidad de inventario.

**¿Qué harías en producción?** Seguridad de acceso por tienda (RLS), conexión a base de datos, actualización incremental donde aplique, diccionario de datos, pruebas de conciliación y aprobación de KPIs.

## Frases fuertes para el CV (solo si realmente construiste y validaste el PBIX)
- "Desarrollé un dashboard de inteligencia comercial en Power BI para analizar ventas, rentabilidad y metas sobre 4.200 transacciones simuladas."
- "Diseñé procesos ETL en Power Query (M), estandaricé datos y modelé un esquema estrella con métricas DAX y navegación ejecutiva."
