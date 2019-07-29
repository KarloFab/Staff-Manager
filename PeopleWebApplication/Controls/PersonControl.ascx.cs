using PeopleWebApplication.Models;
using System;
using System.Collections.Generic;
using System.Web.UI.WebControls;

namespace PeopleWebApplication.Controls
{
	public partial class PersonControl : System.Web.UI.UserControl
	{
		public delegate void OnDeleteClickEventHandler(int IDPerson);
		public event OnDeleteClickEventHandler OnDeleteClick;

		public delegate void OnUpdateClickEventHandler(Person person, bool emailUpdated);
		public event OnUpdateClickEventHandler OnUpdateClick;

		public List<Email> emails = new List<Email>();

		public Person Person { get; set; }

		public string Email
		{
			get { return txtEmail.Text; }
			set { txtEmail.Text = value; }
		}

		public string Status
		{
			get { return ddlUser.SelectedItem.Text; }
			set
			{

				ddlUser.ClearSelection();

				string user = "";

				if (value == "Korisnik" || value == "User")
				{
					user = "user";
				}
				else
				{
					user = "admin";
				}
				ddlUser.Items.FindByValue(user).Selected = true;
			}
		}

		public string City
		{
			get { return ddlCity.SelectedItem.Text; }
			set
			{

				ddlCity.ClearSelection();
				ddlCity.Items.FindByText(value).Selected = true;
			}
		}
		protected void Page_Load(object sender, EventArgs e)
		{
			if (!IsPostBack)
			{
				LoadEmails();
			}

		}

		private void LoadEmails()
		{
			foreach (Email email in emails)
			{
				ddlEmails.Items.Add(new ListItem
				{
					Text = email.Name,
					Value = email.IDEmail.ToString()
				});
			}
			txtEmail.Text = emails[0].Name;
			hfEmail.Value = ddlEmails.SelectedItem.Value;
		}

		protected void ddlEmails_SelectedIndexChanged(object sender, EventArgs e)
		{
			txtEmail.Text = ddlEmails.SelectedItem.Text;
			hfEmail.Value = ddlEmails.SelectedItem.Value;
		}

		internal void SetPersonData()
		{
			txtName.Text = Person.Name;
			txtSurname.Text = Person.Surname;
			txtPass.Text = Person.Password;
			txtTelephone.Text = Person.ContactTelephone;
			City = Person.City;
			Status = Person.Status;
			emails = Person.Emails;

			AddValidationGroups();
		}

		private void AddValidationGroups()
		{
			string validationGroup = "UserControlValidation" + Person.IDPerson;
			btnUpdate.ValidationGroup = validationGroup;
			nameValidator.ValidationGroup = validationGroup;
			surnameValidator.ValidationGroup = validationGroup;
			emailValidator.ValidationGroup = validationGroup;
			telephoneValidator.ValidationGroup = validationGroup;
			passValidator.ValidationGroup = validationGroup;
			ValidationSummary1.ValidationGroup = validationGroup;
			emailRegex.ValidationGroup = validationGroup;
			lbEditEmail.ValidationGroup = validationGroup;
		}

		protected void btnDelete_Click(object sender, EventArgs e)
		{
			int idperson = Person.IDPerson;

			OnDeleteClick?.Invoke(Person.IDPerson);
		}

		protected void btnUpdate_Click(object sender, EventArgs e)
		{
			Person person = GetPerson();

			int changedEmail = int.Parse(hfEmail.Value);

			HiddenField emailUpdated = (HiddenField)FindControl("hfEmailUpdated");
			bool emailChanged = false;


			if (emailUpdated.Value == "1")
			{
				emailChanged = true;
				emailUpdated.Value = "0";
			}

			else
			{
				emailChanged = false;
			}


			foreach (ListItem email in ddlEmails.Items)
			{
				if (int.Parse(email.Value) == changedEmail)
				{
					person.Emails.Add(new Email
					{
						IDEmail = int.Parse(email.Value),
						Name = txtEmail.Text
					});
				}
				else
				{
					person.Emails.Add(new Email
					{
						IDEmail = int.Parse(email.Value),
						Name = email.Text

					});
				}
			}

			OnUpdateClick?.Invoke(person, emailChanged);

		}

		private Person GetPerson()
		{
			Person person = new Person
			{
				IDPerson = Person.IDPerson,
				Name = txtName.Text,
				Surname = txtSurname.Text,
				ContactTelephone = txtTelephone.Text,
				Password = txtPass.Text,
				City = ddlCity.SelectedItem.Text,
				Status = ddlUser.SelectedItem.Text
			};
			return person;
		}

		protected void lbEditEmail_Click(object sender, EventArgs e)
		{
			HiddenField emailUpdated = (HiddenField)FindControl("hfEmailUpdated");
			emailUpdated.Value = "1";
			btnUpdate_Click(null, null);
		}
	}
}