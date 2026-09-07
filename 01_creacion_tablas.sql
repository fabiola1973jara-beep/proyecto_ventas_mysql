use practicas_sql;
CREATE TABLE detalle_ventas (
    id_detalle INT PRIMARY KEY AUTO_INCREMENT,
    id_ventas INT,
    id_producto INT,
    cantidad INT,
    subtotal DECIMAL(10,2),
    FOREIGN KEY (id_ventas) REFERENCES ventas(id_ventas),
    FOREIGN KEY (id_producto) REFERENCES productos(id_producto)
);
#SHOW TABLES;
CREATE TABLE stock_movimientos (
id_mov INT PRIMARY KEY AUTO_INCREMENT,
id_producto INT ,
tipo ENUM("entrada","salida"),
cantidad INT ,
fecha DATETIME ,
FOREIGN KEY (id_producto) REFERENCES productos(id_producto)
);
SHOW TABLES;