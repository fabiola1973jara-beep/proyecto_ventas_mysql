USE practicas_sql;
#eliminar la tabla detalle_ventas porque no funciona insert 

DROP TABLE detalle_ventas;
SHOW TABLES;  -- CON ESTO COMPROBE SI LA TABLA SE ELIMINO

# CREO LA TABLA LIMPIA DESDE CERO

CREATE TABLE detalle_ventas (
id_detalle INT PRIMARY KEY AUTO_INCREMENT,
id_ventas INT,
id_producto INT,
cantidad INT,
subtotal DECIMAL(10,2),
FOREIGN KEY (id_ventas) REFERENCES ventas(id_ventas),
FOREIGN KEY (id_producto) REFERENCES productos(id_producto)
);

SHOW CREATE TABLE detalle_ventas;
DROP TABLE detalle_ventas;
SHOW TABLES;  -- CON ESTO COMPROBE SI LA TABLA SE ELIMINO


# tampoco funciono ahora creo la tabla limpia desde cero pero sin foreign

CREATE TABLE detalle_ventas (
id_detalle INT PRIMARY KEY AUTO_INCREMENT,
id_ventas INT,
id_producto INT,
cantidad INT,
subtotal DECIMAL(10,2)
);
SHOW CREATE TABLE detalle_ventas;

# añado las foreign keys con alter  table 
ALTER TABLE detalle_ventas
ADD CONSTRAINT fk_detalle_ventas
FOREIGN KEY (id_ventas)
REFERENCES ventas(id_ventas);


ALTER TABLE detalle_ventas
ADD CONSTRAINT fk_detalle_producto
FOREIGN KEY (id_producto)
REFERENCES productos(id_producto);

SHOW CREATE TABLE detalle_ventas;

DROP TABLE detalle_ventas;

SHOW TABLES LIKE "%detalle%";

CREATE TABLE detalle_ventas (
id_detalle INT PRIMARY KEY AUTO_INCREMENT,
id_ventas INT,
id_producto INT,
cantidad INT,
subtotal DECIMAL(10,2)
);
SHOW CREATE TABLE detalle_ventas;

ALTER TABLE detalle_ventas
ADD CONSTRAINT fk_detalle_ventas
FOREIGN KEY (id_ventas)
REFERENCES ventas(id_ventas);

ALTER TABLE detalle_ventas
ADD CONSTRAINT fk_detalle_producto
FOREIGN KEY (id_producto)
REFERENCES productos(id_producto);


SHOW CREATE TABLE detalle_ventas;





