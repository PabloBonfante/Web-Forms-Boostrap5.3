<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Idempotence.aspx.cs" Inherits="Web_Forms_Boostrap5._3.Pages.Idempotence" EnableEventValidation="false" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <asp:Button 
        ID="Btn_Idempotence"
        runat="server" 
        Text="Idempotence"
        CommandName="IdEmpotence" 
        CommandArgument='<%# GetIdEmpotence() %>'
        OnCommand="Btn_Idempotence_Command"
        OnClientClick="generarIdIdempotencia(this)" />

    <div>
        Current Idempotence:
                <asp:Literal ID="L_Idempotence" runat="server" />
    </div>

    <asp:Button ID="Button1" runat="server" UseSubmitBehavior="false" Text="Posback" />

    <asp:HiddenField runat="server" ID="H_Idempotence" ClientIDMode="Static" />
    <script>
        $(document).ready(function () {
            generateIdempotences();

            // Suscribirse al evento endRequest
            if (typeof Sys !== 'undefined') {
                Sys.WebForms.PageRequestManager.getInstance().add_endRequest(EndRequestHandler);

                function EndRequestHandler(sender, args) {
                    // Este código se ejecuta después de que se completa la solicitud AJAX
                    generateIdempotences();
                }
            }
        });

        function generateGUID() {
            const array = new Uint32Array(8);
            window.crypto.getRandomValues(array);
            let str = '';
            for (let i = 0; i < array.length; i++) {
                str += array[i].toString(16).padStart(8, '0');
            }
            return str;
        }
        console.log(generateGUID());

        function generateIdempotences() {
            const btns = document.querySelectorAll('[data-idempotence]');
            const hiddenField = document.getElementById('H_Idempotence');
            const ids = [];
            btns.forEach(btn => {
                const id = generateGUID();
                ids.push(id);
            });

            hiddenField.value = ids.join(';');
        }
    </script>
</asp:Content>
