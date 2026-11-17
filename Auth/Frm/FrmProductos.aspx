<%@ Page Title="Productos" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="FrmProductos.aspx.cs" Inherits="Auth.Frm.FrmProductos" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <h1>Lista de Productos</h1>

    <ul>
        <li>
            <asp:HyperLink runat="server"
                NavigateUrl="<%$ RouteUrl:RouteName=DetalleProducto, id=1 %>"
                Text="Producto 1" />
        </li>
        <li>
            <asp:HyperLink runat="server"
                NavigateUrl="<%$ RouteUrl:RouteName=DetalleProducto, id=2 %>"
                Text="Producto 2" />
        </li>
        <li>
            <asp:HyperLink runat="server"
                NavigateUrl='<%# GetRouteUrl("DetalleProducto", new { id = 3 }) %>'
                Text="Producto 3" />
        </li>
    </ul>
</asp:Content>
