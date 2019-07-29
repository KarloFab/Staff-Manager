<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="AddPerson.aspx.cs" Inherits="PeopleWebApplication.AddPerson" Culture="auto" meta:resourcekey="PageResource1" UICulture="auto" %>

<%@ MasterType VirtualPath="~/Main.Master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="row ">
        <div class="col-lg-4 col-md-4 col-sm-4">
            <asp:Label ID="lblName" runat="server" Text="Ime:" Font-Bold="True" meta:resourcekey="lblNameResource1"></asp:Label>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Ime je obavezno polje" ControlToValidate="txtName"
                ForeColor="Red" Text="*" ValidationGroup="ValGroup" meta:resourcekey="RequiredFieldValidator1Resource1"></asp:RequiredFieldValidator>
            <br />
            <div style="margin-bottom: 10px;">
                <asp:TextBox ID="txtName" runat="server" CssClass="form-control" meta:resourcekey="txtNameResource1"></asp:TextBox>

            </div>

            <asp:Label ID="lblSurname" runat="server" Text="Prezime:" Font-Bold="True" meta:resourcekey="lblSurnameResource1"></asp:Label>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Prezime je obavezno polje" ControlToValidate="txtSurname"
                ForeColor="Red" Text="*" ValidationGroup="ValGroup" meta:resourcekey="RequiredFieldValidator2Resource1"></asp:RequiredFieldValidator>
            <br />
            <div style="margin-bottom: 10px;">
                <asp:TextBox ID="txtSurname" runat="server" CssClass="form-control" meta:resourcekey="txtSurnameResource1"></asp:TextBox>

            </div>
            <asp:Label ID="lblEmail" runat="server" Text="Email:" Font-Bold="True" meta:resourcekey="lblEmailResource1"></asp:Label>
            <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server"
                ControlToValidate="txtEmail" Display="Dynamic"
                ErrorMessage="Krivo upisana e-mail adresa" Font-Bold="True" ForeColor="Red"
                ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"
                ValidationGroup="ValGroup" meta:resourcekey="RegularExpressionValidator1Resource1">*</asp:RegularExpressionValidator>
            <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server"
                ControlToValidate="txtEmail1" Display="Dynamic"
                ErrorMessage="Krivo upisana e-mail adresa" Font-Bold="True" ForeColor="Red"
                ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"
                ValidationGroup="ValGroup" meta:resourcekey="RegularExpressionValidator2Resource1">*</asp:RegularExpressionValidator>
            <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server"
                ControlToValidate="txtEmail2" Display="Dynamic"
                ErrorMessage="Krivo upisana e-mail adresa" Font-Bold="True" ForeColor="Red"
                ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"
                ValidationGroup="ValGroup" meta:resourcekey="RegularExpressionValidator3Resource1">*</asp:RegularExpressionValidator>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Email je obavezno polje" ControlToValidate="txtEmail"
                ForeColor="Red" Text="*" ValidationGroup="ValGroup" meta:resourcekey="RequiredFieldValidator3Resource1"></asp:RequiredFieldValidator>
            <br />
            <asp:PlaceHolder ID="emailPh" runat="server">

                <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control" meta:resourcekey="txtEmailResource1"></asp:TextBox>
                <asp:TextBox ID="txtEmail1" runat="server" CssClass="form-control" Style="margin-top: 10px;" Visible="false" meta:resourcekey="txtEmail1Resource1"></asp:TextBox>
                <asp:TextBox ID="txtEmail2" runat="server" CssClass="form-control" Style="margin-top: 10px;" Visible="false" meta:resourcekey="txtEmail2Resource1"></asp:TextBox>

            </asp:PlaceHolder>
            <asp:LinkButton ID="lbAddMoreEmails" runat="server" OnClick="lbAddMoreEmails_Click" meta:resourcekey="lbAddMoreEmailsResource1">Dodaj još email adresa...</asp:LinkButton>
            <br />
            <br />

        </div>
        <div class="col-lg-4 col-md-4 col-sm-4">
            <asp:Label ID="lblTelephone" runat="server" Text="Telefon:" Font-Bold="True" meta:resourcekey="lblTelephoneResource1"></asp:Label>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ErrorMessage="Telefon je obavezno polje" ControlToValidate="txtTelephone"
                ForeColor="Red" Text="*" ValidationGroup="ValGroup" meta:resourcekey="RequiredFieldValidator6Resource1"></asp:RequiredFieldValidator>
            <div class="" style="margin-bottom: 10px;">
                <asp:TextBox ID="txtTelephone" runat="server" CssClass="form-control" meta:resourcekey="txtTelephoneResource1"></asp:TextBox>

            </div>
            <asp:Label ID="lblCity" runat="server" Text="Grad:" Font-Bold="True" meta:resourcekey="lblCityResource1"></asp:Label>
            <br />

            <asp:DropDownList ID="ddlCity" runat="server" CssClass="form-control" Style="margin-bottom: 10px;" meta:resourcekey="ddlCityResource1">
                <asp:ListItem Text="Zagreb" Value="zg" meta:resourcekey="ListItemResource1"></asp:ListItem>
                <asp:ListItem Text="Rijeka" Value="ri" meta:resourcekey="ListItemResource2"></asp:ListItem>
                <asp:ListItem Text="Split" Value="st" meta:resourcekey="ListItemResource3"></asp:ListItem>
                <asp:ListItem Text="Varaždin" Value="vz" meta:resourcekey="ListItemResource4"></asp:ListItem>
                <asp:ListItem Text="Dubrovnik" Value="du" meta:resourcekey="ListItemResource5"></asp:ListItem>
                <asp:ListItem Text="Osijek" Value="os" meta:resourcekey="ListItemResource6"></asp:ListItem>
                <asp:ListItem Text="Pula" Value="pu" meta:resourcekey="ListItemResource7"></asp:ListItem>

            </asp:DropDownList>

            <asp:Label ID="lblStatus" runat="server" Text="Status:" Font-Bold="True" meta:resourcekey="lblStatusResource1"></asp:Label>
            <br />
            <asp:DropDownList ID="ddlUser" runat="server" CssClass="form-control" meta:resourcekey="ddlUserResource1">
                <asp:ListItem Text="Korisnik" Value="user" meta:resourcekey="ListItemResource8"></asp:ListItem>
                <asp:ListItem Text="Admin" Value="admin" meta:resourcekey="ListItemResource9"></asp:ListItem>
            </asp:DropDownList>
        </div>
        <div class="col-lg-4 col-md-4 col-sm-4">
            <asp:Label ID="lblPass" runat="server" Text="Lozinka:" Font-Bold="True" meta:resourcekey="lblPassResource1"></asp:Label>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="Lozinka je obavezno polje" ControlToValidate="txtPass"
                ForeColor="Red" Text="*" ValidationGroup="ValGroup" meta:resourcekey="RequiredFieldValidator4Resource1"></asp:RequiredFieldValidator>
            <br />
            <div style="margin-bottom: 10px;">
                <asp:TextBox ID="txtPass" runat="server" CssClass="form-control" TextMode="Password" meta:resourcekey="txtPassResource1"></asp:TextBox>

            </div>

            <asp:Label ID="lblRepeatPass" runat="server" Text="Potvrda lozinke:" Font-Bold="True" meta:resourcekey="lblRepeatPassResource1"></asp:Label>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="Potvrda lozinke je obavezno polje" ControlToValidate="txtRepeatPass"
                ForeColor="Red" Text="*" ValidationGroup="ValGroup" meta:resourcekey="RequiredFieldValidator5Resource1"></asp:RequiredFieldValidator>
            <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToCompare="txtRepeatPass" ControlToValidate="txtPass" Display="Dynamic" ErrorMessage="Lozinke se ne podudaraju!" ForeColor="Red"
                ValidationGroup="ValGroup" meta:resourcekey="CompareValidator1Resource1">*</asp:CompareValidator>
            <br />
            <div style="margin-bottom: 10px;">
                <asp:TextBox ID="txtRepeatPass" runat="server" CssClass="form-control" TextMode="Password" meta:resourcekey="txtRepeatPassResource1"></asp:TextBox>
            </div>

            <asp:Button ID="btnAdd" Style="width: 75px;" runat="server" Text="Dodaj" OnClick="btnAdd_Click" CssClass="btn btn-primary" ValidationGroup="ValGroup" meta:resourcekey="btnAddResource1"/>
        </div>
    </div>
    <div class="row">
        <asp:ValidationSummary ID="ValidationSummary1" runat="server" ValidationGroup="ValGroup" ForeColor="Red" Font-Size="13px" CssClass="col-xs-8 col-xs-offset-1" meta:resourcekey="ValidationSummary1Resource1" />
    </div>
</asp:Content>
