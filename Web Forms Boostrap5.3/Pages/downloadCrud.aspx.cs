using System;
using System.Web;
using Web_Forms_Boostrap5._3.Src.WeatherForecast;

namespace Web_Forms_Boostrap5._3.Pages
{
    public partial class downloadCrud : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string fName = "WeatherForecast.csv";
            int error_code = 404;
            string error_message = "Archivo no encontrado";
            string csv = "";
            bool flag = false;

            try
            {
                // DESCARGAR ARCHIVO -----------------------------------
                WeatherForecastService service = new WeatherForecastService();
                csv = service.DownloadWeatherForecast(); //contenido del archivo
                flag = true; //si todo fue bien descargar
            }
            catch (Exception ex)
            {
                error_code = 500;
                error_message = "Fallo al proceso el archivo ! " + ex.Message;
            }

            //bamdera si todo esta bien
            if (flag)
            {
                Response.Clear();
                Response.Buffer = true;
                Response.AddHeader("Content-disposition", "attachment;filename=" + fName);
                Response.Charset = "";
                Response.ContentType = "text/csv";
                Response.AppendCookie(new HttpCookie("fileDownload", "true"));
                Response.AppendCookie(new HttpCookie("path", "/"));
                Response.BinaryWrite(System.Text.Encoding.UTF8.GetPreamble());
                Response.Output.Write(csv);
                Response.Flush();
                Response.End();
            }
            else
            {
                Response.Clear();
                Response.StatusCode = error_code;
                Response.StatusDescription = error_message;
                Response.End();
                HttpContext.Current.ApplicationInstance.CompleteRequest();
            }
        }
    }
}