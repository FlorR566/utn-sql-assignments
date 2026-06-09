-- ============================================================
--  TP MÓDULO 5 - VISTAS
-- ============================================================
USE gestionacademica;

-- ============================================================
--  BÁSICO
-- ============================================================

-- ------------------------------------------------------------
-- Ejercicio 1: Vista básica de alumnos
-- ------------------------------------------------------------
CREATE VIEW vista_alumnos_basica AS
SELECT id, nombre, apellido
FROM alumnos;

SELECT * FROM vista_alumnos_basica;

-- ------------------------------------------------------------
-- Ejercicio 2: Consulta mixta - nombre del alumno + nombre de su carrera
-- (combina vista_alumnos_basica con la tabla carreras)
-- ------------------------------------------------------------
SELECT 
    v.nombre,
    v.apellido,
    c.nombre_carrera
FROM vista_alumnos_basica v
LEFT JOIN alumnos a ON v.id = a.id
LEFT JOIN carreras c ON a.id_carrera = c.id;

-- ============================================================
--  INTERMEDIO
-- ============================================================

-- ------------------------------------------------------------
-- Ejercicio 3: Vista asignaturas con nombre de carrera
-- ------------------------------------------------------------
CREATE VIEW vista_asignaturas_carrera AS
SELECT 
    asig.nombre        AS nombre_asignatura,
    asig.creditos,
    c.nombre_carrera
FROM asignaturas asig
INNER JOIN carreras c ON asig.id_carrera = c.id;

SELECT * FROM vista_asignaturas_carrera;

-- ------------------------------------------------------------
-- Ejercicio 4: Vista asignaturas con más de 5 créditos
-- ------------------------------------------------------------
CREATE VIEW vista_asignaturas_credito_alto AS
SELECT nombre, creditos
FROM asignaturas
WHERE creditos > 5;

SELECT * FROM vista_asignaturas_credito_alto;

-- ------------------------------------------------------------
-- Ejercicio 5: Consulta mixta - carrera + asignaturas con créditos altos
-- ------------------------------------------------------------
SELECT 
    c.nombre_carrera,
    v.nombre AS asignatura
FROM vista_asignaturas_credito_alto v
INNER JOIN asignaturas asig ON v.nombre = asig.nombre
INNER JOIN carreras c ON asig.id_carrera = c.id;

-- ============================================================
--  AVANZADO
-- ============================================================

-- ------------------------------------------------------------
-- Ejercicio 6: Vista créditos totales por alumno
-- (suma créditos de todas las asignaturas de SU carrera)
-- ------------------------------------------------------------
CREATE VIEW vista_creditos_por_alumno AS
SELECT 
    a.id,
    a.nombre,
    a.apellido,
    SUM(asig.creditos) AS total_creditos
FROM alumnos a
INNER JOIN asignaturas asig ON a.id_carrera = asig.id_carrera
GROUP BY a.id, a.nombre, a.apellido;

SELECT * FROM vista_creditos_por_alumno;

-- ------------------------------------------------------------
-- Ejercicio 7: Vista alumnos mayores de 21 años
-- ------------------------------------------------------------
CREATE VIEW vista_alumnos_mayores AS
SELECT nombre, apellido, edad, id_carrera
FROM alumnos
WHERE edad > 21;

SELECT * FROM vista_alumnos_mayores;

-- ------------------------------------------------------------
-- Ejercicio 8: Vista asignaturas con más de 3 créditos
-- ------------------------------------------------------------
CREATE VIEW vista_asignaturas_creditos AS
SELECT nombre, creditos
FROM asignaturas
WHERE creditos > 3;

SELECT * FROM vista_asignaturas_creditos;

-- ------------------------------------------------------------
-- Ejercicio 9: Consulta mixta avanzada
-- nombre completo, edad, carrera y asignaturas con más de 3 créditos
-- ------------------------------------------------------------
SELECT 
    CONCAT(am.nombre, ' ', am.apellido) AS nombre_completo,
    am.edad,
    c.nombre_carrera,
    vc.nombre AS asignatura,
    vc.creditos
FROM vista_alumnos_mayores am
INNER JOIN carreras c       ON am.id_carrera = c.id
INNER JOIN asignaturas asig ON asig.id_carrera = c.id
INNER JOIN vista_asignaturas_creditos vc ON vc.nombre = asig.nombre
ORDER BY am.apellido, vc.nombre;

-- ============================================================
--  ACTUALIZACIONES DE VISTAS  (se usa CREATE OR REPLACE VIEW)
-- ============================================================

-- ------------------------------------------------------------
-- Ejercicio 10: Agregar edad a vista_alumnos_basica
-- ------------------------------------------------------------
CREATE OR REPLACE VIEW vista_alumnos_basica AS
SELECT id, nombre, apellido, edad
FROM alumnos;

SELECT * FROM vista_alumnos_basica;

-- ------------------------------------------------------------
-- Ejercicio 11: Agregar nombre_carrera a vista_asignaturas_credito_alto
-- ------------------------------------------------------------
CREATE OR REPLACE VIEW vista_asignaturas_credito_alto AS
SELECT 
    asig.nombre,
    asig.creditos,
    c.nombre_carrera
FROM asignaturas asig
INNER JOIN carreras c ON asig.id_carrera = c.id
WHERE asig.creditos > 5;

SELECT * FROM vista_asignaturas_credito_alto;

-- ------------------------------------------------------------
-- Ejercicio 12: Filtrar vista_asignaturas_carrera a solo créditos > 3
-- ------------------------------------------------------------
CREATE OR REPLACE VIEW vista_asignaturas_carrera AS
SELECT 
    asig.nombre        AS nombre_asignatura,
    asig.creditos,
    c.nombre_carrera
FROM asignaturas asig
INNER JOIN carreras c ON asig.id_carrera = c.id
WHERE asig.creditos > 3;

SELECT * FROM vista_asignaturas_carrera;

-- ------------------------------------------------------------
-- Ejercicio 13: Agregar nombre_carrera a vista_alumnos_mayores
-- ------------------------------------------------------------
CREATE OR REPLACE VIEW vista_alumnos_mayores AS
SELECT 
    a.nombre,
    a.apellido,
    a.edad,
    a.id_carrera,
    c.nombre_carrera
FROM alumnos a
LEFT JOIN carreras c ON a.id_carrera = c.id
WHERE a.edad > 21;

SELECT * FROM vista_alumnos_mayores;

-- ------------------------------------------------------------
-- Ejercicio 14: Agregar nombre_carrera a vista_creditos_por_alumno
-- ------------------------------------------------------------
CREATE OR REPLACE VIEW vista_creditos_por_alumno AS
SELECT 
    a.id,
    a.nombre,
    a.apellido,
    c.nombre_carrera,
    SUM(asig.creditos) AS total_creditos
FROM alumnos a
INNER JOIN carreras    c    ON a.id_carrera    = c.id
INNER JOIN asignaturas asig ON asig.id_carrera = c.id
GROUP BY a.id, a.nombre, a.apellido, c.nombre_carrera;

SELECT * FROM vista_creditos_por_alumno;