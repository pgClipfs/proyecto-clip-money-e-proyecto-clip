namespace proyecto_clip_money_e_proyecto_clip.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    public partial class Operacion
    {
        public long Id { get; set; }

        public double Monto { get; set; }

        [Column(TypeName = "timestamp")]
        [MaxLength(8)]
        [Timestamp]
        public byte[] FechaHora { get; set; }

        public long? CuentaOrigenNroCuenta { get; set; }

        public long CuentaDestinoNroCuenta { get; set; }

        public virtual Cuenta CuentaOrigen { get; set; }

        public virtual Cuenta CuentaDestino { get; set; }
    }
}
