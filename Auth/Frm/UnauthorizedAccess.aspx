<%@ Page Title="Acceso no autorizado" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="UnauthorizedAccess.aspx.cs" Inherits="Auth.Frm.UnauthorizedAccess" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container">
        <div class="row">
            <div class="col-md-6 col-md-offset-3 col-sm-8 col-sm-offset-2 text-center">
                <div class="well" style="margin-top:80px;">
                    <h1 class="text-warning"><strong>403</strong></h1>
                    <h2 class="text-muted">Acceso no autorizado</h2>
                    <p class="lead">
                        No tenés permisos suficientes para acceder a esta página.
                        Si creés que es un error, contactá al administrador del sistema.
                    </p>
                    <p>&nbsp;</p>
                    <a runat="server" href="/Home" class="btn btn-primary btn-lg" title="Volver al inicio">
                        <span class="glyphicon glyphicon-home" aria-hidden="true"></span>
                        Volver al inicio
                    </a>
                    <a runat="server" href="/Logout" class="btn btn-default btn-lg" title="Iniciar sesión con otra cuenta">
                        <span class="glyphicon glyphicon-user" aria-hidden="true"></span>
                        Cambiar de usuario
                    </a>
                </div>
            </div>
        </div>
    </div>
</asp:Content>