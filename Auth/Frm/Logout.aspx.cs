using Auth.Seguridad;
using System;

namespace Auth.Frm
{
    public partial class Logout : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            AuthManager.Logout();
            Response.Redirect(GetRouteUrl("Login", null));
        }
    }
}