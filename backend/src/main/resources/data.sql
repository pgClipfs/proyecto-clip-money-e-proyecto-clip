/* SERVICIO */
INSERT INTO servicio (id, razon_social, cuit) VALUES 
	(hibernate_sequence.nextval, 'Cooperativa de Agua, Servicios Públicos y Vivienda', 30710123388),
	(hibernate_sequence.nextval, 'Empresa Provincial de Energía de Córdoba', 30999027489);


/* USUARIO */
INSERT INTO usuario (id, nick, password) VALUES 
	(hibernate_sequence.nextval, 'admin', 'D82494F05D6917BA02F7AAA29689CCB444BB73F20380876CB05D1F37537B7892'),
	(hibernate_sequence.nextval, 'fmarquez', 'EF797C8118F02DFB649607DD5D3F8C7623048C9C063D532CC95C5ED7A898A64F'),
	(hibernate_sequence.nextval, 'edert', 'EF797C8118F02DFB649607DD5D3F8C7623048C9C063D532CC95C5ED7A898A64F');

/* LOCALIDAD */
INSERT INTO localidad (id, nombre) VALUES 
	(hibernate_sequence.nextval, 'Villa María'),
	(hibernate_sequence.nextval, 'Córdoba'),
	(hibernate_sequence.nextval, 'Morrison'),
	(hibernate_sequence.nextval, 'Bell Ville'),
	(hibernate_sequence.nextval, 'Unquillo'),
	(hibernate_sequence.nextval, 'Justiniano Posse'),
	(hibernate_sequence.nextval, 'Ramón J. Cárcano'),
	(hibernate_sequence.nextval, 'Achiras'),
	(hibernate_sequence.nextval, 'Balnearia'),
	(hibernate_sequence.nextval, 'Río Primero'),
	(hibernate_sequence.nextval, 'Río Segundo'),
	(hibernate_sequence.nextval, 'Río Tercero'),
	(hibernate_sequence.nextval, 'Río Cuarto'),
	(hibernate_sequence.nextval, 'Carlos Paz'),
	(hibernate_sequence.nextval, 'Tío Pujio'),
	(hibernate_sequence.nextval, 'Oncativo');
	
/* DATOS USUARIO */
INSERT INTO datos_usuario (id, dni, nombres, apellidos, email, telefono, direccion, codigo_postal, fecha_nacimiento, dato_biometrico, usuario_id, localidad_id) VALUES
	(hibernate_sequence.nextval, 39970427, 'Federico Alejo', 'Marquez', 'fedealejo_007@hotmail.com', '3537 666329', 'Tucumán 1773', '5900', '1996-11-24', NULL, 4, 6),
	(hibernate_sequence.nextval, 40257895, 'Eder', 'Tassin', 'eder@gmail.com', NULL, NULL, '5900', '1996-11-24', NULL, 5, 6),
	(hibernate_sequence.nextval, 20941187, 'Federico Alejo', 'Marquez', 'fedealejo007@gmail.com', '3537 666329', 'Tucumán 1773', 'X5109', '1996-11-24', NULL, 3, 11);
	
/* MONEDA */
INSERT INTO moneda (id, nombre, valor_dolares) VALUES
	(hibernate_sequence.nextval, 'Peso Argentino', 0.013),
	(hibernate_sequence.nextval, 'Dólar', 1),
	(hibernate_sequence.nextval, 'Bitcoin', 12796.8);
	
/* CUENTA */
INSERT INTO cuenta (nro_cuenta, cvu, saldo, moneda_id, usuario_id) VALUES
	(hibernate_sequence.nextval, '2800000000160990597625', 0, 25, 4),
	(hibernate_sequence.nextval, '2900000000161000832625', 75000, 25, 5),
	(hibernate_sequence.nextval, '3000000000161035201126', 354.75, 26, 5),
	(hibernate_sequence.nextval, '3100000000161035205727', 150, 27, 4);

/* ESTADO FACTURA */
INSERT INTO estado_factura (id, nombre) VALUES
	(hibernate_sequence.nextval, 'Paga'),
	(hibernate_sequence.nextval, 'Impaga'),
	(hibernate_sequence.nextval, 'Primer Vencimiento'),
	(hibernate_sequence.nextval, 'Segundo Vencimiento');
	
