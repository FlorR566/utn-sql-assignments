--
-- TP Módulo 6 : carga de datos en tablas creadas con phpMyAdmin
--

USE Libreria;

-- Insertamos datos dentro de la tabla Artículos
INSERT INTO Articulos (Codigo_Articulo, Articulo, Precio) 
VALUES
('1-0023-D', 'Auriculares inalámbricos', 175),
('2-0023-D', 'Teclado inalámbrico', 245),
('3-0023-D', 'Mini Adaptador USB-C USB 2.0', 75),
('4-0023-D', 'Cable red UTP RJ45', 90),
('5-0023-D', 'Cámara web USB', 165);

SELECT*FROM Articulos;


-- Insertamos datos dentro de la tabla Localidades
INSERT INTO Localidades (codigo_postal, localidad) 
VALUES
(1870, 'Avellaneda'),
(1900, 'La Plata');

SELECT*FROM Localidades;


-- Insertamos datos dentro de la tabla Clientes
INSERT INTO Clientes  (numero_cliente, apellido_cliente, nombre_cliente, calle, numero_calle, codigo_postal) 
VALUES
(21, 'Rodriguez', 'Facundo', 'Rivero', 41, 1870),
(22, 'Martinez', 'Natalia', 'San Eloy', 82, 1870),
(23, 'Garcia', 'Carlos', 'Av. De Italia', 245, 1900);

SELECT*FROM Clientes;


-- Insertamos datos dentro de la tabla Facturas
INSERT INTO Facturas  (numero_factura, fecha, numero_cliente) 
VALUES
(335, '01.08.24', 21),           -- guarda, acá las fechas están mal (PRIMERO VA EL AÑO, LUEGO EL MES Y LUEGO EL DIA --> 2024.08.01)
(336, '02.08.24', 22),
(337, '02.08.24', 23);

SELECT*FROM Facturas;


UPDATE Facturas SET fecha='2024.08.01'  Where numero_factura= 335;
UPDATE Facturas SET fecha='2024.08.02'  Where numero_factura= 336;
UPDATE Facturas SET fecha='2024.08.02'  Where numero_factura= 337;


-- Insertamos datos dentro de la tabla Detalle_Factura
INSERT INTO Detalle_Factura  (Numero_Factura, Item_Factura, Codigo_Articulo, Unidades) 
VALUES
(335, 1, '2-0023-D', 10),
(335, 2, '4-0023-D', 12),
(335, 3, '5-0023-D', 1),
(336, 1, '1-0023-D', 2),
(336, 2, '3-0023-D', 2),
(337, 1, '2-0023-D', 25);

SELECT*FROM Detalle_Factura;

-- Mostramos el script (consultas necesarias) para construir cada tabla:
SHOW CREATE TABLE Articulos;

SHOW CREATE TABLE Clientes;

SHOW CREATE TABLE Localidades;

SHOW CREATE TABLE Facturas;

SHOW CREATE TABLE Detalle_Factura;


-- Mostramos el script para visualizar los índices:
SHOW INDEX FROM Articulos;

SHOW INDEX FROM Clientes;

SHOW INDEX FROM Localidades;

SHOW INDEX FROM Facturas;

SHOW INDEX FROM Detalle_Factura;


-- Consulta SQL para mostrar aquellos clientes que realizaron compras el 02/08/2024
SELECT c.numero_cliente, c.apellido_cliente, c.nombre_cliente, f.numero_factura, f.fecha -- notar que de cada tabla tomo solo las columnas que creo necesarias mostrar
FROM Clientes c
JOIN Facturas f ON c.numero_cliente = f.numero_cliente
WHERE f.fecha = '2024-08-02';


