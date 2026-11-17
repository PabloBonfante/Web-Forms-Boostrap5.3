<%@ Page Title="Cantidad" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Cantidad.aspx.cs" Inherits="Web_Forms_Boostrap5._3.Pages.Cantidad" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <h1>Cantidad</h1>

    <div class="row">
        <asp:UpdatePanel runat="server" class="col-1">
            <ContentTemplate>
                <div class="has-validation">
                    <div class="input-group input-group-sm flex-nowrap cantidad" role="group">
                        <asp:Button runat="server" ID="BtnRestar" UseSubmitBehavior="false"
                            aria-label="Quitar una unidad" TabIndex="3"
                            ToolTip="Quitar una unidad" Text="-" CssClass="input-group-text"
                            OnClick="ChangeCantidad" CommandArgument="-1" CausesValidation="true" ValidationGroup="VG" />

                        <asp:TextBox runat="server" ID="Tb_Cantidad" CssClass="form-control text-center"
                            ToolTip="Ingrese la cantidad" aria-label="Ingrese la cantidad" TextMode="Number"
                            inputmode="number" Text="1" placeholder="0" TabIndex="1" min="1" max="9999" step="1"
                            OnTextChanged="ChangeCantidad" CausesValidation="true" ValidationGroup="VG" />

                        <asp:Button runat="server" ID="BtnSumar" UseSubmitBehavior="false"
                            aria-label="Añadir una unidad" ToolTip="Añadir una unidad"
                            Text="+" CssClass="input-group-text" TabIndex="2" CausesValidation="true" ValidationGroup="VG"
                            OnClick="ChangeCantidad" CommandArgument="1" />
                    </div>

                    <asp:RequiredFieldValidator runat="server"
                        ControlToValidate="Tb_Cantidad"
                        ErrorMessage="* Ingrese una cantidad"
                        CssClass="invalid-feedback"
                        Display="Dynamic"
                        SetFocusOnError="true"
                        ValidationGroup="VG" />

                    <asp:RangeValidator runat="server"
                        ControlToValidate="Tb_Cantidad"
                        MinimumValue="1"
                        MaximumValue="9999"
                        Type="Integer"
                        ValidateRequestMode="Disabled"
                        ErrorMessage="* Cantidad invalida"
                        CssClass="invalid-feedback"
                        Display="Dynamic"
                        SetFocusOnError="true"
                        ValidationGroup="VG" />
                </div>
            </ContentTemplate>
        </asp:UpdatePanel>
    </div>
    <style>
        .cantidad {
            --bs-btn-hover-color: #fff;
            --bs-btn-hover-bg: #5c636a;
            --bs-btn-hover-border-color: #565e64;
            --bs-btn-focus-shadow-rgb: 130, 138, 145;
            --bs-btn-focus-box-shadow: 0 0 0 0.25rem rgba(var(--bs-btn-focus-shadow-rgb), .5);
        }

        .cantidad input[type=button]:hover:not(:disabled) {
            color: var(--bs-btn-hover-color);
            background-color: var(--bs-btn-hover-bg);
            border-color: var(--bs-btn-hover-border-color);
        }

        .cantidad input[type=button]:focus-visible {
          color: var(--bs-btn-hover-color);
          background-color: var(--bs-btn-hover-bg);
          border-color: var(--bs-btn-hover-border-color);
          outline: 0;
          box-shadow: var(--bs-btn-focus-box-shadow);
          z-index: 5;
        }

        .cantidad input[type=number]::-webkit-outer-spin-button,
        .cantidad input[type=number]::-webkit-inner-spin-button {
            -webkit-appearance: none;
            margin: 0;
        }

        .cantidad input[type=number] {
            -moz-appearance: textfield;
            background-image: none !important;
        }
    </style>
</asp:Content>
