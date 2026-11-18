using Auth.Seguridad;
using Microsoft.AspNet.FriendlyUrls;
using System;
using System.Linq;
using System.Web.Routing;

namespace Auth
{
    public static class RouteConfig
    {
        public static void RegisterRoutes(RouteCollection routes)
        {
            var settings = new FriendlyUrlSettings();
            settings.AutoRedirectMode = RedirectMode.Permanent;
            routes.EnableFriendlyUrls(settings);

            foreach (var r in ROUTES)
            {
                routes.MapPageRoute(r.Name, r.Url, r.PhysicalFile);
            }
        }

        /// <summary>
        /// Array de rutas de la app con su configuración de acceso: anónimas, por rol o solo autenticadas.
        /// utilizo este arreglo para registrar todas las rutas en <see cref="RouteConfig.RegisterRoutes(RouteCollection)"/> 
        /// y valido el acceso en <see cref="Global.Application_AcquireRequestState(object, EventArgs)"/>.
        /// </summary>
        private static readonly RoutesDTO[] ROUTES = new RoutesDTO[]
        {
            // Rutas anónimas
            new RoutesDTO { Name = "Login", Url = "Login", PhysicalFile = "~/Frm/Login.aspx", IsAnonymous = true },
            new RoutesDTO { Name = "Logout", Url = "Logout", PhysicalFile = "~/Frm/Logout.aspx", IsAnonymous = true },
            new RoutesDTO { Name = "NotFound", Url = "NotFound", PhysicalFile = "~/Frm/NotFound.aspx", IsAnonymous = true },
            new RoutesDTO { Name = "Error", Url = "Error", PhysicalFile = "~/Frm/Error.aspx", IsAnonymous = true },
            new RoutesDTO { Name = "Home", Url = "Home", PhysicalFile = "~/Default.aspx", IsAnonymous = true },
            new RoutesDTO { Name = "UnauthorizedAccess", Url = "UnauthorizedAccess", PhysicalFile = "~/Frm/UnauthorizedAccess.aspx", IsAnonymous = true },

            // Rutas protegidas por roles
            new RoutesDTO { Name = "OnlyAdmin", Url = "OnlyAdmin", PhysicalFile = "~/Frm/FrmOnlyAdmin.aspx", IsInRol = new string[] { "Admin" } },

            // Rutas protegidas por autenticación
            new RoutesDTO { Name = "ListaProductos", Url = "Productos", PhysicalFile = "~/Frm/FrmProductos.aspx" },
            new RoutesDTO { Name = "DetalleProducto", Url = "Productos/{id}", PhysicalFile = "~/Frm/FrmProductoDetalle.aspx" },
            new RoutesDTO { Name = "EditarProducto", Url = "Productos/{id}/Nuevo", PhysicalFile = "~/Frm/FrmProductoNuevo.aspx" }
        };

        /// <summary>
        /// Indica si el usuario actual puede acceder a la ruta según los roles requeridos de la ruta.
        /// </summary>
        /// <param name="route">URL de la ruta (comparación case-insensitive).</param>
        /// <returns>
        /// <c>true</c> si el usuario tiene algún rol exigido por la ruta, o si la ruta
        /// no restringe por roles. <c>false</c> si exige roles y el usuario no tiene ninguno.
        /// </returns>
        public static bool HasAccessToRoute(string route)
        {
            var routeInfo = ROUTES.FirstOrDefault(r =>
                                                  r.Url.Equals(route, StringComparison.OrdinalIgnoreCase) &&
                                                  !r.IsAnonymous &&
                                                  r.IsInRol != null &&
                                                  r.IsInRol.Length > 0);
            if (routeInfo == null)
                return true;

            return routeInfo.IsInRol.Any(role => AuthManager.IsInRole(role));
        }
    }
}
