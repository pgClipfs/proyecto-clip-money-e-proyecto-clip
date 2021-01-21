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
	[Id] BIGINT IDENTITY (1, 1) NOT NULL,
	[RazonSocial] NVARCHAR(100) NOT NULL,
	[Cuit] BIGINT NOT NULL,
	CONSTRAINT [PK_dbo.Servicios] PRIMARY KEY CLUSTERED ([Id] ASC),
	CONSTRAINT [IX_dbo.Servicios_Cuit] UNIQUE([Cuit])
);
 
CREATE TABLE [dbo].[Localidades] (
	[Id] INT IDENTITY (1, 1) NOT NULL,
	[Nombre] NVARCHAR(50) NOT NULL,
	CONSTRAINT [PK_dbo.Localidades] PRIMARY KEY CLUSTERED ([Id] ASC)
);
 
CREATE TABLE [dbo].[DatosUsuarios] (
	[Id] BIGINT IDENTITY(1, 1) NOT NULL,
	[Dni] INT NOT NULL,
	[Nombres] NVARCHAR(50) NOT NULL,
	[Apellidos] NVARCHAR(50) NOT NULL,
	[Email] NVARCHAR(50) NOT NULL,
	[Telefono] NVARCHAR(50) NULL,
	[Direccion] NVARCHAR(50) NULL,
	[CodigoPostal] NVARCHAR(10) NOT NULL,
	[FechaNacimiento] DATE NOT NULL,
	[DatoBiometrico] NVARCHAR(50) NULL,
	[LocalidadId] INT NOT NULL,
	CONSTRAINT [PK_dbo.DatosUsuarios] PRIMARY KEY CLUSTERED ([Id] ASC),
	CONSTRAINT [FK_dbo.DatosUsuarios_dbo.Localidades_LocalidadId] FOREIGN KEY ([LocalidadId]) REFERENCES [dbo].[Localidades] ([Id]) ON DELETE NO ACTION,
	CONSTRAINT [IX_dbo.DatosUsuarios_Email] UNIQUE([email]),
	CONSTRAINT [IX_dbo.DatosUsuarios_Dni] UNIQUE([dni])
);
 
CREATE TABLE [dbo].[Usuarios] (
	[Id] BIGINT IDENTITY(1, 1) NOT NULL,
	[Nick] NVARCHAR(50) NOT NULL,
	[Contrasena] NVARCHAR(64) NOT NULL,
	[DatosUsuarioId] BIGINT NOT NULL,
	CONSTRAINT [PK_dbo.Usuarios] PRIMARY KEY CLUSTERED ([Id] ASC),
	CONSTRAINT [FK_dbo.Usuarios_dbo.DatosUsuarios_DatosUsuarioId] FOREIGN KEY ([DatosUsuarioId]) REFERENCES [dbo].[DatosUsuarios] ([Id]) ON DELETE CASCADE,
	CONSTRAINT [IX_dbo.Usuarios_Nick] UNIQUE([Nick])
);
 
CREATE TABLE [dbo].[Monedas] (
	[Id] INT IDENTITY(1, 1) NOT NULL,
	[Nombre] NVARCHAR(50) NOT NULL,
	[ValorDolares] FLOAT NOT NULL,
	CONSTRAINT [PK_dbo.Monedas] PRIMARY KEY CLUSTERED ([Id] ASC)
);
 
CREATE TABLE [dbo].[Cuentas] (
	[NroCuenta] BIGINT IDENTITY(1, 1) NOT NULL,
	[Cvu] NVARCHAR(22) NOT NULL,
	[Saldo] FLOAT NOT NULL,
	[MonedaId] INT NOT NULL,
	[UsuarioId] BIGINT NOT NULL,
	CONSTRAINT [PK_dbo.Cuentas] PRIMARY KEY CLUSTERED ([NroCuenta] ASC),
	CONSTRAINT [FK_dbo.Cuentas_dbo.Monedas_MonedaId] FOREIGN KEY ([MonedaId]) REFERENCES [dbo].[Monedas] ([Id]) ON DELETE NO ACTION,
	CONSTRAINT [FK_dbo.Cuentas_dbo.Usuarios_UsuarioId] FOREIGN KEY ([UsuarioId]) REFERENCES [dbo].[Usuarios] ([Id]) ON DELETE CASCADE,
	CONSTRAINT [IX_dbo.Cuentas_Cvu] UNIQUE([Cvu])
);
 
CREATE TABLE [dbo].[EstadosFacturas] (
	[Id] INT IDENTITY(1, 1) NOT NULL,
	[Nombre] NVARCHAR(50) NOT NULL,
	CONSTRAINT [PK_dbo.EstadosFacturas] PRIMARY KEY CLUSTERED ([Id] ASC)
);
 
