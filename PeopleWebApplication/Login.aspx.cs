using PeopleWebApplication.Models;
using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI.WebControls;

namespace PeopleWebApplication
{
	public partial class Login : CentralPage
	{
		public string UserStatus { get; set; }
		public string UserName { get; set; }
		protected void Page_Load(object sender, EventArgs e)
		{

			if (!IsPostBack)
			{
				txtEmail.Focus();

			}
		}

		protected void btnLogin_Click(object sender, EventArgs e)
		{
			if (IsUserAlreadyRegistered(txtEmail.Text, txtPassword.Text))
			{
				var cookie = new HttpCookie("user");
				cookie["email"] = txtEmail.Text;
				cookie["password"] = txtPassword.Text;
				cookie["status"] = UserStatus;
				cookie["username"] = UserName;

				if (cbRemberMe.Checked)
				{
					cookie.Expires = DateTime.Now.AddDays(1);
				}
				else
				{
					cookie.Expires = DateTime.Now.AddSeconds(20);
				}
				Response.Cookies.Add(cookie);
				Response.Redirect("~/PersonList.aspx");

			}
			else
			{
				ResetForm();
				var customValidator = new CustomValidator
				{
					ErrorMessage = "Krivi korisnicki podaci!",
					IsValid = false,
					ValidationGroup = "LoginValidationGroup"
				};
				Validators.Add(customValidator);
			}

		}

		private bool IsUserAlreadyRegistered(string email, string password)
		{
			List<Person> people = repo.GetPeople();
			foreach (Person person in people)
			{
				if (person.Password == password)
				{
					foreach (Email mail in person.Emails)
					{
						if (email == mail.Name)
						{
							UserStatus = person.Status;
							UserName = person.Name;
							return true;
						}
					}
				}

			}
			return false;
		}

		public void ResetForm()
		{
			txtEmail.Text = string.Empty;
			txtPassword.Text = string.Empty;
			txtEmail.Focus();
		}

	}
}