USE tienda_informatica;
SHOW TABLES;
-- insertar datos a tabla fabricante
DESCRIBE fabricante;
INSERT INTO fabricante VALUES (1, 'Asus');
INSERT INTO fabricante VALUES(2, 'Lenovo');
INSERT INTO fabricante VALUES(3, 'Hewlett-Packard');
INSERT INTO fabricante VALUES(4, 'Samsung');
INSERT INTO fabricante VALUES(5, 'Seagate');
INSERT INTO fabricante VALUES(6, 'Crucial');
INSERT INTO fabricante VALUES(7, 'Gigabyte');
INSERT INTO fabricante VALUES(8, 'Huawei');
INSERT INTO fabricante VALUES(9, 'Xiaomi');

-- consultar
SELECT * from fabricante;
-- insertar datos en tabla productos
DESCRIBE productos;
INSERT INTO  productos VALUES(1, 'Disco duro SATA3 1TB', 86.99, 5);
INSERT INTO productos VALUES(2, 'Memoria RAM DDR4 8GB', 120, 6);
INSERT INTO productos VALUES(3, 'Disco SSD 1 TB', 150.99, 4);
INSERT INTO productos VALUES(4, 'GeForce GTX 1050Ti', 185, 7);
INSERT INTO productos VALUES(5, 'GeForce GTX 1080 Xtreme', 755, 6);
INSERT INTO productos VALUES(6, 'Monitor 24 LED Full HD', 202, 1);
INSERT INTO productos VALUES(7, 'Monitor 27 LED Full HD', 245.99, 1);
INSERT INTO productos VALUES(8, 'Portátil Yoga 520', 559, 2);
INSERT INTO productos VALUES(9, 'Portátil Ideapd 320', 444, 2);
INSERT INTO productos VALUES(10, 'Impresora HP Deskjet 3720', 59.99, 3);
INSERT INTO productos VALUES(11, 'Impresora HP Laserjet Pro M26nw', 180, 3);
-- consultar
SELECT * from productos;

--  ejercicios
-- Lista los nombres y los precios de todos los productos de la tabla productos.
DESCRIBE productos;
SELECT nombre, precio from productos;
-- Lista los nombres y los precios de todos los productos de la tabla producto, convirtiendo los nombres a mayúscula.
SELECT upper(nombre), precio from productos;
-- lista el nombre de los productos, el precio en euros y el precio en dólares estadounidenses (USD)
SELECT nombre as nombre_de_producto, precio as precio_euros, round(precio*1.14, 2) as precio_dolar from productos;
-- el producto más caro por cada fabricante
SELECT f.nombre as nombre, max(p.precio) as maximo_precio
from fabricante f
INNER join productos p on f.id = p.id_fabricante
GROUP BY nombre
ORDER BY maximo_precio DESC;
--  Lista el identificador de los fabricantes que tienen productos en la tabla producto, eliminando los identificadores que aparecen repetidos.
SELECT DISTINCT id_fabricante from productos;
-- Lista el nombre de los productos que no tienen un precio mayor o igual a 400€.
DESCRIBE productos;
SELECT nombre, precio from productos
WHERE precio>= 400;
-- Lista todos los productos que tengan un precio entre 80€ y 300€. 
SELECT nombre, precio from productos
WHERE precio BETWEEN 80 AND 300
ORDER BY precio DESC;

-- Lista todos los productos que tengan un precio mayor que 200€ y que el identificador de fabricante sea igual a 6
SELECT *from productos
WHERE precio>200 and id_fabricante =6;
--  Lista todos los productos donde el identificador de fabricante sea 1, 3 o 5
SELECT * from productos
where id_fabricante  IN(1,3,5);
-- Lista los nombres de los fabricantes cuyo nombre empiece por la letra S.
SELECT *from fabricante
where nombre LIKE 's%';
-- Lista los nombres de los fabricantes cuyo nombre termine por la vocal e
SELECT *from fabricante
WHERE nombre LIKE '%e';
-- Lista los nombres de los fabricantes cuyo nombre contenga el carácter w
SELECT *from fabricante
WHERE nombre LIKE '%w%';
-- Lista los nombres de los fabricantes cuyo nombre sea de 4 caracteres
SELECT *from fabricante
WHERE nombre LIKE '____'; -- cada_ es un caracter

SELECT *from fabricante
WHERE char_length(nombre) =4;

-- ejercicios multitablas 
-- consulta de join. El fabricantes ¿cuantos productos tiene?
DESCRIBE productos;
DESCRIBE fabricante;
SELECT f.nombre as nombre, count(p.nombre) as total_articulos
from fabricante f 
inner JOIN productos p on f.id = p.id_fabricante
GROUP BY f.nombre
ORDER BY total_articulos DESC;

-- Devuelve una lista con el nombre del producto, precio y nombre de fabricante de todos los productos de la base de datos.
-- Ordene el resultado por el nombre del fabricante, por orden alfabético
SELECT p.nombre as nombre_producto, p.precio as precio_producto, f.nombre as nombre_fabricante
from productos p
 join fabricante f on
p.id_fabricante = f.id
ORDER BY nombre_fabricante ASC;

-- devuelve nombre del producto, precio y nombre de fabricante de todos los productos de la base de datos el producto más caro.
SELECT p.nombre, p.precio , f.nombre as nombre_fabricante
from productos p
INNER JOIN fabricante f
on p.id_fabricante = f.id
ORDER BY  p.precio DESC;
-- Devuelve una lista de todos los productos del fabricante Lenovo.
SELECT f.nombre as fabricante_lenovo, p.nombre as productos_lenovo
from  fabricante f
INNER JOIN  productos p
on  f.id = p.id_fabricante
WHERE f.id = "2";

-- Devuelve una lista de todos los productos del fabricante Crucial que tengan un precio mayor que 200€.
SELECT f.nombre, p.nombre as producto
from fabricante  f
INNER JOIN productos p
on  f.id = p.id_fabricante
WHERE f.id ="6" and p.precio>200;
-- Devuelve un listado con todos los productos de los fabricantes Asus, Hewlett-Packard y Seagate
SELECT f.nombre, p.nombre as producto
from fabricante f
INNER JOIN productos p 
on f.id = p.id_fabricante
WHERE f.nombre IN('Asus', 'Hewlett-Packard', 'Seagate');

--  Devuelve un listado con el nombre y el precio de todos los productos de los fabricantes cuyo nombre termine por la vocal e.
SELECT*FROM productos;
SELECT*FROM  fabricante;

DESCRIBE productos;
DESCRIBE fabricante;

SELECT f.nombre, p.precio 
from fabricante f
INNER JOIN productos p 
on f.id = p.id_fabricante
WHERE f.nombre LIKE '%e'
