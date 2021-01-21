namespace proyecto_clip_money_e_proyecto_clip.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("PlazosFijos")]
    public partial class PlazoFijo
    {
        public long Id { get; set; }

        [Column(TypeName = "timestamp")]
        [MaxLength(8)]
        [Timestamp]
        public byte[] FechaHoraCreacion { get; set; }

        [Column(TypeName = "date")]
        public DateTime FechaInicioPlazo { get; set; }

        [Column(TypeName = "date")]
        public DateTime FechaFinPlazo { get; set; }

        public double InteresAnual { get; set; }

        public double Monto { get; set; }

        public long CuentaNroCuenta { get; set; }

        public int TipoPlazoFijoId { get; set; }

        public virtual Cuenta Cuenta { get; set; }

        public virtual TipoPlazoFijo TipoPlazoFijo { get; set; }
    }
}
