/* TABLAS */
DROP TABLE IF EXISTS [dbo].[Operaciones];
DROP TABLE IF EXISTS [dbo].[PlazosFijos];
DROP TABLE IF EXISTS [dbo].[TiposPlazosFijos];
DROP TABLE IF EXISTS [dbo].[Facturas];
DROP TABLE IF EXISTS [dbo].[EstadosFacturas];
DROP TABLE IF EXISTS [dbo].[Cuentas];
DROP TABLE IF EXISTS [dbo].[Monedas];
DROP TABLE IF EXISTS [dbo].[Usuarios];
DROP TABLE IF EXISTS [dbo].[DatosUsuarios];
DROP TABLE IF EXISTS [dbo].[Localidades];
DROP TABLE IF EXISTS [dbo].[Servicios];
 
CREATE TABLE [dbo].[Servicios] (
	[id] BIGINT IDENTITY (1, 1) NOT NULL,
	[razonSocial] NVARCHAR(100) NOT NULL,
	[cuit] BIGINT NOT NULL,
	CONSTRAINT [PK_dbo.Servicios] PRIMARY KEY CLUSTERED ([id] ASC),
	CONSTRAINT [IX_dbo.Servicios_cuit] UNIQUE([cuit])
);
 
CREATE TABLE [dbo].[Localidades] (
	[id] INT IDENTITY (1, 1) NOT NULL,
	[nombre] NVARCHAR(50) NOT NULL,
	CONSTRAINT [PK_dbo.Localidades] PRIMARY KEY CLUSTERED ([id] ASC)
);
 
CREATE TABLE [dbo].[DatosUsuarios] (
	[id] BIGINT IDENTITY(1, 1) NOT NULL,
	[dni] INT NOT NULL,
	[nombres] NVARCHAR(50) NOT NULL,
	[apellidos] NVARCHAR(50) NOT NULL,
	[email] NVARCHAR(50) NOT NULL,
	[telefono] NVARCHAR(50) NULL,
	[direccion] NVARCHAR(50) NULL,
	[codigoPostal] NVARCHAR(10) NOT NULL,
	[fechaNacimiento] DATE NOT NULL,
	[datoBiometrico] NVARCHAR(50) NULL,
	[localidadId] INT NOT NULL,
	CONSTRAINT [PK_dbo.DatosUsuarios] PRIMARY KEY CLUSTERED ([id] ASC),
	CONSTRAINT [FK_dbo.DatosUsuarios_dbo.Localidades_localidadId] FOREIGN KEY ([localidadId]) REFERENCES [dbo].[Localidades] ([id]) ON DELETE NO ACTION,
	CONSTRAINT [IX_dbo.DatosUsuarios_email] UNIQUE([email]),
	CONSTRAINT [IX_dbo.DatosUsuarios_dni] UNIQUE([dni])
);
 
CREATE TABLE [dbo].[Usuarios] (
	[id] BIGINT IDENTITY(1, 1) NOT NULL,
	[nick] NVARCHAR(50) NOT NULL,
	[contrasena] NVARCHAR(64) NOT NULL,
	[datosUsuarioId] BIGINT NOT NULL,
	CONSTRAINT [PK_dbo.Usuarios] PRIMARY KEY CLUSTERED ([id] ASC),
	CONSTRAINT [FK_dbo.Usuarios_dbo.DatosUsuarios_datosUsuarioId] FOREIGN KEY ([datosUsuarioId]) REFERENCES [dbo].[DatosUsuarios] ([id]) ON DELETE CASCADE,
	CONSTRAINT [IX_dbo.Usuarios_nick] UNIQUE([nick])
);
 
CREATE TABLE [dbo].[Monedas] (
	[id] INT IDENTITY(1, 1) NOT NULL,
	[nombre] NVARCHAR(50) NOT NULL,
	[valorDolares] FLOAT NOT NULL,
	CONSTRAINT [PK_dbo.Monedas] PRIMARY KEY CLUSTERED ([id] ASC)
);
 
CREATE TABLE [dbo].[Cuentas] (
	[nroCuenta] BIGINT IDENTITY(1, 1) NOT NULL,
	[cvu] NVARCHAR(22) NOT NULL,
	[saldo] FLOAT NOT NULL,
	[monedaId] INT NOT NULL,
	[usuarioId] BIGINT NOT NULL,
	CONSTRAINT [PK_dbo.Cuentas] PRIMARY KEY CLUSTERED ([nroCuenta] ASC),
	CONSTRAINT [FK_dbo.Cuentas_dbo.Monedas_monedaId] FOREIGN KEY ([monedaId]) REFERENCES [dbo].[Monedas] ([id]) ON DELETE NO ACTION,
	CONSTRAINT [FK_dbo.Cuentas_dbo.Usuarios_usuarioId] FOREIGN KEY ([usuarioId]) REFERENCES [dbo].[Usuarios] ([id]) ON DELETE CASCADE,
	CONSTRAINT [IX_dbo.Cuentas_cvu] UNIQUE([cvu])
);
 
