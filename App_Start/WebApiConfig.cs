using System.Net.Http.Headers;
using System.Web.Http;
using proyecto_clip_money_e_proyecto_clip.Controllers;

class WebApiConfig
{
    public static void Register(HttpConfiguration config)
    {
        config.EnableCors();

        config.MapHttpAttributeRoutes();

        config.MessageHandlers.Add(new TokenValidationHandler());

        config.Routes.MapHttpRoute(
            name: "API Default",
            routeTemplate: "api/{controller}/{id}",
            defaults: new { id = RouteParameter.Optional }
        );
    }
}