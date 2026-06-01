# Gestión Académica — Base de Datos

Proyecto de base de datos relacional desarrollado en la materia **Base de Datos I** de la Tecnicatura Universitaria en Programación (UTN).

## Archivos

| Archivo                  | Descripción                                            |
| ------------------------ | ------------------------------------------------------ |
| `gestionAcademica.sql`   | Estructura y datos de la base de datos                 |
| `consultas_practica.sql` | Consultas del Módulo 5: INSERT, UPDATE, DELETE, SELECT |

## Estructura de la base de datos

Tres tablas relacionadas entre sí:

- **carreras** — carreras universitarias disponibles
- **alumnos** — alumnos inscriptos en cada carrera
- **asignaturas** — materias pertenecientes a cada carrera

## Tecnologías

- MySQL 8
- MySQL Workbench

## Cómo usar

1. Importar `gestionAcademica.sql` en MySQL Workbench via `Server > Data Import`
2. Ejecutar las consultas de `consultas_practica.sql` sobre la base importada