CREATE TABLE [dbo].[EstadosFacturas] (
	[id] INT IDENTITY(1, 1) NOT NULL,
	[nombre] NVARCHAR(50) NOT NULL,
	CONSTRAINT [PK_dbo.EstadosFacturas] PRIMARY KEY CLUSTERED ([id] ASC)
);
 
CREATE TABLE [dbo].[Facturas] (
	[id] BIGINT IDENTITY(1, 1) NOT NULL,
	[nroFactura] BIGINT NOT NULL,
	[monto] FLOAT NOT NULL,
	[fechaPrimerVencimiento] DATE NOT NULL,
	[fechaSegundoVencimiento] DATE NULL,
	[montoPrimerVencimiento] FLOAT NOT NULL,
	[montoSegundoVencimiento] FLOAT NULL,
	[fechaHoraPago] DATETIME NULL,
	[servicioId] BIGINT NOT NULL,
	[cuentaPagoNroCuenta] BIGINT NULL,
	[estadoFacturaId] INT NOT NULL,
	[usuarioId] BIGINT NOT NULL,
	CONSTRAINT [PK_dbo.Facturas] PRIMARY KEY CLUSTERED ([id] ASC),
	CONSTRAINT [FK_dbo.Facturas_dbo.Servicios_servicioId] FOREIGN KEY ([servicioId]) REFERENCES [dbo].[Servicios] ([id]) ON DELETE CASCADE,
	CONSTRAINT [FK_dbo.Facturas_dbo.Cuentas_cuentaPagoNroCuenta] FOREIGN KEY ([cuentaPagoNroCuenta]) REFERENCES [dbo].[Cuentas] ([nroCuenta]) ON DELETE NO ACTION,
	CONSTRAINT [FK_dbo.Facturas_dbo.EstadosFacturas_estadoFacturaId] FOREIGN KEY ([estadoFacturaId]) REFERENCES [dbo].[EstadosFacturas] ([id]) ON DELETE NO ACTION,
	CONSTRAINT [FK_dbo.Facturas_dbo.Usuarios_usuarioId] FOREIGN KEY ([usuarioId]) REFERENCES [dbo].[Usuarios] ([id]) ON DELETE NO ACTION
);
 
CREATE TABLE [dbo].[TiposPlazosFijos] (
	[id] INT IDENTITY(1, 1) NOT NULL,
	[nombre] NVARCHAR(50) NOT NULL,
	[plazoMinimoDias] INT NOT NULL,
	[interesAnual] FLOAT NOT NULL,
	[montoMinimo] FLOAT NOT NULL,
	[monedaId] INT NOT NULL,
	CONSTRAINT [PK_dbo.TiposPlazosFijos] PRIMARY KEY CLUSTERED ([id] ASC),
	CONSTRAINT [FK_dbo.TiposPlazosFijos_dbo.Monedas_monedaId] FOREIGN KEY ([monedaId]) REFERENCES [dbo].[Monedas] ([id]) ON DELETE NO ACTION
);
 
CREATE TABLE [dbo].[PlazosFijos] (
	[id] BIGINT IDENTITY(1, 1) NOT NULL,
	[fechaHoraCreacion] TIMESTAMP NOT NULL,
	[fechaInicioPlazo] DATE NOT NULL,
	[fechaFinPlazo] DATE NOT NULL,
	[interesAnual] FLOAT NOT NULL,
	[monto] FLOAT NOT NULL,
	[cuentaNroCuenta] BIGINT NOT NULL,
	[tipoPlazoFijoId] INT NOT NULL,
	CONSTRAINT [PK_dbo.PlazosFijos] PRIMARY KEY CLUSTERED ([id] ASC),
	CONSTRAINT [FK_dbo.PlazosFijos_dbo.Cuentas_cuentaNroCuenta] FOREIGN KEY ([cuentaNroCuenta]) REFERENCES [dbo].[Cuentas] ([nroCuenta]) ON DELETE CASCADE,
	CONSTRAINT [FK_dbo.PlazosFijos_dbo.TiposPlazosFijos_tipoPlazoFijoId] FOREIGN KEY ([tipoPlazoFijoId]) REFERENCES [dbo].[TiposPlazosFijos] ([id]) ON DELETE NO ACTION
);
 
CREATE TABLE [dbo].[Operaciones] (
	[id] BIGINT IDENTITY(1, 1) NOT NULL,
	[monto] FLOAT NOT NULL,
	[fechaHora] TIMESTAMP NOT NULL,
	[cuentaOrigenNroCuenta] BIGINT NULL,
	[cuentaDestinoNroCuenta] BIGINT NOT NULL,
	CONSTRAINT [PK_dbo.Operaciones] PRIMARY KEY CLUSTERED ([id] ASC),
	CONSTRAINT [FK_dbo.Operaciones_dbo.Cuentas_cuentaOrigenNroCuenta] FOREIGN KEY ([cuentaOrigenNroCuenta]) REFERENCES [dbo].[Cuentas] ([nroCuenta]) ON DELETE SET NULL,
	CONSTRAINT [FK_dbo.Operaciones_dbo.Cuentas_cuentaDestinoNroCuenta] FOREIGN KEY ([cuentaDestinoNroCuenta]) REFERENCES [dbo].[Cuentas] ([nroCuenta]) ON DELETE NO ACTION
);