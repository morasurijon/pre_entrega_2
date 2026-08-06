-- Creacion de tablas (DDL)

CREATE DATABASE retail_project;

DROP TABLE IF EXISTS cliente;

CREATE TABLE cliente (
	cliente_id SERIAL PRIMARY KEY,
	nombre VARCHAR(50),
	email VARCHAR(100) UNIQUE NOT NULL,
	edad INT NOT NULL CONSTRAINT edad_minima CHECK (edad >= 18)
);

DROP TABLE IF EXISTS producto;

CREATE TABLE producto (
	descripcion VARCHAR(50),
	producto_id SERIAL PRIMARY KEY,
	precio DECIMAL(10,2) NOT NULL CONSTRAINT precio_minimo CHECK (precio > 0),
	stock INT NOT NULL DEFAULT 1 CONSTRAINT stock_minimo CHECK (stock >= 0),
	categoria VARCHAR(50) CHECK (categoria IN ('decoracion', 'comedor y cocina', 'articulos de jardin'))
);

DROP TABLE IF EXISTS venta;

CREATE TABLE venta (
	venta_id SERIAL PRIMARY KEY,
	producto_id INT NOT NULL,
	cliente_id INT NOT NULL,
	fecha_venta TIMESTAMP DEFAULT CURRENT_TIMESTAMP,

	CONSTRAINT fk_producto
		FOREIGN KEY (producto_id) REFERENCES producto(producto_id),

	CONSTRAINT fk_cliente
		FOREIGN KEY (cliente_id) REFERENCES cliente(cliente_id)
);

-- Insercion de datos (DML)

BEGIN;

INSERT INTO cliente (nombre, email, edad)
VALUES
	('Juan', 'juan@gmail.com', 21),
	('Luciano', 'luciano@gmail.com', 48),
	('Ana', 'ana@gmail.com', 26),
	('Lola', 'lola@hotmail.com', 34),
	('Andres', 'andres98@gmail.com', 33);

INSERT INTO producto (descripcion, precio, stock, categoria)
VALUES
	('Plato ceramica', 15.00, 2000, 'comedor y cocina'),
	('Vaso calado', 115.00, 20, 'comedor y cocina'),
	('Cenicero', 200.00, 10, 'decoracion'),
	('Florero', 3000.00, 4, 'decoracion'),
	('Tabla de madera', 600.00, 44, 'comedor y cocina');

INSERT INTO venta (producto_id, cliente_id)
VALUES
	(1, 1),
	(5, 1),
	(5, 2),
	(4, 3),
	(3, 4);

COMMIT;

-- Manipulacion y actualizacion de datos (DML)

UPDATE producto
SET precio = precio * 1.10
WHERE categoria = 'decoracion';

DELETE FROM venta
WHERE venta_id = 5;

-- Verificación de los datos

SELECT *
FROM cliente;

SELECT *
FROM producto;

SELECT *
FROM venta;
