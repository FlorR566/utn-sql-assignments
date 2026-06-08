use libreria;

SELECT*from autores;
SELECT*from libros;

-- 1. Datos para tabla Autores
INSERT INTO `autores` (autor_id, nombre) 
VALUES 
(1, 'Gabriel García Márquez'),
(2, 'Jorge Luis Borges'),
(3, 'Julio Cortázar'),
(4, 'Isabel Allende'),
(5, 'Mariana Enríquez'); -- Este autor quedará sin libros para probar el LEFT JOIN

-- 2. Datos para tabla Clientes
INSERT INTO `clientes` (cliente_id, nombre, email) 
VALUES 
(1, 'Florencia Gómez', 'flor.gomez@email.com'),
(2, 'Lucas Martínez', 'lucas.m@email.com'),
(3, 'Ana Solís', 'ana.solis@email.com');


-- 3. Agrego columna 'precio' a la tabla libros

ALTER TABLE `libros` ADD COLUMN precio INT NOT NULL;

-- 4. Datos para tabla Libros (incluyendo una columna 'precio')
INSERT INTO `libros` (libro_id, titulo, autor_id, precio) 
VALUES 
(1, 'Cien años de soledad', 1, 28000),
(2, 'El amor en los tiempos del cólera', 1, 22000),
(3, 'El Aleph', 2, 18000),
(4, 'Ficciones', 2, 19500),
(5, 'Rayuela', 3, 24000),
(6, 'La casa de los espíritus', 4, 31000);



-- Traigo todos los registros de cada tabla
SELECT*from libros;
SELECT*from autores;
SELECT*from clientes;

--
-- INNER JOIN entre Autores y Libros
-- cruza ambas tablas y muestra únicament elos lubros que tengan un autor asignado, y los autores que tengan al menos un libro cargado. 
--
SELECT 
    a.nombre AS nombre_autor, 
    l.titulo AS titulo_libro
FROM autores a
INNER JOIN libros l ON a.autor_id = l.autor_id;

-- Ejercicio 1
-- INNER JOIN - Unimos las tablas autor y libro mostrando el nombre del autor del libro y el titulo del libro
SELECT libros.titulo AS "TITULO DEL LIBRO", autores.nombre AS "NOMBRE DEL AUTOR"
FROM libros
INNER JOIN autores on libros.autor_id = autores.autor_id;

-- Ejercicio 2
-- LEFT JOIN - devuelve los autores de tabla izquierda, aunque aún no tengan libros publicados, aparecen como null
--
SELECT a.nombre AS Autor, l.titulo AS Titulo
FROM autores a
LEFT JOIN libros l ON a.autor_id = l.autor_id;


-- Ejercicio 3
-- SUBCONSULTA que muestra los libros más caros que el promedio de precios
-- la subconsulta calcula el promedio de precios y la consulta principal filtra con ese valor.
SELECT titulo, precio
FROM libros
WHERE precio > (
	SELECT AVG(precio) FROM libros
);


SELECT*from libros;
SELECT*from autores;
SELECT*from clientes;

-- Ejercicio 4
-- VISTA "autoresConLibros" que muestra el nombre del autor y la cantidad de libros que tiene
-- 
CREATE VIEW autoresConLibros AS 
SELECT 
	a.autor_id,
    a.nombre AS nombreAutor,
    COUNT(l.libro_id) AS CantidadLibros
FROM autores a
LEFT JOIN libros l ON a.autor_id = l.autor_id
Group By a.autor_id, a.nombre;

-- vemos el contenido de la tabla
select*from autoresConLibros;

-- ELIMINAR una VISTA
DROP VIEW IF EXISTS autoresConLibros;
