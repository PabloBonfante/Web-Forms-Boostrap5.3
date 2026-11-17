<%@ Page Title="Piedra, Papel o Tijera" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="PiedraPapelTijera.aspx.cs" Inherits="Web_Forms_Boostrap5._3.Pages.PiedraPapelTijera" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <asp:UpdatePanel runat="server">
        <ContentTemplate>
            <div class="card border-0 shadow-lg rounded-4">
                <div class="card-body p-4 p-md-5">

                    <!-- Título -->
                    <div class="text-center mb-4">
                        <h1 class="fw-bold text-primary mb-2">
                            <i class="bi bi-controller"></i>Piedra, Papel o Tijera
                        </h1>
                        <p class="text-muted mb-0">Elige tu jugada y vence a la CPU 🤖</p>
                    </div>

                    <!-- Marcador -->
                    <div class="card bg-primary text-white border-0 rounded-4 mb-4">
                        <div class="card-body py-3">
                            <div class="row text-center align-items-center">
                                <div class="col-4">
                                    <div class="text-uppercase small opacity-75">👤 Tú</div>
                                    <div class="fs-1 fw-bold lh-1">
                                        <asp:Label ID="lblJugador" runat="server" Text="0" />
                                    </div>
                                </div>
                                <div class="col-4">
                                    <div class="text-uppercase small opacity-75">⚔️ VS</div>
                                    <div class="fs-5 fw-bold">
                                        <asp:Label ID="lblRonda" runat="server" Text="Ronda 1" />
                                    </div>
                                </div>
                                <div class="col-4">
                                    <div class="text-uppercase small opacity-75">🤖 CPU</div>
                                    <div class="fs-1 fw-bold lh-1">
                                        <asp:Label ID="lblCPU" runat="server" Text="0" />
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <!-- Botones de jugada -->
                    <div class="d-flex justify-content-center gap-3 flex-wrap mb-4">
                        <asp:Button ID="btnPiedra" runat="server" Text="🪨"
                            CssClass="btn btn-light btn-lg border rounded-4 shadow-sm fs-1"
                            Style="width: 110px; height: 110px;"
                            OnClick="Jugar" CommandArgument="piedra" ToolTip="Piedra" />

                        <asp:Button ID="btnPapel" runat="server" Text="📄"
                            CssClass="btn btn-light btn-lg border rounded-4 shadow-sm fs-1"
                            Style="width: 110px; height: 110px;"
                            OnClick="Jugar" CommandArgument="papel" ToolTip="Papel" />

                        <asp:Button ID="btnTijera" runat="server" Text="✂️"
                            CssClass="btn btn-light btn-lg border rounded-4 shadow-sm fs-1"
                            Style="width: 110px; height: 110px;"
                            OnClick="Jugar" CommandArgument="tijera" ToolTip="Tijera" />
                    </div>

                    <!-- Resultado -->
                    <asp:Panel ID="pnlResultado" runat="server"
                        CssClass="bg-light rounded-4 p-4 text-center mb-3" Visible="false">

                        <div class="d-flex align-items-center justify-content-center gap-4">
                            <div class="text-center">
                                <div class="display-4">
                                    <asp:Label ID="lblEmojiJugador" runat="server" />
                                </div>
                                <span class="badge bg-primary">Tú</span>
                            </div>
                            <div class="fs-3 fw-bold text-primary">VS</div>
                            <div class="text-center">
                                <div class="display-4">
                                    <asp:Label ID="lblEmojiCPU" runat="server" />
                                </div>
                                <span class="badge bg-dark">CPU</span>
                            </div>
                        </div>

                        <asp:Label ID="lblMensaje" runat="server"
                            CssClass="d-block fs-4 fw-bold mt-3" />
                    </asp:Panel>

                    <!-- Botón Reiniciar -->
                    <div class="text-center mt-4">
                        <asp:Button ID="btnReset" runat="server"
                            Text="🔄 Reiniciar juego"
                            CssClass="btn btn-outline-secondary rounded-3 px-4"
                            OnClick="btnReset_Click" />
                    </div>
                </div>
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
