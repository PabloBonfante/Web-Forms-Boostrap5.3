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

                    <button type="button" class="btn btn-secondary btn-sm" onclick="limpiarPatron()">Limpiar</button>
                </div>
            </div>
        </div>
    </div>

    <script>
        let lock = null;
        $(document).ready(function () {
            // Inicializar lock
            lock = new PatternLock('#lock', {
                onPattern: function (pattern) {
                    if (pattern) {
                        document.getElementById('PatternLock').value = pattern;
                        cookie('patron', pattern); // Guarda automáticamente
                    }
                },
                vibrate: false
            });

            // Cargar patrón guardado al iniciar
            var patronGuardado = cookie('patron');
            if (patronGuardado) {
                lock.setPattern(parseInt(patronGuardado));
                document.getElementById('PatternLock').value = patronGuardado;
            }
        });

        // Función cookie
        function cookie(nombre, valor) {
            if (valor) {
                document.cookie = nombre + "=" + encodeURIComponent(valor) + ";path=/;max-age=" + 60 * 60 * 24 * 30;
            } else {
                var c = document.cookie.split('; ');
                for (var i = 0; i < c.length; i++) {
                    if (c[i].split('=')[0] == nombre) return decodeURIComponent(c[i].split('=')[1]);
                }
                return null;
            }
        }

        function limpiarPatron() {
            lock.clear();
            document.getElementById('PatternLock').value = '';
            cookie('patron', ''); // Borra la cookie
        }
    </script>
</asp:Content>