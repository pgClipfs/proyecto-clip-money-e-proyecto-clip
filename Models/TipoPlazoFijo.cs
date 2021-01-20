namespace proyecto_clip_money_e_proyecto_clip.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("TiposPlazosFijos")]
    public partial class TipoPlazoFijo
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public TipoPlazoFijo()
        {
            PlazosFijos = new HashSet<PlazoFijo>();
        }

        public int Id { get; set; }

        [Required]
        [StringLength(50)]
        public string Nombre { get; set; }

        public int PlazoMinimoDias { get; set; }

        public double InteresAnual { get; set; }

        public double MontoMinimo { get; set; }

        public int MonedaId { get; set; }

        public virtual Moneda Moneda { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<PlazoFijo> PlazosFijos { get; set; }
    }
}
