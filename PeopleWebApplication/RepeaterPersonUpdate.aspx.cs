using PeopleWebApplication.Models;
using System;
using System.Linq;

namespace PeopleWebApplication
{
	public partial class RepeaterPersonUpdate : CentralPage
	{
		public int PersonId
		{
			get
			{
				if (Session["personId"] == null)
					Session["personId"] = 0;
				return (int)Session["personId"];
			}
			set { Session["personId"] = value; }
		}
		protected void Page_Load(object sender, EventArgs e)
		{
			if (!IsPostBack)
			{
				LoadPerson();
			}

			ctrl.OnUpdateClick += Ctrl_OnUpdateClick;
			ctrl.OnDeleteClick += Ctrl_OnDeleteClick;

			ToastrUpdateAndDelete();
		}


		private void Ctrl_OnDeleteClick(int IDPerson)
		{
			repo.DeletePerson(IDPerson);
			ValidDelete = true;
			Response.Redirect("~/PersonList.aspx");
		}

		private void Ctrl_OnUpdateClick(Person person, bool emailUpdated)
		{
			repo.UpdatePerson(person, person.IDPerson);
			EmailUpdate = emailUpdated;
			ValidUpdate = true;
			Response.Redirect(Request.Url.AbsolutePath);
		}

		private void LoadPerson()
		{
			Person person = repo.GetPeople()
				.Where(p => p.IDPerson == PersonId)
				.FirstOrDefault();

			ctrl.Person = person;
			ctrl.SetPersonData();
			ctrl.OnUpdateClick += Ctrl_OnUpdateClick;
			ctrl.OnDeleteClick += Ctrl_OnDeleteClick;
			ctrl.ID = "ctrl" + person.IDPerson;

		}

		public void ShowPersonControl(int personID)
		{
			PersonId = personID;
		}
		protected override void OnInit(EventArgs e)
		{
			base.OnInit(e);
			if (IsPostBack)
			{
				LoadPerson();
			}
		}
	}
}