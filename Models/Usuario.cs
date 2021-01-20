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
    }
}