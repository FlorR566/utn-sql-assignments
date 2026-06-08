-- Actividad: 7) Crear una BD veterinaria con sus tablas 

-- eliminamos una base de datos:
DROP DATABASE IF EXISTS veterinaria;                        -- elimina si ya existe (es una buena practica antes de comenzar)

-- creamos la base de datos:
CREATE DATABASE veterinaria;

-- usamos la base de datos:
USE veterinaria;

-- creamos la tablas con sus atributos:
CREATE TABLE cliente (
	id_cliente INT AUTO_INCREMENT PRIMARY KEY,              -- AUTOINCREMENTAL
    nombre VARCHAR(80) NOT NULL,
    dni VARCHAR(20) UNIQUE NOT NULL ,                       -- UNIQUE (no puede repetirse)
    telefono VARCHAR(10) NOT NULL,
    direccion VARCHAR(100) NOT NULL
);

CREATE TABLE mascota (
	id_mascota INT AUTO_INCREMENT PRIMARY KEY,              
    nombre VARCHAR(50) NOT NULL,
    especie VARCHAR(30) NOT NULL ,                      
    fecha_nacimiento DATE,
    id_cliente INT NOT NULL,                                 -- CLAVE FORANEA (FK)
    FOREIGN KEY (id_cliente) REFERENCES cliente(id_cliente)
);

CREATE TABLE vacuna (
	id_vacuna INT AUTO_INCREMENT PRIMARY KEY,       
    nombre_vacuna VARCHAR(80) NOT NULL,
    fecha_aplicacion DATE NOT NULL,                  
    id_mascota INT NOT NULL,
    FOREIGN KEY (id_mascota) REFERENCES mascota(id_mascota)
);

-- insetamos los datos en tabla cliente
INSERT INTO cliente (nombre, dni, telefono, direccion)
VALUES 
('María Gómez', '35124879', '1145896325', 'Av. Rivadavia 4520'),
('Alberto Rodríguez', '28456123', '1519987412', 'San Martín 815'),
('Ana Benítez', '40235781', '1114758693', 'Belgrano 1240'),
('Diego Fernando López', '31654982', '1116547892', 'Colon 355'),
('Sofia Elizabeth Martínez', '42105634', '1114123654', 'Mitre 789'),
('Lucas Giménez', '25894123', '1165874123', 'Falcon 1245'),
('Camila Belén Herrera', '38451296', '1114859632', 'Calle 7 No. 432'),
('Juan Ignacio Silva', '33654128', '1114569871', 'Las Heras 960'),
('Valeria Inés Castro', '29784512', '1124159632', 'Urquiza 2150'),
('Matías Romero', '41325647', '1145123698', 'Av. Libertador 840');

-- insetamos los datos en tabla mascota
INSERT INTO mascota (nombre, especie, fecha_nacimiento, id_cliente)
VALUES 
("Lola", "Perro", "2022-11-05", 2),
("Bruno", "Perro", "2020-04-12", 4),
("Cleo", "Gato", "2023-01-20", 6),
("Oliver", "Gato", "2021-09-15", 7),
("Zeus", "Perro", "2019-06-30", 1),
("Lila", "Hamster", "2024-02-10", 8),
("Mía", "Perro", "2023-07-14", 3),
("Pelusa", "Conejo", "2022-08-01", 5);


-- insetamos los datos en tabla vacuna
INSERT INTO vacuna (nombre_vacuna, fecha_aplicacion, id_mascota)
VALUES 
("Antirrábica", "2024-11-15", 3),
("Séxtuple", "2024-05-20", 1),
("Triple Felina", "2024-02-10", 4),
("Triple Felina", "2024-10-05", 2),
("Antirrábica", "2024-07-22", 5),
("Quíntuple", "2024-08-30", 3 ),
("Refuerzo Anual", "2025-02-10", 2),
("Antirrábica", "2025-03-15", 6);


-- 7.3.1: Mostrar los datos de la tabla cliente:
SELECT*FROM cliente;

-- 7.3.2: Mostrar los datos de la tabla mascota:
SELECT*FROM mascota;

-- 7.3.2: Mostrar los datos de la tabla vacuna:
SELECT*FROM vacuna;

-- 7.3.3: Mostrar únicamente el nombre y la especie de todas las mascotas:
SELECT nombre, especie FROM mascota;

-- 7.3.4: Listar las mascotas cuya especie sea "Perro":
SELECT*FROM mascota
WHERE especie = "Perro";

-- 7.3.5: mostrar las mascotas ordenadas por fecha de nacimiento (de la más antigua a la más reciente):
SELECT*FROM mascota
ORDER BY fecha_nacimiento;

-- 7.3.6: mostrar a los clientes ordenados alfabéticamente por nombre:
SELECT*FROM cliente
ORDER BY nombre;

-- 7.3.7: mostrar vacunas aplicadas a la mascota con id 1:
SELECT*FROM vacuna
WHERE id_mascota = 1;

-- 7.3.8: mostrar las mascotas que pertenezcan a cliente con id 1:
SELECT*FROM mascota
WHERE id_cliente = 1;

-- 7.3.9: mostrar las vacunas ordenadas por fecha de aplicación en ORDEN DESCENDIENTE:
SELECT*FROM vacuna
ORDER BY fecha_aplicacion DESC;

-- 7.3.10: mostrar las mascotas cuyo nombre comiencen con la letra "L":
SELECT*FROM mascota
WHERE nombre LIKE "L%";

-- 7.3.11: mostrar las mascotas cuyo nombre termine con la letra "a":
SELECT*FROM mascota
WHERE nombre LIKE "%a";

-- 7.3.12: Mostrar las mascotas cuyo nombre contenga la letra "o":
SELECT*FROM mascota
WHERE nombre LIKE "%o%";

-- 7.3.13: Mostrar las mascotas cuyo nombre tenga exactamente 4 caracteres:
SELECT*FROM mascota
WHERE nombre LIKE "____";

-- 7.3.14: Mostrar los clientes cuyo nombre comience con la letra "M":
SELECT*FROM cliente
WHERE nombre LIKE "M%";

-- 7.3.15: Mostrar las vacunas cuyo nombre comience con la palabra "Anti":
SELECT*FROM vacuna
WHERE nombre_vacuna LIKE "Anti%";

-- 7.3.16: Mostrar las mascotas cuyo nombre NO COMIENCE con la letra "S":
SELECT*FROM mascota
WHERE nombre NOT LIKE "S%";

-- 7.3.17: Mostrar las mascotas cuyo nombre tenga la letra "i" como 2º letra:
SELECT*FROM mascota
WHERE nombre LIKE "_i%";

