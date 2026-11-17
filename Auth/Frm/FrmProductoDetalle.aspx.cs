using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Routing;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Auth.Frm
{
    public partial class FrmProductoDetalle : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // 1) Leer id desde la RUTA
            string id = Page.RouteData.Values["id"] as string;

            if (!IsPostBack)
            {
                // 2) Construir la URL de destino del POST usando GetVirtualPath
                var routeValues = new RouteValueDictionary { { "id", id } };
                var vp = RouteTable.Routes.GetVirtualPath(
                    null,
                    "EditarProducto",
                    routeValues
                );

                if (vp != null)
                    btnGuardar.PostBackUrl = vp.VirtualPath;

                // 3) Simulamos carga
                txtNombre.Text = "Producto " + id;
                txtPrecio.Text = "100";
            }
        }
    }
}