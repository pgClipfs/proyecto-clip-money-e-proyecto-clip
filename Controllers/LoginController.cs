using System.Net;
using System.Threading;
using System.Web.Http;
using System.Web.Http.Cors;
using Microsoft.AspNet.Identity;
using proyecto_clip_money_e_proyecto_clip.Gestores;
using proyecto_clip_money_e_proyecto_clip.Models;

namespace proyecto_clip_money_e_proyecto_clip.Controllers
{
    [AllowAnonymous]
    [RoutePrefix("api/login")]
    public class LoginController : ApiController
    {
        [HttpGet]
        [Route("echoping")]
        public IHttpActionResult EchoPing()
        {
            return Ok(true);
        }

        [HttpGet]
        [Route("echouser")]
        public IHttpActionResult EchoUser()
        {
            var identity = Thread.CurrentPrincipal.Identity;
            return Ok($" IPrincipal-user: {identity.Name} - IsAuthenticated: {identity.IsAuthenticated}");
        }

        
        [HttpPost]
        [Route("authenticate")]
        [EnableCors(origins: "*", headers: "*", methods: "*")]
        public IHttpActionResult Authenticate(LoginRequest login)
        {
            if (login == null)
                throw new HttpResponseException(HttpStatusCode.BadRequest);

            UsuarioModelo usuario = new UsuarioGestor().ObtenerUsuarioPorNick(login.Nick);

            if (usuario == null)
                return Unauthorized();

            PasswordVerificationResult isCredentialValid = new PasswordHasher().VerifyHashedPassword(usuario.Contrasena, login.Contrasena);

            if (isCredentialValid == PasswordVerificationResult.Success)
            {
                var token = TokenGenerator.GenerateTokenJwt(login.Nick);
                return Ok(new LoginResponse(login.Nick, token));
            }
            else
            {
                return Unauthorized();
            }
        }
    }
}
