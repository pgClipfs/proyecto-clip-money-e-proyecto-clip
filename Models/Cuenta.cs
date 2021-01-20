using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace proyecto_clip_money_e_proyecto_clip.Models
{
    public class Cuenta
    {
        private long nroCuenta;
        private string cvu;
        private float saldo;
        private Moneda moneda;

        public Cuenta(long nroCuenta, string cvu, float saldo, Moneda moneda)
        {
            this.NroCuenta = nroCuenta;
            this.Cvu = cvu;
            this.Saldo = saldo;
            this.Moneda = moneda;
        }

        public long NroCuenta { get => nroCuenta; set => nroCuenta = value; }
        public string Cvu { get => cvu; set => cvu = value; }
        public float Saldo { get => saldo; set => saldo = value; }
        public Moneda Moneda { get => moneda; set => moneda = value; }
    }
}