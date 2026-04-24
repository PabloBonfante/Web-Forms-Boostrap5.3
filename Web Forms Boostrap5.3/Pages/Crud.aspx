<%@ Page Title="CRUD" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Crud.aspx.cs" Inherits="Web_Forms_Boostrap5._3.Pages.Crud" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="row g-3">
        <div class="col-12">
            <h1>Weather Forecast</h1>
        </div>

        <div class="col-12 col-sm-6">
            <div class="input-group input-group-sm">
                <asp:TextBox
                    runat="server"
                    ID="Tb_Filter"
                    CssClass="form-control"
                    AutoPostBack="true"
                    ToolTip="Search"
                    placeholder="Search..."
                    aria-label="Search records"
                    aria-describedby="Filter search functionality"
                    TextMode="Search" />

                <asp:Button
                    ID="Btn_Search"
                    runat="server"
                    UseSubmitBehavior="false"
                    CssClass="asp-icon input-group-text"
                    Text="&#xF52A;"
                    ToolTip="Execute search"
                    aria-label="Execute search"
                    OnClick="Btn_Search_Click" />

                <asp:Button
                    ID="Btn_ClearFilter"
                    runat="server"
                    UseSubmitBehavior="false"
                    CssClass="asp-icon input-group-text"
                    Text="&#xF330;"
                    ToolTip="Clear search filter"
                    aria-label="Clear filter"
                    OnClick="Btn_ClearFilter_Click" />
            </div>
        </div>
        <div class="col-12 col-sm-6">
            <div class="d-grid gap-2 d-md-flex justify-content-md-end">
                <button type="button" class="btn btn-primary btn-sm bi bi-plus-lg" onclick="openModal('#exampleModal', '[autofocus]');">
                    Create New Record
                </button>
                <div class="asp-icon btn btn-outline-danger btn-sm bi bi-trash3">
                    <span>Delete Selected</span>
                    <asp:Button
                        ID="Btn_DeleteSelected"
                        runat="server"
                        ToolTip="Permanently remove selected records"
                        aria-label="Delete selected items"
                        CausesValidation="true"
                        ValidationGroup="VG_SelecAny"
                        OnClick="Btn_DeleteSelected_Click"
                        OnClientClick="if(!areYouSure({ event: event, ValidationGroup: 'VG_SelecAny' })) return;" />
                </div>

                <asp:CustomValidator
                    runat="server"
                    ID="CV_SelectAny"
                    ValidateEmptyText="true"
                    OnServerValidate="CV_SelectAny_ServerValidate"
                    ValidationGroup="VG_SelecAny" />
            </div>
        </div>

        <div class="col-12">
            <asp:UpdatePanel runat="server" ID="UP" class="vstack gap-3">
                <ContentTemplate>
                    <div class="table-responsive fixed-header">
                        <asp:GridView
                            runat="server"
                            ID="GV_WeatherForecast"
                            AllowSorting="true"
                            AllowPaging="true"
                            AutoGenerateColumns="False"
                            ShowHeaderWhenEmpty="true"
                            EmptyDataText="No weather records"
                            CssClass="table table-hover table-sm mb-0"
                            RowStyle-VerticalAlign="Middle"
                            DataSourceID="DS_WeatherForecast"
                            DataKeyNames="Id"
                            GridLines="None">
                            <Columns>
                                <asp:TemplateField>
                                    <EditItemTemplate></EditItemTemplate>
                                    <HeaderTemplate>
                                        <asp:CheckBox
                                            runat="server"
                                            ID="Cb_SelectAll"
                                            Checked='<%# IsAllSelected %>'
                                            ToolTip="Select all records for batch operations"
                                            CssClass="asp-form-check"
                                            AutoPostBack="true"
                                            OnCheckedChanged="Cb_SelectAll_CheckedChanged" />
                                    </HeaderTemplate>
                                    <ItemTemplate>
                                        <asp:CheckBox
                                            runat="server"
                                            ID="Cb_Select"
                                            Checked='<%# IsRecordSelected(Eval("Id")) %>'
                                            data-id='<%# Eval("Id") %>'
                                            ToolTip="Select this record for batch operations"
                                            CssClass="asp-form-check"
                                            OnCheckedChanged="Cb_Select_CheckedChanged" />
                                    </ItemTemplate>
                                    <HeaderStyle Width="50" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Date" SortExpression="Date">
                                    <EditItemTemplate>
                                        <div class="has-validation">
                                            <asp:TextBox
                                                ID="Tb_Date"
                                                runat="server"
                                                Text='<%# Bind("Date", "{0:yyyy-MM-dd}") %>'
                                                CssClass="form-control form-control-sm"
                                                placeholder="Date"
                                                ToolTip="Enter forecast date"
                                                TextMode="Date"
                                                autofocus />

                                            <asp:RequiredFieldValidator runat="server"
                                                ControlToValidate="Tb_Date"
                                                ErrorMessage="Forecast date is required"
                                                CssClass="invalid-feedback"
                                                Display="Dynamic"
                                                SetFocusOnError="true"
                                                ValidationGroup="VG" />
                                        </div>
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <%# Eval("Date", "{0:dd/MM/yyyy}") %>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Temperature (°C)" SortExpression="TemperatureC">
                                    <EditItemTemplate>
                                        <div class="has-validation">
                                            <asp:TextBox
                                                ID="Tb_TemperatureC"
                                                runat="server"
                                                Text='<%# Bind("TemperatureC") %>'
                                                CssClass="form-control form-control-sm"
                                                placeholder="Temperature in Celsius"
                                                ToolTip="Enter temperature value in degrees Celsius"
                                                TextMode="Number"></asp:TextBox>

                                            <asp:RequiredFieldValidator runat="server"
                                                ControlToValidate="Tb_TemperatureC"
                                                ErrorMessage="Celsius temperature value is required"
                                                CssClass="invalid-feedback"
                                                Display="Dynamic"
                                                SetFocusOnError="true"
                                                ValidationGroup="VG" />
                                        </div>
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <%# Eval("TemperatureC", "{0} °C") %>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Temperature (°F)" SortExpression="TemperatureF">
                                    <EditItemTemplate>
                                        <asp:TextBox
                                            ID="Tb_TemperatureF"
                                            runat="server"
                                            Text='<%# Bind("TemperatureF") %>'
                                            CssClass="form-control form-control-sm"
                                            placeholder="Temperature in Fahrenheit"
                                            ToolTip="Temperature value in Fahrenheit (auto-calculated)"
                                            TextMode="Number"
                                            Enabled="false"></asp:TextBox>
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <%# Eval("TemperatureF", "{0} °F") %> 
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Weather Summary" SortExpression="Summary">
                                    <EditItemTemplate>
                                        <div class="has-validation">
                                            <asp:TextBox
                                                ID="Tb_Summary"
                                                runat="server"
                                                Text='<%# Bind("Summary") %>'
                                                CssClass="form-control form-control-sm"
                                                placeholder="Weather conditions description"
                                                ToolTip="Describe weather conditions (Sunny, Rainy, Cloudy, etc.)"></asp:TextBox>

                                            <asp:RequiredFieldValidator runat="server"
                                                ControlToValidate="Tb_Summary"
                                                ErrorMessage="Weather summary description is required"
                                                CssClass="invalid-feedback"
                                                Display="Dynamic"
                                                SetFocusOnError="true"
                                                ValidationGroup="VG" />
                                        </div>
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <%# Eval("Summary") %>
                                    </ItemTemplate>
                                </asp:TemplateField>

                                <asp:TemplateField HeaderText="Actions">
                                    <EditItemTemplate>
                                        <div class="d-flex gap-2">
                                            <asp:ImageButton ID="Btn_Update" runat="server"
                                                AlternateText="&#xF270;"
                                                CssClass="asp-icon btn btn-primary btn-sm rounded-circle p-2 lh-1"
                                                CommandName="Update"
                                                CausesValidation="true"
                                                ValidationGroup="VG"
                                                ToolTip="Save record changes" />

                                            <asp:Button ID="Btn_Cancel" runat="server"
                                                UseSubmitBehavior="false"
                                                Text="&#xF659;"
                                                CssClass="asp-icon btn btn-secondary btn-sm rounded-circle p-2 lh-1"
                                                CommandName="Cancel"
                                                ToolTip="Discard changes and exit edit mode" />
                                        </div>
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <div class="d-flex gap-2">
                                            <asp:ImageButton ID="Btn_Edit" runat="server"
                                                UseSubmitBehavior="false"
                                                AlternateText="&#xF4CB;"
                                                CssClass="asp-icon btn btn-primary btn-sm rounded-circle p-2 lh-1"
                                                CommandName="Edit"
                                                ToolTip="Edit this weather record" />

                                            <asp:Button ID="Btn_Cancel" runat="server"
                                                UseSubmitBehavior="false"
                                                Text="&#xF78B;"
                                                CssClass="asp-icon btn btn-danger btn-sm rounded-circle p-2 lh-1"
                                                CommandName="Delete"
                                                ToolTip="Permanently delete this record"
                                                OnClientClick="if(!areYouSure({ event: event })) return;" />
                                        </div>
                                    </ItemTemplate>
                                    <HeaderStyle CssClass="fixed-column" />
                                    <ItemStyle CssClass="fixed-column" />
                                </asp:TemplateField>
                            </Columns>
                            <PagerSettings Mode="NumericFirstLast" />
                            <PagerStyle CssClass="asp-pagination asp-pagination-sm asp-pagination-origin" />
                            <HeaderStyle CssClass="asp-table-header" Height="41" />
                            <SortedAscendingHeaderStyle CssClass="sort-asc" />
                            <SortedDescendingHeaderStyle CssClass="sort-desc" />
                            <EditRowStyle CssClass="asp-table-edit" />
                        </asp:GridView>
                    </div>

                    <!-- Records Per Page Selector -->
                    <aside class="asp-pagination-destination d-flex justify-content-end">
                        <asp:DropDownList
                            ID="DDL_Paginator"
                            runat="server"
                            CssClass="form-select form-select-sm w-auto"
                            AutoPostBack="True"
                            OnSelectedIndexChanged="DDL_Paginator_SelectedIndexChanged"
                            ToolTip="Select number of records to display per page">
                            <asp:ListItem Text="10" Value="10"></asp:ListItem>
                            <asp:ListItem Text="25" Value="25"></asp:ListItem>
                            <asp:ListItem Text="50" Value="50"></asp:ListItem>
                            <asp:ListItem Text="100" Value="100"></asp:ListItem>
                            <asp:ListItem Text="All" Value="All"></asp:ListItem>
                        </asp:DropDownList>
                    </aside>
                </ContentTemplate>
            </asp:UpdatePanel>
        </div>
    </div>

    <asp:ObjectDataSource
        runat="server"
        ID="DS_WeatherForecast"
        TypeName="Web_Forms_Boostrap5._3.Src.WeatherForecast.WeatherForecastService"
        DataObjectTypeName="Web_Forms_Boostrap5._3.Src.WeatherForecast.WeatherForecastRequest"
        ConflictDetection="CompareAllValues"
        ParsingCulture="Invariant"
        SelectMethod="GetWeatherForecast"
        DeleteMethod="DeleteWeatherForecast"
        UpdateMethod="UpdateWeatherForecast"
        InsertMethod="InsertWeatherForecast"
        FilterExpression="CONVERT(Date, 'System.String') LIKE '%{0}%' OR CONVERT(TemperatureC, 'System.String') LIKE '%{0}%' OR CONVERT(TemperatureF, 'System.String') LIKE '%{0}%' OR CONVERT(Summary, 'System.String') LIKE '%{0}%'"
        OldValuesParameterFormatString="original_{0}"
        OnDeleted="DS_WeatherForecast_Deleted"
        OnInserted="DS_WeatherForecast_Inserted"
        OnUpdated="DS_WeatherForecast_Updated">
        <FilterParameters>
            <asp:ControlParameter Name="Filter" ControlID="Tb_Filter" PropertyName="Text" Type="String" ConvertEmptyStringToNull="false" />
        </FilterParameters>
    </asp:ObjectDataSource>


    <!-- Create New Record Modal Dialog -->
    <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true" data-bs-backdrop="static" data-bs-keyboard="false">
        <div class="modal-dialog">
            <div class="modal-content">
                <asp:FormView
                    runat="server"
                    ID="formNew"
                    RenderOuterTable="false"
                    DefaultMode="Insert"
                    DataSourceID="DS_WeatherForecast"
                    DataKeyNames="Id">
                    <InsertItemTemplate>
                        <div class="modal-header">
                            <h1 class="modal-title fs-5" id="exampleModalLabel">Create New Weather Record</h1>
                            <asp:Button
                                ID="Btn_CloseHeader"
                                runat="server"
                                UseSubmitBehavior="false"
                                CssClass="btn-close"
                                ToolTip="Close form without saving"
                                CommandName="Cancel"
                                data-bs-dismiss="modal"
                                aria-label="Close modal" />
                        </div>
                        <div class="modal-body">
                            <div class="row g-3">
                                <div class="col-12">
                                    <div class="form-floating has-validation">

                                        <asp:TextBox
                                            ID="Tb_Date"
                                            runat="server"
                                            Text='<%# Bind("Date", "{0:yyyy-MM-dd}") %>'
                                            CssClass="form-control form-control-sm"
                                            placeholder="Forecast Date"
                                            ToolTip="Select the date for this weather forecast (YYYY-MM-DD)"
                                            TextMode="Date"
                                            autofocus />

                                        <asp:Label
                                            runat="server"
                                            AssociatedControlID="Tb_Date"
                                            Text="Forecast Date" />

                                        <asp:RequiredFieldValidator runat="server"
                                            ControlToValidate="Tb_Date"
                                            ErrorMessage="Please select a valid forecast date"
                                            CssClass="invalid-feedback"
                                            Display="Dynamic"
                                            SetFocusOnError="true"
                                            ValidationGroup="VG_New" />
                                    </div>
                                </div>

                                <div class="col-12">
                                    <div class="form-floating has-validation">
                                        <asp:TextBox
                                            ID="Tb_TemperatureC"
                                            runat="server"
                                            Text='<%# Bind("TemperatureC") %>'
                                            CssClass="form-control form-control-sm"
                                            placeholder="Temperature (°C)"
                                            ToolTip="Enter temperature value in degrees Celsius (numeric value only)"
                                            TextMode="Number" />

                                        <asp:Label
                                            runat="server"
                                            AssociatedControlID="Tb_TemperatureC"
                                            Text="Temperature (°C)" />

                                        <asp:RequiredFieldValidator runat="server"
                                            ControlToValidate="Tb_TemperatureC"
                                            ErrorMessage="Please enter a valid Celsius temperature value"
                                            CssClass="invalid-feedback"
                                            Display="Dynamic"
                                            SetFocusOnError="true"
                                            ValidationGroup="VG_New" />
                                    </div>
                                </div>

                                <div class="col-12">
                                    <div class="form-floating has-validation">
                                        <asp:TextBox
                                            ID="Tb_Summary"
                                            runat="server"
                                            Text='<%# Bind("Summary") %>'
                                            CssClass="form-control form-control-sm"
                                            placeholder="Weather Summary"
                                            ToolTip="Describe weather conditions (Sunny, Partly Cloudy, Rain, etc.)" />

                                        <asp:Label
                                            runat="server"
                                            AssociatedControlID="Tb_Summary"
                                            Text="Weather Summary" />

                                        <asp:RequiredFieldValidator runat="server"
                                            ControlToValidate="Tb_Summary"
                                            ErrorMessage="Please provide a weather summary description"
                                            CssClass="invalid-feedback"
                                            Display="Dynamic"
                                            SetFocusOnError="true"
                                            ValidationGroup="VG_New" />
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="modal-footer">
                            <div class="asp-icon btn btn-primary bi bi-check-lg">
                                <span>Save Record</span>
                                <asp:Button
                                    ID="Btn_Save"
                                    runat="server"
                                    ToolTip="Save this new weather record to database"
                                    aria-label="Save new record"
                                    CausesValidation="true"
                                    ValidationGroup="VG_New"
                                    CommandName="Insert" />
                            </div>
                            <div class="asp-icon btn btn-secondary bi bi-x-lg">
                                <span>Cancel</span>
                                <asp:Button
                                    ID="Btn_Close"
                                    runat="server"
                                    UseSubmitBehavior="false"
                                    ToolTip="Close form without saving changes"
                                    aria-label="Cancel and close"
                                    CommandName="Cancel"
                                    data-bs-dismiss="modal" />
                            </div>
                        </div>
                    </InsertItemTemplate>
                </asp:FormView>
            </div>
        </div>
    </div>
</asp:Content>
