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
                                        producto_cantidad INT NOT NULL
);

-- Crear la tabla de Entrada con el identificador
CREATE TABLE IF NOT EXISTS Entrada (
                                       entrada_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY DEFAULT 0,
                                       entrada_folio VARCHAR(100) NOT NULL,
                                       entrada_fecha TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
                                       entrada_proveedor_id INT NOT NULL,
                                       entrada_usuario_id INT NOT NULL,
                                       entrada_estado VARCHAR(20) NOT NULL DEFAULT 'pendiente',
                                       CONSTRAINT entrada_proveedor_fk FOREIGN KEY (entrada_proveedor_id) REFERENCES Proveedor (proveedor_id),
                                       CONSTRAINT entrada_usuario_fk FOREIGN KEY (entrada_usuario_id) REFERENCES Usuarios (id)
);

-- Crear la tabla de Detalle_Entrada
CREATE TABLE IF NOT EXISTS Detalle_Entrada (
                                               detalle_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
                                               entrada_id INT NOT NULL,
                                               entrada_folio VARCHAR(100) NOT NULL,
                                               producto_id INT NOT NULL,
                                               cantidad INT NOT NULL,
                                               valor_total DOUBLE,
                                               CONSTRAINT detalle_entrada_fk FOREIGN KEY (entrada_id) REFERENCES Entrada (entrada_id),
                                               CONSTRAINT detalle_producto_fk FOREIGN KEY (producto_id) REFERENCES Producto (producto_id)
);

CREATE TABLE IF NOT EXISTS Salida (
                                      salida_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY DEFAULT 0,
                                      salida_folio VARCHAR(100) NOT NULL,
                                      salida_usuario_id INT NOT NULL,
                                      salida_fecha TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
                                      salida_area_id INT NOT NULL,
                                      salida_estado VARCHAR(20) NOT NULL DEFAULT 'pendiente',
                                      CONSTRAINT salida_usuario_fk FOREIGN KEY (salida_usuario_id) REFERENCES Usuarios(id),
                                      CONSTRAINT salida_area_fk FOREIGN KEY (salida_area_id) REFERENCES Area_salida(area_id)
);

CREATE TABLE Detalle_Salida(
                               detalle_salida_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
                               salida_id INT NOT NULL,
                               salida_producto_id INT NOT NULL,
                               salida_folio VARCHAR(100) NOT NULL,
                               detalle_salida_cantidad INT NOT NULL, -- Renombrado
                               unidad_id INT NOT NULL,
                               cantidad INT NOT NULL, -- Insertado
                               valor_salida DOUBLE,
                               CONSTRAINT detalle_salida_fk FOREIGN KEY (salida_id) REFERENCES Salida(salida_id),
                               CONSTRAINT detalle_product_fk FOREIGN KEY (salida_producto_id) REFERENCES Producto(producto_id), -- mismo nombre, se cambió
                               CONSTRAINT detalle_unidad_fk FOREIGN KEY (unidad_id) REFERENCES Unidad_medida(unidad_id)
);

CREATE TABLE Usuarios_inhabilitados(
                                       id_correo INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
                                       el_correo VARCHAR(50) NOT NULL
);

CREATE TABLE Usuarios_habilitados(
                                     id_correo INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
                                     el_correo VARCHAR(50) NOT NULL
);

-- Crear vista vista_almacen
    ALTER VIEW vista_almacen AS
    SELECT
        SUM(p.producto_cantidad) AS Cantidad_total,
        SUM(p.producto_precio * p.producto_cantidad) AS Monto_total
    FROM Producto p;

SELECT * FROM vista_almacen;

select*from Producto;

-- Crear vista Catalogo
CREATE VIEW Catalogo AS
SELECT
    p.producto_nombre AS Producto,
    p.producto_cantidad AS Cantidad,
    p.producto_precio AS Precio
FROM Producto p
ORDER BY p.producto_nombre;

-- Actualizar Catalogo
DELIMITER //

CREATE PROCEDURE RefreshMyView()
BEGIN
    DROP VIEW Catalogo;

    CREATE VIEW Catalogo AS
    SELECT
        p.producto_nombre AS Producto,
        p.producto_cantidad AS Cantidad,
        p.producto_precio AS Precio
    FROM Producto p
    ORDER BY p.producto_nombre;
END //

DELIMITER //
CREATE EVENT control_de_usuarios
    ON SCHEDULE
        EVERY 1 DAY
            STARTS TIMESTAMP(CURRENT_DATE + INTERVAL 1 DAY)
    DO
    BEGIN
        TRUNCATE TABLE Usuarios_inhabilitados;
        TRUNCATE TABLE Usuarios_habilitados;
    END;
DELIMITER //



DROP EVENT control_de_usuarios;

CREATE UNIQUE INDEX Idx_proveedores ON Proveedor (proveedor_nombre);
CREATE INDEX Idx_areas ON Area_salida (area_identidad);
CREATE INDEX Idx_unidades ON Unidad_medida (unidad_nombre);
CREATE INDEX Empleados ON Usuarios (nombre);

insert into usuarios (nombre, correo, contra, tipo_cuenta,estado) values ('Leo', '20233tn094@utez.edu.mx', sha2(123,256), 1,true);
insert into usuarios (nombre, correo, contra, tipo_cuenta,estado) values ('Francisco', '20233tn239@utez.edu.mx', sha2(123,256), 1,true);
insert into usuarios (nombre, correo, contra, tipo_cuenta,estado) values ('Axel', '20233tn089@utez.edu.mx', sha2(123,256), 1,true);
insert into usuarios (nombre, correo, contra, tipo_cuenta,estado) values ('Mau', '20233t110@utez.edu.mx', sha2(123,256), 1,true);
insert into usuarios (nombre, correo, contra, tipo_cuenta,estado) values ('Alexis', '20203tn100@utez.edu.mx', sha2(123,256), 1,true);
insert into usuarios (nombre, correo, contra, tipo_cuenta,estado) values ('Fred', '20203tn101@utez.edu.mx', sha2(123,256), 1,false);


insert into Area_salida (area_nombre, area_identidad) values ('Papeleria', 'A');
insert into Area_salida (area_nombre, area_identidad) values ('Abarrotes', 'B');
insert into Area_salida (area_nombre, area_identidad) values ('Farmacia', 'C');
insert into Area_salida (area_nombre, area_identidad) values ('Limpieza', 'D');

insert into Proveedor (proveedor_nombre) values ('Scribid');
insert into Proveedor (proveedor_nombre) values ('Doña chona');
insert into Proveedor (proveedor_nombre) values ('Farmapronto');
insert into Proveedor (proveedor_nombre) values ('Aurrera');

insert into Unidad_medida (unidad_nombre) values ('pieza');

insert into Producto (producto_nombre, producto_precio, producto_cantidad) values ('Jabón ZOTE', 15, 9);
insert into Producto (producto_nombre, producto_precio, producto_cantidad) values ('Mantequilla', 12, 3);
insert into Producto (producto_nombre, producto_precio, producto_cantidad) values ('Café', 40, 1);
insert into Producto (producto_nombre, producto_precio, producto_cantidad) values ('Jabón SALVO', 28, 2);
insert into Producto (producto_nombre, producto_precio, producto_cantidad) values ('Donitas Bimbo', 18, 4);
insert into Producto (producto_nombre, producto_precio, producto_cantidad) values ('Pilas Duracell', 20, 0);