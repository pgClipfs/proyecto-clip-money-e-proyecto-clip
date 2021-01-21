/* SERVICIO */
INSERT INTO [dbo].[Servicios] ([razonSocial], [cuit]) VALUES 
	('Cooperativa de Agua, Servicios Públicos y Vivienda', 30710123388),
	('Empresa Provincial de Energía de Córdoba', 30999027489);

/* LOCALIDAD */
INSERT INTO [dbo].[Localidades] ([nombre]) VALUES 
	('Villa María'),
	('Córdoba'),
	('Morrison'),
	('Bell Ville'),
	('Unquillo'),
	('Justiniano Posse'),
	('Ramón J. Cárcano'),
	('Achiras'),
	('Balnearia'),
	('Río Primero'),
	('Río Segundo'),
	('Río Tercero'),
	('Río Cuarto'),
	('Carlos Paz'),
	('Tío Pujio'),
	('Oncativo');
	
/* DATOS USUARIO */
INSERT INTO [dbo].[DatosUsuarios] ([dni], [nombres], [apellidos], [email], [telefono], [direccion], [codigoPostal], [fechaNacimiento], [datoBiometrico], [localidadId]) VALUES
	(39970427, 'Federico Alejo', 'Marquez', 'fedealejo_007@hotmail.com', '3537 666329', 'Tucumán 1773', '5900', '1996-11-24', NULL, 1),
	(40257895, 'Eder', 'Tassin', 'eder@gmail.com', NULL, NULL, '5900', '1996-11-24', NULL, 1),
	(20941187, 'Federico Alejo', 'Marquez', 'fedealejo007@gmail.com', '3537 666329', 'Tucumán 1773', 'X5109', '1996-11-24', NULL, 5);

/* USUARIO */
INSERT INTO [dbo].[Usuarios] ([nick], [contrasena], [datosUsuarioId]) VALUES 
	('admin', 'D82494F05D6917BA02F7AAA29689CCB444BB73F20380876CB05D1F37537B7892', 3),
	('fmarquez', 'EF797C8118F02DFB649607DD5D3F8C7623048C9C063D532CC95C5ED7A898A64F', 1),
	('edert', 'EF797C8118F02DFB649607DD5D3F8C7623048C9C063D532CC95C5ED7A898A64F', 2);
	
/* MONEDA */
INSERT INTO [dbo].[Monedas] ([nombre], [valorDolares]) VALUES
	('Peso Argentino', 0.013),
	('Dólar', 1),
	('Bitcoin', 12796.8);
	
/* CUENTA */
INSERT INTO [dbo].[Cuentas] ([cvu], [saldo], [monedaId], [usuarioId]) VALUES
	('1000000000016099059761', 0, 1, 2),
	('2000000000016100083261', 75000, 1, 3),
	('3000000000016103520112', 354.75, 2, 3),
	('4000000000016103520573', 150, 3, 2);

/* ESTADO FACTURA */
INSERT INTO [dbo].[EstadosFacturas] ([nombre]) VALUES
	('Paga'),
	('Impaga'),
	('Primer Vencimiento'),
	('Segundo Vencimiento');
	
/* FACTURA */
INSERT INTO [dbo].[Facturas] ([nroFactura], [monto], [fechaPrimerVencimiento], [fechaSegundoVencimiento], [montoPrimerVencimiento], [montoSegundoVencimiento], [fechaHoraPago], [servicioId], [cuentaPagoNroCuenta], [estadoFacturaId], [usuarioId]) VALUES
	(123455, 1366.25, '2020-11-25', '2020-12-07', 1375.44, 1401.15, CURRENT_TIMESTAMP, 2, 1, 1, 2),
	(123456, 1366.25, '2020-12-25', '2021-01-07', 1375.44, 1401.15, NULL, 2, NULL, 3, 2),
	(123457, 1366.25, '2021-01-25', '2021-02-07', 1375.44, 1401.15, NULL, 2, NULL, 2, 2),
	(23456, 1000, '2021-02-10', NULL, 1100, NULL, NULL, 1, NULL, 2, 2),
	(23457, 1000, '2021-03-10', NULL, 1100, NULL, NULL, 1, NULL, 2, 2),
	(23458, 1000, '2021-04-10', NULL, 1100, NULL, NULL, 1, NULL, 2, 2),
	(233459, 1366.25, '2020-11-25', '2020-12-07', 1375.44, 1401.15, CURRENT_TIMESTAMP, 2, 2, 1, 3),
	(233460, 1366.25, '2020-12-25', '2021-01-07', 1375.44, 1401.15, CURRENT_TIMESTAMP, 2, 2, 1, 3),
	(233461, 1366.25, '2021-01-25', '2021-02-07', 1375.44, 1401.15, CURRENT_TIMESTAMP, 2, 2, 1, 3),
	(55681, 1000, '2021-02-10', NULL, 1100, NULL, CURRENT_TIMESTAMP, 1, 2, 1, 3),
	(55682, 1000, '2021-03-10', NULL, 1100, NULL, CURRENT_TIMESTAMP, 1, 2, 1, 3),
	(55683, 1000, '2021-04-10', NULL, 1100, NULL, NULL, 1, NULL, 2, 3);
	
/* TIPO PLAZO FIJO */
INSERT INTO [dbo].[TiposPlazosFijos] ([nombre], [plazoMinimoDias], [interesAnual], [montoMinimo], [monedaId]) VALUES
	('Tradicional en pesos', 30, 0.33, 1000, 1),
	('UVA', 90, 0.29, 1000, 1),
	('UVI', 90, 0.35, 5000, 1),
	('Tradicional en dólares', 30, 0.027, 500, 2);
	
/* PLAZO FIJO */
INSERT INTO [dbo].[PlazosFijos] ([fechaHoraCreacion], [fechaInicioPlazo], [fechaFinPlazo], [interesAnual], [monto], [cuentaNroCuenta], [tipoPlazoFijoId]) VALUES
	(DEFAULT, '2020-10-21', '2021-02-22', 0.33, 7000, 2, 1);

/* OPERACION */
INSERT INTO [dbo].[Operaciones] ([monto], [fechaHora], [cuentaOrigenNroCuenta], [cuentaDestinoNroCuenta]) VALUES	
	(15000, DEFAULT, 1, 2),
	(60000, DEFAULT, NULL, 2),
	(354.75, DEFAULT, NULL, 3),
	(300, DEFAULT, NULL, 4),
	(-150, DEFAULT, NULL, 4);