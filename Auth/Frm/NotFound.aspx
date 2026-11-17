<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="NotFound.aspx.cs" Inherits="Auth.Frm.NotFound" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <title>Página no encontrada</title>
    <link runat="server" rel="stylesheet" href="~/Content/bootstrap.min.css" />
</head>
<body>
    <form id="form1" runat="server">
        <div class="container">
            <div class="row">
                <div class="col-md-6 col-md-offset-3 col-sm-8 col-sm-offset-2 text-center">
                    <div class="well" style="margin-top:80px;">
                        <h1 class="text-danger"><strong>404</strong></h1>
                        <h2 class="text-muted">Página no encontrada</h2>
                        <p class="lead">
                            Lo sentimos, la página que estás buscando no existe
                            o fue movida a otra ubicación.
                        </p>
                        <p>&nbsp;</p>
                        <a runat="server" href="~/Default.aspx" class="btn btn-primary btn-lg" title="Volver al inicio">
                            <span class="glyphicon glyphicon-home" aria-hidden="true"></span>
                            Volver al inicio
                        </a>
                    </div>
                </div>
            </div>
        </div>
    </form>
</body>
</html>