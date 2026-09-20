<%@ Page Title="JS Invokable In Web Forms" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="JSInvokable.aspx.cs" Inherits="Web_Forms_Boostrap5._3.Pages.JSInvokable" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <h1>JS Invokable In Web Forms</h1>

    <button type="button" onclick="LlamarServidor('dato de prueba')">Click Me</button>

    <asp:Button runat="server" ID="BtnPosback" Text="posback" OnClick="BtnPosback_Click" />

    <asp:Label runat="server" ID="label"></asp:Label>
    <script>
        function OnCallbackComplete(resultado) {
            alert(resultado);
        }
    </script>
</asp:Content>
