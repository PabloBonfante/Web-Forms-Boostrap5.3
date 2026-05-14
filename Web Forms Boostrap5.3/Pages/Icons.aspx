<%@ Page Title="Icons" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Icons.aspx.cs" Inherits="Web_Forms_Boostrap5._3.Pages.Icons" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="row g-3">
        <div class="col-12">
            <span>Icons</span>
            <div class="d-flex gap-3">
                <div class="asp-icon btn btn-primary btn-sm bi bi-browser-chrome">
                    <span>Chrome</span>
                    <asp:Button ID="btnChrome" runat="server" UseSubmitBehavior="false" ToolTip="Chrome" />
                </div>

                <div class="asp-icon btn btn-secondary btn-sm bi bi-browser-edge">
                    <span>Edge</span>
                    <asp:ImageButton ID="btniEdge" runat="server" Enabled="false" ToolTip="Edge" />
                </div>

                <div class="asp-icon btn btn-warning btn-sm bi bi-browser-firefox">
                    <span>Firefox</span>
                    <asp:Button ID="btnFirefox" runat="server" UseSubmitBehavior="false" ToolTip="Firefox" />
                </div>

                <!-- No Visible btn -->
                <div class="asp-icon btn btn-warning btn-sm bi bi-browser-safari">
                    <span>Safari</span>
                    <asp:Button ID="btnSafari" runat="server" UseSubmitBehavior="false" Visible="false" ToolTip="Safari" />
                </div>
            </div>
        </div>

        <div class="col-12">
            <span>Icons btn</span>
            <div class="d-flex gap-3">
                <asp:Button ID="btnIcon" runat="server"
                    UseSubmitBehavior="false"
                    Text="&#xF30A;"
                    CssClass="asp-icon btn btn-primary rounded-circle p-2 lh-1"
                    ToolTip="Download" />

                <asp:Button ID="btnIcon1" runat="server"
                    UseSubmitBehavior="false"
                    Text="&#xF659;"
                    CssClass="asp-icon btn btn-secondary rounded-circle p-2 lh-1"
                    ToolTip="Cancel" />

                <asp:ImageButton ID="Button1" runat="server"
                    UseSubmitBehavior="false"
                    AlternateText="&#xF26B;"
                    CssClass="asp-icon btn btn-light rounded-circle p-2 lh-1"
                    ToolTip="Check" />
            </div>
        </div>

        <div class="col-4">
            <asp:TextBox
                runat="server"
                ID="TextBox2"
                CssClass="form-control form-control-lg asp-icon-search"
                placeholder="Search..."
                ToolTip="Search"
                TextMode="Search" />
        </div>

        <div class="col-4">
            <asp:TextBox
                runat="server"
                ID="Tb_Search"
                CssClass="form-control asp-icon-search"
                placeholder="Search..."
                ToolTip="Search"
                TextMode="Search" />
        </div>

        <div class="col-4">
            <asp:TextBox
                runat="server"
                ID="TextBox1"
                CssClass="form-control form-control-sm asp-icon-search"
                placeholder="Search..."
                ToolTip="Search"
                TextMode="Search" />
        </div>


    </div>
</asp:Content>
