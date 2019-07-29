<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="PersonControl.ascx.cs" Inherits="PeopleWebApplication.Controls.PersonControl" %>


<style type="text/css">
    .auto-style1 {
        width: 10px;
    }

    .auto-style2 {
        width: 200px;
    }

    .auto-style3 {
        width: 80px;
        height: 47px;
    }

    .auto-style4 {
        width: 180px;
        height: 47px;
    }
</style>

<div class="col-lg-4-ctrl col-md-6 col-sm-6 col-xs-12" style=" overflow:hidden;">
    <div style="border: 1px solid #d6d4d4; padding: 15px; width: 310px;margin-bottom:20px; margin-right:20px;" class="form-group;">
        <table style="border-collapse: separate; border-spacing: 0 7px;">
            <tr>
                <td class="auto-style1">
                    <asp:Label ID="lblName" runat="server" Text="Ime:" Font-Bold="True" meta:resourcekey="lblNameResource1"></asp:Label>
                </td>

                <td class="auto-style2">
                    <asp:TextBox ID="txtName" runat="server" CssClass="form-control input-sm" Style="margin-left: 0px" meta:resourcekey="txtNameResource1"></asp:TextBox>
          
                </td>
                <td>
                    <asp:RequiredFieldValidator ID="nameValidator" runat="server" ErrorMessage="Ime je obavezno" ControlToValidate="txtName"
                        ForeColor="Red" Text="*" meta:resourcekey="RequiredFieldValidator1Resource1"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style1">
                    <asp:Label ID="lblSurname" runat="server" Text="Prezime:" Font-Bold="True" meta:resourcekey="lblSurnameResource1"></asp:Label>
                </td>
                <td class="auto-style2">
                    <asp:TextBox ID="txtSurname" runat="server" CssClass="form-control input-sm" meta:resourcekey="txtSurnameResource1"></asp:TextBox>
                </td>
                <td>
                    <asp:RequiredFieldValidator ID="surnameValidator" runat="server" ErrorMessage="Prezime je obavezno" ControlToValidate="txtSurname"
                        ForeColor="Red" Text="*" meta:resourcekey="RequiredFieldValidator1Resource1"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style1">
            
                </td>
                <td class="auto-style2">
                    <asp:DropDownList
                        ID="ddlEmails"
                        runat="server"
                        CssClass="form-control input-sm"
                        AutoPostBack="True"
                        OnSelectedIndexChanged="ddlEmails_SelectedIndexChanged" meta:resourcekey="ddlEmailsResource1">
                    </asp:DropDownList>

                </td>
                <td>

                </td>
            </tr>
            <tr>
                <td class="auto-style1">
                    <asp:Label ID="lblEmail" runat="server" Text="Email:" Font-Bold="True" meta:resourcekey="lblEmailResource1"></asp:Label>
                </td>
                <td class="auto-style2">
                    <div class="input-group">
                        <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control input-sm" meta:resourcekey="txtEmailResource1"></asp:TextBox>
                        <span class="input-group-btn">
                            <asp:LinkButton ID="lbEditEmail" runat="server" CssClass="btn btn-default btn-sm" OnClick="lbEditEmail_Click" meta:resourcekey="lbEditEmailResource1">
                                  <span class="glyphicon glyphicon-save" style="color:#0094ff;"></span>
                            </asp:LinkButton>
                            <asp:HiddenField ID="hfEmailUpdated" Value="0" runat="server" />
                        </span>
           
                    </div>
           
                </td>
                <td>
                    <asp:RequiredFieldValidator ID="emailValidator" runat="server" ErrorMessage="Email je obavezan" ControlToValidate="txtEmail"
                        ForeColor="Red" Text="*" meta:resourcekey="RequiredFieldValidator1Resource1"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="emailRegex" runat="server"
                        ControlToValidate="txtEmail" Display="Dynamic"
                        Text="*"
                        ErrorMessage="Krivi mail"
                        ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"
                        ForeColor="Red" meta:resourcekey="RegularExpressionValidator1Resource1"></asp:RegularExpressionValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style1">
                    <asp:Label ID="lblTelephone" runat="server" Text="Telefon:" Font-Bold="True" meta:resourcekey="lblTelephoneResource1"></asp:Label>
                </td>
                <td class="auto-style2">
                    <asp:TextBox ID="txtTelephone" runat="server" CssClass="form-control input-sm" meta:resourcekey="txtTelephoneResource1"></asp:TextBox>
                </td>
                <td>
                    <asp:RequiredFieldValidator ID="telephoneValidator" runat="server" ErrorMessage="Telefon je obavezan" ControlToValidate="txtTelephone"
                        ForeColor="Red" Text="*" meta:resourcekey="RequiredFieldValidator1Resource1"></asp:RequiredFieldValidator>

                </td>
            </tr>
            <tr>
                <td class="auto-style1">
                    <asp:Label ID="lblCity" runat="server" Text="Grad:" Font-Bold="True" meta:resourcekey="lblCityResource1"></asp:Label>
                </td>
                <td class="auto-style2">
                    <asp:DropDownList ID="ddlCity" runat="server" CssClass="form-control input-sm" meta:resourcekey="ddlCityResource1">
                        <asp:ListItem Text="Zagreb" Value="zg"></asp:ListItem>
                        <asp:ListItem Text="Rijeka" Value="ri"></asp:ListItem>
                        <asp:ListItem Text="Split" Value="st"></asp:ListItem>
                        <asp:ListItem Text="Varaždin" Value="vz"></asp:ListItem>
                        <asp:ListItem Text="Dubrovnik" Value="du"></asp:ListItem>
                        <asp:ListItem Text="Osijek" Value="os"></asp:ListItem>
                        <asp:ListItem Text="Pula" Value="pu"></asp:ListItem>
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td class="auto-style1">
                    <asp:Label ID="lblStatus" runat="server" Text="Status:" Font-Bold="True" meta:resourcekey="lblStatusResource1"></asp:Label>
                </td>
                <td class="auto-style2">
                    <asp:DropDownList ID="ddlUser" runat="server" CssClass="form-control input-sm" meta:resourcekey="ddlUserResource1">
                        <asp:ListItem Text="Korisnik" Value="user" meta:resourcekey="ListItemResource8"></asp:ListItem>
                        <asp:ListItem Text="Admin" Value="admin"></asp:ListItem>
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td class="auto-style1">
                    <asp:Label ID="lblPass" runat="server" Text="Lozinka:" Font-Bold="True" meta:resourcekey="lblPassResource1"></asp:Label>
                </td>
                <td class="auto-style2">
                    <asp:TextBox ID="txtPass" runat="server" CssClass="form-control input-sm" meta:resourcekey="txtPassResource1"></asp:TextBox>
                </td>
                <td>
                    <asp:RequiredFieldValidator ID="passValidator" runat="server" ErrorMessage="Lozinka je obavezna" ControlToValidate="txtPass"
                        ForeColor="Red" Text="*" meta:resourcekey="RequiredFieldValidator1Resource1"></asp:RequiredFieldValidator>
                </td>
            </tr>

            <tr>
                <td class="auto-style3"></td>
                <td class="auto-style4">
                    <asp:Button ID="btnUpdate" runat="server" Text="Uredi" CssClass="btn btn-primary btn-sm"
                        OnClick="btnUpdate_Click" meta:resourcekey="btnUpdateResource1" Style="width: 90px;"/>
                    <asp:Button ID="btnDelete" runat="server" Text="Obriši" CssClass="btn btn-warning btn-sm"
                        OnClick="btnDelete_Click" OnClientClick="return confirm('Nastaviti s brisanjem osobe?');"
                        meta:resourcekey="btnDeleteResource1" Style="width: 90px;" />
                    <br />
                    <asp:HiddenField ID="hfEmail" runat="server" />
                    <asp:ValidationSummary ID="ValidationSummary1" runat="server" ForeColor="Red" Font-Size="13px" meta:resourcekey="ValidationSummary1Resource1" />
                </td>
            </tr>
        </table>

    </div>
</div>

