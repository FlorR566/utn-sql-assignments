
-- __________ 7) Crear una BD veterinaria con sus tablas __________ -- 

-- eliminamos una base de datos:
DROP DATABASE IF EXISTS veterinaria;                        -- elimina si ya existe (es una buena practica antes de comenzar)

-- creamos la base de datos:
CREATE DATABASE veterinaria;

-- usamos la base de datos:
USE veterinaria;

-- creamos la tablas con sus atributos:
CREATE TABLE cliente (
	id_cliente INT AUTO_INCREMENT PRIMARY KEY,              -- autoincremental
    nombre VARCHAR(80) NOT NULL,
    dni VARCHAR(20) UNIQUE NOT NULL ,                       -- unique (no puede repetirse)
    telefono VARCHAR(10) NOT NULL,
    direccion VARCHAR(100) NOT NULL
);

CREATE TABLE mascota (
	id_mascota INT AUTO_INCREMENT PRIMARY KEY,              
    nombre VARCHAR(50) NOT NULL,
    especie VARCHAR(15) NOT NULL ,                      
    fecha_nacimiento DATE,
    id_cliente INT NOT NULL                                 -- clave foránea
);

CREATE TABLE vacuna (
	id_cliente INT AUTO_INCREMENT PRIMARY KEY,       
    nombre VARCHAR(100) NOT NULL,
    dni VARCHAR(20) UNIQUE NOT NULL ,                  
    telefono VARCHAR(10) NOT NULL,
    direccion VARCHAR(100) NOT NULL
);