using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace proyecto_clip_money_e_proyecto_clip.Models
{
    public class Operacion
    {
        private long id;
        private float monto;
        private DateTime fechaHora;
        private Cuenta cuentaOrigen;
        private Cuenta cuentaDestino;

        public Operacion(long id, float monto, DateTime fechaHora, Cuenta cuentaOrigen, Cuenta cuentaDestino)
        {
            this.Id = id;
            this.Monto = monto;
            this.FechaHora = fechaHora;
            this.CuentaOrigen = cuentaOrigen;
            this.CuentaDestino = cuentaDestino;
        }

        public long Id { get => id; set => id = value; }
        public float Monto { get => monto; set => monto = value; }
        public DateTime FechaHora { get => fechaHora; set => fechaHora = value; }
        public Cuenta CuentaOrigen { get => cuentaOrigen; set => cuentaOrigen = value; }
        public Cuenta CuentaDestino { get => cuentaDestino; set => cuentaDestino = value; }
    }
}