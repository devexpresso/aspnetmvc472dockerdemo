using System.Web;
using System.Web.Mvc;

namespace aspnetmvc472dockerdemo
{
    public class FilterConfig
    {
        public static void RegisterGlobalFilters(GlobalFilterCollection filters)
        {
            filters.Add(new HandleErrorAttribute());
        }
    }
}
