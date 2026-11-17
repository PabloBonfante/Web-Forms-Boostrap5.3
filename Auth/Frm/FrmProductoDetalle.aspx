<%@ Page Title="Producto Detalle" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="FrmProductoDetalle.aspx.cs" Inherits="Auth.Frm.FrmProductoDetalle" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <h1>Detalle del Producto</h1>

        <p>ID recibido por ruta: <strong><asp:Literal runat="server" Text="<%$ RouteValue:id %>" /></strong></p>

        <fieldset>
            <legend>Editar producto</legend>

            <label>Nombre:</label>
            <asp:TextBox ID="txtNombre" runat="server" ClientIDMode="Static" /><br /><br />

            <label>Precio:</label>
            <asp:TextBox ID="txtPrecio" runat="server" ClientIDMode="Static" /><br /><br />

            <asp:Button ID="btnGuardar" runat="server" Text="Guardar" />
        </fieldset>
</asp:Content>
