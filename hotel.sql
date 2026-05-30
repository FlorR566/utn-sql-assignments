-- Creacion de la BD
DROP DATABASE IF EXISTS hotel;                        -- elimina si ya existe (es una buena practica antes de comenzar)
CREATE DATABASE hotel;                                -- crea el contenedor principal
USE hotel;                                            -- activa la base de datos

-- Creacion de la tabla
CREATE TABLE tipos_habitacion (
	id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(80) NOT NULL,
    precio_noche DECIMAL(10,2) NOT NULL
);

-- Verificacion inmediata
DESCRIBE tipos_habitacion;                            -- muestra la estructura de la tabla