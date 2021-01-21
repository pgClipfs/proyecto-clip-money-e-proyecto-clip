namespace proyecto_clip_money_e_proyecto_clip.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;


    public partial class Cuenta
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public Cuenta()
        {
            Facturas = new HashSet<Factura>();
            OperacionesOrigen = new HashSet<Operacion>();
            OperacionesDestino = new HashSet<Operacion>();
            PlazosFijos = new HashSet<PlazoFijo>();
        }

        [Key]
        public long NroCuenta { get; set; }

        [Required]
        [StringLength(22)]
        public string Cvu { get; set; }

        public double Saldo { get; set; }

        public int MonedaId { get; set; }

        public long UsuarioId { get; set; }

        public virtual Moneda Moneda { get; set; }

        public virtual Usuario Usuario { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Factura> Facturas { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Operacion> OperacionesOrigen { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Operacion> OperacionesDestino { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<PlazoFijo> PlazosFijos { get; set; }

        public CuentaModelo ToModel()
        {
            return new CuentaModelo(
                this.Cvu,
                this.Saldo,
                this.Moneda.ToModel(),
                this.Usuario.ToModel());
        }
    }
}
