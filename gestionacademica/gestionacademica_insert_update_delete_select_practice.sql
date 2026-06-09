-- ============================================================
-- MÓDULO 5: Práctica INSERT - UPDATE - DELETE - SELECT
-- Base de Datos I - Tecnicatura Universitaria en Programación
-- UTN - Base de datos: gestionacademica
-- ============================================================
 
USE gestionacademica;
 
-- ============================================================
-- INSERT - TABLA CARRERAS
-- ============================================================
 
-- Ejemplo 1: Insertar una carrera usando INSERT INTO ... VALUES
INSERT INTO carreras (id, nombre_carrera, duracion, departamento) VALUES
(1, 'CIENCIA DE DATOS', 5, 'SISTEMAS');
 
SELECT * FROM carreras;
 
-- Ejemplo 2: Insertar múltiples carreras
INSERT INTO carreras (id, nombre_carrera, duracion, departamento) VALUES
(2, 'ANALISIS DE DATOS', 3, 'SISTEMAS');
 
INSERT INTO carreras (id, nombre_carrera, duracion, departamento) VALUES
(3, 'DISEÑO WEB', 3, 'ARTES Y DISEÑO');
 
SELECT * FROM carreras;
 
-- ============================================================
-- INSERT - TABLA ALUMNOS (usando INSERT INTO ... SET)
-- ============================================================
 
-- Ejemplo 1: Insertar un alumno con INSERT ... SET
INSERT INTO alumnos SET id = 101, nombre = 'Juan', apellido = 'Soto', edad = 25, id_carrera = 1;
 
SELECT * FROM alumnos;
 
-- Ejemplo 2: Insertar múltiples alumnos
INSERT INTO alumnos SET id = 102, nombre = 'Gabriela', apellido = 'Ruiz', edad = 35, id_carrera = 2;
INSERT INTO alumnos SET id = 103, nombre = 'Diego', apellido = 'Lopez', edad = 29, id_carrera = 3;
INSERT INTO alumnos SET id = 104, nombre = 'Mariela', apellido = 'Puertas', edad = 19, id_carrera = 1;
 
SELECT * FROM alumnos;
 
-- ============================================================
-- INSERT - TABLA ASIGNATURAS (insertado visualmente en Workbench)
-- ============================================================
 
INSERT INTO asignaturas (id, nombre, creditos, id_carrera) VALUES
(1, 'MATEMATICA I', 8, 1),
(2, 'PROGRAMACION I', 12, 1),
(3, 'BASE DE DATOS', 10, 1),
(4, 'ESTRUCTURA DE DATOS', 8, 1),
(5, 'INTELIGENCIA ARTIFICIAL I', 6, 1);
 
SELECT * FROM asignaturas;
 
-- ============================================================
-- UPDATE - MODIFICACIÓN DE REGISTROS
-- ============================================================
 
-- Ejemplo 1: Actualizar una sola columna
-- Cambia el nombre a 'Juan Jose' para el alumno con id = 101
UPDATE alumnos SET nombre = 'Juan Jose' WHERE id = 101;
 
SELECT * FROM alumnos;
 
-- Ejemplo 2: Actualizar múltiples columnas
-- Cambia nombre y créditos de la asignatura con id = 3
UPDATE asignaturas SET nombre = 'BASE DE DATOS I', creditos = 12 WHERE id = 3;
 
SELECT * FROM asignaturas;
 
-- ============================================================
-- DELETE - ELIMINACIÓN DE REGISTROS
-- ============================================================
 
-- Ejemplo 1: Eliminar una fila específica
DELETE FROM alumnos WHERE id = 103;
 
SELECT * FROM alumnos;
 
-- Ejemplo 2: Eliminar varias filas que coincidan con una condición
-- Elimina asignaturas de la carrera 1 que tengan 8 créditos
DELETE FROM asignaturas WHERE id_carrera = 1 AND creditos = 8;
 
SELECT * FROM asignaturas;
 
-- Ejemplo 3: Eliminar todas las filas de una tabla (¡usar con cuidado!)
-- DELETE FROM alumnos;   <-- comentado para no ejecutar accidentalmente
 
-- ============================================================
-- OPERADORES DE COMPARACIÓN - SELECT con WHERE
-- ============================================================
 
-- Operador <> (distinto de)
-- Traer todos los alumnos menos Diego
SELECT nombre, apellido, edad FROM alumnos WHERE nombre <> 'Diego';
 
-- Listar carreras que no tengan 5 años de duración
SELECT * FROM carreras WHERE duracion <> 5;
 
-- Operador = (igual)
-- Listar carreras con 5 años de duración
SELECT * FROM carreras WHERE duracion = 5;
 
-- Listar asignaturas con 12 créditos
SELECT * FROM asignaturas WHERE creditos = 12;
 
-- Operador > (mayor que)
-- Alumnos con edad mayor a 25
SELECT nombre, apellido, edad FROM alumnos WHERE edad > 25;
 
-- Operador >= (mayor o igual)
-- Alumnos con edad mayor o igual a 25
SELECT nombre, apellido, edad FROM alumnos WHERE edad >= 25;
 
-- Operador < (menor que)
-- Asignaturas con créditos menores a 8
SELECT nombre, creditos FROM asignaturas WHERE creditos < 8;
 
-- Operador <= (menor o igual)
-- Asignaturas con créditos menores o iguales a 8
SELECT nombre, creditos FROM asignaturas WHERE creditos <= 8;
SELECT * FROM asignaturas;
 
-- Operador != (distinto, equivalente a <>)
-- Asignaturas con créditos distintos a 8
SELECT * FROM asignaturas WHERE creditos != 8;
 
-- ============================================================
-- OPERADORES LÓGICOS AND y OR - Otros ejemplos con WHERE
-- ============================================================
 
-- 1. Seleccionar todos los alumnos de una carrera específica
SELECT * FROM alumnos WHERE id_carrera = 3;
 
-- 2. Buscar asignaturas que tengan más de 5 créditos
SELECT * FROM asignaturas WHERE creditos > 5;
 
-- 3. Obtener alumnos que tengan menos de 21 años
SELECT * FROM alumnos WHERE edad < 21;
 
-- 4. Mostrar carreras del departamento 'SISTEMAS'
SELECT * FROM carreras WHERE departamento = 'SISTEMAS';
 
-- 5. Buscar asignaturas de la carrera ID 1 con al menos 8 créditos (AND)
SELECT * FROM asignaturas WHERE id_carrera = 1 AND creditos >= 8;
 
-- 6. Obtener alumnos cuyo apellido sea 'Lopez'
SELECT * FROM alumnos WHERE apellido = 'Lopez';
 
-- 7. Carreras con duración de 5 años O del departamento 'ARTES Y DISEÑO' (OR)
SELECT * FROM carreras WHERE duracion = 5 OR departamento = 'ARTES Y DISEÑO';