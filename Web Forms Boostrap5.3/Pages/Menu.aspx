<%@ Page Title="ASP Menu" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Menu.aspx.cs" Inherits="Web_Forms_Boostrap5._3.Pages.Menu" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <asp:Menu
        runat="server"
        ID="menuVideojuegos"
        CssClass="asp-menu"
        Orientation="Horizontal"
        DynamicEnableDefaultPopOutImage="false"
        StaticEnableDefaultPopOutImage="false" 
        IncludeStyleBlock="False">
        <Items>
            <asp:MenuItem Text="Accion" Value="Accion" Selectable="false">
                <asp:MenuItem Text="Call of Duty: Modern Warfare III" Value="COD"></asp:MenuItem>
                <asp:MenuItem Text="Doom Eternal" Value="DOOM"></asp:MenuItem>
                <asp:MenuItem Text="Halo Infinite" Value="HALO"></asp:MenuItem>
                <asp:MenuItem Text="Battlefield 2042" Value="BATTLEFIELD"></asp:MenuItem>
            </asp:MenuItem>

            <asp:MenuItem Text="Aventura" Value="Aventura" Selectable="false">
                <asp:MenuItem Text="The Legend of Zelda" Value="ZELDA"></asp:MenuItem>
                <asp:MenuItem Text="God of War Ragnarok" Value="GOW"></asp:MenuItem>
                <asp:MenuItem Text="Hogwarts Legacy" Value="HOGWARTS"></asp:MenuItem>
                <asp:MenuItem Text="Assassin's Creed Mirage" Value="ASSASSIN"></asp:MenuItem>
            </asp:MenuItem>

            <asp:MenuItem Text="RPG" Value="RPG" Selectable="false">
                <asp:MenuItem Text="Elden Ring" Value="ELDEN"></asp:MenuItem>
                <asp:MenuItem Text="The Witcher 3" Value="WITCHER"></asp:MenuItem>
                <asp:MenuItem Text="Final Fantasy XVI" Value="FF16"></asp:MenuItem>
                <asp:MenuItem Text="Cyberpunk 2077" Value="CYBERPUNK"></asp:MenuItem>
            </asp:MenuItem>

            <asp:MenuItem Text="Deportes" Value="Deportes" Selectable="false">
                <asp:MenuItem Text="EA Sports FC 24" Value="FC24"></asp:MenuItem>
                <asp:MenuItem Text="NBA 2K24" Value="NBA"></asp:MenuItem>
                <asp:MenuItem Text="Madden NFL 24" Value="MADDEN"></asp:MenuItem>
                <asp:MenuItem Text="F1 23" Value="F1" Enabled="false"></asp:MenuItem>
            </asp:MenuItem>

            <asp:MenuItem Text="Estrategia" Value="Estrategia" Selectable="false">
                <asp:MenuItem Text="Age of Empires IV" Value="AOE" Selectable="false"></asp:MenuItem>
                <asp:MenuItem Text="Civilization VI" Value="CIV" Selected="true"></asp:MenuItem>
                <asp:MenuItem Text="StarCraft II" Value="STARCRAFT"></asp:MenuItem>
                <asp:MenuItem Text="Total War: Pharaoh" Value="TOTALWAR"></asp:MenuItem>
                <asp:MenuItem Text="Menu lv3" Value="menulv3" Selectable="false">
                    <asp:MenuItem Text="Total War: Pharaoh" Value="TOTALWAR"></asp:MenuItem>
                    <asp:MenuItem Text="Total War: 123" Value="4"></asp:MenuItem>
                    <asp:MenuItem Text="Total War: 4444" Value="44"></asp:MenuItem>
                </asp:MenuItem>
            </asp:MenuItem>
            <asp:MenuItem Text="Total War: 111" Value="11"></asp:MenuItem>
        </Items>
    </asp:Menu>
</asp:Content>
