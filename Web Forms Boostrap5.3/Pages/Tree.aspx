<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Tree.aspx.cs" Inherits="Web_Forms_Boostrap5._3.Pages.Tree" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <asp:TreeView ID="TreeView1" runat="server" ShowLines="true" ExpandDepth="3" CssClass="tree-view asp-form-check" ShowCheckBoxes="All">
        <Nodes>
            <asp:TreeNode Text="CADENA ALIMENTICIA - ECOSISTEMA TERRESTRE" Expanded="True">
                <asp:TreeNode Text="NIVEL 1: PRODUCTORES" Expanded="True">
                    <asp:TreeNode Text="Pasto" />
                    <asp:TreeNode Text="Hojas de arboles" />
                    <asp:TreeNode Text="Flores silvestres" />
                    <asp:TreeNode Text="Frutos y semillas" />
                </asp:TreeNode>
                <asp:TreeNode Text="NIVEL 2: CONSUMIDORES PRIMARIOS">
                    <asp:TreeNode Text="Saltamontes" />
                    <asp:TreeNode Text="Conejo" />
                    <asp:TreeNode Text="Vaca" />
                    <asp:TreeNode Text="Raton" />
                </asp:TreeNode>
                <asp:TreeNode Text="NIVEL 3: CONSUMIDORES SECUNDARIOS" Expanded="True">
                    <asp:TreeNode Text="Rana" />
                    <asp:TreeNode Text="Lagartija" />
                    <asp:TreeNode Text="Arana" />
                    <asp:TreeNode Text="Comadreja" />
                </asp:TreeNode>
                <asp:TreeNode Text="NIVEL 4: CONSUMIDORES TERCIARIOS" Expanded="True">
                    <asp:TreeNode Text="Serpiente" />
                    <asp:TreeNode Text="Zorro" />
                    <asp:TreeNode Text="Buho" />
                    <asp:TreeNode Text="Halcón" />
                </asp:TreeNode>
                <asp:TreeNode Text="NIVEL 5: SUPERDEPREDADORES" Expanded="True">
                    <asp:TreeNode Text="Leon" />
                    <asp:TreeNode Text="Tigre" />
                    <asp:TreeNode Text="Lobo" />
                </asp:TreeNode>
                <asp:TreeNode Text="NIVEL 6: DESCOMPONEDORES" Expanded="True">
                    <asp:TreeNode Text="Hongos" />
                    <asp:TreeNode Text="Bacterias" />
                    <asp:TreeNode Text="Lombrices" />
                    <asp:TreeNode Text="NIVEL 6: DESCOMPONEDORES" Expanded="True">
                        <asp:TreeNode Text="Hongos" />
                        <asp:TreeNode Text="Bacterias" />
                        <asp:TreeNode Text="Lombrices" />
                    </asp:TreeNode>
                </asp:TreeNode>
            </asp:TreeNode>
        </Nodes>
    </asp:TreeView>
</asp:Content>
