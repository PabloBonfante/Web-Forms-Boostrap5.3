<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Error.aspx.cs" Inherits="Auth.Frm.Error" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <title>Ha ocurrido un error</title>
    <link runat="server" rel="stylesheet" href="~/Content/bootstrap.min.css" />
</head>
<body>
    <form id="form1" runat="server">
        <div class="row">
            <div class="col-md-6 col-md-offset-3 col-sm-8 col-sm-offset-2 text-center">
                <div class="well" style="margin-top: 80px;">
                    <h1 class="text-warning"><strong>500</strong></h1>
                    <h2 runat="server" id="errorTitle" class="text-muted">Ha ocurrido un error inesperado
                    </h2>
                    <p runat="server" id="pException" class="lead text-break" visible="false"></p>
                    <p>&nbsp;</p>
                    <a runat="server" href="~/Default.aspx" class="btn btn-primary btn-lg" title="Volver al inicio">
                        <span class="glyphicon glyphicon-home" aria-hidden="true"></span>
                        Volver al inicio
                        </a>
                </div>
            </div>
        </div>
    </form>
    <style>
        .text-break {
            word-wrap: break-word !important;
            word-break: break-word !important;
        }
    </style>
</body>
</html>
