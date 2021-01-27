using proyecto_clip_money_e_proyecto_clip.Models;

using System;
using System.Collections.Generic;
using System.Data.Entity;
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

                if (query.Count() == 0)
                {
                    return null;
                }

                return query.Single().ToModel();
            }
        }

        public List<CuentaModelo> ObtenerCuentaPorNickUsuario(string nick)
        {
            using (var db = new ModeloDatos())
            {
                var cuentas = new List<CuentaModelo>();

                var query = from c in db.Cuentas
                            where c.Usuario.Nick == nick
                            select c;

                
                foreach (Cuenta cuenta in query)
                {
                    cuentas.Add(cuenta.ToModel());
                }

                return cuentas;
            }
        }

        public CuentaModelo CrearCuenta(CuentaModelo cuenta)
        {
            using (var db = new ModeloDatos())
            {
                Cuenta entidad = cuenta.ToEntity();

                var query = from c in db.Cuentas
                            orderby c.NroCuenta descending
                            select c;

                long nroCuenta = query.First().NroCuenta + 1;

                entidad.Cvu = GenerarCvu(nroCuenta, entidad.MonedaId);

                CuentaModelo cuentaNueva = db.Cuentas.Add(entidad).ToModel();
                db.SaveChanges();

                return cuentaNueva;
            }
        }

        public void EliminarCuenta(long nroCuenta)
        {
            using (var db = new ModeloDatos())
            {
                Cuenta entidad = new Cuenta { NroCuenta = nroCuenta };

                db.Entry(entidad).State = EntityState.Deleted;
                db.SaveChanges();
            }
        }

        public CuentaModelo EditarCuenta(long nroCuenta, CuentaModelo cuenta)
        {
            using (var db = new ModeloDatos())
            {
                Cuenta entidad = cuenta.ToEntity();
                entidad.NroCuenta = nroCuenta;

                db.Entry(entidad).State = EntityState.Modified;
                db.SaveChanges();

                return db.Entry(entidad).Entity.ToModel();
            }
        }

        public string GenerarCvu(long nroCuenta, int idMoneda)
        {
            string txtNroCuenta = nroCuenta.ToString();
            string txtIdMoneda = idMoneda.ToString();

            int cantidadDeDigitosAGenerar = 22 - txtNroCuenta.Length - txtIdMoneda.Length;

            string digitosFaltantes = DateTime.Now.Ticks.ToString();

            int resta = cantidadDeDigitosAGenerar - digitosFaltantes.Length;

            if (resta > 0)
            {
                string ceros = "";

                for (int i = 0; i < resta; i++)
                {
                    ceros += "0";
                }

                digitosFaltantes = ceros + digitosFaltantes;
            }
            else if (resta < 0)
            {
                digitosFaltantes = digitosFaltantes.Substring(-resta);
            }

            string cvu = nroCuenta + digitosFaltantes + idMoneda;

            return cvu;
        }
    }
}