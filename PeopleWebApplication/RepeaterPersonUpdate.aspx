<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="RepeaterPersonUpdate.aspx.cs" Inherits="PeopleWebApplication.RepeaterPersonUpdate" %>

<%@ Register Src="~/Controls/PersonControl.ascx" TagPrefix="uc1" TagName="PersonControl" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="row">
        <div class="col-lg-ofset-4 col-md-offset-4 col-sm-offset-2" style="width: 1200px;">
          <uc1:PersonControl runat="server" ID="ctrl" />
        </div>
    </div>
</asp:Content>

