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
	localidad_id INTEGER NOT NULL,
	PRIMARY KEY (id),
	UNIQUE KEY email_datos_usuario_unique (email),
	UNIQUE KEY dni_datos_usuario_unique (dni)
);
	
ALTER TABLE datos_usuario
    ADD FOREIGN KEY (localidad_id) 
    REFERENCES localidad(id);
	
DROP TABLE IF EXISTS usuario;
 
CREATE TABLE usuario (
	id BIGINT NOT NULL,
	nick VARCHAR(50) NOT NULL,
	contrasena VARCHAR(64) NOT NULL,
	datos_usuario_id BIGINT NOT NULL,
	PRIMARY KEY (id),
	UNIQUE KEY nick_usuario_unique (nick)
);

ALTER TABLE usuario
    ADD FOREIGN KEY (datos_usuario_id) 
    REFERENCES datos_usuario(id);

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
	PRIMARY KEY (id)
);

DROP TABLE IF EXISTS factura;
 
CREATE TABLE factura (
	id BIGINT NOT NULL,
	nro_factura BIGINT NOT NULL,
	monto FLOAT NOT NULL,
	fecha_primer_vencimiento DATE NOT NULL,
	fecha_segundo_vencimiento DATE,
	monto_primer_vencimiento FLOAT NOT NULL,
	monto_segundo_vencimiento FLOAT,
	fecha_hora_pago TIMESTAMP,
	servicio_id BIGINT NOT NULL,
	cuenta_pago_nro_cuenta BIGINT,
	estado_factura_id INTEGER NOT NULL,
	usuario_id BIGINT NOT NULL,
	PRIMARY KEY (id)
);

ALTER TABLE factura
    ADD FOREIGN KEY (servicio_id) 
    REFERENCES servicio(id);
	
ALTER TABLE factura
    ADD FOREIGN KEY (cuenta_pago_nro_cuenta) 
    REFERENCES cuenta(nro_cuenta);

ALTER TABLE factura
    ADD FOREIGN KEY (estado_factura_id) 
    REFERENCES estado_factura(id);
	
ALTER TABLE factura
    ADD FOREIGN KEY (usuario_id) 
    REFERENCES usuario(id);

DROP TABLE IF EXISTS tipo_plazo_fijo;
 
CREATE TABLE tipo_plazo_fijo (
	id INT NOT NULL,
	nombre VARCHAR(50) NOT NULL,
	plazo_minimo_dias INTEGER NOT NULL,
	interes_anual FLOAT NOT NULL,
	monto_minimo FLOAT NOT NULL,
	moneda_id BIGINT NOT NULL,
	PRIMARY KEY (id)
);

ALTER TABLE tipo_plazo_fijo
    ADD FOREIGN KEY (moneda_id) 
    REFERENCES moneda(id);

DROP TABLE IF EXISTS plazo_fijo;
 
CREATE TABLE plazo_fijo (
	id BIGINT NOT NULL,
	fecha_hora_creacion TIMESTAMP NOT NULL,
	fecha_inicio_plazo DATE NOT NULL,
	fecha_fin_plazo DATE NOT NULL,
	interes_anual FLOAT NOT NULL,
	monto FLOAT NOT NULL,
	cuenta_nro_cuenta BIGINT NOT NULL,
	tipo_plazo_fijo_id INTEGER NOT NULL,
	PRIMARY KEY (id)
);

ALTER TABLE plazo_fijo
    ADD FOREIGN KEY (cuenta_nro_cuenta) 
    REFERENCES cuenta(nro_cuenta);

ALTER TABLE plazo_fijo
    ADD FOREIGN KEY (tipo_plazo_fijo_id) 
    REFERENCES tipo_plazo_fijo(id);
	
DROP TABLE IF EXISTS operacion;
 
CREATE TABLE operacion (
	id BIGINT NOT NULL,
	monto FLOAT NOT NULL,
	fecha_hora TIMESTAMP NOT NULL,
	cuenta_origen_nro_cuenta BIGINT,
	cuenta_destino_nro_cuenta BIGINT NOT NULL,
	PRIMARY KEY (id)
);

ALTER TABLE operacion
    ADD FOREIGN KEY (cuenta_origen_nro_cuenta) 
    REFERENCES cuenta(nro_cuenta);

ALTER TABLE operacion
    ADD FOREIGN KEY (cuenta_destino_nro_cuenta) 
    REFERENCES cuenta(nro_cuenta);