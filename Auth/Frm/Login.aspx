<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="Auth.Frm.Login"
    Culture="es-AR" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml" lang="es">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <title>Iniciar sesión</title>
    <link runat="server" rel="stylesheet" href="~/Content/bootstrap.min.css" />
    <link runat="server" rel="stylesheet" href="~/Content/Site.css" />
</head>
<body>
    <form id="form1" runat="server" role="form" aria-label="Formulario de inicio de sesión">
        <main class="container" role="main">
            <div class="row">
                <div class="col-xs-12 col-sm-8 col-sm-offset-2 col-md-6 col-md-offset-3 col-lg-4 col-lg-offset-4">
                    <div class="panel panel-default" style="margin-top: 40px;">
                        <div class="panel-heading">
                            <h1 class="panel-title text-center" style="font-size: 22px;">Iniciar sesión</h1>
                        </div>
                        <div class="panel-body">

                            <asp:Label ID="lblError" runat="server"
                                CssClass="alert alert-danger"
                                role="alert"
                                aria-live="assertive"
                                Visible="false"
                                Style="display: block;" />

                            <div class="form-group has-feedback">
                                <asp:Label runat="server" AssociatedControlID="txtUsuario" Text="Usuario"
                                    CssClass="control-label" />
                                <asp:TextBox ID="txtUsuario" runat="server"
                                    CssClass="form-control"
                                    placeholder="Ej: Admin"
                                    ToolTip="Ingrese su nombre de usuario"
                                    aria-label="Nombre de usuario"
                                    aria-required="true"
                                    autocomplete="username"
                                    autofocus="autofocus" />

                                <span class="glyphicon glyphicon-remove form-control-feedback" aria-hidden="true"></span>

                                <asp:RequiredFieldValidator runat="server" ControlToValidate="txtUsuario"
                                    SetFocusOnError="true" ErrorMessage="*Ingrese un nombre de usuario"
                                    CssClass="invalid-feedback" Display="Dynamic" ValidationGroup="VG_Login" />
                            </div>


                            <div class="form-group has-feedback">
                                <asp:Label runat="server" AssociatedControlID="txtPassword" Text="Contraseña"
                                    CssClass="control-label" />

                                <asp:TextBox ID="txtPassword" runat="server"
                                    TextMode="Password"
                                    CssClass="form-control"
                                    ToolTip="Ingrese su contraseña"
                                    placeholder="Ej: admin123"
                                    aria-label="Contraseña"
                                    aria-required="true"
                                    autocomplete="current-password" />

                                <span class="glyphicon glyphicon-remove form-control-feedback" aria-hidden="true"></span>

                                <asp:RequiredFieldValidator runat="server" ControlToValidate="txtPassword"
                                    SetFocusOnError="true" ErrorMessage="*Ingrese una contraseña" 
                                    CssClass="invalid-feedback" Display="Dynamic" ValidationGroup="VG_Login" />
                            </div>

                            <div class="checkbox" aria-label="Recordarme" title="Marcar para mantener la sesión iniciada">
                                <label>
                                    <asp:CheckBox ID="chkRecordarme" runat="server" />
                                    Recordarme
                                </label>
                            </div>

                            <asp:Button ID="btnLogin" ClientIDMode="Static" runat="server"
                                Text="Entrar"
                                CausesValidation="true" ValidationGroup="VG_Login"
                                CssClass="btn btn-primary btn-block"
                                OnClick="btnLogin_Click"
                                OnClientClick="if(Page_ClientValidate('VG_Login')) btnToggleLoading({ selector: this, busyText: 'Iniciando Session...' })"
                                ToolTip="Iniciar sesión con las credenciales ingresadas"
                                aria-label="Iniciar sesión" />
                        </div>
                    </div>
                </div>
            </div>
        </main>

        <asp:PlaceHolder runat="server">
            <%: Scripts.Render("~/Scripts/Site.js") %>
        </asp:PlaceHolder>

        <script>
            onGlobalEnter(() => click('#btnLogin'));
        </script>
    </form>
</body>
</html>
