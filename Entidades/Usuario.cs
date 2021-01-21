namespace proyecto_clip_money_e_proyecto_clip.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    public partial class Usuario
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public Usuario()
        {
            Cuentas = new HashSet<Cuenta>();
            Facturas = new HashSet<Factura>();
        }

        public long Id { get; set; }

        [Required]
        [StringLength(50)]
        public string Nick { get; set; }

        [Required]
        [StringLength(64)]
        public string Contrasena { get; set; }

        public long DatosUsuarioId { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Cuenta> Cuentas { get; set; }

        public virtual DatosUsuarioModelo DatosUsuario { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Factura> Facturas { get; set; }

        public UsuarioModelo ToModel()
        {
            return new UsuarioModelo(
                this.Id,
                this.Nick,
                this.Contrasena);
        }
    }
}
