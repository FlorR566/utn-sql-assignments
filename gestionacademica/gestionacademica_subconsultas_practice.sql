-- ============================================================
--  TP MÓDULO 5 - SUBCONSULTAS
-- ============================================================
USE gestionacademica;

-- ============================================================
--  BÁSICO
-- ============================================================

-- ------------------------------------------------------------
-- Ejercicio 1: Alumnos con edad menor al promedio
-- ------------------------------------------------------------
SELECT nombre, apellido
FROM alumnos
WHERE edad < (SELECT AVG(edad) FROM alumnos);

-- ------------------------------------------------------------
-- Ejercicio 2: Carreras que NO tienen asignaturas
-- ------------------------------------------------------------
SELECT id, nombre_carrera
FROM carreras
WHERE id NOT IN (
    SELECT DISTINCT id_carrera 
    FROM asignaturas 
    WHERE id_carrera IS NOT NULL
);

-- ============================================================
--  INTERMEDIO
-- ============================================================

-- ------------------------------------------------------------
-- Ejercicio 3: Departamento y suma de duración total
-- ------------------------------------------------------------
SELECT 
    departamento,
    SUM(duracion) AS duracion_total
FROM carreras
GROUP BY departamento;

-- ------------------------------------------------------------
-- Ejercicio 4: Carrera y cantidad de alumnos cursando
-- ------------------------------------------------------------
SELECT 
    c.nombre_carrera,
    (SELECT COUNT(*) 
     FROM alumnos a 
     WHERE a.id_carrera = c.id) AS cantidad_alumnos
FROM carreras c;

-- ------------------------------------------------------------
-- Ejercicio 5: Cantidad de carreras por departamento
-- ------------------------------------------------------------
SELECT 
    departamento,
    COUNT(*) AS cantidad_carreras
FROM carreras
GROUP BY departamento;

-- ============================================================
--  AVANZADO
-- ============================================================

-- ------------------------------------------------------------
-- Ejercicio 6: Alumnos con créditos totales mayores a 10
-- ------------------------------------------------------------
SELECT nombre, apellido
FROM alumnos
WHERE id IN (
    SELECT a.id
    FROM alumnos a
    INNER JOIN asignaturas asig ON a.id_carrera = asig.id_carrera
    GROUP BY a.id
    HAVING SUM(asig.creditos) > 10
);

-- ------------------------------------------------------------
-- Ejercicio 7: Alumnos que NO cursan en el departamento 'ARTES Y DISEÑO'
-- ------------------------------------------------------------
SELECT nombre, apellido
FROM alumnos
WHERE id_carrera NOT IN (
    SELECT id 
    FROM carreras 
    WHERE departamento = 'ARTES Y DISEÑO'
)
AND id_carrera IS NOT NULL;

-- ------------------------------------------------------------
-- Ejercicio 8: Asignaturas donde se encuentra el promedio 
-- de créditos de los alumnos más jóvenes
-- ------------------------------------------------------------
SELECT nombre
FROM asignaturas
WHERE id_carrera IN (
    SELECT id_carrera
    FROM alumnos
    WHERE edad = (SELECT MIN(edad) FROM alumnos)
    AND id_carrera IS NOT NULL
);