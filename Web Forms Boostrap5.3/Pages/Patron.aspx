<%@ Page Title="Patron de celular" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Patron.aspx.cs" Inherits="Web_Forms_Boostrap5._3.Pages.Patron" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <h1><%: Title %></h1>

    <asp:PlaceHolder runat="server">
        <%: Styles.Render("~/lib/pattern-lock/patternlock.min.css") %>
        <%: Scripts.Render("~/lib/pattern-lock/patternlock.min.js") %>
    </asp:PlaceHolder>

    <div class="row g-3">
        <div class="col-4">
            <div class="vstack gap-3">
                <svg class="patternlock border rounded" id="lock" viewBox="0 0 100 100" xmlns="http://www.w3.org/2000/svg">
                    <g class="lock-actives"></g>
                    <g class="lock-lines"></g>
                    <g class="lock-dots">
                        <circle cx="20" cy="20" r="3" />
                        <circle cx="50" cy="20" r="3" />
                        <circle cx="80" cy="20" r="3" />
                                                   
                        <circle cx="20" cy="50" r="3" />
                        <circle cx="50" cy="50" r="3" />
                        <circle cx="80" cy="50" r="3" />
                                                   
                        <circle cx="20" cy="80" r="3" />
                        <circle cx="50" cy="80" r="3" />
                        <circle cx="80" cy="80" r="3" />
                    </g>
                </svg>

                <div class="d-grid gap-2">
                    <asp:TextBox runat="server" ID="PatternLock" ClientIDMode="Static"
                        CssClass="form-control form-control-sm" ToolTip="Patron de desbloqueo"
                        ReadOnly="true" AutoCompleteType="None"></asp:TextBox>

                    <button type="button" class="btn btn-primary btn-sm" onclick="cargarPatronGuardado()">Cargar Patrón</button>
                    <button type="button" class="btn btn-primary btn-sm" onclick="limpiarPatron()">Limpiar</button>
                </div>
            </div>
        </div>
    </div>

    <script>

        // Inicializar el lock
        var lock = new PatternLock('#lock', {
            onPattern: function (pattern) {
                console.log('Patrón dibujado:', pattern);
                if (pattern)
                    document.getElementById('PatternLock').value = pattern;
            },
            vibrate: false
        });

        // Función para cargar un patrón guardado
        function cargarPatronGuardado() {
            // Simulamos un patrón guardado en la base de datos
            var patronGuardado = 12369;

            // Cargar el patrón
            lock.setPattern(patronGuardado);

            document.getElementById('PatternLock').value = patronGuardado;

            console.log('Patrón cargado:', lock.getPattern());
        }

        function limpiarPatron() {
            lock.clear();
            document.getElementById('PatternLock').value = '';
        }
    </script>
</asp:Content>
