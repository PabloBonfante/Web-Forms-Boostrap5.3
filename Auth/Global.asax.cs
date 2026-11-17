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

        void Application_EndRequest(object sender, EventArgs e)
        {
            // Manejo global del 401/403 para que no muestre la página fea de IIS
            var ctx = HttpContext.Current;
            if (ctx.Response.StatusCode == 401 && !ctx.Response.IsRequestBeingRedirected)
            {
                var returnUrl = ctx.Server.UrlEncode(ctx.Request.RawUrl);
                ctx.Response.Redirect("~/Login?ReturnUrl=" + returnUrl);
            }
        }

        protected void Application_Error(object sender, EventArgs e)
        {
            try
            {
                // 3. Transfiere el control a tu página de error.
                //    Server.Transfer preserva el contexto actual y evita una redirección HTTP.
                Server.Transfer("~/Frm/Error.aspx", true);
            }
            catch
            {
            }
        }
    }
}