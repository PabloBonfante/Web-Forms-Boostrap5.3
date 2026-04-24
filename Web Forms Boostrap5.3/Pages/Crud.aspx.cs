using System;
using System.Collections.Generic;
using System.Linq;
using System.Web.UI.WebControls;
using Web_Forms_Boostrap5._3.Src.Utils;
using Web_Forms_Boostrap5._3.Src.WeatherForecast;

namespace Web_Forms_Boostrap5._3.Pages
{
    public partial class Crud : System.Web.UI.Page
    {
        #region ViewState Properties
        public List<int> SelectedRecordIds
        {
            get => (List<int>)(ViewState["SelectedRecordIds"] ?? (ViewState["SelectedRecordIds"] = new List<int>()));
            set => ViewState["SelectedRecordIds"] = value;
        }

        public bool IsAllSelected
        {
            get => (bool)(ViewState["IsAllSelected"] ?? (ViewState["IsAllSelected"] = false));
            set => ViewState["IsAllSelected"] = value;
        }
        
        #endregion

        protected void Page_Load(object sender, EventArgs e)
        {
        }

        #region Event Handlers
        protected void Cb_Select_CheckedChanged(object sender, EventArgs e)
        {
            var selectCheckbox = (CheckBox)sender;
            int recordId = int.TryParse(selectCheckbox.Attributes["data-id"] ?? "", out int parsedId) ? parsedId : -1;

            if (selectCheckbox.Checked && !SelectedRecordIds.Contains(recordId))
            {
                SelectedRecordIds.Add(recordId);
            }
            else if (!selectCheckbox.Checked && SelectedRecordIds.Contains(recordId))
            {
                SelectedRecordIds.Remove(recordId);
            }
        }

        protected void DDL_Paginator_SelectedIndexChanged(object sender, EventArgs e)
        {
            GV_WeatherForecast.AllowPaging = !DDL_Paginator.SelectedValue.Equals("All");
            if (GV_WeatherForecast.AllowPaging)
                GV_WeatherForecast.PageSize = int.Parse(DDL_Paginator.SelectedValue);
        }
        #endregion

        #region CRUD Operation Alerts
        protected void DS_WeatherForecast_Updated(object sender, ObjectDataSourceStatusEventArgs e)
        {
            if (e.Exception == null && (int)e.ReturnValue > 0)
            {
                JSHelper
                .Create(Page)
                .ShowToast(
                    headerText: "Success",
                    bodyText: "The weather record was updated successfully.",
                    color: "success",
                    icon: "bi bi-hand-thumbs-up"
                )
                .Execute();
            }
            else
            {
                JSHelper
                .Create(Page)
                .ShowToast(
                    headerText: "Error",
                    bodyText: "Failed to update the weather record. Please try again."
                )
                .Execute();
            }
        }

        protected void DS_WeatherForecast_Deleted(object sender, ObjectDataSourceStatusEventArgs e)
        {
            if (e.Exception == null && (int)e.ReturnValue > 0)
            {
                JSHelper.Create(Page)
                .ShowToast(
                    headerText: "Success",
                    bodyText: "The weather record was deleted successfully.",
                    color: "success",
                    icon: "bi bi-hand-thumbs-up"
                ).Execute();
            }
            else
            {
                JSHelper.Create(Page)
                .ShowToast(
                    headerText: "Error",
                    bodyText: "Failed to delete the weather record. Please try again."
                ).Execute();
            }
        }

        protected void DS_WeatherForecast_Inserted(object sender, ObjectDataSourceStatusEventArgs e)
        {
            if (e.Exception == null && (int)e.ReturnValue > 0)
            {
                JSHelper.Create(Page)
                .ShowToast(
                    headerText: "Success",
                    bodyText: "The weather record was inserted successfully.",
                    color: "success",
                    icon: "bi bi-hand-thumbs-up"
                ).Execute();
            }
            else
            {
                JSHelper.Create(Page)
                .ShowToast(
                    headerText: "Error",
                    bodyText: "Failed to insert the weather record. Please check your data and try again."
                ).Execute();
            }
        }
        #endregion

        #region Button Click Handlers
        protected void Btn_Search_Click(object sender, EventArgs e)
        {
            BindWeatherForecastData();
        }

        protected void Btn_ClearFilter_Click(object sender, EventArgs e)
        {
            Tb_Filter.Text = string.Empty;
            BindWeatherForecastData();
        }

        protected void Btn_DeleteSelected_Click(object sender, EventArgs e)
        {
            if (IsValid)
            {
                WeatherForecastService weatherService = new WeatherForecastService();
                int affectedRowsCount = weatherService.DeleteWeatherForecast(SelectedRecordIds.ToArray());

                if (affectedRowsCount > 0)
                {
                    SelectedRecordIds.Clear();

                    JSHelper.Create(Page)
                    .ShowToast(
                        headerText: "Success",
                        bodyText: $"Successfully deleted {affectedRowsCount} record(s).",
                        color: "success",
                        icon: "bi bi-hand-thumbs-up"
                    ).Execute();

                    BindWeatherForecastData();
                }
                else
                {
                    JSHelper.Create(Page)
                    .ShowToast(
                        headerText: "Error",
                        bodyText: "Failed to delete the selected records. Please try again."
                    ).Execute();
                }
            }
        }
        #endregion

        #region Validation Methods
        protected void CV_SelectAny_ServerValidate(object source, ServerValidateEventArgs args)
        {
            args.IsValid = SelectedRecordIds.Any();

            if (!args.IsValid)
            {
                JSHelper.Create(Page)
                .ShowAlert(
                    headerText: "Warning",
                    bodyText: "Please select at least one record to delete.",
                    color: "warning",
                    timeout: 5000
                )
                .AutoFocus("[data-id] input[type=checkbox]")
                .Execute();
            }
        }
        #endregion

        #region Utility Methods
        public void BindWeatherForecastData()
        {
            DS_WeatherForecast.DataBind();
            GV_WeatherForecast.DataBind();
        }

        public bool IsRecordSelected(object recordId) => SelectedRecordIds.Contains(Convert.ToInt32(recordId));
        #endregion

        protected void Cb_SelectAll_CheckedChanged(object sender, EventArgs e)
        {
            var cb = (CheckBox)sender;
            IsAllSelected = cb.Checked;
            if (cb.Checked)
            {
                WeatherForecastService weatherService = new WeatherForecastService();
                SelectedRecordIds = weatherService.GetIdsWeatherForecast();
            }
            else
            {
                SelectedRecordIds.Clear();
            }

            BindWeatherForecastData();
        }
    }
}