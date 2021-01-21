using proyecto_clip_money_e_proyecto_clip.Models;

using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace proyecto_clip_money_e_proyecto_clip.Gestores
{
    public class CuentaGestor
    {
        public List<CuentaModelo> ObtenerCuentas()
        {
            using (var db = new ModeloDatos())
            {
                List<CuentaModelo> cuentas = new List<CuentaModelo>();

                var query = from c in db.Cuentas
                            select c;

                foreach (var cuenta in query)
                {
                    cuentas.Add(cuenta.ToModel());
                }
                return cuentas;
            }
        }

        public CuentaModelo ObtenerCuentaPorNroCuenta(long nroCuenta)
        {
            using (var db = new ModeloDatos())
            {
                var query = from c in db.Cuentas
                            where c.NroCuenta == nroCuenta
                            select c;

                return query.Single().ToModel();
            }
        }
    }
}