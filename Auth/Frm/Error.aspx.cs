using System;

namespace Auth.Frm
{
    public partial class Error : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string aspxerrorpath = Request.QueryString["aspxerrorpath"];
            if (!string.IsNullOrEmpty(aspxerrorpath))
                errorTitle.InnerText += $" en la ruta: {aspxerrorpath}";

            // Recuperar la excepción que ASP.NET guarda en el contexto
            Exception ex = Server.GetLastError();

            if (ex != null)
            {
                // Registrar en log (ajusta a tu sistema: log4net, NLog, EventLog, etc.)
                System.Diagnostics.Trace.TraceError(
                    "Error global: {0} | URL: {1}",
                    ex.ToString(),
                    Request.RawUrl);

                pException.InnerHtml = $"Exception: {ex.Message} <br/> InnerException: {ex.InnerException.Message}";
                pException.Visible = !string.IsNullOrEmpty(ex.Message) || !string.IsNullOrEmpty(ex.InnerException.Message);

                // 2. Limpia el error para que no se propague
                Server.ClearError();
            }
        }
    }
}