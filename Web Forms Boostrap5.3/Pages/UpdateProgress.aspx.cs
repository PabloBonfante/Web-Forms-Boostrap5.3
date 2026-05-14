using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Web_Forms_Boostrap5._3.Pages
{
    public partial class UpdateProgress : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnProcesar_Click(object sender, EventArgs e)
        {
            // Simular un proceso que toma tiempo
            // En una aplicación real, esto podría ser: consulta DB, llamada API, etc.
            Thread.Sleep(3000); // Espera 3 segundos para simular trabajo

            // Actualizar el label después del proceso
            lblMensaje.Text = $"¡Proceso completado! Hora: {DateTime.Now.ToString("HH:mm:ss")}";
        }
    }
}