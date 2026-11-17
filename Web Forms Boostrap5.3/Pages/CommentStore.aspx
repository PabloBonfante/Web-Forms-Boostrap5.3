<%@ Page Title="Comment Store" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="CommentStore.aspx.cs" Inherits="Web_Forms_Boostrap5._3.Pages.CommentStore" %>

<%@ Register Assembly="Web Forms Boostrap5.3" Namespace="Web_Forms_Boostrap5._3.CustomControls" TagPrefix="cc" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <h1>Comment Store</h1>

    <cc:CommentSerializer ID="csConfig" runat="server" CommentId="config" />
    <cc:CommentSerializer ID="csUsuario" runat="server" CommentId="usuario" />

    <asp:Button ID="btnCambiarTema" runat="server" Text="Cambiar tema"
        OnClick="btnCambiarTema_Click" />

    <asp:Button ID="btnActualizarUsuario" runat="server" Text="Actualizar usuario"
        OnClick="btnActualizarUsuario_Click" />

    <asp:Button ID="btnLimpiar" runat="server" Text="Limpiar"
        OnClick="btnLimpiar_Click" />

    <asp:PlaceHolder runat="server">
        <%: Scripts.Render("~/lib/commentStore/commentStore.js") %>
    </asp:PlaceHolder>
    <script>
        // Escucha cambios notificados desde el servidor
        window.addEventListener('commentstore:updated', function (ev) {
            const id = ev.detail.id;
            const data = CommentStore.load(id);
            console.log('Cambió el comentario "' + id + '":', data);
        });

        // También puedes leerlo directo en cualquier momento
        const cfg = CommentStore.load('config');
        console.log('config inicial:', cfg);
    </script>
</asp:Content>
