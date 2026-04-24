<%@ Page Title="Modal" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Modals.aspx.cs" Inherits="Web_Forms_Boostrap5._3.Pages.Modals" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <h1>Open Modal From C#</h1>

    <!-- Button trigger modal -->
    <asp:Button runat="server" ID="btnOpenModal" UseSubmitBehavior="false" CssClass="btn btn-primary" Text="Launch demo modal" OnClick="btnOpenModal_Click" />

    <!-- Modal -->
    <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h1 class="modal-title fs-5" id="exampleModalLabel">Modal title</h1>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <asp:TextBox runat="server" ID="Name" CssClass="form-control" placeholder="Name"></asp:TextBox>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-primary">Save changes</button>
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
