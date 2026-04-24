using System;
using System.Web.UI.WebControls;

namespace Web_Forms_Boostrap5._3.Pages
{
    public partial class SelectedTable : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void WeatherForecast_SelectedIndexChanged(object sender, EventArgs e)
        {
            GridViewRow row = WeatherForecast.SelectedRow;
            DateTime date = Convert.ToDateTime(row.Cells[1].Text);
            int tempC = Convert.ToInt32(row.Cells[2].Text);
            int tempF = Convert.ToInt32(row.Cells[3].Text);
            string summary = row.Cells[4].Text;

            Literal.Text = $@"
            <table class='table table-sm table-bordered caption-top'>
                <caption>Selected Row</caption>
                <tbody>
                    <tr>
                        <th style='width: 150px;'>Fecha:</th>
                        <td>{date:dd/MM/yyyy}</td>
                    </tr>
                    <tr>
                        <th>Temperatura (°C):</th>
                        <td>{tempC} °C</td>
                    </tr>
                    <tr>
                        <th>Temperatura (°F):</th>
                        <td>{tempF} °F</td>
                    </tr>
                    <tr>
                        <th>Resumen:</th>
                        <td>{summary}</td>
                    </tr>
                </tbody>
            </table>";
        }
    }
}