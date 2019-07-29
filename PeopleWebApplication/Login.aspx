<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="PeopleWebApplication.Login" Culture="auto" meta:resourcekey="PageResource1" UICulture="auto" %>

<%@ MasterType VirtualPath="~/Main.Master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
	<div class="container h-100" id="loginPrompt" style="width: 310px;">
		<div class="row h-100 justify-content-center align-items-center" style="margin-top: 20px;">
			<div class="col-6">
				<div class="form-container">
					<div>
						<asp:Label ID="lblEmail" runat="server" Text="Email:" Font-Bold="True" meta:resourcekey="lblEmailResource1"></asp:Label>
						<asp:RequiredFieldValidator
							ID="RequiredFieldValidator1"
							runat="server"
							ErrorMessage="Email je obavezno polje"
							ControlToValidate="txtEmail"
							Display="Dynamic"
							Text="*"
							ForeColor="Red" meta:resourcekey="RequiredFieldValidator1Resource1"
							ValidationGroup="LoginValidationGroup"></asp:RequiredFieldValidator>
						<asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server"
							ControlToValidate="txtEmail" Display="Dynamic"
							ErrorMessage="Krivo upisana e-mail adresa" Font-Bold="True" ForeColor="Red"
							ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"
							meta:resourcekey="RegularExpressionValidator1Resource1"
							ValidationGroup="LoginValidationGroup">*</asp:RegularExpressionValidator>
						<div>
							<asp:TextBox ID="txtEmail" runat="server" CssClass="form-control " meta:resourcekey="txtEmailResource1"></asp:TextBox>
						</div>
					</div>
					<br />
					<div>
						<asp:Label ID="lblPassword" runat="server" Text="Lozinka:" Font-Bold="True" meta:resourcekey="lblPasswordResource1"></asp:Label>
						<asp:RequiredFieldValidator
							ID="RequiredFieldValidator2"
							Display="Dynamic"
							runat="server"
							ErrorMessage="Lozinka je obavezno polje"
							ControlToValidate="txtPassword"
							Text="*"
							ForeColor="Red"
							meta:resourcekey="RequiredFieldValidator2Resource1"
							ValidationGroup="LoginValidationGroup"></asp:RequiredFieldValidator>
						<div style="margin-bottom: 10px;">
							<asp:TextBox ID="txtPassword" runat="server" CssClass="form-control" TextMode="Password" meta:resourcekey="txtPasswordResource1"></asp:TextBox>
						</div>

					</div>
					<asp:CheckBox ID="cbRemberMe" CssClass="checkbox-inline" runat="server" Text="Zapamti me" Font-Bold="false" meta:resourcekey="cbRemberMeResource1" />
					<br />
					<asp:Button ID="btnLogin" runat="server" Text="Ulaz" CssClass="btn btn-primary" OnClick="btnLogin_Click" meta:resourcekey="btnLoginResource1" ValidationGroup="LoginValidationGroup" />
					<br />
					<br />
					<asp:ValidationSummary ID="ValidationSummary1" runat="server" ForeColor="Red" Font-Size="13px" CssClass="col-xs-8 col-xs-offset-2" meta:resourcekey="ValidationSummary1Resource1" ValidationGroup="LoginValidationGroup" />
				</div>

			</div>
		</div>
	</div>
</asp:Content>
