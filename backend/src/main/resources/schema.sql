/* SECUENCIA HIBERNATE */
DROP SEQUENCE IF EXISTS hibernate_sequence;

CREATE SEQUENCE hibernate_sequence
	START WITH 1
	INCREMENT BY 1;

/* TABLAS */
DROP TABLE IF EXISTS servicio;
 
CREATE TABLE servicio (
	id BIGINT NOT NULL,
	razon_social VARCHAR(100) NOT NULL,
	cuit BIGINT NOT NULL,
	PRIMARY KEY (id),
	UNIQUE KEY cuit_servicio_unique (cuit)
);
	
DROP TABLE IF EXISTS usuario;
 
CREATE TABLE usuario (
	id BIGINT NOT NULL,
	nick VARCHAR(50) NOT NULL,
	password VARCHAR(50) NOT NULL,
	PRIMARY KEY (id),
	UNIQUE KEY nick_usuario_unique (nick)
);

DROP TABLE IF EXISTS localidad;
 
CREATE TABLE localidad (
	id INTEGER NOT NULL,
	nombre VARCHAR(50) NOT NULL,
	PRIMARY KEY (id)
);

DROP TABLE IF EXISTS datos_usuario;
 
CREATE TABLE datos_usuario (
	id BIGINT NOT NULL,
	dni INTEGER NOT NULL,
	nombres VARCHAR(50) NOT NULL,
	apellidos VARCHAR(50) NOT NULL,
	email VARCHAR(50) NOT NULL,
	telefono VARCHAR(50),
	direccion VARCHAR(50),
	codigo_postal VARCHAR(10) NOT NULL,
	fecha_nacimiento DATE NOT NULL,
	dato_biometrico VARCHAR(50),
	usuario_id BIGINT NOT NULL,
	localidad_id INTEGER NOT NULL,
	PRIMARY KEY (id),
	UNIQUE KEY email_datos_usuario_unique (email),
	UNIQUE KEY dni_datos_usuario_unique (dni)
);

ALTER TABLE datos_usuario
    ADD FOREIGN KEY (usuario_id) 
    REFERENCES usuario(id);
	
ALTER TABLE datos_usuario
    ADD FOREIGN KEY (localidad_id) 
    REFERENCES localidad(id);

DROP TABLE IF EXISTS moneda;
 
CREATE TABLE moneda (
	id INTEGER NOT NULL,
	nombre VARCHAR(50) NOT NULL,
	valor_dolares FLOAT NOT NULL,
	PRIMARY KEY (id)
);

DROP TABLE IF EXISTS cuenta;
 
CREATE TABLE cuenta (
	nro_cuenta BIGINT NOT NULL,
	cvu VARCHAR(22) NOT NULL,
	saldo FLOAT NOT NULL,
	moneda_id INTEGER NOT NULL,
	usuario_id BIGINT NOT NULL,
	PRIMARY KEY (nro_cuenta),
	UNIQUE KEY cvu_cuenta_unique (cvu)
);

ALTER TABLE cuenta
    ADD FOREIGN KEY (usuario_id) 
    REFERENCES usuario(id);
	
ALTER TABLE cuenta
    ADD FOREIGN KEY (moneda_id) 
    REFERENCES moneda(id);

DROP TABLE IF EXISTS estado_factura;
 
CREATE TABLE estado_factura (
	id INTEGER NOT NULL,
	nombre VARCHAR(22) NOT NULL,
	PRIMARY KEY (nro_cuenta)
);

DROP TABLE IF EXISTS factura;
 
CREATE TABLE factura (
	id BIGINT NOT NULL,
	nro_cuenta BIGINT NOT NULL,
	monto FLOAT NOT NULL,
	fecha_primer_vencimiento DATE NOT NULL,
	fecha_segundo_vencimiento DATE NOT NULL,
	monto FLOAT NOT NULL,
	saldo FLOAT NOT NULL,
	moneda_id INTEGER NOT NULL,
	usuario_id BIGINT NOT NULL,
	PRIMARY KEY (nro_cuenta),
	UNIQUE KEY cvu_cuenta_unique (cvu)
);

ALTER TABLE cuenta
    ADD FOREIGN KEY (usuario_id) 
    REFERENCES usuario(id);
	
ALTER TABLE cuenta
    ADD FOREIGN KEY (moneda_id) 
    REFERENCES moneda(id);