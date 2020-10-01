CREATE DATABASE Wallet

USE [Wallet]
GO
/****** Object:  Table [dbo].[cuenta]    Script Date: 30/9/2020 20:05:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cuenta](
	[id] [int] NOT NULL,
	[nro_cuenta] [int] NOT NULL,
	[cvu] [int] NOT NULL,
	[saldo] [float] NULL,
	[dato_biometrico] [varchar](50) NULL,
	[moneda_id] [int] NOT NULL,
	[usuario_id] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[datos_usuarios]    Script Date: 30/9/2020 20:05:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[datos_usuarios](
	[id] [int] NOT NULL,
	[dni] [int] NOT NULL,
	[nombres] [varchar](50) NOT NULL,
	[apellidos] [varchar](50) NOT NULL,
	[email] [varchar](50) NOT NULL,
	[direccion] [varchar](50) NOT NULL,
	[codigo_postal] [varchar](50) NOT NULL,
	[fecha_nacimiento] [date] NOT NULL,
	[usuario_id] [int] NOT NULL,
	[localidad_id] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[deposito]    Script Date: 30/9/2020 20:05:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[deposito](
	[id] [int] NULL,
	[monto] [float] NULL,
	[fecha] [timestamp] NULL,
	[cuenta_destino] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[estado_factura]    Script Date: 30/9/2020 20:05:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[estado_factura](
	[id] [int] NULL,
	[nombre] [varchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[factura]    Script Date: 30/9/2020 20:05:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[factura](
	[id] [int] NULL,
	[nro_factura] [int] NULL,
	[monto] [float] NULL,
	[fecha_primer_vencimiento] [date] NULL,
	[fecha_segundo_vencimiento] [date] NULL,
	[monto_primer_vencimineto] [float] NULL,
	[monto_segundo_vencimiento] [float] NULL,
	[fecha_pago] [timestamp] NULL,
	[servicio_id] [int] NULL,
	[estado_factura_id] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[localidad]    Script Date: 30/9/2020 20:05:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[localidad](
	[id] [int] NULL,
	[nombre] [varchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[moneda]    Script Date: 30/9/2020 20:05:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[moneda](
	[id] [int] NOT NULL,
	[nombre] [varchar](50) NULL,
	[valor_dolares] [float] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[pago_servicio]    Script Date: 30/9/2020 20:05:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[pago_servicio](
	[id] [int] NULL,
	[fecha] [timestamp] NULL,
	[monto] [float] NULL,
	[factura_id] [int] NULL,
	[cuenta_id] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[plazo_fijo]    Script Date: 30/9/2020 20:05:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[plazo_fijo](
	[id] [int] NULL,
	[fecha_creacion] [timestamp] NULL,
	[fecha_inicio_plazo] [date] NULL,
	[fecha_fin_plazo] [date] NULL,
	[interes] [float] NULL,
	[monto] [float] NULL,
	[cuenta_id] [int] NULL,
	[moneda_id] [int] NULL,
	[tipo_plazo_fijo_id] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[rubro]    Script Date: 30/9/2020 20:05:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[rubro](
	[id] [int] NULL,
	[nombre] [varchar](50) NULL,
	[tipo_servicio_id] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[servicio]    Script Date: 30/9/2020 20:05:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[servicio](
	[id] [int] NULL,
	[razon_social] [varchar](50) NULL,
	[cuit] [int] NULL,
	[rubro_id] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tipo_plazo_fijo]    Script Date: 30/9/2020 20:05:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tipo_plazo_fijo](
	[id] [int] NULL,
	[nombre] [varchar](50) NULL,
	[interes] [float] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tipo_servicio]    Script Date: 30/9/2020 20:05:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tipo_servicio](
	[id] [int] NULL,
	[nombre] [varchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[transferencia]    Script Date: 30/9/2020 20:05:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[transferencia](
	[id] [int] NULL,
	[monto] [float] NULL,
	[fecha] [timestamp] NULL,
	[cuenta_origen] [int] NULL,
	[cuenta_destino] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[usuario]    Script Date: 30/9/2020 20:05:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[usuario](
	[id] [int] NOT NULL,
	[nick] [varchar](50) NOT NULL,
	[password] [varchar](50) NOT NULL
) ON [PRIMARY]
GO
