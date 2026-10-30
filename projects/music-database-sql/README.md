# Base de datos musical — SQL Server

**Script:** [`EntregaFinal.sql`](sql/EntregaFinal.sql)

Proyecto de modelado relacional para una aplicación de música. Incluye entidades como usuarios, artistas, géneros, álbumes, canciones y playlists, con tablas puente para relaciones muchos-a-muchos.

## Conceptos demostrados
- Definición de tablas y tipos de datos con `CREATE TABLE`.
- Llaves primarias y llaves foráneas.
- Restricciones como `UNIQUE` y `CHECK`.
- Inserción de registros de ejemplo y estructura relacional.

## Ejecución segura
1. Crea una **base de datos nueva y exclusivamente de pruebas** en SQL Server.
2. Abre el script en SQL Server Management Studio o Azure Data Studio.
3. Revisa el script antes de ejecutarlo: **contiene sentencias `DROP TABLE`**, que eliminan tablas existentes con esos nombres.
4. Ejecuta sobre la base de pruebas únicamente.

No ejecutes este script en bases productivas ni en una base que contenga información que deseas conservar.
