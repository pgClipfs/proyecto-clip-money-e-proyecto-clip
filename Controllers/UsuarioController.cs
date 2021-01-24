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

        // POST: api/Usuario
        public void Post([FromBody]string value)
        {
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
