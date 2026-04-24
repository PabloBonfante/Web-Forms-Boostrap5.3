using System;
using System.Collections.Generic;
using System.Web.UI.WebControls;

namespace Web_Forms_Boostrap5._3.Pages
{
    public partial class Pagination : System.Web.UI.Page
    {
        public List<int> SelectedRecordIds
        {
            get => (List<int>)(ViewState["SelectedRecordIds"] ?? (ViewState["SelectedRecordIds"] = new List<int>()));
            set => ViewState["SelectedRecordIds"] = value;
        }

        protected void Page_Load(object sender, EventArgs e)
        {
        }

        public bool IsSelected(object id) => SelectedRecordIds.Contains(Convert.ToInt32(id));

        protected void Cb_Select_CheckedChanged(object sender, EventArgs e)
        {
            var check = (CheckBox)sender;
            int id = int.TryParse(check.Attributes["data-id"] ?? "", out int _i) ? _i : -1;

            if (check.Checked && !SelectedRecordIds.Contains(id))
                SelectedRecordIds.Add(id);
            
            if (!check.Checked && SelectedRecordIds.Contains(id))
                SelectedRecordIds.Remove(id);
        }

        protected void DDL_Paginator_SelectedIndexChanged(object sender, EventArgs e)
        {
            WeatherForecast.AllowPaging = !DDL_Paginator.SelectedValue.Equals("All");
            if (WeatherForecast.AllowPaging) WeatherForecast.PageSize = int.Parse(DDL_Paginator.SelectedValue);
        }
    }
}