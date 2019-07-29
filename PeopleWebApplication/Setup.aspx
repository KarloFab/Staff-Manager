<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="Setup.aspx.cs" Inherits="PeopleWebApplication.Setup" Culture="auto" meta:resourcekey="PageResource1" UICulture="auto" %>

<%@ MasterType VirtualPath="~/Main.Master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
	<div class="container h-100" id="loginPrompt" style="width: 350px;">
		<div class="row h-100 justify-content-center align-items-center">
			<div class="col-6">
				<asp:Label ID="lblTheme" runat="server" Text="Tema:" Font-Bold="True" meta:resourcekey="lblThemeResource1"></asp:Label>
				<br />
				<asp:DropDownList ID="ddlTheme" runat="server" AutoPostBack="True" CssClass="form-control" OnSelectedIndexChanged="ddlTheme_SelectedIndexChanged" meta:resourcekey="ddlThemeResource1">
					<asp:ListItem Text="--- odaberi ---" Value="0" meta:resourcekey="ListItemResource1"></asp:ListItem>
					<asp:ListItem Text="Predefinirana" Value="predefine" meta:resourcekey="ListItemResource2"></asp:ListItem>
					<asp:ListItem Text="Plava" Value="blue" meta:resourcekey="ListItemResource3"></asp:ListItem>
					<asp:ListItem Text="Crvena" Value="red" meta:resourcekey="ListItemResource4"></asp:ListItem>
				</asp:DropDownList>
				<br />
				<asp:Label ID="lblLang" runat="server" Text="Jezik:" Font-Bold="True" meta:resourcekey="lblLangResource1"></asp:Label>
				<br />
				<asp:DropDownList ID="ddlLang" runat="server" AutoPostBack="True" CssClass="form-control" OnSelectedIndexChanged="ddlLang_SelectedIndexChanged" meta:resourcekey="ddlLangResource1">
					<asp:ListItem Text="--- odaberi ---" Value="0" meta:resourcekey="ListItemResource5"></asp:ListItem>
					<asp:ListItem Text="Hrvatski" Value="hr" meta:resourcekey="ListItemResource6"></asp:ListItem>
					<asp:ListItem Text="Engleski" Value="en" meta:resourcekey="ListItemResource7"></asp:ListItem>
				</asp:DropDownList>
				<br />
				<asp:Label ID="lblRepository" runat="server" Text="Repozitorij:" Font-Bold="True" meta:resourcekey="lblRepositoryResource1"></asp:Label>
				<br />
				<asp:DropDownList ID="ddlRepo" runat="server" AutoPostBack="True" CssClass="form-control" OnSelectedIndexChanged="ddlRepo_SelectedIndexChanged" meta:resourcekey="ddlRepoResource1">
					<asp:ListItem Text="--- odaberi ---" Value="0" meta:resourcekey="ListItemResource8"></asp:ListItem>
					<asp:ListItem Text="Tekstualna datoteka" Value="text" meta:resourcekey="ListItemResource9"></asp:ListItem>
					<asp:ListItem Text="Baza podataka" Value="database" meta:resourcekey="ListItemResource10"></asp:ListItem>
				</asp:DropDownList>
			</div>
		</div>
	</div>
</asp:Content>
