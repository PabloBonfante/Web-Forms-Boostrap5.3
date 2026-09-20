using System;
using System.Web.UI;

namespace Web_Forms_Boostrap5._3.Pages
{
    public partial class JSInvokable : Page, ICallbackEventHandler
    {
        private string resultado;

        public string GetCallbackResult() => resultado;

        protected void Page_Load(object sender, EventArgs e)
        {
            string cbReference = Page.ClientScript.GetCallbackEventReference(
                this, "arg", "OnCallbackComplete", "");
            string callbackScript = "function LlamarServidor(arg) { " + cbReference + "; }";
            Page.ClientScript.RegisterClientScriptBlock(GetType(), "LlamarServidor", callbackScript, true);
        }
        public void RaiseCallbackEvent(string eventArgument)
        {
            resultado = "Procesado: " + eventArgument;
            label.Text = resultado;
        }

        protected void BtnPosback_Click(object sender, EventArgs e)
        {
            label.Text = resultado;
        }
    }
}