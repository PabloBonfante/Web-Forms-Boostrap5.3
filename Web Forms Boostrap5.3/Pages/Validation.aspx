<%@ Page Title="ASP Validator" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Validation.aspx.cs" Inherits="Web_Forms_Boostrap5._3.Pages.Validation" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <h1>ASP Validator</h1>

    <div class="row g-3">
        <div class="col-md-4">
            <div class="has-validation">
                <asp:Label runat="server" Text="First name" CssClass="form-label" AssociatedControlID="txtFirstName" />
                <asp:TextBox ID="txtFirstName" runat="server" CssClass="form-control" Text="Mark" />
                <asp:RequiredFieldValidator runat="server"
                    ControlToValidate="txtFirstName"
                    ErrorMessage="First name is required"
                    CssClass="invalid-feedback"
                    Display="Dynamic"
                    SetFocusOnError="true"
                    ValidationGroup="VG" />
            </div>
        </div>

        <div class="col-md-4">
            <div class="has-validation">
                <asp:Label runat="server" Text="Last name" CssClass="form-label" AssociatedControlID="txtLastName" />
                <asp:TextBox ID="txtLastName" runat="server" CssClass="form-control form-control-sm" Text="Otto" />
                <asp:RequiredFieldValidator runat="server"
                    ControlToValidate="txtLastName"
                    ErrorMessage="Last name is required"
                    CssClass="invalid-feedback"
                    Display="Dynamic"
                    SetFocusOnError="true"
                    ValidationGroup="VG" />
            </div>
        </div>

        <div class="col-md-4">
            <asp:Label runat="server" Text="Username" CssClass="form-label" AssociatedControlID="txtUsername" />
            <div class="input-group has-validation">
                <asp:Label runat="server" Text="@" CssClass="input-group-text" AssociatedControlID="txtUsername" />
                <asp:TextBox ID="txtUsername" runat="server" CssClass="form-control" />
                <asp:RequiredFieldValidator runat="server"
                    ControlToValidate="txtUsername"
                    ErrorMessage="Please choose a username."
                    CssClass="invalid-feedback"
                    Display="Dynamic"
                    SetFocusOnError="true"
                    ValidationGroup="VG"></asp:RequiredFieldValidator>
            </div>
        </div>

        <div class="col-md-6">
            <div class="has-validation">
                <asp:Label runat="server" Text="City" CssClass="form-label" AssociatedControlID="txtCity" />
                <asp:TextBox ID="txtCity" runat="server" CssClass="form-control" />
                <asp:RequiredFieldValidator runat="server"
                    ControlToValidate="txtCity"
                    ErrorMessage="Please provide a valid city."
                    CssClass="invalid-feedback"
                    Display="Dynamic"
                    SetFocusOnError="true"
                    ValidationGroup="VG" />
            </div>
        </div>

        <div class="col-md-3">
            <div class="has-validation">
                <asp:Label runat="server" Text="State" CssClass="form-label" AssociatedControlID="ddlState" />
                <asp:DropDownList ID="ddlState" runat="server" CssClass="form-select">
                    <asp:ListItem Selected="True" Disabled="True" Value="" hidden>Choose...</asp:ListItem>
                    <asp:ListItem Value="CA">California</asp:ListItem>
                    <asp:ListItem Value="NY">New York</asp:ListItem>
                    <asp:ListItem Value="TX">Texas</asp:ListItem>
                </asp:DropDownList>
                <asp:RequiredFieldValidator runat="server"
                    ControlToValidate="ddlState"
                    ErrorMessage="Please select a valid state."
                    CssClass="invalid-feedback"
                    Display="Dynamic"
                    SetFocusOnError="true"
                    InitialValue=""
                    ValidationGroup="VG" />
            </div>
        </div>

        <div class="col-md-3">
            <div class="has-validation">
                <asp:Label runat="server" Text="Zip" CssClass="form-label" AssociatedControlID="txtZip" />
                <asp:TextBox ID="txtZip" runat="server" CssClass="form-control" TextMode="MultiLine" />
                <asp:RequiredFieldValidator runat="server"
                    ControlToValidate="txtZip"
                    ErrorMessage="Please provide a valid zip."
                    CssClass="invalid-feedback"
                    Display="Dynamic"
                    SetFocusOnError="true"
                    ValidationGroup="VG" />
            </div>
        </div>

        <div class="col-12">
            <div class="has-validation">
                <asp:CheckBox runat="server" ID="chkTerms" CssClass="asp-form-check" Text="Agree to terms and conditions" />
                <asp:CustomValidator runat="server"
                    ErrorMessage="You must agree before submitting."
                    CssClass="invalid-feedback"
                    Display="Dynamic"
                    EnableClientScript="true"
                    ClientValidationFunction="isChecked" 
                    ValidationGroup="VG"/>
            </div>
        </div>

        <div class="col-12">
            <asp:ValidationSummary ID="vsSummary" runat="server" CssClass="alert alert-danger" DisplayMode="BulletList" ShowSummary="true" ValidationGroup="VG" />
        </div>

        <div class="col-12">
            <asp:Button ID="btnSubmit" runat="server" Text="Submit form" CssClass="btn btn-primary" OnClick="btnSubmit_Click" CausesValidation="true" ValidationGroup="VG" />
        </div>
    </div>

    <style>
        [data-valsummary] ul {
            margin: 0;
        }
    </style>

    <script type="text/javascript">
    function isChecked(sender, args) {
        const isChecked = $('#<%= chkTerms.ClientID %>').is(':checked');
        args.IsValid = isChecked;
    }
    </script>
</asp:Content>
