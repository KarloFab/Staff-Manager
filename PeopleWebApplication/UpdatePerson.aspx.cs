using PeopleWebApplication.Controls;
using PeopleWebApplication.Models;
using System;
using System.Collections.Generic;
using System.Threading;
using System.Web.UI.WebControls;

namespace PeopleWebApplication
{
	public partial class UpdatePerson : CentralPage
	{
		PersonControl person = new PersonControl();
		List<Person> people = new List<Person>();

		protected void Page_Load(object sender, EventArgs e)
		{
			SetMasterPage();

			if (!IsPostBack)
			{
				LoadPeople();
			}


			person.OnDeleteClick += Person_OnDeleteClick;
			person.OnUpdateClick += Person_OnUpdateClick;
		}

		private void SetMasterPage()
		{
			SetTranslations();

			Master.ButtonUser = Request.Cookies["user"]["username"];
			(Master.FindControl("lbUpdatePeople") as LinkButton).CssClass = "btn btn-primary";

			ToastrUpdateAndDelete();
		}

		private void SetTranslations()
		{
			if (Thread.CurrentThread.CurrentCulture.Name == "hr")
			{
				Master.LabelTitle = "Uredi podatke";
				Master.Title = "Uredi podatke";
			}
			else
			{
				Master.LabelTitle = "Edit data";
				Master.Title = "Edit data";
			}
		}

		private void Person_OnUpdateClick(Person person, bool emailUpdated)
		{

			repo.UpdatePerson(person, person.IDPerson);
			ValidUpdate = true;
			EmailUpdate = emailUpdated;
			Response.Redirect(Request.Url.AbsolutePath);

		}

		private void Person_OnDeleteClick(int IDPerson)
		{
			repo.DeletePerson(IDPerson);
			ValidDelete = true;
			Response.Redirect(Request.Url.AbsolutePath);
		}

		private void LoadPeople()
		{
			people = repo.GetPeople();

			foreach (Person person in people)
			{
				BindPersonDataToPersonControl(person);
			}

		}

		private void BindPersonDataToPersonControl(Person person)
		{
			PersonControl ctrl = (PersonControl)LoadControl("~/Controls/PersonControl.ascx");
			ctrl.Person = person;
			ctrl.SetPersonData();
			ctrl.OnDeleteClick += Person_OnDeleteClick;
			ctrl.OnUpdateClick += Person_OnUpdateClick;
			ctrl.ID = "ctrl" + person.IDPerson;
			ctrlContainer.Controls.Add(ctrl);
		}

		protected override void OnInit(EventArgs e)
		{
			base.OnInit(e);
			if (IsPostBack)
			{
				people.Clear();
				LoadPeople();
			}
		}
	}
}