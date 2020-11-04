using System.Web;
using System.Web.Mvc;

namespace proyecto_clip_money_e_proyecto_clip
{
    public class FilterConfig
    {
        public static void RegisterGlobalFilters(GlobalFilterCollection filters)
        {
            filters.Add(new HandleErrorAttribute());
        }
    }
}
