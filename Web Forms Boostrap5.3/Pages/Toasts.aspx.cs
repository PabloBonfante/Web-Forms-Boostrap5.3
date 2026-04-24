using System;
using Web_Forms_Boostrap5._3.Src.Utils;

namespace Web_Forms_Boostrap5._3.Pages
{
    public partial class Toasts : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnToast_Click(object sender, EventArgs e)
        {
            JSHelper.Create(Page)
            .ShowToast(
                headerText: "Hi",
                bodyText: "Hello, world! This is a toast message.",
                color: "success",
                icon: "bi bi-hand-thumbs-up",
                showHeader: true
            ).Execute();
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            JSHelper.Create(Page)
            .ShowToast(
               headerText: "Hi",
               bodyText: "Hello, world! This is a toast message.",
               color: "success",
               icon: "bi bi-hand-thumbs-up"
            ).Execute();
        }

        protected void btnToastSimpleDanger_Click(object sender, EventArgs e)
        {
            JSHelper.Create(Page)
            .ShowToast(
              headerText: "Hi",
              bodyText: "Hello, world! This is a toast message."
            ).Execute();
        }

        protected void btnAlertDanger_Click(object sender, EventArgs e)
        {
            JSHelper.Create(Page)
            .ShowAlert(
               headerText: "Hi",
               bodyText: "Hello, world! This is a toast message.",
               timeout: 100000
            ).Execute();
        }

        protected void btnAlertPrimary_Click(object sender, EventArgs e)
        {
            JSHelper.Create(Page)
            .ShowAlert(
               headerText: "Hi",
               bodyText: "Hello, world! This is a toast message.",
               color: "primary",
               icon: "bi bi-hand-thumbs-up"
            ).Execute();
        }

        protected void btnAlertSuccess_Click(object sender, EventArgs e)
        {
            JSHelper.Create(Page)
            .ShowAlert(
               headerText: "Hi",
               bodyText: "Hello, world! This is a toast message.",
               color: "success",
               icon: "bi bi-hand-thumbs-up"
            ).Execute();
        }
    }
}