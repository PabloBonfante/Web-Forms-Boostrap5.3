using System;

namespace Web_Forms_Boostrap5._3.Pages
{
    public partial class Pagination : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void DDL_Paginator_SelectedIndexChanged(object sender, EventArgs e)
        {
            WeatherForecast.AllowPaging = !DDL_Paginator.SelectedValue.Equals("All");
            if (WeatherForecast.AllowPaging) WeatherForecast.PageSize = int.Parse(DDL_Paginator.SelectedValue);
        }
    }
}