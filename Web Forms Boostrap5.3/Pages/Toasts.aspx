<%@ Page Title="Toasts" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Toasts.aspx.cs" Inherits="Web_Forms_Boostrap5._3.Pages.Toasts" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <h1>Create toasts from C#</h1>

    <div class="row g-3">
        <div class="col-12">
            <span>Toasts</span>
            <div class="d-flex gap-3">
                <asp:Button runat="server" ID="btnToast" UseSubmitBehavior="false" CssClass="btn btn-success" Text="Header toast" OnClick="btnToast_Click" />
                <asp:Button runat="server" ID="btnToastSimple" UseSubmitBehavior="false" CssClass="btn btn-success" Text="Simple toast" OnClick="Button1_Click" />
                <asp:Button runat="server" ID="btnToastSimpleDanger" UseSubmitBehavior="false" CssClass="btn btn-danger" Text="Simple toast danger" OnClick="btnToastSimpleDanger_Click" />
            </div>
        </div>

        <div class="col-12">
            <span>Alerts</span>
            <div class="d-flex gap-3">
                <asp:Button runat="server" ID="btnAlertPrimary" UseSubmitBehavior="false" CssClass="btn btn-primary" Text="Alert Primary" OnClick="btnAlertPrimary_Click" />
                <asp:Button runat="server" ID="btnAlertSuccess" UseSubmitBehavior="false" CssClass="btn btn-success" Text="Alert Success" OnClick="btnAlertSuccess_Click" />
                <asp:Button runat="server" ID="btnAlertDanger" UseSubmitBehavior="false" CssClass="btn btn-danger" Text="Alert Danger" OnClick="btnAlertDanger_Click" />
            </div>
        </div>
    </div>
</asp:Content>
