<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="CalendarExample.aspx.cs" Inherits="Web_Forms_Boostrap5._3.Pages.CalendarExample" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="d-flex justify-content-center p-3 p-md-4">
        <div class="card shadow-sm calendar-card" style="max-width: 420px; width: 100%;">
            <div class="card-body vstack gap-3">

                <h2 class="card-title text-center text-primary-emphasis fs-4 mb-0">
                    <i class="bi bi-calendar3 me-2"></i>Calendario Interactivo
                </h2>

                <!-- Calendario de ASP.NET -->
                <div class="table-responsive rounded overflow-hidden border">
                    <asp:Calendar ID="Calendar1" runat="server"
                        OnSelectionChanged="Calendar1_SelectionChanged"
                        OnDayRender="Calendar1_DayRender"
                        CssClass="table table-sm text-center align-middle m-0 calendar-table"
                        DayNameFormat="Shortest"
                        NextPrevFormat="FullMonth">
                        <DayHeaderStyle CssClass="bg-secondary-subtle text-secondary-emphasis fw-semibold small" />
                        <NextPrevStyle CssClass="text-primary-emphasis fw-semibold small text-decoration-none" />
                        <OtherMonthDayStyle CssClass="text-body-tertiary" />
                        <SelectedDayStyle CssClass="bg-primary text-white fw-bold rounded-circle" />
                        <SelectorStyle CssClass="bg-info-subtle text-info-emphasis" />
                        <TitleStyle CssClass="bg-primary-subtle text-primary-emphasis fw-bold py-2" />
                        <TodayDayStyle CssClass="bg-warning-subtle text-warning-emphasis fw-bold rounded-circle" />
                        <WeekendDayStyle CssClass="bg-body-secondary" />
                    </asp:Calendar>
                </div>

                <!-- Panel para mostrar información -->
                <asp:Panel ID="pnlInfo" runat="server" CssClass="alert alert-info mb-0 text-center selected-date" Visible="false">
                    <asp:Label ID="lblSelectedDate" runat="server" CssClass="d-block fw-semibold" Text=""></asp:Label>
                    <asp:Label ID="lblDayOfWeek" runat="server" CssClass="d-block small" Text=""></asp:Label>
                </asp:Panel>

                <!-- Controles de navegación -->
                <div class="d-flex gap-2">
                    <asp:Button ID="btnToday" runat="server" Text="Hoy"
                        OnClick="btnToday_Click" CssClass="btn btn-sm btn-outline-secondary w-100" />
                    <asp:Button ID="btnPrevMonth" runat="server" Text="◀ Anterior"
                        OnClick="btnPrevMonth_Click" CssClass="btn btn-sm btn-outline-secondary w-100" />
                    <asp:Button ID="btnNextMonth" runat="server" Text="Siguiente ▶"
                        OnClick="btnNextMonth_Click" CssClass="btn btn-sm btn-outline-secondary w-100" />
                </div>

                <!-- Selección rápida de mes/año -->
                <div class="row g-2 align-items-center">
                    <div class="col-12">
                        <asp:Label ID="lblSelectMonth" runat="server" Text="Ir a:" CssClass="form-label small mb-1" AssociatedControlID="ddlMonths"></asp:Label>
                    </div>
                    <div class="col-7">
                        <asp:DropDownList ID="ddlMonths" runat="server" AutoPostBack="true"
                            OnSelectedIndexChanged="ddlMonths_SelectedIndexChanged" CssClass="form-select form-select-sm">
                        </asp:DropDownList>
                    </div>
                    <div class="col-5">
                        <asp:DropDownList ID="ddlYears" runat="server" AutoPostBack="true"
                            OnSelectedIndexChanged="ddlYears_SelectedIndexChanged" CssClass="form-select form-select-sm">
                        </asp:DropDownList>
                    </div>
                </div>

            </div>
        </div>
    </div>

    <style>
        /* Usamos las variables de Bootstrap 5.3 en lugar de colores fijos,
           así todo cambia automáticamente con data-bs-theme="dark" */
        .calendar-card {
            border-color: var(--bs-border-color);
            background-color: var(--bs-body-bg);
            color: var(--bs-body-color);
        }

        .calendar-table {
            --bs-table-bg: transparent;
        }

        .calendar-table td,
        .calendar-table th {
            border-color: var(--bs-border-color-translucent);
        }

        /* Celda "hoy" y "seleccionado": círculo centrado */
        .calendar-table .rounded-circle {
            display: inline-flex;
            align-items: center;
            justify-content: center;
            width: 1.9rem;
            height: 1.9rem;
            margin: 0 auto;
        }

        .selected-date {
            border: 1px solid var(--bs-info-border-subtle);
        }
    </style>
</asp:Content>