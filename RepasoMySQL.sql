CREATE DATABASE  actividad_I;

USE actividad_I;

CREATE TABLE productos (
id_producto INT AUTO_INCREMENT PRIMARY KEY,
nombre VARCHAR(50) NOT NULL,
precio INT NOT NULL,
stock INT
);

CREATE TABLE clientes (
id_cliente INT AUTO_INCREMENT PRIMARY KEY,
nombre VARCHAR(50) NOT NULL,
email VARCHAR(50) NOT NULL,
fecha_registro DATETIME
);


CREATE TABLE pedidos (
id_pedido INT AUTO_INCREMENT PRIMARY KEY,
cliente_id VARCHAR(50) NOT NULL,
fecha DATETIME,
total INT
);


-- mejora observación: agregar columna ‘id_producto’ en pedidos como clave foránea de productos
ALTER TABLE pedidos
ADD COLUMN id_producto INT;

ALTER TABLE pedidos
ADD CONSTRAINT fk_id_producto
FOREIGN KEY (id_producto)
REFERENCES productos(id_producto);


-- a) Insertar 3 clientes y 2 productos
-- insertar clientes
INSERT INTO clientes (id_cliente, nombre, email, fecha_registro)
VALUES 
(1, 'Carlos López', 'carlos@gmail.com', '2025-11-24'), 
(2, 'Daniela Fernandez', 'daniela@gmail.com', '2023-04-20'),
(3, 'Tomas Dante', 'tomas@gmail.com', '2026-08-04');

select *from clientes;

-- insertar productos
INSERT INTO productos (id_producto, nombre, precio, stock)
VALUES 
(101, 'Vaso térmico', 30000, 200), 
(102, 'Mochila camping', 150000, 10);


select *from productos;

-- b) Actualice el stock de uno de los productos insertados, estableciendo su valor en 5 unidades
UPDATE productos 
SET stock = 5
WHERE id_producto = 102;

select *from productos;
 
-- c) Elimine los pedidos cuya fecha sea anterior al año 2026
-- primero insertamos pedidos
INSERT INTO pedidos (id_pedido, cliente_id, fecha, total, id_producto)
VALUES 
(1000, 2, '2025-08-24', 300450, 102), 
(1001, 1, '2025-11-10', 200, 101), 
(1002, 1, '2026-07-22', 78500, 102), 
(1003, 2, '2026-05-15', 499500, 101);

-- Para eliminar datos
-- desactivo temporalmente el "modo seguro" de workbench
SET SQL_SAFE_UPDATES = 0;

-- eliminamos pedidos anteriores al año 2026 
DELETE FROM pedidos 
WHERE YEAR(fecha) < 2026;

-- activo nuevamente el "modo seguro"
SET SQL_SAFE_UPDATES = 1;


-- d) Liste todos los productos cuyo precio sea mayor a 100
SELECT *from productos
WHERE precio > 100;

-- e) Muestre el nombre del cliente y la fecha de cada pedido
SELECT c.nombre AS nombre_cliente, p.fecha AS fecha_pedido
FROM clientes AS c
INNER JOIN pedidos AS p ON c.id_cliente = p.cliente_id;


-- f) Obtenga la cantidad de pedidos por cliente
SELECT c.nombre AS nombre_cliente, COUNT(p.cliente_id) AS cantidad_pedidos
FROM clientes AS c
LEFT JOIN pedidos AS p ON c.id_cliente = p.cliente_id
GROUP BY c.id_cliente, c.nombre;



