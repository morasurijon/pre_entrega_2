# Pre Entrega 2 - Surijon Mora

## Descripción

El presente proyecto consiste en el desarrollo de una base de datos relacional en PostgreSQL para gestionar información de clientes, productos y ventas.

El repositorio contiene un único archivo SQL denominado **`Surijon_Mora_Pre_entrega_2.sql`**, el cual reúne todas las sentencias necesarias para crear la estructura de la base de datos, cargar información y realizar operaciones básicas sobre los datos.

---

# Cómo ejecutar el proyecto

1. Crear una base de datos vacía en PostgreSQL.
2. Abrir el archivo **`Surijon_Mora_Pre_entrega_2.sql`** desde DBeaver (o cualquier cliente compatible con PostgreSQL).
3. Conectarse a la base de datos creada.
4. Ejecutar el script completo.

El script está preparado para ejecutarse de principio a fin.

---

# Desarrollo del proyecto

## 1. Creación de las tablas (DDL)

Como primer paso se creó la estructura de la base de datos mediante sentencias `CREATE TABLE`.

Antes de crear cada tabla se utilizó la sentencia `DROP TABLE IF EXISTS`. Esto permite eliminar la tabla si ya existe y volver a crearla sin generar errores, facilitando la iteración y las pruebas durante el desarrollo del proyecto.

Las tablas fueron creadas respetando sus dependencias. Primero se crearon las tablas **cliente** y **producto**, y finalmente la tabla **venta**, ya que contiene las claves foráneas que referencian a las tablas anteriores.

---

## 2. Restricciones implementadas

Con el objetivo de garantizar la integridad de los datos, se incorporaron las siguientes restricciones:

* **PRIMARY KEY** para identificar de forma única cada registro.
* **FOREIGN KEY** para relacionar la tabla **venta** con las tablas **cliente** y **producto**.
* **CHECK** para validar reglas de negocio, como la edad mínima del cliente, el precio mínimo del producto, el stock disponible y las categorías permitidas.
* **NOT NULL** para impedir valores nulos en los campos obligatorios.
* **UNIQUE** sobre el correo electrónico del cliente para evitar registros duplicados.
* 
Además, se utilizaron valores por defecto (DEFAULT) para asignar automáticamente el stock inicial de un producto y la fecha de una venta cuando dichos valores no son especificados durante la inserción.
---

## 3. Manipulación de datos (DML)

Una vez creada la estructura de la base de datos, se realizaron operaciones de inserción, actualización y eliminación de registros.

Las inserciones de datos fueron agrupadas utilizando transacciones mediante las sentencias `BEGIN` y `COMMIT`, asegurando que cada conjunto de operaciones se confirme únicamente cuando se ejecuta correctamente.

También se incorporó una sentencia `UPDATE` que incrementa en un 10% el precio de todos los productos pertenecientes a la categoría **decoración**, simulando una actualización masiva de precios por categoría.

Por último, se realizó un `DELETE` para eliminar un cliente sin ventas asociadas y se agregaron consultas `SELECT` para verificar el contenido final de cada una de las tablas.
