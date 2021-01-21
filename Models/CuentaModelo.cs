using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace proyecto_clip_money_e_proyecto_clip.Models
{
    [Serializable()]
    public class CuentaModelo
    {
        private long nroCuenta;
        private string cvu;
        private double saldo;
        private MonedaModelo moneda;

        public CuentaModelo(long nroCuenta, string cvu, double saldo, MonedaModelo moneda)
        {
            this.NroCuenta = nroCuenta;
            this.Cvu = cvu;
            this.Saldo = saldo;
            this.Moneda = moneda;
        }

        public long NroCuenta { get => nroCuenta; set => nroCuenta = value; }
        public string Cvu { get => cvu; set => cvu = value; }
        public double Saldo { get => saldo; set => saldo = value; }
        public MonedaModelo Moneda { get => moneda; set => moneda = value; }
    }
}