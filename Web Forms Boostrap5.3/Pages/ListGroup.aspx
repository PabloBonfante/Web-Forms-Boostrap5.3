<%@ Page Title="List Group" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ListGroup.aspx.cs" Inherits="Web_Forms_Boostrap5._3.Pages.ListGroup" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container mt-5">
        <h5>List Group</h5>
        <asp:CheckBoxList
            runat="server"
            ID="CheckBoxListPaises"
            CssClass="asp-form-check asp-list-group asp-list-group-item-action asp-list-group-flush"
            RepeatLayout="UnorderedList">
            <asp:ListItem Text="México" Value="MX"></asp:ListItem>
            <asp:ListItem Text="Argentina" Value="AR"></asp:ListItem>
            <asp:ListItem Text="Colombia" Value="CO"></asp:ListItem>
            <asp:ListItem Text="Chile" Value="CL"></asp:ListItem>
            <asp:ListItem Text="Perú" Value="PE"></asp:ListItem>
            <asp:ListItem Text="España" Value="ES"></asp:ListItem>
            <asp:ListItem Text="Estados Unidos" Value="US"></asp:ListItem>
            <asp:ListItem Text="Brasil" Value="BR"></asp:ListItem>
            <asp:ListItem Text="Uruguay" Value="UY"></asp:ListItem>
            <asp:ListItem Text="Paraguay" Value="PY" Enabled="false" Selected="True"></asp:ListItem>
        </asp:CheckBoxList>
    </div>
</asp:Content>
