USE practicas_sql;
INSERT INTO clientes (nombre, ciudad, email, telefono)
VALUES
("Ana Torres", "Elche", "ana@example.com","600123124"),
("Luis Jorquera", "Alicante", "luisj@example.com", "600252444"),
("joselyn Jara", "Murcia", "joselyn@example,com", "600393547"),
("Kathereinne Mendez", "Guardamar","kate@example.com", "600254777");

#SELECT * FROM clientes;

INSERT INTO productos (nombre, precio, stock)
VALUES
("teclado mecanico",45.99, 20),
("raton inalambrico", 25.30, 35),
("monitor 24 pulgadas", 140.00, 10);
#SELECT * FROM productos;


INSERT INTO stock_movimientos (id_producto, tipo, cantidad, fecha)
VALUES
(1, "entrada", 20, now()),
(2, "entrada", 35, now()),
(3, "entrada", 10, now());

#SELECT * FROM stock_movimientos;

INSERT INTO ventas (id_cliente, fecha, total)
VALUES
(1, now(),140.00);
#SELECT * FROM ventas;

INSERT INTO detalle_ventas (id_ventas, id_producto, cantidad, subtotal)
VALUES
(1, 3, 1, 140.00);
DESCRIBE detalle_ventas;
SELECT * FROM detalle_ventas;

INSERT INTO stock_movimientos (id_producto, tipo, cantidad, fecha)
VALUES
(3,"salida", 1, now());

UPDATE productos
SET stock = -1
WHERE id_producto = 3;    -- actualizar stock

SELECT
  c.nombre,
  v.id_venta,
  v.fecha,
  v.total
FROM clientes c
LEFT JOIN ventas v ON c.id_cliente = v.id_cliente;  

SELECT * FROM ventas;
SELECT * FROM productos;
SHOW CREATE TABLE detalle_ventas;
SHOW CREATE TABLE ventas;

-- hago esto porque el inser de detalle_ventas no me funciona y parece ser que la clave foranea no se ejecuto

ALTER TABLE detalle_ventas
ADD CONSTRAINT fk_detalle_ventas
FOREIGN KEY (id_ventas)
REFERENCES ventas(id_ventas);

ALTER TABLE detalle_ventas
ADD CONSTRAINT fk_detalle_producto
FOREIGN KEY (id_producto)
REFERENCES productos(id_product);-- me falto la o

SHOW CREATE TABLE detalle_ventas; 

-- debo renombrar la columna nuevamente 
ALTER TABLE productos
CHANGE COLUMN id_product id_producto INT;

ALTER TABLE detalle_ventas
ADD CONSTRAINT fk_detalle_producto
FOREIGN KEY (id_producto)
REFERENCES productos(id_producto);  

SHOW CREATE TABLE detalle_ventas; 
DESCRIBE productos;

SHOW TABLE STATUS WHERE name = "productos";    -- para comprobar si funciona
SHOW TABLE STATUS WHERE name = "detalle_ventas";

SHOW INDEX FROM detalle_ventas;  -- sigue sin funcionar voy a comprobar los indices actuales

ALTER TABLE detalle_ventas
DROP INDEX fk_detalle_ventas;  -- con esto borro  los indices viejos que bloquean las foreign keys

ALTER TABLE detalle_ventas
DROP INDEX fk_detalle_producto; -- lo mismo

ALTER TABLE detalle_ventas   -- vuelvo a crearlas
ADD CONSTRAINT fk_detalle_ventas
FOREIGN KEY (id_ventas)
REFERENCES ventas(id_ventas);

ALTER TABLE detalle_ventas
ADD CONSTRAINT fk_detalle_producto
FOREIGN KEY (id_producto)
REFERENCES productos(id_producto);

SHOW CREATE TABLE detalle_ventas;  -- verifico si existen
