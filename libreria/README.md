# Librería — Base de Datos

Proyecto de base de datos relacional construido para la materia Base de Datos I de la Tecnicatura Universitaria en Programación (UTN).

## Archivos

| Archivo                  | Descripción                                                                                 |
| :----------------------- | :------------------------------------------------------------------------------------------ |
| `libreria_backup.sql`    | Estructura, claves foráneas y datos de prueba de la base de datos.                          |
| `consultas_practica.sql` | Consultas del Módulo 5: `INSERT`, `JOINS` (`INNER`/`LEFT`), subconsultas y vistas (`VIEW`). |

## Estructura de la base de datos

El modelo consta de tres tablas principales relacionadas entre sí:

- **autores:** Almacena la información de los escritores (`autor_id`, `nombre`).
- **libros:** Contiene los títulos y precios, conectada mediante una clave foránea (`FK`) hacia `autores`.
- **clientes:** Registro de usuarios compradores (`cliente_id`, `nombre`, `email`).

## Tecnologías

- MySQL 9.6
- MySQL Workbench

## Comandos Clave Utilizados

- **`INSERT INTO`:** Inserción de registros especificando columnas para asegurar la robustez del código y evitar fallas ante futuros cambios estructurales.
- **`INNER JOIN` / `LEFT JOIN`:** Cruce de tablas relacionales. `INNER` para coincidencias exactas y `LEFT` para preservar todos los registros de la tabla izquierda (ej. autores sin libros).
- **Subconsultas:** Consultas anidadas en el `WHERE` para filtrado dinámico avanzado (ej. buscar libros con precio mayor al promedio general `AVG`).
- **`CREATE VIEW` / `DROP VIEW`:** Creación y eliminación de vistas o "consultas guardadas" para simplificar el acceso a reportes complejos (como la cantidad de libros por autor).

## Cómo usar

1. **Importar la base de datos:** Abrir `libreria.sql` en MySQL Workbench o importarlo desde el menú _Server > Data Import_.
2. **Ejecutar consultas:** Abrir el archivo `consultas_practica.sql` para probar los diferentes tipos de uniones, subconsultas y la creación de la vista analítica.
