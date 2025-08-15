-- Crear base de datos
-- CREATE DATABASE IF NOT EXISTS web;
USE web;

-- Tabla de clientes
CREATE TABLE cliente (
                         id_cliente INT AUTO_INCREMENT PRIMARY KEY,
                         nombre VARCHAR(100) NOT NULL,
                         apellido VARCHAR(100) NOT NULL,
                         dni VARCHAR(20) UNIQUE,
                         direccion VARCHAR(255),
                         telefono VARCHAR(20),
                         email VARCHAR(100)
);

-- Tabla de usuarios (login / administración)
CREATE TABLE usuario (
                         id_usuario INT AUTO_INCREMENT PRIMARY KEY,
                         username VARCHAR(50) UNIQUE NOT NULL,
                         password VARCHAR(255) NOT NULL,
                         rol ENUM('ADMIN', 'VENDEDOR') DEFAULT 'VENDEDOR'
);

-- Tabla de productos
CREATE TABLE producto (
                          id_producto INT AUTO_INCREMENT PRIMARY KEY,
                          nombre VARCHAR(100) NOT NULL,
                          descripcion TEXT,
                          precio DECIMAL(10,2) NOT NULL,
                          stock INT NOT NULL DEFAULT 0
);

-- Tabla de fotos (asociada a productos)
CREATE TABLE foto (
                      id_foto INT AUTO_INCREMENT PRIMARY KEY,
                      id_producto INT NOT NULL,
                      url VARCHAR(255) NOT NULL,
                      FOREIGN KEY (id_producto) REFERENCES producto(id_producto)
                          ON DELETE CASCADE
);

-- Tabla de profesores (puede ser un módulo extra del sistema)
CREATE TABLE profesor (
                          id_profesor INT AUTO_INCREMENT PRIMARY KEY,
                          nombre VARCHAR(100) NOT NULL,
                          especialidad VARCHAR(100)
);

-- Tabla de ventas
CREATE TABLE venta (
                       id_venta INT AUTO_INCREMENT PRIMARY KEY,
                       id_cliente INT NOT NULL,
                       id_usuario INT NOT NULL,
                       fecha DATETIME DEFAULT CURRENT_TIMESTAMP,
                       total DECIMAL(10,2) NOT NULL,
                       FOREIGN KEY (id_cliente) REFERENCES cliente(id_cliente),
                       FOREIGN KEY (id_usuario) REFERENCES usuario(id_usuario)
);

-- Tabla de detalle de venta
CREATE TABLE detalleventa (
                              id_detalle INT AUTO_INCREMENT PRIMARY KEY,
                              id_venta INT NOT NULL,
                              id_producto INT NOT NULL,
                              cantidad INT NOT NULL,
                              precio_unitario DECIMAL(10,2) NOT NULL,
                              subtotal DECIMAL(10,2) GENERATED ALWAYS AS (cantidad * precio_unitario) STORED,
                              FOREIGN KEY (id_venta) REFERENCES venta(id_venta) ON DELETE CASCADE,
                              FOREIGN KEY (id_producto) REFERENCES producto(id_producto)
);
