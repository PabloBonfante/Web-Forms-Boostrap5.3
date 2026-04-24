<%@ Page Title="Confirm Modal" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ConfirmModal.aspx.cs" Inherits="Web_Forms_Boostrap5._3.Pages.ConfirmModal" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <h1>Confirm Modal</h1>

    <asp:Button 
        runat="server"
        ID="btnAlertDanger"
        UseSubmitBehavior="false" 
        CssClass="btn btn-danger" 
        Text="Button button"
        OnClick="btnAlertDanger_Click"
        OnClientClick="if(!areYouSure({ event: event })) return;" />

    <asp:Button 
        runat="server"
        ID="Button1"
        CssClass="btn btn-danger" 
        Text="Button submit"
        OnClick="btnAlertDanger_Click"
        OnClientClick="if(!areYouSure({ event: event })) return;" />

      <asp:LinkButton 
        runat="server"
        ID="Button2"
        CssClass="btn btn-danger" 
        Text="Link button"
        OnClick="btnAlertDanger_Click"
        OnClientClick="if(!areYouSure({ event: event })) return;" />

     <asp:ImageButton 
        runat="server"
        ID="LinkButton1"
        CssClass="btn btn-danger" 
        AlternateText="Image button"
        OnClick="btnAlertDanger_Click"
        OnClientClick="if(!areYouSure({ event: event })) return;" />

</asp:Content>
