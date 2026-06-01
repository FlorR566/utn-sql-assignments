-- Modulo 5 - práctica: INSERT - DELETE - UPDATE

-- eliminamos una base de datos:
DROP DATABASE IF EXISTS gestionacademica;                        -- elimina si ya existe (es una buena practica antes de comenzar)

-- creamos la base de datos:
CREATE DATABASE gestionacademica;

-- usamos la base de datos:
USE gestionacademica;

-- creamos la tablas con sus atributos:
CREATE TABLE carreras (
    id INT PRIMARY KEY,
    nombre_carrera VARCHAR(60) NOT NULL,
    duracion TINYINT(1) NOT NULL,
    departamento VARCHAR(60) NOT NULL
);

CREATE TABLE asignaturas (
    id INT PRIMARY KEY,
    nombre VARCHAR(40) NOT NULL,
    creditos INT NOT NULL,
    id_carrera INT NOT NULL,
    FOREIGN KEY (id_carrera)
        REFERENCES carreras (id)
); 

CREATE TABLE alumnos (
    id INT PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
    apellido VARCHAR(50) NOT NULL,
    edad TINYINT NOT NULL,
    id_carrera INT NOT NULL,
    FOREIGN KEY (id_carrera)
        REFERENCES carreras (id)
);

-- En tabla carreras insertamos un registro, una nueva carrera llamada ‘CIENCIA DE DATOS’ con 5 años de duración perteneciente al departamento de ‘SISTEMAS’
INSERT INTO carreras (id, nombre_carrera, duracion, departamento) 
VALUES (1, 'CIENCIA DE DATOS', '5', 'SISTEMAS');

SELECT * FROM carreras;

-- En tabla carreras, insertamos 2 carreras, 'ANALISIS DE DATOS' y 'DISEÑO WEB' , en los registros con id=2 , id=3 .
INSERT INTO carreras (id, nombre_carrera, duracion, departamento) 
VALUES
(2, 'ANALISIS DE DATOS', '3', 'SISTEMAS'),
(3, 'DISEÑO WEB', '3', 'ARTES Y DISEÑO');

SELECT * FROM carreras;


-- En tabla alumnos, insertamos nombre y apellido Juan Soto, con una edad de 25 años, que se inscribirá en la carrera con id=1 (CIENCIA DE DATOS)
INSERT INTO alumnos SET id = 101, nombre = "Juan" , apellido = "Soto", edad = "25", id_carrera = 1;

SELECT*FROM alumnos;

-- En tabla alumnos, vamos a insertar tres alumnos Gabriela, Diego y Mariela con los apellidos, edades y carreras correspondientes siguiendo la misma sintaxis que el primer ejemplo
INSERT INTO alumnos SET id = 102, nombre = "Gabriela" , apellido = "Ruiz", edad = "35", id_carrera = 2;
INSERT INTO alumnos SET id = 103, nombre = "Diego" , apellido = "Lopez", edad = "29", id_carrera = 3;
INSERT INTO alumnos SET id = 104, nombre = "Mariela" , apellido = "Puertas", edad = "19", id_carrera = 1;

SELECT*FROM alumnos;

-- Luego de insertar los datos manualmente mostramos los datos de la tabla asignaturas
SELECT * FROM asignaturas;

-- modificación de registros de una tabla (UPDATE) actualizamos 1 sola columna, el nombre ahora es Juan José para el id=101:
UPDATE alumnos SET nombre = 'Juan Jose' WHERE id=101;

SELECT*FROM alumnos WHERE id=101;

-- modificacion de registros (UPDATE) en varias tablas, actualizamos el nombre a BASE DE DATOS I, y los créditos a 12 para el id=3:
UPDATE asignaturas SET nombre = 'BASE DE DATOS I', creditos = 12 WHERE id = 3;

SELECT*FROM asignaturas WHERE id=3;

-- eliminación de registros de una tabla -- Eliminar una fila específica de la tabla alumnos donde el ID es igual a 103:
DELETE FROM alumnos WHERE id = 103;

SELECT*FROM alumnos WHERE id=103;

-- eliminar varias filas -- en la tabla asignaturas donde el id_carrera = 1 y el credito = 8:
DELETE FROM asignaturas WHERE id_carrera = 1 AND creditos = 8;

SELECT*FROM asignaturas WHERE id_carrera=1;


-- eliminar todas las filas del la tabla alumnos:
-- DELETE FROM alumnos;


INSERT INTO alumnos SET id = 103, nombre = "Diego" , apellido = "Lopez", edad = "29", id_carrera = 3;

-- OPERADORES
-- operador <> 
-- quiero traer a todos los alumnos menos a Diego
SELECT nombre, apellido, edad FROM alumnos WHERE nombre <> 'Diego';

-- listamos solo las carreras que no tengan 5 años de duracion:
SELECT * FROM carreras WHERE duracion <> 5;

-- operador = 
-- listamos las carreras que tengan 5 años de duracion
SELECT * FROM carreras WHERE duracion = 5;

-- listamos de la tabla, las asignaturas que tienen créditos por valor de 12
SELECT * FROM asignaturas WHERE creditos = 12;

-- Operador > , Operador >= . Operador mayor , Operador mayor que
-- mostramos los registros cuya edad sea mayor a 25 años
SELECT nombre, apellido, edad FROM alumnos WHERE edad >25;

-- mostrar registros cuya edad sea mayor o igual a 25 en tabla alumnos:
SELECT nombre, apellido, edad FROM alumnos WHERE edad >=25;


-- Operador < , Operador <= . Operador menor , Operador menor que
-- listamos las asignaturas que tienen credito menor a 8
SELECT nombre, creditos FROM asignaturas WHERE creditos < 8;

-- listamos la asignaturas que tienen un crédito menor o igual a 8. 
SELECT nombre, creditos FROM asignaturas WHERE creditos <= 8;
SELECT * FROM asignaturas; 
