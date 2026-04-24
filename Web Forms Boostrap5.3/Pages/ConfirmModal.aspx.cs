using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Web_Forms_Boostrap5._3.Src.Utils;

namespace Web_Forms_Boostrap5._3.Pages
{
    public partial class ConfirmModal : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnAlertDanger_Click(object sender, EventArgs e)
        {
            JSHelper.Create(Page)
            .ShowToast(
               headerText: "Exito",
               bodyText: "Se elimino correctamente.",
               color: "success",
               icon: "bi bi-check2-circle"
           ).Execute();
        }
    }
}