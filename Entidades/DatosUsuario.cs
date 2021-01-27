namespace proyecto_clip_money_e_proyecto_clip.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    public partial class DatosUsuario
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public DatosUsuario()
        {
            Usuarios = new HashSet<Usuario>();
        }

        public long Id { get; set; }

        public int Dni { get; set; }

        [Required]
        [StringLength(50)]
        public string Nombres { get; set; }

        [Required]
        [StringLength(50)]
        public string Apellidos { get; set; }

        [Required]
        [StringLength(50)]
        public string Email { get; set; }

        [StringLength(50)]
        public string Telefono { get; set; }

        [StringLength(50)]
        public string Direccion { get; set; }

        [Required]
        [StringLength(10)]
        public string CodigoPostal { get; set; }

        [Column(TypeName = "date")]
        public DateTime FechaNacimiento { get; set; }

        [StringLength(50)]
        public string DatoBiometrico { get; set; }

        public int LocalidadId { get; set; }

        public virtual Localidad Localidad { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Usuario> Usuarios { get; set; }

        public DatosUsuarioModelo ToModel()
        {
            return new DatosUsuarioModelo(
                this.Id,
                this.Dni,
                this.Nombres,
                this.Apellidos,
                this.Email,
                this.Telefono,
                this.Direccion,
                this.CodigoPostal,
                this.Localidad.ToModel(),
                this.FechaNacimiento);
        }
    }
}
