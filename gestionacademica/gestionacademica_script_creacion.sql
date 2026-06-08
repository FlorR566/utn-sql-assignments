DROP DATABASE gestionacademica; -- esbuena practica eliminar la DB si ya existe 

-- Creamos la base de datos
CREATE DATABASE gestionacademica;

-- Usamos la base de datos
USE gestionacademica;

--
-- Table structure for table `alumnos`
--

CREATE TABLE `alumnos` (
  `id` int(4) PRIMARY KEY NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `apellido` varchar(50) NOT NULL,
  `edad` TINYINT(2) NOT NULL,
  `id_carrera` int(4) NOT NULL
);

--
-- Insert data into table `alumnos`
--

INSERT INTO `alumnos` (id, nombre, apellido, edad, id_carrera)
VALUES 
(101,'Juan Jose','Soto',25,1),
(102,'Gabriela','Ruiz',35,2),
(103,'Diego','Lopez',29,3),
(104,'Mariela','Puertas',19,1);


--
-- También es posible insertar datos de esta otra manera  (USANDO "SET")
--
INSERT INTO alumnos SET id=105, nombre="Aldana", apellido="Flores", edad=25, id_carrera=2;
INSERT INTO alumnos SET id=106, nombre="Federico", apellido="Dominguez", edad=30, id_carrera=2;



--
-- Table structure for table `asignaturas`
--

CREATE TABLE `asignaturas` (
 `id` int(4) PRIMARY KEY NOT NULL,
  `nombre` varchar(40) NOT NULL,
  `creditos` int(4) NOT NULL,
  `id_carrera` int(4) NOT NULL
);

--
-- Insert data into table `asignaturas`
--


INSERT INTO `asignaturas` (id, nombre, creditos, id_carrera)
VALUES 
(1,'MATEMATICA I',8,1),
(2,'PROGRAMACION I',12,1),
(3,'BASE DE DATOS I',12,1),
(4,'ESTRUCTURA DE DATOS',8,1),
(5,'INTELIGENCIA ARTIFICIAL I',6,1);


--
-- Table structure for table `carreras`
--

CREATE TABLE `carreras` (
  `id` int(4) PRIMARY KEY NOT NULL,
  `nombre_carrera` varchar(60) NOT NULL,
  `duracion` tinyint(1) NOT NULL,
  `departamento` varchar(60) NOT NULL
);

--
-- Insert data into table `carreras`
--

INSERT INTO `carreras` (id, nombre_carrera, duracion, departamento)
VALUES 
(1,'CIENCIA DE DATOS',5,'SISTEMAS'),
(2,'ANALISIS DE DATOS',3,'SISTEMAS'),
(3,'DISEÑO WEB',3,'ARTES Y DISEÑO');

--
-- También es posible insertar datos de esta otra manera  (ANTEPONIENDO EL NOMBR DE LA BASE DE DATOS)
--
INSERT INTO gestionacademica.carreras (id, nombre_carrera, duracion, departamento) VALUES (4,'PROGRAMACION I',4,'SISTEMAS');
INSERT INTO gestionacademica.carreras (id, nombre_carrera, duracion, departamento) VALUES (5,'HISTORIA DEL ARTE',4,'ARTES Y DISEÑO');

--
-- Vemos el contenido de las tablas
--
SELECT * FROM alumnos;
SELECT * FROM carreras;
SELECT * FROM asignaturas;


--
-- Relacionamos las tablas 
--
alter table `alumnos`
add constraint `alumnos_carreras`
foreign key (`id_carrera`) references `carreras` (`id`);



alter table `asignaturas`
add constraint `aignaturas_alumnos`
foreign key (`id_carrera`) references `carreras` (`id`);


--
-- Actualizamos datos con UPDATE
--
UPDATE alumnos SET nombre="Juan Jose Andres" WHERE id=101;

UPDATE asignaturas SET nombre="BASE DE DATOS II", creditos=15 WHERE id=3; 


-- 
-- Eliminamos con DELETE
--
DELETE FROM asignaturas WHERE id=5 AND creditos=6; -- en este caso para eliminar la asignatura debe cumplir con 2 condiciones unidas mediante AND

-- DELETE FROM alumnos; esto eliminaria todos los registros de la tabla alumnos


--
-- Select usando operadores de condicion
--

-- Mostramos todos los nombres, apellidos y edades de los alumnos que no posean el nombre Diego:
SELECT nombre, apellido, edad FROM alumnos WHERE nombre <> 'Diego';

-- Mostramos todas las carreras donde la duración es distinta a 5 años
SELECT * FROM carreras WHERE duracion <> 5;



	