CREATE TABLE [dbo].[Facturas] (
	[Id] BIGINT IDENTITY(1, 1) NOT NULL,
	[NroFactura] BIGINT NOT NULL,
	[Monto] FLOAT NOT NULL,
	[FechaPrimerVencimiento] DATE NOT NULL,
	[FechaSegundoVencimiento] DATE NULL,
	[MontoPrimerVencimiento] FLOAT NOT NULL,
	[MontoSegundoVencimiento] FLOAT NULL,
	[FechaHoraPago] DATETIME NULL,
	[ServicioId] BIGINT NOT NULL,
	[CuentaPagoNroCuenta] BIGINT NULL,
	[EstadoFacturaId] INT NOT NULL,
	[UsuarioId] BIGINT NOT NULL,
	CONSTRAINT [PK_dbo.Facturas] PRIMARY KEY CLUSTERED ([Id] ASC),
	CONSTRAINT [FK_dbo.Facturas_dbo.Servicios_ServicioId] FOREIGN KEY ([servicioId]) REFERENCES [dbo].[Servicios] ([Id]) ON DELETE CASCADE,
	CONSTRAINT [FK_dbo.Facturas_dbo.Cuentas_CuentaPagoNroCuenta] FOREIGN KEY ([CuentaPagoNroCuenta]) REFERENCES [dbo].[Cuentas] ([NroCuenta]) ON DELETE NO ACTION,
	CONSTRAINT [FK_dbo.Facturas_dbo.EstadosFacturas_EstadoFacturaId] FOREIGN KEY ([EstadoFacturaId]) REFERENCES [dbo].[EstadosFacturas] ([Id]) ON DELETE NO ACTION,
	CONSTRAINT [FK_dbo.Facturas_dbo.Usuarios_UsuarioId] FOREIGN KEY ([UsuarioId]) REFERENCES [dbo].[Usuarios] ([Id]) ON DELETE NO ACTION
);
 
CREATE TABLE [dbo].[TiposPlazosFijos] (
	[Id] INT IDENTITY(1, 1) NOT NULL,
	[Nombre] NVARCHAR(50) NOT NULL,
	[PlazoMinimoDias] INT NOT NULL,
	[InteresAnual] FLOAT NOT NULL,
	[MontoMinimo] FLOAT NOT NULL,
	[MonedaId] INT NOT NULL,
	CONSTRAINT [PK_dbo.TiposPlazosFijos] PRIMARY KEY CLUSTERED ([Id] ASC),
	CONSTRAINT [FK_dbo.TiposPlazosFijos_dbo.Monedas_MonedaId] FOREIGN KEY ([MonedaId]) REFERENCES [dbo].[Monedas] ([Id]) ON DELETE NO ACTION
);
 
CREATE TABLE [dbo].[PlazosFijos] (
	[Id] BIGINT IDENTITY(1, 1) NOT NULL,
	[FechaHoraCreacion] TIMESTAMP NOT NULL,
	[FechaInicioPlazo] DATE NOT NULL,
	[FechaFinPlazo] DATE NOT NULL,
	[InteresAnual] FLOAT NOT NULL,
	[Monto] FLOAT NOT NULL,
	[CuentaNroCuenta] BIGINT NOT NULL,
	[TipoPlazoFijoId] INT NOT NULL,
	CONSTRAINT [PK_dbo.PlazosFijos] PRIMARY KEY CLUSTERED ([Id] ASC),
	CONSTRAINT [FK_dbo.PlazosFijos_dbo.Cuentas_CuentaNroCuenta] FOREIGN KEY ([CuentaNroCuenta]) REFERENCES [dbo].[Cuentas] ([NroCuenta]) ON DELETE CASCADE,
	CONSTRAINT [FK_dbo.PlazosFijos_dbo.TiposPlazosFijos_TipoPlazoFijoId] FOREIGN KEY ([TipoPlazoFijoId]) REFERENCES [dbo].[TiposPlazosFijos] ([Id]) ON DELETE NO ACTION
);
 
CREATE TABLE [dbo].[Operaciones] (
	[Id] BIGINT IDENTITY(1, 1) NOT NULL,
	[Monto] FLOAT NOT NULL,
	[FechaHora] TIMESTAMP NOT NULL,
	[CuentaOrigenNroCuenta] BIGINT NULL,
	[CuentaDestinoNroCuenta] BIGINT NOT NULL,
	CONSTRAINT [PK_dbo.Operaciones] PRIMARY KEY CLUSTERED ([Id] ASC),
	CONSTRAINT [FK_dbo.Operaciones_dbo.Cuentas_CuentaOrigenNroCuenta] FOREIGN KEY ([CuentaOrigenNroCuenta]) REFERENCES [dbo].[Cuentas] ([NroCuenta]) ON DELETE SET NULL,
	CONSTRAINT [FK_dbo.Operaciones_dbo.Cuentas_CuentaDestinoNroCuenta] FOREIGN KEY ([CuentaDestinoNroCuenta]) REFERENCES [dbo].[Cuentas] ([NroCuenta]) ON DELETE NO ACTION
);