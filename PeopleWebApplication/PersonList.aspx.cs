using PeopleWebApplication.Models;
using System;
using System.Collections.Generic;
using System.Threading;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace PeopleWebApplication
{
	public partial class ShowPeople : CentralPage
	{
		List<Person> people = new List<Person>();
		protected void Page_Load(object sender, EventArgs e)
		{
			SetMasterPage();
		}

		private void SetMasterPage()
		{
			if (Thread.CurrentThread.CurrentCulture.Name == "hr")
			{
				Master.LabelTitle = "Prikaži osobe";
				Master.Title = "Prikaži osobe";
			}
			else
			{
				Master.LabelTitle = "Person list";
				Master.Title = "Person list";
			}

			Master.ButtonUser = Request.Cookies["user"]["username"];
			(Master.FindControl("lbShowPeople") as LinkButton).CssClass = "btn btn-primary";

			if (!IsPostBack)
			{
				ShowData();
			}
			ToastrUpdateAndDelete();
		}

		private void ShowData()
		{
			people = repo.GetPeople();
			MyGrid.DataSource = people;
			MyGrid.DataBind();

			Repeater.DataSource = people;
			Repeater.DataBind();
		}

		protected void MyGrid_RowEditing(object sender, GridViewEditEventArgs e)
		{
			MyGrid.EditIndex = e.NewEditIndex;
			ShowData();
		}

		protected void MyGrid_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
		{
			MyGrid.EditIndex = -1;
			ShowData();
		}

		private T GetControl<T>(ControlCollection parent)
		{
			foreach (var ctrl in parent)
			{
				if (ctrl is T)
				{
					return (T)ctrl;
				}
			}

			return default(T);
		}

		protected void MyGrid_RowUpdating(object sender, GridViewUpdateEventArgs e)
		{
			GridViewRow row = MyGrid.Rows[e.RowIndex];
			var personID = (int)MyGrid.DataKeys[e.RowIndex].Value;

			DropDownList ddl = GetControl<DropDownList>(row.Cells[4].Controls);
			ddl.Enabled = true;

			Person person = new Person();

			TextBox txtIme = GetControl<TextBox>(row.Cells[0].Controls);
			TextBox txtPrezime = GetControl<TextBox>(row.Cells[1].Controls);
			TextBox txtTelefon = GetControl<TextBox>(row.Cells[2].Controls);

			HiddenField password = row.Cells[4].FindControl("hfPassword") as HiddenField;
			HiddenField city = row.Cells[4].FindControl("hfCity") as HiddenField;

			List<Email> emails = new List<Email>();

			for (int i = 1; i <= 3; i++)
			{
				TextBox email = (TextBox)row.Cells[3].FindControl("txtEmail" + i);
				HiddenField hiddenField = (HiddenField)row.Cells[3].FindControl("hfEmail" + i);

				if (email.Text != string.Empty)
				{
					emails.Add(new Email
					{
						IDEmail = int.Parse(hiddenField.Value),
						Name = email.Text
					});
				}

			}

			person.IDPerson = personID;
			person.Name = txtIme.Text;
			person.Surname = txtPrezime.Text;
			person.ContactTelephone = txtTelefon.Text;
			person.Emails = emails;
			person.Password = password.Value;
			person.City = city.Value;
			person.Status = ddl.SelectedItem.Text;

			repo.UpdatePerson(person, personID);

			MyGrid.EditIndex = -1;
			ShowData();

		}

		protected void MyGrid_RowDataBound(object sender, GridViewRowEventArgs e)
		{
			PlaceHolder ph = (PlaceHolder)e.Row.FindControl("phEmails");
			DropDownList ddl = (DropDownList)e.Row.FindControl("ddlUser");
			HiddenField hfPassword = (HiddenField)e.Row.FindControl("hfPassword");
			HiddenField hfCity = (HiddenField)e.Row.FindControl("hfCity");

			if (e.Row.RowType == DataControlRowType.DataRow)
			{
				string userId = ((GridView)sender).DataKeys[e.Row.RowIndex].Value.ToString();

				foreach (Person person in people)
				{
					if (person.IDPerson == int.Parse(userId))
					{
						int emailNumber = 1;
						foreach (Email email in person.Emails)
						{
							if ((e.Row.RowState & DataControlRowState.Edit) == 0)
							{
								ph.Controls.Add(new HyperLink
								{
									Text = email.Name,
									NavigateUrl = $"mailto:{email.Name}",
									ForeColor = System.Drawing.ColorTranslator.FromHtml("#006dcc")


								});

								ph.Controls.Add(new LiteralControl("<br/>"));

								string personStatus = "";

								if (person.Status == "Korisnik" || person.Status == "User")
								{
									personStatus = "user";
								}
								else
								{
									personStatus = "admin";
								}

								ddl.Items.FindByValue(personStatus).Selected = true;
							}


							if ((e.Row.RowState & DataControlRowState.Edit) > 0)
							{

								TextBox tb = (TextBox)e.Row.FindControl("txtEmail" + emailNumber);
								HiddenField hfEmailID = (HiddenField)e.Row.FindControl("hfEmail" + emailNumber);
								tb.Visible = true;
								tb.Text = email.Name;
								hfEmailID.Value = email.IDEmail.ToString();
								emailNumber++;
								ddl.Enabled = true;

								string personStatus = "";

								if (person.Status == "Korisnik")
								{
									personStatus = "user";
								}
								else
								{
									personStatus = "admin";
								}

								ddl.Items.FindByValue(personStatus).Selected = true;

							}
						}


						hfPassword.Value = person.Password;
						hfCity.Value = person.City;

					}
				}
			}


		}

		protected void btnUpdate_Click(object sender, EventArgs e)
		{
			Button button = sender as Button;
			RepeaterPersonUpdate rpu = new RepeaterPersonUpdate();
			rpu.ShowPersonControl(int.Parse(button.CommandArgument));
			Response.Redirect("RepeaterPersonUpdate.aspx");
		}

		protected void Repeater_ItemDataBound(object sender, RepeaterItemEventArgs e)
		{
			if ((e.Item.ItemType == ListItemType.Item) || (e.Item.ItemType == ListItemType.AlternatingItem))
			{
				PlaceHolder emailsPlaceholder = (PlaceHolder)e.Item.FindControl("emailsPH");
				Button personIdButton = (Button)e.Item.FindControl("btnUpdate");

				emailsPlaceholder.Controls.Add(new LiteralControl("<ul class='list-unstyled'>"));

				foreach (Person person in people)
				{
					if (person.IDPerson == int.Parse(personIdButton.CommandArgument))
					{
						foreach (Email mail in person.Emails)
						{
							emailsPlaceholder.Controls.Add(new LiteralControl($"<li><a style='color:#006dcc;' href='mailto:{mail.Name}'>{mail.Name}</a></li> "));
						}

						emailsPlaceholder.Controls.Add(new LiteralControl("</ul>"));
					}

				}

			}
		}

		protected void Repeater_DataBinding(object sender, EventArgs e)
		{

		}
	}
}