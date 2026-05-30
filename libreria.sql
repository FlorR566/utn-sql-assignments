-- eliminamos una base de datos:
DROP DATABASE IF EXISTS libreria;                        -- elimina si ya existe (es una buena practica antes de comenzar)

-- creamos la base de datos:
CREATE DATABASE libreria;

-- usamos la base de datos:
USE libreria;

-- creamos la tabla "autores" con sus atributos:
CREATE TABLE autores(
	autor_id INT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL
);

-- Verificacion inmediata
DESCRIBE autores;                            -- muestra la estructura de la tabla

-- creamos la tabla "libros" con sus atributos:
CREATE TABLE libros(
	libro_id INT PRIMARY KEY,
    titulo VARCHAR(150) NOT NULL,
    autor_id INT,
    FOREIGN	KEY (autor_id) REFERENCES autores(autor_id)
);

-- Verificacion inmediata
DESCRIBE libros;                            -- muestra la estructura de la tabla

-- vemos todos los registros de la tabla "autores":
SELECT*FROM autores;

-- selecciona una columna específica:
SELECT nombre FROM autores;
 
-- filtramos resultados con WHERE:
SELECT titulo FROM libros
WHERE autor_id = 1; -- en este caso pedimos solo los libros del autor con el identificador 1

-- insertar registros con INSERT y VALUES:
INSERT INTO autores(autor_id, nombre)
VALUES (1, 'Isabell Allende');

INSERT INTO libros(libro_id, titulo, autor_id)
VALUES (20, 'La Casa de los Espíritus', 1);



SELECT*FROM autores;
