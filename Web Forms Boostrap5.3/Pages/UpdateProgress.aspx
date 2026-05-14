<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="UpdateProgress.aspx.cs" Inherits="Web_Forms_Boostrap5._3.Pages.UpdateProgress" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div style="text-align: center; margin-top: 50px;">
        <h2>Ejemplo de UpdateProgress</h2>

        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
            <ContentTemplate>
                <asp:Label ID="lblMensaje" runat="server" Text="Esperando acción..." Font-Size="Large"></asp:Label>
                <br />
                <br />
                <asp:Button ID="btnProcesar" runat="server" Text="Procesar Datos (3 segundos)"
                    OnClick="btnProcesar_Click" Height="40px" Width="250px" />
            </ContentTemplate>
        </asp:UpdatePanel>
    </div>

    <!-- UpdateProgress - se muestra durante postbacks asíncronos -->
    <asp:UpdateProgress ID="UpdateProgress1" runat="server" AssociatedUpdatePanelID="UpdatePanel1">
        <ProgressTemplate>
            <div class="d-flex align-items-center">
                <strong role="status">Procesando espere...</strong>
                <div class="spinner-border ms-auto" aria-hidden="true"></div>
            </div>
        </ProgressTemplate>
    </asp:UpdateProgress>
</asp:Content>
