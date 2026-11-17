using System;
using System.Web.UI.WebControls;

namespace Web_Forms_Boostrap5._3.Pages
{
    public partial class Cantidad : System.Web.UI.Page
    {
        public int Cant 
        {
            get => (int)(ViewState["Cantidad"] ?? 1);
            set => ViewState["Cantidad"] = value;
        }
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void ChangeCantidad(object sender, EventArgs e)
        {
            Page.Validate();
            bool IsTextBox = sender is TextBox;
            if (IsTextBox && IsValid) 
                Cant = ToInt(((TextBox)sender).Text);
            else if(!IsTextBox)
            {
                Cant += ToInt(((Button)sender).CommandArgument);
                Tb_Cantidad.Text = Cant.ToString();
            }

            BtnRestar.Enabled = Cant != 1;
        }

        private int ToInt(string value) 
        {
            if (string.IsNullOrEmpty(value))
                return 0;

           return int.TryParse(value, out int _val) ? _val : 0;
        }
    }
}