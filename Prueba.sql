CREATE SCHEMA Prueba;

CREATE TABLE clientes (
	id serial NOT null primary key,
	nombre varchar(255) NOT NULL,
	direccion varchar(255) NOT NULL
);

CREATE TABLE factura(
	numero_factura serial NOT null primary KEY,
	fecha date NOT NULL,
	subtotal float4 NOT NULL,
	iva float4 NOT NULL,
	precio_total float4 NOT NULL,
	id_cliente int4 NULL,
	CONSTRAINT factura_fk FOREIGN KEY (id_cliente) REFERENCES clientes(id)
);

create table categorias(
	id serial not null primary key,
	nombre varchar(255) not null,
	descripcion varchar(255) not null
);

drop table productos cascade;

create table productos(
	 id SERIAL not null primary key, 
	 nombre VARCHAR(255) not NULL,
	 descripcion varchar(255) not null,
	 valor_unitario float4 not null,
	 categoria int4 not null,
	 CONSTRAINT productos_fk FOREIGN KEY (categoria) REFERENCES categorias(id)
);

drop table factura_productos ;

create table factura_productos(
	id_factura int4 not null,
	id_producto int4 not null,
	cantidad int4 not null,
	valor_total int4 not null,
	CONSTRAINT factura_fk FOREIGN KEY (id_factura) REFERENCES factura(numero_factura),
	CONSTRAINT factura_productos_fk FOREIGN KEY (id_producto) REFERENCES productos(id)
);

insert into clientes (nombre,direccion) values ('Javier', 'Los Olmedos 355');
insert into clientes (nombre,direccion) values ('Daniela', 'Paseo Poniente 4509');
insert into clientes (nombre,direccion) values ('Ricardo', 'Alameda 251');
insert into clientes (nombre,direccion) values ('Byron', 'Calle dos 3541');
insert into clientes (nombre,direccion) values ('Joaquín', 'Colibrí 240');

insert into categorias(nombre,descripcion) values ('Aseo','Articulos de aseo');
insert into categorias(nombre,descripcion) values ('Abarrotes','Artículos de despensa');
insert into categorias(nombre,descripcion) values ('Carnes','Carnes blancas y rojas');


insert into productos(nombre,descripcion, valor_unitario,categoria) values ('Cepillo de dientes','Cepillo de dientes colgate', 2990.0, 1);
insert into productos(nombre,descripcion, valor_unitario,categoria) values ('Jabón','Jabón LeSancy', 1500.0, 1);
insert into productos(nombre,descripcion, valor_unitario,categoria) values ('Fideos','Fideos Carozzi', 1500.0, 2);
insert into productos(nombre,descripcion, valor_unitario,categoria) values ('Porotos','Porotos a granel', 990.0, 2);
insert into productos(nombre,descripcion, valor_unitario,categoria) values ('Pechuga de Pollo','Pechuga de pollo por kg', 2390.0, 3);
insert into productos(nombre,descripcion, valor_unitario,categoria) values ('Pescado apanado','Por unidad', 1290.0, 3);
insert into productos(nombre,descripcion, valor_unitario,categoria) values ('Arroz acuenta','la bolsa', 1100.0, 2);
insert into productos(nombre,descripcion, valor_unitario,categoria) values ('Aceite','Aceite feliz', 1600.0, 2);


--CLIENTE 1
-- FACTURA 1
INSERT INTO factura (fecha, subtotal, iva, precio_total, id_cliente) VALUES(current_date, 0, 0, 0, 1);
INSERT INTO factura_productos (id_factura, id_producto, cantidad, valor_total) VALUES(1, 1, 2, (select valor_unitario from productos where id = 1) );
INSERT INTO factura_productos (id_factura, id_producto, cantidad, valor_total) VALUES(1, 2, 2, (select valor_unitario from productos where id = 2) );

-- FACTURA 2
INSERT INTO factura (fecha, subtotal, iva, precio_total, id_cliente) VALUES(current_date, 0, 0, 0, 1);
INSERT INTO factura_productos (id_factura, id_producto, cantidad, valor_total) VALUES(2, 3, 2, (select valor_unitario from productos where id = 3) );
INSERT INTO factura_productos (id_factura, id_producto, cantidad, valor_total) VALUES(2, 4, 2, (select valor_unitario from productos where id = 4) );
INSERT INTO factura_productos (id_factura, id_producto, cantidad, valor_total) VALUES(2, 5, 2, (select valor_unitario from productos where id = 5) );

-- CLIENTE 2
-- FACTURA 1
INSERT INTO factura (fecha, subtotal, iva, precio_total, id_cliente) VALUES(current_date, 0, 0, 0, 2);
INSERT INTO factura_productos (id_factura, id_producto, cantidad, valor_total) VALUES(3, 3, 2, (select valor_unitario from productos where id = 3) );
INSERT INTO factura_productos (id_factura, id_producto, cantidad, valor_total) VALUES(3, 4, 2, (select valor_unitario from productos where id = 4) );
INSERT INTO factura_productos (id_factura, id_producto, cantidad, valor_total) VALUES(3, 5, 2, (select valor_unitario from productos where id = 5) );

