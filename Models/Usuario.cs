using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace proyecto_clip_money_e_proyecto_clip.Models
{
    public class Usuario
    {
        private long id;
        private string nick;
        private string contrasena;
        private DatosUsuario datosUsuario;
        private List<Factura> facturas;
        private List<Cuenta> cuentas;

        public Usuario(long id, string nick, string contrasena, DatosUsuario datosUsuario, List<Factura> facturas, List<Cuenta> cuentas)
        {
            this.Id = id;
            this.Nick = nick;
            this.Contrasena = contrasena;
            this.DatosUsuario = datosUsuario;
            this.Facturas = facturas;
            this.Cuentas = cuentas;
        }

        public long Id { get => id; set => id = value; }
        public string Nick { get => nick; set => nick = value; }
        public string Contrasena { get => contrasena; set => contrasena = value; }
        public DatosUsuario DatosUsuario { get => datosUsuario; set => datosUsuario = value; }
        public List<Factura> Facturas { get => facturas; set => facturas = value; }
        public List<Cuenta> Cuentas { get => cuentas; set => cuentas = value; }
    }
}