<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="UpdatePerson.aspx.cs" Inherits="PeopleWebApplication.UpdatePerson" Culture="auto" meta:resourcekey="PageResource1" UICulture="auto" %>

<%@ MasterType VirtualPath="~/Main.Master" %>

<%@ Register Src="~/Controls/PersonControl.ascx" TagPrefix="uc1" TagName="PersonControl" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

	<div class="row" runat="server">
		<asp:PlaceHolder ID="ctrlContainer" runat="server"></asp:PlaceHolder>
	</div>
</asp:Content>
