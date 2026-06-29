using System;
using Web_Forms_Boostrap5._3.Src.Utils;

namespace Web_Forms_Boostrap5._3.Pages
{
    public partial class Validation : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            JSHelper.Create(Page)
           .ShowToast(
               bodyText: "Validacion Exitosa",
               color: "success",
               icon: "bi bi-hand-thumbs-up",
               showHeader: false
           ).Execute();
        }
    }
}