-- Crear  base datos con UTF-8 que en este caso es utf8mb4 para aceptar palabras de castellano y emoji
CREATE DATABASE tienda_informatica
 CHARACTER SET utf8mb4;
 -- usar base de datos
 use tienda_informatica;
 
 -- crearemos la tabla de fabricante y productos
 -- id tienes UNSIGNED PARA ACEPTAR SOLO NÚMEROS POSITIVOS INCLUYENDO EL CERO
 
 CREATE TABLE fabricante (
   id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
   nombre  VARCHAR(100) NOT null
 );
 
 CREATE TABLE productos (
  id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
  nombre VARCHAR(100) not NULL,
  precio DOUBLE not NULL,
  id_fabricante INT UNSIGNED NOT NULL,
  FOREIGN KEY (id_fabricante) REFERENCES fabricante(id)
 );

 

 