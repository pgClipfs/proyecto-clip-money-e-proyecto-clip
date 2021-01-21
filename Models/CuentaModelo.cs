using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace proyecto_clip_money_e_proyecto_clip.Models
{
    [Serializable()]
    public class CuentaModelo
    {
        private string cvu;
        private double saldo;
        private MonedaModelo moneda;
        private UsuarioModelo usuario;

        public CuentaModelo(string cvu, double saldo, MonedaModelo moneda, UsuarioModelo usuario)
        {
            this.Cvu = cvu;
            this.Saldo = saldo;
            this.Moneda = moneda;
            this.Usuario = usuario;
        }

        public string Cvu { get => cvu; set => cvu = value; }
        public double Saldo { get => saldo; set => saldo = value; }
        public MonedaModelo Moneda { get => moneda; set => moneda = value; }
        public UsuarioModelo Usuario { get => usuario; set => usuario = value; }

        public Cuenta ToEntity()
        {
            return new Cuenta
            {
                Cvu = this.Cvu,
                Saldo = this.Saldo,
                MonedaId = this.Moneda.Id,
                UsuarioId = this.Usuario.Id
            };
        }
    }
}