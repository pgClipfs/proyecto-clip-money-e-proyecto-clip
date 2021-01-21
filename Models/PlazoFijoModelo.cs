using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace proyecto_clip_money_e_proyecto_clip.Models
{
    public class PlazoFijoModelo
    {
        private long id;
        private DateTime fechaHoraCreacion;
        private DateTime fechaInicioPlazo;
        private DateTime fechaFinPlazo;
        private float interesAnual;
        private float monto;
        private CuentaModelo cuenta;
        private TipoPlazoFijoModelo tipoPlazoFijo;

        public PlazoFijoModelo(long id, DateTime fechaHoraCreacion, DateTime fechaInicioPlazo, DateTime fechaFinPlazo, float interesAnual, float monto, CuentaModelo cuenta, TipoPlazoFijoModelo tipoPlazoFijo)
        {
            this.Id = id;
            this.FechaHoraCreacion = fechaHoraCreacion;
            this.FechaInicioPlazo = fechaInicioPlazo;
            this.FechaFinPlazo = fechaFinPlazo;
            this.InteresAnual = interesAnual;
            this.Monto = monto;
            this.Cuenta = cuenta;
            this.TipoPlazoFijo = tipoPlazoFijo;
        }

        public long Id { get => id; set => id = value; }
        public DateTime FechaHoraCreacion { get => fechaHoraCreacion; set => fechaHoraCreacion = value; }
        public DateTime FechaInicioPlazo { get => fechaInicioPlazo; set => fechaInicioPlazo = value; }
        public DateTime FechaFinPlazo { get => fechaFinPlazo; set => fechaFinPlazo = value; }
        public float InteresAnual { get => interesAnual; set => interesAnual = value; }
        public float Monto { get => monto; set => monto = value; }
        public CuentaModelo Cuenta { get => cuenta; set => cuenta = value; }
        public TipoPlazoFijoModelo TipoPlazoFijo { get => tipoPlazoFijo; set => tipoPlazoFijo = value; }
    }
}