using System;
using System.Collections.Generic;
using System.Web;
using System.Web.Routing;
using Microsoft.AspNet.FriendlyUrls;

namespace Auth
{
    public static class RouteConfig
    {
        public static void RegisterRoutes(RouteCollection routes)
        {
            var settings = new FriendlyUrlSettings();
            settings.AutoRedirectMode = RedirectMode.Permanent;
            routes.EnableFriendlyUrls(settings);

            // Auth
            routes.MapPageRoute("Login", "Login", "~/Frm/Login.aspx");
            routes.MapPageRoute("Logout", "Logout", "~/Frm/Logout.aspx");
            routes.MapPageRoute("NotFound", "NotFound", "~/Frm/NotFound.aspx");
            routes.MapPageRoute("Error", "Error", "~/Frm/Error.aspx");

            routes.MapPageRoute("ListaProductos", "Productos", "~/Frm/FrmProductos.aspx");
            routes.MapPageRoute("DetalleProducto", "Productos/{id}", "~/Frm/FrmProductoDetalle.aspx");
            routes.MapPageRoute("EditarProducto", "Productos/{id}/Nuevo", "~/Frm/FrmProductoNuevo.aspx");
        }
    }
}
