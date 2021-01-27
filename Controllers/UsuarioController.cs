using proyecto_clip_money_e_proyecto_clip.Gestores;
using proyecto_clip_money_e_proyecto_clip.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using System.Web.Http.Cors;

namespace proyecto_clip_money_e_proyecto_clip.Controllers
{
    [Authorize]
    public class UsuarioController : ApiController
    {
        private UsuarioGestor gestor;

        public UsuarioGestor Gestor { get => gestor; set => gestor = value; }

        public UsuarioController()
        {
            this.Gestor = new UsuarioGestor();
        }

        // GET: api/Usuario
        public IEnumerable<string> Get()
        {
            return new string[] { "value1", "value2" };
        }

        // GET: api/Usuario/5
        public string Get(long id)
        {
            return "value";
        }

        [EnableCors(origins: "*", headers: "*", methods: "*")]
        public IHttpActionResult Get(string nick)
        {
            return Ok(Gestor.ObtenerUsuarioPorNick(nick));
        }

        // POST: api/Usuario
        [EnableCors(origins: "*", headers: "*", methods: "*")]
        [AllowAnonymous]
        public IHttpActionResult Post([FromBody]UsuarioModelo usuario)
        {
            if (usuario == null)
            {
                return BadRequest();
            }

            return Ok(Gestor.CrearUsuario(usuario));
        }

        // PUT: api/Usuario/5
        public void Put(int id, [FromBody]string value)
        {
        }

        // DELETE: api/Usuario/5
        public void Delete(int id)
        {
        }
    }
}
