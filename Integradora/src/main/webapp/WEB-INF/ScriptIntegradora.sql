CREATE DATABASE SGA3;

USE SGA3;

-- Crear tabla Usuarios
CREATE TABLE Usuarios (
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(30) NOT NULL,
    correo VARCHAR(50) NOT NULL,
    contra VARCHAR(256) NOT NULL,
    tipo_cuenta INT NOT NULL,
    estado BOOLEAN NOT NULL,
    codigoVerif VARCHAR(20)
);

-- Crear tabla Proveedor
CREATE TABLE Proveedor (
    nombre_proveedor VARCHAR(50) NOT NULL PRIMARY KEY 
);

-- Crear tabla Unidad de medida
CREATE TABLE Unidad_medida (
    nombre_unidad VARCHAR(50) NOT NULL PRIMARY KEY
);

-- Crear tabla de Areas
CREATE TABLE Areas ( 
    nombre_area VARCHAR(50) NOT NULL PRIMARY KEY,
    letra_identidad CHAR(1) NOT NULL
);

-- Crear tabla Producto
CREATE TABLE Producto (
    producto_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    nombre_producto VARCHAR(100) NOT NULL,
    precio_unitario DECIMAL(7,2) NOT NULL,
    unidad_medida VARCHAR(50) NOT NULL,
    cantidad BIGINT NOT NULL,
    CONSTRAINT unidad_fk FOREIGN KEY (unidad_medida) REFERENCES Unidad_medida (nombre_unidad)
);

-- Crear tabla entradas_pendientes sin prod_entrantes
CREATE TABLE entradas_pendientes (
    folio_entrada INT NOT NULL PRIMARY KEY,
    monto_entrante DECIMAL(7,2) NOT NULL,
    fecha_entrante DATE NOT NULL,
    factura_proveedor VARCHAR(50) NOT NULL,
    usuario_id INT NOT NULL,
    CONSTRAINT proveedor_nombre FOREIGN KEY (factura_proveedor) REFERENCES Proveedor (nombre_proveedor),
    CONSTRAINT usuario_fk FOREIGN KEY (usuario_id) REFERENCES Usuarios (id)
);

-- Completar la tabla entradas_confirmadas
CREATE TABLE entradas_confirmadas (
    entrada_confirmada_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    folio_entrada INT NOT NULL,
    monto_entrante DECIMAL(7,2) NOT NULL,
    fecha_entrante DATE NOT NULL,
    factura_proveedor VARCHAR(50) NOT NULL,
    usuario_id INT NOT NULL,
    CONSTRAINT folio_entrada_fk FOREIGN KEY (folio_entrada) REFERENCES entradas_pendientes (folio_entrada),
    CONSTRAINT proveedor_nombre_fk FOREIGN KEY (factura_proveedor) REFERENCES Proveedor (nombre_proveedor),
    CONSTRAINT usuario_confirmado_fk FOREIGN KEY (usuario_id) REFERENCES Usuarios (id)
);

-- Crear tabla Salidas sin prodSalientes
CREATE TABLE Salidas (
    folio_salida INT NOT NULL,
    montoSaliente DECIMAL(7,2) NOT NULL,
    fechaSal DATE NOT NULL,
    usuario_id INT NOT NULL,
    CONSTRAINT salida_pk PRIMARY KEY (folio_salida),
    CONSTRAINT almacenista_prov FOREIGN KEY (usuario_id) REFERENCES Usuarios (id),
    INDEX idx_fechaSal (fechaSal)
);

-- Crear tabla intermedia entrada_productos
CREATE TABLE entrada_productos (
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    folio_entrada INT NOT NULL,
    producto_id INT NOT NULL,
    cantidad INT NOT NULL,
    CONSTRAINT entrada_fk FOREIGN KEY (folio_entrada) REFERENCES entradas_pendientes (folio_entrada),
    CONSTRAINT producto_fk FOREIGN KEY (producto_id) REFERENCES Producto (producto_id)
);

drop table salida_productos;
-- Crear tabla intermedia salida_productos
CREATE TABLE salida_productos (
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    folioSalida INT NOT NULL,
    idProducto INT NOT NULL,
    cantidad INT NOT NULL,
    CONSTRAINT salida_fk FOREIGN KEY (folioSalida) REFERENCES Salidas (folio_salida),
    CONSTRAINT product_fk FOREIGN KEY (idProducto) REFERENCES Producto (producto_id)
);

-- Simplificar la tabla HistorialEntrada
CREATE TABLE HistorialEntrada (
    historial_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    folioE INT NOT NULL,
    fechaE DATE NOT NULL,
    ingreso DECIMAL(7,2) NOT NULL,
    usuario_id INT NOT NULL,
    saldo_nuevo DECIMAL(7,2) NOT NULL,
    CONSTRAINT folioE_fk FOREIGN KEY (folioE) REFERENCES entradas_pendientes (folio_entrada),
    CONSTRAINT usuarioE_fk FOREIGN KEY (usuario_id) REFERENCES Usuarios (id)
);

-- Simplificar la tabla HistorialSalida
CREATE TABLE HistorialSalida (
    historial_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    folioS INT NOT NULL,
    fechaS DATE NOT NULL,
    egreso DECIMAL(7,2) NOT NULL,
    usuario_id INT NOT NULL,
    saldo_nuevo DECIMAL(7,2) NOT NULL,
    CONSTRAINT folioS_fk FOREIGN KEY (folioS) REFERENCES Salidas (folio_salida),
    CONSTRAINT usuarioS_fk FOREIGN KEY (usuario_id) REFERENCES Usuarios (id)
);

-- Crear vista vista_almacen
CREATE VIEW vista_almacen AS 
SELECT
    p.nombre_producto, 
    SUM(p.precio_unitario * p.cantidad) AS monto_total
FROM Producto p
GROUP BY p.nombre_producto;

-- Crear vista Catalogo
CREATE VIEW Catalogo AS
SELECT 
    p.nombre_producto, 
    p.cantidad, 
    p.precio_unitario
FROM Producto p
GROUP BY p.nombre_producto;

insert into usuarios (nombre, correo, contra, tipo_cuenta,estado) values ('Leo', '20233tn094@utez.edu.mx', sha2(123,256), 1,true);
insert into usuarios (nombre, correo, contra, tipo_cuenta,estado) values ('Francisco', '20233tn239@utez.edu.mx', sha2(123,256), 1,true);
insert into usuarios (nombre, correo, contra, tipo_cuenta,estado) values ('Axel', '20233tn089@utez.edu.mx', sha2(123,256), 1,true);
insert into usuarios (nombre, correo, contra, tipo_cuenta,estado) values ('Mau', '20233t110@utez.edu.mx', sha2(123,256), 1,true);
insert into usuarios (nombre, correo, contra, tipo_cuenta,estado) values ('Alexis', '20203tn100@utez.edu.mx', sha2(123,256), 1,true);

select*from Usuarios;