-- FACTURA 2
INSERT INTO factura (fecha, subtotal, iva, precio_total, id_cliente) VALUES(current_date, 0, 0, 0, 2);
INSERT INTO factura_productos (id_factura, id_producto, cantidad, valor_total) VALUES(4, 5, 2, (select valor_unitario from productos where id = 5) );
INSERT INTO factura_productos (id_factura, id_producto, cantidad, valor_total) VALUES(4, 6, 2, (select valor_unitario from productos where id = 6) );
INSERT INTO factura_productos (id_factura, id_producto, cantidad, valor_total) VALUES(4, 7, 2, (select valor_unitario from productos where id = 7) );

-- FACTURA 3
INSERT INTO factura (fecha, subtotal, iva, precio_total, id_cliente) VALUES(current_date, 0, 0, 0, 2);
INSERT INTO factura_productos (id_factura, id_producto, cantidad, valor_total) VALUES(5, 5, 2, (select valor_unitario from productos where id = 5) );
INSERT INTO factura_productos (id_factura, id_producto, cantidad, valor_total) VALUES(5, 6, 2, (select valor_unitario from productos where id = 6) );

-- CLIENTE 3
-- FACTURA 1
insert into factura (fecha, subtotal, iva, precio_total, id_cliente) VALUES(current_date, 0, 0, 0, 3);
INSERT INTO factura_productos (id_factura, id_producto, cantidad, valor_total) VALUES(6, 8, 1, (select valor_unitario from productos where id = 8) );

-- cliente 4
-- FACTURA 2
insert into factura (fecha, subtotal, iva, precio_total, id_cliente) VALUES(current_date, 0, 0, 0, 4);
INSERT INTO factura_productos (id_factura, id_producto, cantidad, valor_total) VALUES(8, 8, 1, (select valor_unitario from productos where id = 8) );
INSERT INTO factura_productos (id_factura, id_producto, cantidad, valor_total) VALUES(8, 1, 1, (select valor_unitario from productos where id = 1) );

-- FACTURA 3

insert into factura (fecha, subtotal, iva, precio_total, id_cliente) VALUES(current_date, 0, 0, 0, 4);
INSERT INTO factura_productos (id_factura, id_producto, cantidad, valor_total) VALUES(9, 1, 1, (select valor_unitario from productos where id = 1) );
INSERT INTO factura_productos (id_factura, id_producto, cantidad, valor_total) VALUES(9, 2, 1, (select valor_unitario from productos where id = 2) );
INSERT INTO factura_productos (id_factura, id_producto, cantidad, valor_total) VALUES(9, 3, 1, (select valor_unitario from productos where id = 3) );

-- FACTURA 4
insert into factura (fecha, subtotal, iva, precio_total, id_cliente) VALUES(current_date, 0, 0, 0, 4);
INSERT INTO factura_productos (id_factura, id_producto, cantidad, valor_total) VALUES(10, 4, 1, (select valor_unitario from productos where id = 4) );
INSERT INTO factura_productos (id_factura, id_producto, cantidad, valor_total) VALUES(10, 5, 1, (select valor_unitario from productos where id = 5) );
INSERT INTO factura_productos (id_factura, id_producto, cantidad, valor_total) VALUES(10, 6, 1, (select valor_unitario from productos where id = 6) );
INSERT INTO factura_productos (id_factura, id_producto, cantidad, valor_total) VALUES(10, 7, 1, (select valor_unitario from productos where id = 7) );

-- FACTURA 5
insert into factura (fecha, subtotal, iva, precio_total, id_cliente) VALUES(current_date, 0, 0, 0, 4);
INSERT INTO factura_productos (id_factura, id_producto, cantidad, valor_total) VALUES(11, 8, 1, (select valor_unitario from productos where id = 8) );

-- UPDATE A LAS FACTURAS PARA ASIGNAR EL SUBTOTAL
update factura SET subtotal = sumatotal.subtotal
FROM
(select id_factura, sum(valor_total) as subtotal from factura_productos fp group by id_factura order by id_factura) sumatotal
where factura.numero_factura = sumatotal.id_factura;

-- QUÉ CLIENTE REALIZÓ LA COMPRA MÁS CARA?

select clientes.nombre from factura left join clientes on factura.id_cliente = clientes.id where subtotal = (select max(subtotal) from factura);

-- QUÉ CLIENTE PAGÓ SOBRE 100 DE MONTO
select * from factura where subtotal > 100;

-- Cuántos clientes han comprado el producto 6

select distinct clientes.nombre from 
factura_productos fp 
left join factura
on fp.id_factura = factura.numero_factura
left join 
clientes 
on
factura.id_cliente = clientes.id
where fp.id_producto = 6;

