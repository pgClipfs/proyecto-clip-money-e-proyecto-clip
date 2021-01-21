namespace proyecto_clip_money_e_proyecto_clip.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;
    using System.Web.Script.Serialization;
    using System.Xml.Serialization;

    public partial class Moneda
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public Moneda()
        {
            Cuentas = new HashSet<Cuenta>();
            TiposPlazosFijos = new HashSet<TipoPlazoFijo>();
        }

        public int Id { get; set; }

        public string Nombre { get; set; }

        public double ValorDolares { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Cuenta> Cuentas { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<TipoPlazoFijo> TiposPlazosFijos { get; set; }

        public MonedaModelo ToModel()
        {
            return new MonedaModelo(
                this.Id,
                this.Nombre,
                this.ValorDolares);
        }
    }
}
