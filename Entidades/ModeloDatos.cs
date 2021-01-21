namespace proyecto_clip_money_e_proyecto_clip.Models
{
    using System;
    using System.Data.Entity;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Linq;

    public partial class ModeloDatos : DbContext
    {
        public ModeloDatos()
            : base("name=ModeloDatos")
        {
        }

        public virtual DbSet<Cuenta> Cuentas { get; set; }
        public virtual DbSet<DatosUsuario> DatosUsuarios { get; set; }
        public virtual DbSet<EstadoFactura> EstadosFacturas { get; set; }
        public virtual DbSet<Factura> Facturas { get; set; }
        public virtual DbSet<Localidad> Localidades { get; set; }
        public virtual DbSet<Moneda> Monedas { get; set; }
        public virtual DbSet<Operacion> Operaciones { get; set; }
        public virtual DbSet<PlazoFijo> PlazosFijos { get; set; }
        public virtual DbSet<Servicio> Servicios { get; set; }
        public virtual DbSet<TipoPlazoFijo> TiposPlazosFijos { get; set; }
        public virtual DbSet<Usuario> Usuarios { get; set; }

        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            modelBuilder.Entity<Cuenta>()
                .HasMany(e => e.Facturas)
                .WithOptional(e => e.CuentaPago)
                .HasForeignKey(e => e.CuentaPagoNroCuenta);

            modelBuilder.Entity<Cuenta>()
                .HasMany(e => e.OperacionesOrigen)
                .WithRequired(e => e.CuentaOrigen)
                .HasForeignKey(e => e.CuentaDestinoNroCuenta)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<Cuenta>()
                .HasMany(e => e.OperacionesDestino)
                .WithOptional(e => e.CuentaDestino)
                .HasForeignKey(e => e.CuentaOrigenNroCuenta);

            modelBuilder.Entity<EstadoFactura>()
                .HasMany(e => e.Facturas)
                .WithRequired(e => e.EstadoFactura)
                .HasForeignKey(e => e.EstadoFacturaId)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<Localidad>()
                .HasMany(e => e.DatosUsuarios)
                .WithRequired(e => e.Localidad)
                .HasForeignKey(e => e.LocalidadId)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<Moneda>()
                .HasMany(e => e.Cuentas)
                .WithRequired(e => e.Moneda)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<Moneda>()
                .HasMany(e => e.TiposPlazosFijos)
                .WithRequired(e => e.Moneda)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<Operacion>()
                .Property(e => e.FechaHora)
                .IsFixedLength();

            modelBuilder.Entity<PlazoFijo>()
                .Property(e => e.FechaHoraCreacion)
                .IsFixedLength();

            modelBuilder.Entity<TipoPlazoFijo>()
                .HasMany(e => e.PlazosFijos)
                .WithRequired(e => e.TipoPlazoFijo)
                .HasForeignKey(e => e.TipoPlazoFijoId)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<Usuario>()
                .HasMany(e => e.Facturas)
                .WithRequired(e => e.Usuario)
                .WillCascadeOnDelete(false);
        }
    }
}
