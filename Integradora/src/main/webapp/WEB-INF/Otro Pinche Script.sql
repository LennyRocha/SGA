CREATE DATABASE IF NOT EXISTS SGADB;
USE SGADB;

-- Crear las tablas necesarias
CREATE TABLE IF NOT EXISTS Usuarios (
    id INT NOT NULL AUTO_INCREMENT,
    nombre VARCHAR(30) NOT NULL,
    correo VARCHAR(50) NOT NULL,
    contra VARCHAR(256) NOT NULL,
    tipo_cuenta INT NOT NULL,
    estado BOOLEAN NOT NULL,
    codigoVerif VARCHAR(20),
    CONSTRAINT usuario_pk PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS Proveedor (
    proveedor_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    proveedor_nombre VARCHAR(50) NOT NULL
);

CREATE TABLE IF NOT EXISTS Unidad_medida (
    unidad_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    unidad_nombre VARCHAR(50) NOT NULL
);

CREATE TABLE IF NOT EXISTS Area_salida (
    area_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    area_nombre VARCHAR(50) NOT NULL,
    area_identidad CHAR(1) NOT NULL
);

CREATE TABLE IF NOT EXISTS Producto (
    producto_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    producto_nombre VARCHAR(50) NOT NULL,
    producto_precio DOUBLE NOT NULL,
    producto_cantidad INT NOT NULL,
    producto_unidad_id INT NOT NULL,
    CONSTRAINT producto_unidad_medida_fk FOREIGN KEY (producto_unidad_id) REFERENCES Unidad_medida (unidad_id)
);

-- Crear la tabla de Entrada con el identificador
CREATE TABLE IF NOT EXISTS Entrada (
    entrada_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    entrada_folio INT NOT NULL,
    entrada_fecha TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    entrada_proveedor_id INT NOT NULL,
    estado VARCHAR(20) NOT NULL DEFAULT 'pendiente',
    CONSTRAINT entrada_proveedor_fk FOREIGN KEY (entrada_proveedor_id) REFERENCES Proveedor (proveedor_id)
);

-- Crear la tabla de Detalle_Entrada
CREATE TABLE IF NOT EXISTS Detalle_Entrada (
    detalle_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    entrada_id INT NOT NULL,
    producto_id INT NOT NULL,
    cantidad INT NOT NULL,
    valor_total DOUBLE,
    CONSTRAINT detalle_entrada_fk FOREIGN KEY (entrada_id) REFERENCES Entrada (entrada_id),
    CONSTRAINT detalle_producto_fk FOREIGN KEY (producto_id) REFERENCES Producto (producto_id)
);

CREATE TABLE IF NOT EXISTS Salida (
    salida_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    salida_folio INT NOT NULL,
    salida_producto_id INT NOT NULL,
    salida_usuario_id INT NOT NULL,
    salida_cantidad INT NOT NULL,
    salida_fecha TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    salida_area_id INT NOT NULL,
    estado VARCHAR(20) NOT NULL DEFAULT 'pendiente',
    salida_valor_total DOUBLE,
    CONSTRAINT salida_producto_fk FOREIGN KEY (salida_producto_id) REFERENCES Producto (producto_id),
    CONSTRAINT salida_usuario_fk FOREIGN KEY (salida_usuario_id) REFERENCES Usuarios(id),
    CONSTRAINT salida_area_fk FOREIGN KEY (salida_area_id) REFERENCES Area_salida(area_id)
);

CREATE TABLE Detalle_Salida(
detalle_salida_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
salida_id INT NOT NULL,
producto_salida_id INT NOT NULL,
cantidad INT NOT NULL,
valor_salida DOUBLE,
CONSTRAINT detalle_salida_fk FOREIGN KEY (salida_id)
REFERENCES Salida(salida_id),
CONSTRAINT producto_fk FOREIGN KEY (producto_salida_id)
REFERENCES Producto(producto_id)
);

DELIMITER $$

-- Trigger para calcular el valor total antes de insertar en Detalle_Entrada
CREATE TRIGGER before_entrada_insert
BEFORE INSERT ON Detalle_Entrada
FOR EACH ROW
BEGIN
    SET NEW.valor_total = NEW.cantidad * (SELECT producto_precio FROM Producto WHERE producto_id = NEW.producto_id);
END$$

-- Trigger para calcular el valor de salida total antes de insertar en Detalle_Salida
CREATE TRIGGER before_salida_insert
BEFORE INSERT ON Detalle_Salida
FOR EACH ROW
BEGIN
    SET NEW.valor_salida = NEW.cantidad * (SELECT producto_precio FROM Producto WHERE producto_id = NEW.producto_salida_id);
END$$

-- Trigger para actualizar la cantidad de productos después de actualizar el estado de una Entrada
CREATE TRIGGER after_entrada_update
AFTER UPDATE ON Entrada
FOR EACH ROW
BEGIN
    IF NEW.estado = 'exitoso' AND OLD.estado <> 'exitoso' THEN
        UPDATE Producto
        SET producto_cantidad = producto_cantidad + (
            SELECT SUM(cantidad)
            FROM Detalle_Entrada
            WHERE entrada_id = NEW.entrada_id
        )
        WHERE producto_id IN (
            SELECT producto_id
            FROM Detalle_Entrada
            WHERE entrada_id = NEW.entrada_id
        );
    END IF;
END$$

-- Trigger para actualizar la cantidad de productos después de actualizar el estado de una Salida
CREATE TRIGGER after_salida_update
AFTER UPDATE ON Salida
FOR EACH ROW
BEGIN
    DECLARE cantidad_disponible INT;

    IF NEW.estado = 'exitoso' AND OLD.estado <> 'exitoso' THEN
        SELECT producto_cantidad INTO cantidad_disponible
        FROM Producto
        WHERE producto_id = NEW.salida_producto_id;

        IF cantidad_disponible IS NULL THEN
            SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'Error: Producto no encontrado.';
        ELSEIF NEW.salida_cantidad > cantidad_disponible THEN
            SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'Error: La cantidad solicitada es mayor que la cantidad disponible en el inventario.';
        ELSE
            UPDATE Producto
            SET producto_cantidad = producto_cantidad - NEW.salida_cantidad
            WHERE producto_id = NEW.salida_producto_id;
        END IF;
    END IF;
END$$

DELIMITER ;
-- Crear vista vista_almacen
CREATE VIEW vista_almacen AS 
SELECT
    p.producto_nombre, 
    SUM(p.producto_precio * p.producto_cantidad) AS monto_total
FROM Producto p
GROUP BY p.producto_nombre;

-- Crear vista Catalogo
CREATE VIEW Catalogo AS
SELECT 
    p.producto_nombre, 
    p.producto_cantidad, 
    p.producto_precio
FROM Producto p
GROUP BY p.producto_nombre;

CREATE UNIQUE INDEX Idx_proveedores ON Proveedor (proveedor_nombre);
CREATE INDEX Idx_areas ON Area_salida (area_identidad);
CREATE INDEX Idx_unidades ON Unidad_medida (unidad_nombre);
CREATE INDEX Empleados ON Usuarios (nombre);

insert into usuarios (nombre, correo, contra, tipo_cuenta,estado) values ('Leo', '20233tn094@utez.edu.mx', sha2(123,256), 1,true);
insert into usuarios (nombre, correo, contra, tipo_cuenta,estado) values ('Francisco', '20233tn239@utez.edu.mx', sha2(123,256), 1,true);
insert into usuarios (nombre, correo, contra, tipo_cuenta,estado) values ('Axel', '20233tn089@utez.edu.mx', sha2(123,256), 1,true);
insert into usuarios (nombre, correo, contra, tipo_cuenta,estado) values ('Mau', '20233t110@utez.edu.mx', sha2(123,256), 1,true);
insert into usuarios (nombre, correo, contra, tipo_cuenta,estado) values ('Alexis', '20203tn100@utez.edu.mx', sha2(123,256), 1,true);