using Auth.Seguridad;
using System;
using System.Security.Principal;
using System.Web;
using System.Web.Optimization;
using System.Web.Routing;
using System.Web.Security;

namespace Auth
{
    public class Global : HttpApplication
    {
        void Application_Start(object sender, EventArgs e)
        {
            // Código que se ejecuta al iniciar la aplicación
            RouteConfig.RegisterRoutes(RouteTable.Routes);
            BundleConfig.RegisterBundles(BundleTable.Bundles);
        }

        void Application_AuthenticateRequest(object sender, EventArgs e)
        {
            if (!AuthManager.IsAuthenticated())
                return;

            // Recuperamos el ticket para obtener los roles guardados en UserData
            var ctx = HttpContext.Current;
            if (ctx.User.Identity is FormsIdentity fi)
            {
                string rolesStr = fi.Ticket.UserData;
                string[] roles = string.IsNullOrEmpty(rolesStr)
                    ? new string[0]
                    : rolesStr.Split(',');

                ctx.User = new GenericPrincipal(fi, roles);
            }
        }

        void Application_AcquireRequestState(object sender, EventArgs e)
        {
            if (Request.RequestType != "GET" || HttpContext.Current.Session == null)
                return;

            string currentFrm = System.IO.Path.GetFileNameWithoutExtension(Request.Url.AbsolutePath);
            if (!RouteConfig.HasAccessToRoute(currentFrm))
                Response.Redirect($"/UnauthorizedAccess?page={HttpUtility.ParseQueryString(currentFrm)}");
        }

        protected void Application_Error(object sender, EventArgs e)
        {
            try
            {
                // Transfiere el control a la página de error.
                // Server.Transfer preserva el contexto actual y evita una redirección HTTP.
                Server.Transfer("~/Frm/Error.aspx", true);
            }
            catch
            {
            }
        }
    }
}