CREATE TABLE `cliente` (
                           `idcliente` BIGINT AUTO_INCREMENT PRIMARY KEY,
                           `appaterno` VARCHAR(50) NOT NULL,
                           `apmaterno` VARCHAR(50) NOT NULL,
                           `nombres` VARCHAR(50) NOT NULL,
                           `nacimiento` DATE NULL,
                           `direccion` VARCHAR(200) NULL,
                           `referencia` VARCHAR(200) NULL,
                           `genero` CHAR(1) NOT NULL,
                           `estado` CHAR(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE `usuario` (
                           `id` BIGINT AUTO_INCREMENT PRIMARY KEY,
                           `usuario` VARCHAR(50) NOT NULL UNIQUE,
                           `clave` VARBINARY(255)(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE `profesor` (
                            `id` BIGINT AUTO_INCREMENT PRIMARY KEY,
                            `nombre` VARCHAR(100) NOT NULL,
                            `especialidad` VARCHAR(100)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE `curso` (
                         `id` BIGINT AUTO_INCREMENT PRIMARY KEY,
                         `profesor_id` BIGINT NOT NULL,
                         `nombre` VARCHAR(100) NOT NULL,
                         `descripcion` TEXT,
                         `fecha_inicio` DATE NOT NULL,
                         `fecha_fin` DATE,
                         INDEX `idx_curso_profesor` (`profesor_id`),
                         CONSTRAINT `fk_curso_profesor`
                             FOREIGN KEY (`profesor_id`) REFERENCES `profesor`(`id`)
                                 ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE `producto` (
                            `id` BIGINT AUTO_INCREMENT PRIMARY KEY,
                            `nombre` VARCHAR(100) NOT NULL,
                            `descripcion` TEXT,
                            `precio` DECIMAL(10,2) NOT NULL,
                            `stock` INT NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE `venta` (
                         `id` BIGINT AUTO_INCREMENT PRIMARY KEY,
                         `cliente_id` BIGINT NOT NULL,
                         `usuario_id` BIGINT NOT NULL,
                         `curso_id` BIGINT NULL,
                         `fecha` DATETIME NOT NULL,
                         `total` DECIMAL(10,2) NOT NULL,
                         INDEX `idx_venta_cliente` (`cliente_id`),
                         INDEX `idx_venta_usuario` (`usuario_id`),
                         INDEX `idx_venta_curso` (`curso_id`),
                         CONSTRAINT `fk_venta_cliente`
                             FOREIGN KEY (`cliente_id`) REFERENCES `cliente`(`idcliente`)
                                 ON DELETE RESTRICT,
                         CONSTRAINT `fk_venta_usuario`
                             FOREIGN KEY (`usuario_id`) REFERENCES `usuario`(`id`)
                                 ON DELETE RESTRICT,
                         CONSTRAINT `fk_venta_curso`
                             FOREIGN KEY (`curso_id`) REFERENCES `curso`(`id`)
                                 ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE `detalleventa` (
                                `id` BIGINT AUTO_INCREMENT PRIMARY KEY,
                                `venta_id` BIGINT NOT NULL,
                                `producto_id` BIGINT NOT NULL,
                                `cantidad` INT NOT NULL,
                                `precio_unitario` DECIMAL(10,2) NOT NULL,
                                `subtotal` DECIMAL(10,2) NOT NULL,
                                INDEX `idx_detalle_venta` (`venta_id`),
                                INDEX `idx_detalle_producto` (`producto_id`),
                                CONSTRAINT `fk_detalle_venta`
                                    FOREIGN KEY (`venta_id`) REFERENCES `venta`(`id`)
                                        ON DELETE CASCADE,
                                CONSTRAINT `fk_detalle_producto`
                                    FOREIGN KEY (`producto_id`) REFERENCES `producto`(`id`)
                                        ON DELETE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE `foto` (
                        `id` BIGINT AUTO_INCREMENT PRIMARY KEY,
                        `producto_id` BIGINT NOT NULL,
                        `url` VARCHAR(255) NOT NULL,
                        INDEX `idx_foto_producto` (`producto_id`),
                        CONSTRAINT `fk_foto_producto`
                            FOREIGN KEY (`producto_id`) REFERENCES `producto`(`id`)
                                ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


INSERT INTO usuario (usuario, clave)
VALUES
    ('styp',  AES_ENCRYPT('1234','cibertec')),
    ('admin', AES_ENCRYPT('admin123','cibertec')),
    ('juan',  AES_ENCRYPT('clave123','cibertec'));



SELECT usuario, CAST(AES_DECRYPT(clave,'cibertec') AS CHAR) AS clave
FROM usuario;




