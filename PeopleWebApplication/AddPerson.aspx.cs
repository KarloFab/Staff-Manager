using PeopleWebApplication.Models;
using System;
using System.Threading;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace PeopleWebApplication
{
	public partial class AddPerson : CentralPage
	{
		public int EmailsCount
		{

			get
			{
				if (Session["emailsCount"] == null)
					Session["emailsCount"] = 0;
				return (int)Session["emailsCount"];
			}
			set { Session["emailsCount"] = value; }
		}

		public bool validInsert
		{

			get
			{
				if (Session["validInsert"] == null)
					Session["validInsert"] = false;
				return (bool)Session["validInsert"];
			}
			set { Session["validInsert"] = value; }
		}
		protected void Page_Load(object sender, EventArgs e)
		{

			SetMasterPage();

		}

		private void SetMasterPage()
		{

			if (Thread.CurrentThread.CurrentCulture.Name == "hr")
			{
				Master.LabelTitle = "Dodaj osobu";
				Master.Title = "Dodaj osobu";

			}
			else
			{
				Master.LabelTitle = "Add person";
				Master.Title = "Add person";

			}

			Master.ButtonUser = Request.Cookies["user"]["username"];
			(Master.FindControl("lbAddPerson") as LinkButton).CssClass = "btn btn-primary";

			if (validInsert)
			{
				ScriptManager.RegisterStartupScript(this, typeof(Page), "addPerson", "  $(function () { ShowToastr(); });", true);
			}

			validInsert = false;
		}

		protected void btnAdd_Click(object sender, EventArgs e)
		{
			Person person = new Person();
			person.Name = txtName.Text;
			person.Surname = txtSurname.Text;
			person.ContactTelephone = txtTelephone.Text;
			person.Password = txtPass.Text;
			person.City = ddlCity.SelectedItem.Text;
			person.Status = ddlUser.SelectedItem.Text;

			int emailNumber = 0;

			foreach (TextBox item in emailPh.Controls)
			{
				if (item.Text != string.Empty)
				{
					emailNumber++;
					person.Emails.Add(new Email
					{

						IDEmail = emailNumber,
						Name = item.Text
					});

				}
			}

			repo.InsertPerson(person);
			validInsert = true;
			Response.Redirect(Request.Url.AbsolutePath);
		}

		protected void lbAddMoreEmails_Click(object sender, EventArgs e)
		{
			EmailsCount++;
			txtEmail1.Visible = true;
			txtEmail1.Focus();

			if (EmailsCount == 2)
			{
				EmailsCount++;
				txtEmail2.Visible = true;
				txtEmail2.Focus();
				lbAddMoreEmails.Visible = false;
				EmailsCount = 0;
			}
		}
	}
}