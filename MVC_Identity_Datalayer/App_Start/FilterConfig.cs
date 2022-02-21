using System.Web;
using System.Web.Mvc;

namespace MVC_Identity_Datalayer
{
    public class FilterConfig
    {
        public static void RegisterGlobalFilters(GlobalFilterCollection filters)
        {
            filters.Add(new HandleErrorAttribute());
        }
    }
}
