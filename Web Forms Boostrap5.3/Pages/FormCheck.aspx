<%@ Page Title="Form Check" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="FormCheck.aspx.cs" Inherits="Web_Forms_Boostrap5._3.Pages.FormCheck" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <h1>Form Check</h1>

    <div class="row g-3">
        <div class="col">
            <div class="vstack gap-2">
                <span>Checks</span>
                <asp:CheckBox
                    runat="server"
                    ID="CheckBox"
                    AutoPostBack="true"
                    CssClass="asp-form-check"
                    Text="Default checkbox" />

                <asp:CheckBox
                    runat="server"
                    ID="CheckBox1"
                    CssClass="asp-form-check"
                    Checked="true"
                    Text="Checked checkbox" />

                   <asp:CheckBox
                    runat="server"
                    ID="CheckBox2"
                    CssClass="asp-form-check"
                    Checked="true"
                    Text="Disabled checkbox"
                    Enabled="false" />

                <asp:CheckBoxList
                    runat="server"
                    ID="CheckBoxListPaises"
                    CssClass="asp-form-check list-unstyled"
                    RepeatLayout="UnorderedList">
                    <asp:ListItem Text="México" Value="MX"></asp:ListItem>
                    <asp:ListItem Text="Argentina" Value="AR" Selected="True"></asp:ListItem>
                    <asp:ListItem Text="Colombia" Value="CO"></asp:ListItem>
                    <asp:ListItem Text="Chile" Value="CL"></asp:ListItem>
                    <asp:ListItem Text="Perú" Value="PE"></asp:ListItem>
                    <asp:ListItem Text="España" Value="ES"></asp:ListItem>
                    <asp:ListItem Text="Estados Unidos" Value="US"></asp:ListItem>
                    <asp:ListItem Text="Brasil" Value="BR"></asp:ListItem>
                    <asp:ListItem Text="Uruguay" Value="UY"></asp:ListItem>
                    <asp:ListItem Text="Paraguay" Value="PY"></asp:ListItem>
                </asp:CheckBoxList>
            </div>
        </div>

        <div class="col">
            <div class="vstack gap-2">
                <span>Radios</span>
                <asp:RadioButton
                    runat="server"
                    ID="RadioButton"
                    CssClass="asp-form-check"
                    Text="Default radio"
                    GroupName="radio" />

                <asp:RadioButton
                    runat="server"
                    ID="RadioButto2"
                    CssClass="asp-form-check"
                    Checked="true"
                    Text="Checked radio"
                    GroupName="radio" />

                <asp:RadioButtonList
                    runat="server"
                    ID="RadioButtonListColores"
                    CssClass="asp-form-check">
                    <asp:ListItem Text="Rojo" Value="#FF0000"></asp:ListItem>
                    <asp:ListItem Text="Verde" Value="#00FF00"></asp:ListItem>
                    <asp:ListItem Text="Azul" Value="#0000FF"></asp:ListItem>
                    <asp:ListItem Text="Amarillo" Value="#FFFF00"></asp:ListItem>
                    <asp:ListItem Text="Naranja" Value="#FFA500"></asp:ListItem>
                    <asp:ListItem Text="Morado" Value="#800080"></asp:ListItem>
                    <asp:ListItem Text="Rosa" Value="#FFC0CB"></asp:ListItem>
                    <asp:ListItem Text="Cian" Value="#00FFFF"></asp:ListItem>
                    <asp:ListItem Text="Gris" Value="#808080"></asp:ListItem>
                    <asp:ListItem Text="Negro" Value="#000000" Selected="True"></asp:ListItem>
                    <asp:ListItem Text="Blanco" Value="#FFFFFF"></asp:ListItem>
                    <asp:ListItem Text="Marrón" Value="#8B4513"></asp:ListItem>
                    <asp:ListItem Text="Turquesa" Value="#40E0D0"></asp:ListItem>
                    <asp:ListItem Text="Lima" Value="#32CD32"></asp:ListItem>
                    <asp:ListItem Text="Índigo" Value="#4B0082"></asp:ListItem>
                </asp:RadioButtonList>
            </div>
        </div>

        <div class="col">
            <div class="vstack gap-2">
                <span>Switchs</span>
                <asp:CheckBox
                    runat="server"
                    ID="Switch"
                    CssClass="asp-form-check asp-form-switch"
                    Text="Default switch" />

                <asp:CheckBox
                    runat="server"
                    ID="Switch2"
                    CssClass="asp-form-check asp-form-switch"
                    Checked="true"
                    Text="Checked switch" />

                <asp:CheckBoxList
                    runat="server"
                    ID="CheckBoxList1"
                    CssClass="asp-form-check asp-form-switch"
                    RepeatColumns="3">
                    <asp:ListItem Text="Dinosaurio" Value="dino"></asp:ListItem>
                    <asp:ListItem Text="Unicornio" Value="unicornio"></asp:ListItem>
                    <asp:ListItem Text="Pizza" Value="pizza" Selected="True"></asp:ListItem>
                    <asp:ListItem Text="Cohete" Value="cohete"></asp:ListItem>
                    <asp:ListItem Text="Gato" Value="gato"></asp:ListItem>
                    <asp:ListItem Text="Robot" Value="robot"></asp:ListItem>
                    <asp:ListItem Text="Arcoíris" Value="arcoiris"></asp:ListItem>
                    <asp:ListItem Text="Guitarra" Value="guitarra"></asp:ListItem>
                    <asp:ListItem Text="Mago" Value="mago"></asp:ListItem>
                    <asp:ListItem Text="Dragón" Value="dragon"></asp:ListItem>
                </asp:CheckBoxList>
            </div>
        </div>
    </div>

</asp:Content>
