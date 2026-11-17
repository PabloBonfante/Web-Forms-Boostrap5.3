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
            // ⚠️ En producción, validá contra BD con hash + salt.
            // Acá hardcodeamos dos usuarios de ejemplo.
            bool credencialesOk =
                (usuario == "admin" && password == "admin123") ||
                (usuario == "user" && password == "user123");

            if (!credencialesOk) return false;

            // Creamos el ticket y la cookie
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
                HttpOnly = false,
                Secure = FormsAuthentication.RequireSSL,
                Path = FormsAuthentication.FormsCookiePath
            };

            if (recordarme)
                cookie.Expires = ticket.Expiration; // cookie persistente

            HttpContext.Current.Response.Cookies.Add(cookie);
            return true;
        }

        public static void Logout()
        {
            FormsAuthentication.SignOut();
        }

        public static string GetCurrentUserName() =>
             HttpContext.Current?.User?.Identity?.Name;
        
        public static bool IsAuthenticated() => 
            HttpContext.Current?.User?.Identity?.IsAuthenticated ?? false;
        
        private static string ObtenerRolesDelUsuario(string usuario)
        {
            // En un caso real, consultás la BD.
            if (usuario == "admin") return "Admin";
            return "User";
        }
    }
}