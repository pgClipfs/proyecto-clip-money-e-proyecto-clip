namespace proyecto_clip_money_e_proyecto_clip.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    public partial class Factura
    {
        public long Id { get; set; }

        public long NroFactura { get; set; }

        public double Monto { get; set; }

        [Column(TypeName = "date")]
        public DateTime FechaPrimerVencimiento { get; set; }

        [Column(TypeName = "date")]
        public DateTime? FechaSegundoVencimiento { get; set; }

        public double MontoPrimerVencimiento { get; set; }

        public double? MontoSegundoVencimiento { get; set; }

        public DateTime? FechaHoraPago { get; set; }

        public long ServicioId { get; set; }

        public long? CuentaPagoNroCuenta { get; set; }

        public int EstadoFacturaId { get; set; }

        public long UsuarioId { get; set; }

        public virtual Cuenta CuentaPago { get; set; }

        public virtual EstadoFactura EstadoFactura { get; set; }

        public virtual Servicio Servicio { get; set; }

        public virtual Usuario  Usuario { get; set; }
    }
}
