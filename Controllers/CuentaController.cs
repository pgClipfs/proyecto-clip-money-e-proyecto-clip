using proyecto_clip_money_e_proyecto_clip.Models;
using proyecto_clip_money_e_proyecto_clip.Gestores;

using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;

namespace proyecto_clip_money_e_proyecto_clip.Controllers
{
    public class CuentaController : ApiController
    {
        private List<CuentaModelo> cuentas;
        private CuentaGestor gestor;

        public List<CuentaModelo> Cuentas { get => cuentas; set => cuentas = value; }
        public CuentaGestor Gestor { get => gestor; set => gestor = value; }

        public CuentaController()
        {
            this.Gestor = new CuentaGestor();

            this.Cuentas = Gestor.ObtenerCuentas();
        }

        // GET: api/Cuenta
        public IEnumerable<CuentaModelo> Get()
        {
            return this.Cuentas;
        }

        // GET: api/Cuenta/5
        public CuentaModelo Get(long id)
        {
            return Gestor.ObtenerCuentaPorNroCuenta(id);
        }

        // POST: api/Cuenta
        public void Post([FromBody]string value)
        {
        }

        // PUT: api/Cuenta/5
        public void Put(int id, [FromBody]string value)
        {
        }

        // DELETE: api/Cuenta/5
        public void Delete(int id)
        {
        }
    }
}
