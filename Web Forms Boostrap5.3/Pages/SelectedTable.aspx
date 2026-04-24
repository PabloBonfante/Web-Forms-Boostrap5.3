<%@ Page Title="Selected Table" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="SelectedTable.aspx.cs" Inherits="Web_Forms_Boostrap5._3.Pages.SelectedTable" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <h1>Selected GridView</h1>

    <asp:UpdatePanel runat="server" class="table-responsive">
        <ContentTemplate>
            <asp:GridView
                runat="server"
                ID="WeatherForecast"
                AllowSorting="True"
                AllowPaging="True"
                EnablePersistedSelection="True"
                AutoGenerateColumns="False"
                CssClass="table table-hover"
                Caption="WeatherForecast"
                CaptionAlign="Top"
                DataSourceID="DS_WeatherForecast"
                DataKeyNames="Id"
                GridLines="None"
                OnSelectedIndexChanged="WeatherForecast_SelectedIndexChanged">
                <Columns>
                    <asp:CommandField ShowSelectButton="True" ControlStyle-CssClass="asp-select" SelectText="" ButtonType="Button" />
                    <asp:BoundField DataField="Date" HeaderText="Date" SortExpression="Date" DataFormatString="{0:dd/MM/yyyy}" />
                    <asp:BoundField DataField="TemperatureC" HeaderText="Temp. (°C)" SortExpression="TemperatureC" />
                    <asp:BoundField DataField="TemperatureF" HeaderText="Temp. (°F)" SortExpression="TemperatureF" />
                    <asp:BoundField DataField="Summary" HeaderText="Summary" SortExpression="Summary" />
                </Columns>
                <PagerSettings Mode="NumericFirstLast" />
                <PagerStyle CssClass="asp-pagination" />
                <HeaderStyle CssClass="asp-table-header" />
                <SortedAscendingHeaderStyle CssClass="sort-asc" />
                <SortedDescendingHeaderStyle CssClass="sort-desc" />
                <SelectedRowStyle CssClass="asp-select-checked asp-table-edit" />
            </asp:GridView>

            <!-- Selected Row -->
            <div>
                <asp:Literal runat="server" id="Literal"></asp:Literal>
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>

    <!-- DataSource -->
    <asp:ObjectDataSource
        runat="server"
        ID="DS_WeatherForecast"
        TypeName="Web_Forms_Boostrap5._3.Src.WeatherForecast.WeatherForecastService"
        SelectMethod="GetWeatherForecast"></asp:ObjectDataSource>
</asp:Content>
