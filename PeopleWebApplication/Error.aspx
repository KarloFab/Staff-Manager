<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="Error.aspx.cs" Inherits="PeopleWebApplication.Error" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<div class="row">
    <div class="col-sm-4 col-sm-offset-4">
    <asp:Label ID="lblText" runat="server" Text="There was an error" Style="text-align:center; font-size:xx-large; color:red;"></asp:Label>
    <h3>
        Return to login page:
    </h3>
    <br />
    <asp:Button ID="btnLoginPage" runat="server" 
        Text="Login page" 
        CssClass="btn btn-primary" 
        OnClick="btnLoginPage_Click"/>
    </div>
    </div>
</asp:Content>
