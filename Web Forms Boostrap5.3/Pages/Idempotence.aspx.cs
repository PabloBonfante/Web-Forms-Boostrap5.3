using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Web_Forms_Boostrap5._3.Pages
{
    public partial class Idempotence : System.Web.UI.Page
    {
        public int CountClicks 
        { 
            get => (int)(ViewState["VS_CountClicks"] ?? 0);
            set => ViewState["VS_CountClicks"] = value;
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            DataBind();
        }

        protected void Btn_Idempotence_Command(object sender, CommandEventArgs e)
        {
            if (string.IsNullOrEmpty(L_Idempotence.Text))
            {
                L_Idempotence.Text = CountClicks + ": " + e.CommandArgument.ToString();
            }
            else
            {
                L_Idempotence.Text += "<br/>" + CountClicks + ": " + e.CommandArgument.ToString();
            }

            CountClicks++;
        }

        public string GetIdEmpotence() => Guid.NewGuid().ToString();
    }
}