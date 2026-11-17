using Auth.Seguridad;
using System;
using System.Web.UI;

namespace Auth
{
    public partial class SiteMaster : MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            litUsuario.Text = AuthManager.GetCurrentUserName();
        }
    }
}