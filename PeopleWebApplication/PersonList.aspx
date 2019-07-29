<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="PersonList.aspx.cs" Inherits="PeopleWebApplication.ShowPeople" Culture="auto" meta:resourcekey="PageResource1" UICulture="auto" %>

<%@ MasterType VirtualPath="~/Main.Master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
	<script>
        $(function () {
            $("#accordion").accordion({
                icons: false,
                collapsible: true,
            });
        });
	</script>
	<div id="accordion">
		<a id="link" style="font-size: 17px; color: black; background-color: #f6f6f6; border: 1px solid #cccccc;">Grid view</a>

		<div class="row" id="rw">
			<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
				<div>
					<asp:GridView ID="MyGrid" runat="server" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="10" CssClass="auto-style1" ForeColor="Black" GridLines="Horizontal" Width="100%" AutoGenerateColumns="False" DataKeyNames="IDPerson" OnRowCancelingEdit="MyGrid_RowCancelingEdit" OnRowEditing="MyGrid_RowEditing" OnRowUpdating="MyGrid_RowUpdating" OnRowDataBound="MyGrid_RowDataBound" CellSpacing="10" meta:resourcekey="MyGridResource1">
						<Columns>
							<asp:BoundField DataField="Name" HeaderText="Ime" ControlStyle-Width="120px" meta:resourcekey="BoundFieldResource1">
								<ControlStyle CssClass="form-control" />
								<HeaderStyle Height="30px" />
							</asp:BoundField>
							<asp:BoundField DataField="Surname" HeaderText="Prezime" ControlStyle-Width="120px" meta:resourcekey="BoundFieldResource2">
								<ControlStyle CssClass="form-control" />
							</asp:BoundField>
							<asp:BoundField DataField="ContactTelephone" HeaderText="Telefon" ControlStyle-Width="120px" meta:resourcekey="BoundFieldResource3">
								<ControlStyle CssClass="form-control" />
							</asp:BoundField>
							<asp:TemplateField HeaderText="E-mail" ItemStyle-Width="170px" ControlStyle-Width="160px" meta:resourcekey="TemplateFieldResource1">
								<EditItemTemplate>
									<asp:TextBox ID="txtEmail1" runat="server" Visible="False" CssClass="form-control" meta:resourcekey="txtEmail1Resource1"></asp:TextBox>
									<asp:HiddenField ID="hfEmail1" runat="server" />
									<asp:RegularExpressionValidator ID="RegularExpressionValidator9" runat="server"
										ControlToValidate="txtEmail1" Display="Dynamic"
										ErrorMessage="*Krivi mail"
										ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"
										ForeColor="Red" meta:resourcekey="RegularExpressionValidator1Resource1"></asp:RegularExpressionValidator>
									<asp:TextBox ID="txtEmail2" runat="server" Visible="False" CssClass="form-control" meta:resourcekey="txtEmail2Resource1"></asp:TextBox>
									<asp:HiddenField ID="hfEmail2" runat="server" />
									<asp:RegularExpressionValidator ID="RegularExpressionValidator10" runat="server" ControlToValidate="txtEmail2" Display="Dynamic" ErrorMessage="Krivi mail" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" meta:resourcekey="RegularExpressionValidator2Resource1" ForeColor="Red"></asp:RegularExpressionValidator>
									<asp:TextBox ID="txtEmail3" runat="server" Visible="False" CssClass="form-control" meta:resourcekey="txtEmail3Resource1"></asp:TextBox>
									<asp:HiddenField ID="hfEmail3" runat="server" />
									<asp:RegularExpressionValidator ID="RegularExpressionValidator11" runat="server" ControlToValidate="txtEmail3" Display="Dynamic" ErrorMessage="Krivi mail" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" meta:resourcekey="RegularExpressionValidator3Resource1" ForeColor="Red"></asp:RegularExpressionValidator>
								</EditItemTemplate>
								<ItemTemplate>
									<asp:PlaceHolder ID="phEmails" runat="server"></asp:PlaceHolder>
								</ItemTemplate>

								<ControlStyle Width="160px"></ControlStyle>

								<ItemStyle Width="170px"></ItemStyle>
							</asp:TemplateField>
							<asp:TemplateField ItemStyle-Width="150px" meta:resourcekey="TemplateFieldResource2">
								<ItemTemplate>
									<asp:DropDownList ID="ddlUser" runat="server" AutoPostBack="True" CssClass="form-control" Enabled="False" meta:resourcekey="ddlUserResource1">
										<asp:ListItem Text="Korisnik" Value="user" meta:resourcekey="ListItemResource1"></asp:ListItem>
										<asp:ListItem Text="Admin" Value="admin" meta:resourcekey="ListItemResource2"></asp:ListItem>
									</asp:DropDownList>
									<asp:HiddenField ID="hfPassword" runat="server" />
									<asp:HiddenField ID="hfCity" runat="server" />
								</ItemTemplate>

								<ItemStyle></ItemStyle>
							</asp:TemplateField>
							<asp:CommandField ShowEditButton="True" ItemStyle-HorizontalAlign="Center" ItemStyle-ForeColor="#006dcc" CancelText="Odustani" DeleteText="Obriši" EditText="Uredi" UpdateText="Ažuriraj" meta:resourcekey="CommandFieldResource1">
								<ItemStyle HorizontalAlign="Center"></ItemStyle>
							</asp:CommandField>
						</Columns>
						<FooterStyle BackColor="#CCCC99" ForeColor="Black" />
						<HeaderStyle BackColor="#333333" Font-Bold="True" ForeColor="White" />
						<PagerStyle BackColor="White" ForeColor="Black" HorizontalAlign="Right" />
						<RowStyle Height="60px" />
						<SelectedRowStyle BackColor="#CC3333" Font-Bold="True" ForeColor="White" />
						<SortedAscendingCellStyle BackColor="#F7F7F7" />
						<SortedAscendingHeaderStyle BackColor="#4B4B4B" />
						<SortedDescendingCellStyle BackColor="#E5E5E5" />
						<SortedDescendingHeaderStyle BackColor="#242121" />
					</asp:GridView>
					<asp:HiddenField runat="server" ID="hidAccordionIndex" Value="0" ClientIDMode="Static" />
				</div>
			</div>
		</div>
		<a style="font-size: 17px; color: black; background-color: #f6f6f6; border: 1px solid #cccccc" data-parent="#accordion">Repeater</a>
		<div class="row">
			<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
				<div>
					<asp:Repeater ID="Repeater" runat="server" OnItemDataBound="Repeater_ItemDataBound" OnDataBinding="Repeater_DataBinding">
						<HeaderTemplate>
							<table style="width: 100%;" class="table table-hover">
								<tr style="background-color: #333333; color: white; height: 30px; border-bottom: 1px solid black;">
									<th>
										<asp:Label ID="lblIme" runat="server" Text="Ime" meta:resourcekey="lblImeResource1"></asp:Label>
									</th>
									<th>
										<asp:Label ID="lblPrezime" runat="server" Text="Prezime" meta:resourcekey="lblPrezimeResource1"></asp:Label>
									</th>
									<th>
										<asp:Label ID="lblEmail" runat="server" Text="E-mail" meta:resourcekey="lblEmailResource1"></asp:Label>
									</th>
									<th>
										<asp:Label ID="lblTelephone" runat="server" Text="Telefon" meta:resourcekey="lblTelephoneResource1"></asp:Label>
									</th>
									<th>
										<asp:Label ID="lblStatus" runat="server" Text="Status" meta:resourcekey="lblStatusResource1"></asp:Label>
									</th>
									<th>
										<asp:Label ID="lblGrad" runat="server" Text="Grad" meta:resourcekey="lblGradResource1"></asp:Label>
									</th>
									<th></th>
								</tr>
						</HeaderTemplate>
						<ItemTemplate>
							<tr style="border-bottom: 1px solid #cccccc; height: 60px;">
								<td>
									<%# Eval("Name") %>
								</td>
								<td>
									<%# Eval("Surname") %>
								</td>
								<td>
									<asp:PlaceHolder ID="emailsPH" runat="server"></asp:PlaceHolder>
								</td>
								<td>
									<%# Eval("ContactTelephone") %>
								</td>
								<td>
									<%# Eval("Status") %>
								</td>
								<td>
									<%# Eval("Grad") %>
								</td>
								<td>
									<asp:Button ID="btnUpdate" runat="server" Text="Uredi" CssClass="btn btn-primary" OnClick="btnUpdate_Click" CommandArgument='<%# Eval("IDPerson") %>' meta:resourcekey="btnUpdateResource1" />
									<asp:HiddenField ID="hfPasswordRepeater" runat="server" Value='<%# Eval("Password") %>' />
								</td>
							</tr>

						</ItemTemplate>
						<FooterTemplate>
							</table>
						</FooterTemplate>
					</asp:Repeater>
					<asp:HiddenField runat="server" ID="HiddenField1" Value="0" ClientIDMode="Static" />
				</div>
			</div>
		</div>
	</div>
</asp:Content>
