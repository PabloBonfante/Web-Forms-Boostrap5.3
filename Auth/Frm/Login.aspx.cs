using Auth.Seguridad;
using System;

namespace Auth.Frm
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // Si ya está autenticado, no tiene sentido mostrar el login
            if (!IsPostBack && AuthManager.IsAuthenticated())
                RedirigirAlDestino();
        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            if (!IsValid) return;

            string usuario = txtUsuario.Text.Trim();
            string password = txtPassword.Text.Trim();

            if (!AuthManager.Login(usuario, password, chkRecordarme.Checked))
            {
                lblError.Text = "Usuario o contraseña incorrectos.";
                lblError.Visible = true;
                return;
            }

            RedirigirAlDestino();
        }

        private void RedirigirAlDestino()
        {
            string returnUrl = Request.QueryString["ReturnUrl"];
            string frm = System.IO.Path.GetFileNameWithoutExtension(returnUrl);

            // Controlo si tiene un ReturnUrl y si es diferente de Login
            if (!string.IsNullOrEmpty(returnUrl) && !frm.Equals("Login", StringComparison.OrdinalIgnoreCase))
                Response.Redirect(returnUrl);

            // Por defecto, a la lista
            Response.Redirect(GetRouteUrl("ListaProductos", null));
        }
    }
}