using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace proyecto_clip_money_e_proyecto_clip.Models
{
    public class FacturaModelo
    {
        private long id;
        private long nroFactura;
        private float monto;
        private DateTime fechaPrimerVencimiento;
        private DateTime fechaSegundoVencimiento;
        private float montoPrimerVencimiento;
        private float montoSegundoVencimiento;
        private DateTime fechaHoraPago;
        private ServicioModelo servicio;
        private CuentaModelo cuenta;
        private EstadoFacturaModelo estadoFactura;

        public FacturaModelo(long id, long nroFactura, float monto, DateTime fechaPrimerVencimiento, DateTime fechaSegundoVencimiento, float montoPrimerVencimiento, float montoSegundoVencimiento, DateTime fechaHoraPago, ServicioModelo servicio, CuentaModelo cuenta, EstadoFacturaModelo estadoFactura)
        {
            this.Id = id;
            this.NroFactura = nroFactura;
            this.Monto = monto;
            this.FechaPrimerVencimiento = fechaPrimerVencimiento;
            this.FechaSegundoVencimiento = fechaSegundoVencimiento;
            this.MontoPrimerVencimiento = montoPrimerVencimiento;
            this.MontoSegundoVencimiento = montoSegundoVencimiento;
            this.FechaHoraPago = fechaHoraPago;
            this.Servicio = servicio;
            this.Cuenta = cuenta;
            this.EstadoFactura = estadoFactura;
        }

        public long Id { get => id; set => id = value; }
        public long NroFactura { get => nroFactura; set => nroFactura = value; }
        public float Monto { get => monto; set => monto = value; }
        public DateTime FechaPrimerVencimiento { get => fechaPrimerVencimiento; set => fechaPrimerVencimiento = value; }
        public DateTime FechaSegundoVencimiento { get => fechaSegundoVencimiento; set => fechaSegundoVencimiento = value; }
        public float MontoPrimerVencimiento { get => montoPrimerVencimiento; set => montoPrimerVencimiento = value; }
        public float MontoSegundoVencimiento { get => montoSegundoVencimiento; set => montoSegundoVencimiento = value; }
        public DateTime FechaHoraPago { get => fechaHoraPago; set => fechaHoraPago = value; }
        public ServicioModelo Servicio { get => servicio; set => servicio = value; }
        public CuentaModelo Cuenta { get => cuenta; set => cuenta = value; }
        public EstadoFacturaModelo EstadoFactura { get => estadoFactura; set => estadoFactura = value; }
    }
}