--
--  TP MÓDULO 5 - JOINs: Uniendo Tablas
-- 
USE gestionacademica;

-- creamos la tabla alumnos
CREATE TABLE `alumnos` (
  `id` int(4) PRIMARY KEY NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `apellido` varchar(50) NOT NULL,
  `edad` TINYINT(2) NOT NULL,
  `id_carrera` int(4) NULL -- en este caso dejamos null para permitir el ingreso de id_carrera "null"
);

-- insertamos datos segun el enunciado: 
INSERT INTO `alumnos` (id, nombre, apellido, edad, id_carrera)
VALUES 
(1,'Ana','Gómez',20,1),
(2,'Juan','Pérez',21,1),
(3,'Sol','Martínez',22, NULL);

-- mostramos los datos
select*from alumnos;

-- acomodamos los dato según el enunciado
UPDATE carreras SET nombre_carrera="INFORMATICA" WHERE id=1; 
UPDATE carreras SET nombre_carrera="ELECTRÓNICA" WHERE id=2; 
UPDATE carreras SET nombre_carrera="QUÍMICA" WHERE id=3; 

DELETE FROM carreras where id=4;
DELETE FROM carreras where id=5;

select*from carreras;

-- Parte 1 INNER JOIN
-- ------------------------------------------------------------
-- Ejercicio 1: Nombre completo del alumno y duración de su carrera
-- ------------------------------------------------------------
SELECT 
    CONCAT(a.nombre, ' ', a.apellido) AS nombre_completo,
    c.duracion AS duracion_anios
FROM alumnos a
INNER JOIN carreras c ON a.id_carrera = c.id;


-- ------------------------------------------------------------
-- Ejercicio 2: Alumnos que pertenecen a carreras del departamento 'EXACTAS'
-- ------------------------------------------------------------
SELECT 
    CONCAT(a.nombre, ' ', a.apellido) AS nombre_completo,
    c.nombre_carrera,
    c.departamento
FROM alumnos a
INNER JOIN carreras c ON a.id_carrera = c.id
WHERE c.departamento = 'EXACTAS';

-- =============================================================
--  PARTE 2 - LEFT JOIN
-- =============================================================
-- Consulta de ejemplo del TP
SELECT alumnos.nombre, carreras.nombre_carrera
FROM alumnos
LEFT JOIN carreras ON alumnos.id_carrera = carreras.id;

-- ------------------------------------------------------------
-- Ejercicio 3: Todos los alumnos con nombre y duración de su carrera (si la tienen)
-- ------------------------------------------------------------
SELECT 
    CONCAT(a.nombre, ' ', a.apellido) AS nombre_completo,
    c.nombre_carrera,
    c.duracion AS duracion_anios
FROM alumnos a
LEFT JOIN carreras c ON a.id_carrera = c.id;

-- ------------------------------------------------------------
-- Ejercicio 4: Nombres de alumnos y departamento de su carrera,
--              incluyendo los que no tienen carrera asignada
-- ------------------------------------------------------------
SELECT 
    CONCAT(a.nombre, ' ', a.apellido) AS nombre_completo,
    c.departamento
FROM alumnos a
LEFT JOIN carreras c ON a.id_carrera = c.id;

-- ============================================================
--  PARTE 3 - RIGHT JOIN
-- ============================================================

-- Consulta de ejemplo del TP
SELECT alumnos.nombre, carreras.nombre_carrera
FROM alumnos
RIGHT JOIN carreras ON alumnos.id_carrera = carreras.id;

-- ------------------------------------------------------------
-- Ejercicio 5: Todas las carreras y el nombre de sus alumnos (si tienen)
-- ------------------------------------------------------------
SELECT 
    c.nombre_carrera,
    a.nombre
FROM alumnos a
RIGHT JOIN carreras c ON a.id_carrera = c.id;

-- ------------------------------------------------------------
-- Ejercicio 6: Todas las carreras con departamento y apellidos de alumnos (si hay)
-- ------------------------------------------------------------
SELECT 
    c.nombre_carrera,
    c.departamento,
    a.apellido
FROM alumnos a
RIGHT JOIN carreras c ON a.id_carrera = c.id;

-- ============================================================
--  PARTE 4 - MÚLTIPLES JOINs
-- ============================================================
-- Creamos la tabla matriculas
CREATE TABLE IF NOT EXISTS matriculas (
    id_alumno    INT NOT NULL,
    id_asignatura INT NOT NULL,
    calificacion DECIMAL(3,1),
    PRIMARY KEY (id_alumno, id_asignatura),
    FOREIGN KEY (id_alumno)     REFERENCES alumnos(id),
    FOREIGN KEY (id_asignatura) REFERENCES asignaturas(id)
);

-- Insertamos datos de ejemplo en matriculas
INSERT INTO matriculas (id_alumno, id_asignatura, calificacion) 
VALUES
(1, 1, 9.0), -- Ana en Programación I
(1, 2, 8.0), -- Ana en Bases de Datos
(2, 3, 7.5), -- Juan en Electrónica I
(3, 1, 6.5); -- Sol en Programación I

-- vemos como vienen las tablas 
select*from matriculas;
select*from alumnos;
select*from carreras;
select*from asignaturas;

-- ------------------------------------------------------------
-- Ejercicio 7: 
-- Alumnos de la carrera 'INFORMATICA' con sus asignaturas y calificaciones
-- ------------------------------------------------------------
SELECT
    a.nombre,
    a.apellido,
    c.nombre_carrera,
    asig.nombre  AS asignatura,
    m.calificacion
FROM alumnos a
INNER JOIN carreras    c    ON a.id_carrera    = c.id
INNER JOIN matriculas  m    ON a.id            = m.id_alumno
INNER JOIN asignaturas asig ON m.id_asignatura = asig.id
WHERE c.nombre_carrera = 'INFORMATICA'
ORDER BY a.apellido, a.nombre, asig.nombre;

-- ------------------------------------------------------------
-- Ejercicio 8: Alumnos con carrera, asignaturas matriculadas y calificación,
-- SOLO si la asignatura pertenece a la misma carrera que cursa el alumno
-- ------------------------------------------------------------
SELECT
    a.nombre,
    a.apellido,
    c.nombre_carrera,
    asig.nombre  AS asignatura,
    m.calificacion
FROM alumnos a
INNER JOIN carreras    c    ON a.id_carrera    = c.id
INNER JOIN matriculas  m    ON a.id            = m.id_alumno
INNER JOIN asignaturas asig ON m.id_asignatura = asig.id
WHERE a.id_carrera = asig.id_carrera
ORDER BY a.apellido, a.nombre, asig.nombre;


