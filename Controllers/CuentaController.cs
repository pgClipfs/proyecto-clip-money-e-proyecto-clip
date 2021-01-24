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
    [Authorize]
    public class CuentaController : ApiController
    {
        //private List<CuentaModelo> cuentas;
        private CuentaGestor gestor;

        //public List<CuentaModelo> Cuentas { get => cuentas; set => cuentas = value; }
        public CuentaGestor Gestor { get => gestor; set => gestor = value; }

        public CuentaController()
        {
            this.Gestor = new CuentaGestor();
        }

        // GET: api/Cuenta
        public IHttpActionResult Get()
        {
            return Ok(Gestor.ObtenerCuentas());
        }

        // GET: api/Cuenta/5
        public IHttpActionResult Get(long id)
        {
            CuentaModelo cuenta = Gestor.ObtenerCuentaPorNroCuenta(id);
            
            if (cuenta == null)
            {
                return NotFound();
            }

            return Ok(cuenta);
        }

        // POST: api/Cuenta
        public IHttpActionResult Post([FromBody] CuentaModelo cuenta)
        {
            if (cuenta == null)
            {
                return BadRequest();
            }

            return Ok(Gestor.CrearCuenta(cuenta));
        }

        // PUT: api/Cuenta/5
        public IHttpActionResult Put(long id, [FromBody] CuentaModelo cuenta)
        {
            if (cuenta == null)
            {
                return BadRequest();
            }

            return Ok(Gestor.EditarCuenta(id, cuenta));
        }

        // DELETE: api/Cuenta/5
        public IHttpActionResult  Delete(long id)
        {
            Gestor.EliminarCuenta(id);

            return Ok();
        }
    }
}
