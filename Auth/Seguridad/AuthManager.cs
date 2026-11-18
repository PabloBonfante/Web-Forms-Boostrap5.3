using System;
using System.Web;
using System.Web.Security;

namespace Auth.Seguridad
{
    public static class AuthManager
    {
        /// <summary>
        /// Valida credenciales y crea el ticket de autenticación.
        /// Devuelve true si el login fue exitoso.
        /// </summary>
        public static bool Login(string usuario, string password, bool recordarme)
        {
            // En producción, validar contra BD con hash.
            // Acá hardcodeamos dos usuarios de ejemplo.
            bool credencialesOk =
                (usuario == "admin" && password == "admin123") ||
                (usuario == "user" && password == "user123");

            if (!credencialesOk) return false;

            // Crear ticket y cookie. 
            // Evita almacenar información sensible en la cookies, ya que esto expone los datos al cliente
            var ticket = new FormsAuthenticationTicket(
                version: 1,
                name: usuario,
                issueDate: DateTime.Now,
                expiration: DateTime.Now.Add(FormsAuthentication.Timeout),
                isPersistent: recordarme,
                userData: ObtenerRolesDelUsuario(usuario) // "Admin" o "User"
            );

            string cookieValue = FormsAuthentication.Encrypt(ticket);
            var cookie = new HttpCookie(FormsAuthentication.FormsCookieName, cookieValue)
            {
                HttpOnly = true,
                Secure = FormsAuthentication.RequireSSL,
                Path = FormsAuthentication.FormsCookiePath,
                SameSite = FormsAuthentication.CookieSameSite,
            };

            if (recordarme)
                cookie.Expires = ticket.Expiration; // cookie persistente

            HttpContext.Current.Response.Cookies.Add(cookie);

            return true;
        }

        /// <summary>
        /// Cierra la sesión del usuario actual y elimina la cookie de autenticación.
        /// </summary>
        public static void Logout()
        {
            FormsAuthentication.SignOut();
        }

        /// <summary>
        /// Obtengo el nombre del usuario logueado.
        /// </summary>
        /// <returns>Nombre del usuario o null si no está logueado</returns>
        public static string GetCurrentUserName() =>
             HttpContext.Current?.User?.Identity?.Name;

        /// <summary>
        /// Verifica si el usuario actual está autenticado.
        /// </summary>
        public static bool IsAuthenticated() => 
            HttpContext.Current?.User?.Identity?.IsAuthenticated ?? false;

        /// <summary>
        /// Verifica si el usuario actual es administrador.
        /// </summary>
        public static bool IsAdmin() =>
            HttpContext.Current?.User?.IsInRole("Admin") ?? false;

        public static bool IsInRole(string role) =>
            HttpContext.Current?.User?.IsInRole(role) ?? false;

        /// <summary>
        /// Obtengo el userId del usuario logueado, que se guardó en el ticket de autenticación.
        /// </summary>
        /// <returns>Id del usuario o null si no esta autenticado</returns>
        public static string GetUserId() =>
            HttpContext.Current?.User?.Identity is FormsIdentity fi && !string.IsNullOrEmpty(fi.Ticket?.UserData)
                ? fi.Ticket.UserData
                : null;

        /// <summary>
        /// Obtengo los roles del usuario logueado.
        /// </summary>
        /// <param name="usuario"></param>
        private static string ObtenerRolesDelUsuario(string usuario)
        {
            // En un caso real, consultás la BD.
            if (usuario == "admin") return "Admin";
            return "User";
        }
    }
}