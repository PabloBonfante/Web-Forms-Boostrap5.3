<%@ Page Title="Selected Table" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="SelectedTable.aspx.cs" Inherits="Web_Forms_Boostrap5._3.Pages.SelectedTable" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <h1>Selected GridView</h1>

    <div class="position-relative">
        <asp:UpdatePanel runat="server" ID="UP" class="vstack gap-3">
            <ContentTemplate>
                <div class="table-responsive">
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
                        <SelectedRowStyle CssClass="asp-select-checked table-active" />
                    </asp:GridView>
                </div>

                <!-- Selected Row -->
                <div>
                    <asp:Literal runat="server" ID="Literal"></asp:Literal>
                </div>
            </ContentTemplate>
        </asp:UpdatePanel>

        <asp:UpdateProgress runat="server" AssociatedUpdatePanelID="UP">
            <ProgressTemplate>
                <div class="position-absolute top-0 start-0 w-100 h-100 bg-body bg-opacity-50 d-flex align-items-center justify-content-center"
                    style="z-index: 1000; backdrop-filter: blur(2px);"
                    aria-live="polite"
                    aria-label="Cargando contenido"
                    role="status">

                    <div class="bg-body p-4 rounded-3 border text-center"
                        role="alertdialog"
                        aria-labelledby="progress-title"
                        aria-describedby="progress-description">

                        <div class="spinner-border mb-3"
                            role="progressbar"
                            aria-valuenow="0"
                            aria-valuemin="0"
                            aria-valuemax="100"
                            aria-label="Progreso de carga">
                            <span class="visually-hidden">Cargando, por favor espere...</span>
                        </div>

                        <strong id="progress-title" class="d-block">Procesando información...</strong>
                        <small id="progress-description" class="text-muted">Por favor espere</small>
                    </div>
                </div>
            </ProgressTemplate>
        </asp:UpdateProgress>
    </div>

    <!-- DataSource -->
    <asp:ObjectDataSource
        runat="server"
        ID="DS_WeatherForecast"
        TypeName="Web_Forms_Boostrap5._3.Src.WeatherForecast.WeatherForecastService"
        SelectMethod="GetWeatherForecast">
        <SelectParameters>
            <asp:Parameter Name="SimulateDelay" Type="Boolean" DefaultValue="false" />
        </SelectParameters>
    </asp:ObjectDataSource>
</asp:Content>