/* FACTURA */
INSERT INTO factura (id, nro_factura, monto, fecha_primer_vencimiento, fecha_segundo_vencimiento, monto_primer_vencimiento, monto_segundo_vencimiento, fecha_hora_pago, servicio_id, nro_cuenta, estado_factura_id, usuario_id) VALUES
	(hibernate_sequence.nextval, 123455, 1366.25, '2020-11-25', '2020-12-07', 1375.44, 1401.15, CURRENT_TIMESTAMP, 2, 28, 32, 4),
	(hibernate_sequence.nextval, 123456, 1366.25, '2020-12-25', '2021-01-07', 1375.44, 1401.15, NULL, 2, NULL, 34, 4),
	(hibernate_sequence.nextval, 123457, 1366.25, '2021-01-25', '2021-02-07', 1375.44, 1401.15, NULL, 2, NULL, 33, 4),
	(hibernate_sequence.nextval, 23456, 1000, '2021-02-10', NULL, 1100, NULL, NULL, 1, NULL, 33, 4),
	(hibernate_sequence.nextval, 23457, 1000, '2021-03-10', NULL, 1100, NULL, NULL, 1, NULL, 33, 4),
	(hibernate_sequence.nextval, 23458, 1000, '2021-04-10', NULL, 1100, NULL, NULL, 1, NULL, 33, 4),
	(hibernate_sequence.nextval, 233459, 1366.25, '2020-11-25', '2020-12-07', 1375.44, 1401.15, CURRENT_TIMESTAMP, 2, 29, 32, 5),
	(hibernate_sequence.nextval, 233460, 1366.25, '2020-12-25', '2021-01-07', 1375.44, 1401.15, CURRENT_TIMESTAMP, 2, 29, 32, 5),
	(hibernate_sequence.nextval, 233461, 1366.25, '2021-01-25', '2021-02-07', 1375.44, 1401.15, CURRENT_TIMESTAMP, 2, 29, 32, 5),
	(hibernate_sequence.nextval, 55681, 1000, '2021-02-10', NULL, 1100, NULL, CURRENT_TIMESTAMP, 1, 29, 32, 5),
	(hibernate_sequence.nextval, 55682, 1000, '2021-03-10', NULL, 1100, NULL, CURRENT_TIMESTAMP, 1, 29, 32, 5),
	(hibernate_sequence.nextval, 55683, 1000, '2021-04-10', NULL, 1100, NULL, NULL, 1, NULL, 33, 5);
	
/* TIPO PLAZO FIJO */
INSERT INTO tipo_plazo_fijo (id, nombre, plazo_minimo_dias, interes_anual, monto_minimo, moneda_id) VALUES
	(hibernate_sequence.nextval, 'Tradicional en pesos', 30, 0.33, 1000, 25),
	(hibernate_sequence.nextval, 'UVA', 90, 0.29, 1000, 25),
	(hibernate_sequence.nextval, 'UVI', 90, 0.35, 5000, 25),
	(hibernate_sequence.nextval, 'Tradicional en dólares', 30, 0.027, 500, 26);
	
/* PLAZO FIJO */
INSERT INTO plazo_fijo (id, fecha_hora_creacion, fecha_inicio_plazo, fecha_fin_plazo, interes, monto, nro_cuenta, tipo_plazo_fijo_id) VALUES
	(hibernate_sequence.nextval, CURRENT_TIMESTAMP, '2020-10-21', '2021-02-22', 0.33, 7000, 28, 48);

/* OPERACION */
INSERT INTO operacion (id, monto, fecha_hora, cuenta_origen, cuenta_destino) VALUES	
	(hibernate_sequence.nextval, 15000, CURRENT_TIMESTAMP, 28, 29),
	(hibernate_sequence.nextval, 60000, CURRENT_TIMESTAMP, NULL, 29),
	(hibernate_sequence.nextval, 354.75, CURRENT_TIMESTAMP, NULL, 30),
	(hibernate_sequence.nextval, 300, CURRENT_TIMESTAMP, NULL, 31),
	(hibernate_sequence.nextval, -150, CURRENT_TIMESTAMP, NULL, 31);