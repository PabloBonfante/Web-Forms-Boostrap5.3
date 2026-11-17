using System;

namespace Web_Forms_Boostrap5._3.Pages
{
    public partial class CommentStore : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // Estado inicial
                csConfig.SetData(new
                {
                    tema = "oscuro",
                    idioma = "es-AR",
                    version = 3,
                    features = new[] { "a", "b" }
                });

                csUsuario.SetData(new
                {
                    id = 42,
                    nombre = "Ana",
                    roles = new[] { "admin", "editor" }
                });
            }
        }

        protected void btnCambiarTema_Click(object sender, EventArgs e)
        {
            // Notificamos un cambio parcial: solo "tema"
            csConfig.Update(new { tema = "claro" });
        }

        protected void btnActualizarUsuario_Click(object sender, EventArgs e)
        {
            csUsuario.Update(new
            {
                nombre = "Ana María",
                ultimoLogin = DateTime.UtcNow
            });
        }

        protected void btnLimpiar_Click(object sender, EventArgs e)
        {
            csConfig.Clear();
            csUsuario.Clear();
        }
    }
}