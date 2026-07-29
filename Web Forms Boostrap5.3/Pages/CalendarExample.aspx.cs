using System;
using System.Web.UI.WebControls;

namespace Web_Forms_Boostrap5._3.Pages
{
    public partial class CalendarExample : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                InitializeCalendar();
                LoadMonthsDropdown();
                LoadYearsDropdown();
            }
        }

        private void InitializeCalendar()
        {
            Calendar1.SelectedDate = DateTime.Today;
            Calendar1.VisibleDate = DateTime.Today;
        }

        private void LoadMonthsDropdown()
        {
            ddlMonths.Items.Clear();
            for (int i = 1; i <= 12; i++)
            {
                DateTime date = new DateTime(DateTime.Now.Year, i, 1);
                ddlMonths.Items.Add(new ListItem(date.ToString("MMMM"), i.ToString()));
            }
            ddlMonths.SelectedValue = DateTime.Now.Month.ToString();
        }

        private void LoadYearsDropdown()
        {
            ddlYears.Items.Clear();
            int currentYear = DateTime.Now.Year;
            for (int i = currentYear - 20; i <= currentYear + 5; i++)
            {
                ddlYears.Items.Add(new ListItem(i.ToString(), i.ToString()));
            }
            ddlYears.SelectedValue = currentYear.ToString();
        }

        protected void Calendar1_SelectionChanged(object sender, EventArgs e)
        {
            ShowSelectedDateInfo();
        }

        protected void Calendar1_DayRender(object sender, DayRenderEventArgs e)
        {
            // Resaltar fines de semana
            if (e.Day.IsWeekend)
            {
                e.Cell.CssClass = "weekend";
            }

            // Resaltar día actual
            if (e.Day.Date == DateTime.Today)
            {
                e.Cell.CssClass = "today";
            }

            // Puedes agregar más lógica aquí para resaltar días especiales
            // Por ejemplo, días festivos o eventos
        }

        protected void btnToday_Click(object sender, EventArgs e)
        {
            Calendar1.SelectedDate = DateTime.Today;
            Calendar1.VisibleDate = DateTime.Today;
            ShowSelectedDateInfo();
        }

        protected void btnPrevMonth_Click(object sender, EventArgs e)
        {
            Calendar1.VisibleDate = Calendar1.VisibleDate.AddMonths(-1);
            UpdateDropdowns();
        }

        protected void btnNextMonth_Click(object sender, EventArgs e)
        {
            Calendar1.VisibleDate = Calendar1.VisibleDate.AddMonths(1);
            UpdateDropdowns();
        }

        protected void ddlMonths_SelectedIndexChanged(object sender, EventArgs e)
        {
            int month = int.Parse(ddlMonths.SelectedValue);
            int year = Calendar1.VisibleDate.Year;
            Calendar1.VisibleDate = new DateTime(year, month, 1);
        }

        protected void ddlYears_SelectedIndexChanged(object sender, EventArgs e)
        {
            int year = int.Parse(ddlYears.SelectedValue);
            int month = Calendar1.VisibleDate.Month;
            Calendar1.VisibleDate = new DateTime(year, month, 1);
        }

        private void ShowSelectedDateInfo()
        {
            pnlInfo.Visible = true;
            lblSelectedDate.Text = "Fecha seleccionada: " +
                                  Calendar1.SelectedDate.ToShortDateString();
            lblDayOfWeek.Text = "Día de la semana: " +
                               Calendar1.SelectedDate.ToString("dddd");
        }

        private void UpdateDropdowns()
        {
            ddlMonths.SelectedValue = Calendar1.VisibleDate.Month.ToString();
            ddlYears.SelectedValue = Calendar1.VisibleDate.Year.ToString();
        }
    }
}