using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Auth.Frm
{
    public partial class FrmProductoNuevo : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // 1) Parámetro por RUTA
            string id = Page.RouteData.Values["id"] as string;

            // 2) Datos por POST — con ClientIDMode="Static" los nombres son limpios
            string nombre = Request.Form["txtNombre"];
            string precio = Request.Form["txtPrecio"];

            litResultado.Text = $@"
                <p>ID (por ruta): <b>{id}</b></p>
                <p>Nombre (por POST): <b>{nombre}</b></p>
                <p>Precio (por POST): <b>{precio}</b></p>
                <p>URL amigable: <b>{Request.Url.AbsolutePath}</b></p>
            ";
        }
    }
}