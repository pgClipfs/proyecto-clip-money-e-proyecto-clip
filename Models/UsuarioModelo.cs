using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace proyecto_clip_money_e_proyecto_clip.Models
{
    public class UsuarioModelo
    {
        private long id;
        private string nick;
        private string contrasena;
        private DatosUsuarioModelo datosUsuario;
        private List<FacturaModelo> facturas;
        private List<CuentaModelo> cuentas;

        public UsuarioModelo(long id, string nick, string contrasena, DatosUsuarioModelo datosUsuario, List<FacturaModelo> facturas, List<CuentaModelo> cuentas)
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
        public DatosUsuarioModelo DatosUsuario { get => datosUsuario; set => datosUsuario = value; }
        public List<FacturaModelo> Facturas { get => facturas; set => facturas = value; }
        public List<CuentaModelo> Cuentas { get => cuentas; set => cuentas = value; }
    }
}