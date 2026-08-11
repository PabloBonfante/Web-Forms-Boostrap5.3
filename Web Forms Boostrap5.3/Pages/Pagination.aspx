<%@ Page Title="Pagination" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Pagination.aspx.cs" Inherits="Web_Forms_Boostrap5._3.Pages.Pagination" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="my-3 p-3 bg-body rounded shadow-sm">
        <h1 class="border-bottom pb-2 mb-3">Pagination And Sort</h1>
        <asp:UpdatePanel runat="server" class="vstack gap-3">
            <ContentTemplate>
                <div class="table-responsive fixed-header">
                    <asp:GridView
                        runat="server"
                        ID="WeatherForecast"
                        AllowSorting="true"
                        AllowPaging="true"
                        CssClass="table table-hover table-sm align-middle mb-0"
                        AutoGenerateColumns="False"
                        Caption="WeatherForecast"
                        CaptionAlign="Top"
                        DataSourceID="DS_WeatherForecast"
                        GridLines="None">
                        <Columns>
                            <asp:BoundField DataField="Date" HeaderText="Date" SortExpression="Date" DataFormatString="{0:dd/MM/yyyy}" />
                            <asp:BoundField DataField="TemperatureC" HeaderText="Temp. (°C)" SortExpression="TemperatureC" />
                            <asp:BoundField DataField="TemperatureF" HeaderText="Temp. (°F)" SortExpression="TemperatureF" />
                            <asp:BoundField DataField="Summary" HeaderText="Summary" SortExpression="Summary" />
                        </Columns>
                        <PagerSettings Mode="NumericFirstLast" />
                        <PagerStyle CssClass="asp-pagination asp-pagination-sm asp-pagination-origin" />
                        <HeaderStyle CssClass="asp-table-header" />
                        <SortedAscendingHeaderStyle CssClass="sort-asc" />
                        <SortedDescendingHeaderStyle CssClass="sort-desc" />
                    </asp:GridView>
                </div>

                <!-- Page Size -->
                <aside class="asp-pagination-destination d-flex justify-content-end">
                    <asp:DropDownList
                        ID="DDL_Paginator"
                        runat="server"
                        CssClass="form-select form-select-sm w-auto"
                        AutoPostBack="True"
                        OnSelectedIndexChanged="DDL_Paginator_SelectedIndexChanged"
                        ToolTip="Cantidad de registros por paginas">
                        <asp:ListItem Text="10" Value="10"></asp:ListItem>
                        <asp:ListItem Text="25" Value="25"></asp:ListItem>
                        <asp:ListItem Text="50" Value="50"></asp:ListItem>
                        <asp:ListItem Text="100" Value="100"></asp:ListItem>
                        <asp:ListItem Text="Todos" Value="All"></asp:ListItem>
                    </asp:DropDownList>
                </aside>
            </ContentTemplate>
        </asp:UpdatePanel>
        <span>El paginador esta anclado</span>
    </div>

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
