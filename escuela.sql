-- eliminamos una base de datos:
DROP DATABASE IF EXISTS escuela;                        -- elimina si ya existe (es una buena practica antes de comenzar)

-- creamos la base de datos:
CREATE DATABASE escuela;

-- especificamos la base a usar:
USE escuela;

-- cramos la tabla alumnos con sus columnas:
CREATE TABLE alumnos(
	id_alumno INT PRIMARY KEY NOT NULL,
	nombre_alumno VARCHAR(40) NOT NULL,
	edad INT,
	materia VARCHAR(40),
	grado INT
);

-- Verificacion inmediata
DESCRIBE alumnos;                            -- muestra la estructura de la tabla

-- insertamos datos dentro de la tabla (Insert):
INSERT INTO alumnos(id_alumno, nombre_alumno, edad, materia, grado)
VALUES(1, 'Juan Lopez', 22, 'Matematicas', 4), (2, 'Marcos Perez', 21, 'Quimica', 3),
(3, 'Nicolas Gomez', 21, 'Matematicas', 3), (4, 'Marisa Lima', 21, 'Contabilidad', 5);

-- modificamos registros:
-- cambiamos un nombre de alumno en id 2 y una materia en id 1:
UPDATE alumnos SET nombre_alumno = 'Estefanía Martinez' WHERE id_alumno = 2;
UPDATE alumnos SET materia = 'Historia' WHERE id_alumno = 1;


-- visualizar la tabla con sus columnas (hacer una consulta o pedir información):
SELECT*FROM alumnos;


-- ver algo especifico de la tabla (consultas condicionadas):
SELECT nombre_alumno
FROM alumnos
WHERE materia = 'Quimica';

-- mostrar el nombre de los alumnos donde la edad sea mayor a 21:
SELECT nombre_alumno FROM alumnos
WHERE edad= 22;

SELECT*FROM alumnos;

-- modificar edad 
UPDATE alumnos SET nombre_alumno = 'Juan Manuel Lopez', edad = 23
WHERE id_alumno = 1;

SELECT*FROM alumnos;