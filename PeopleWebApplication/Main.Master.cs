using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace PeopleWebApplication
{
	public partial class Main : System.Web.UI.MasterPage
	{
		private LinkButton lastClicked = new LinkButton();

		public string LabelTitle
		{
			get
			{
				return lblTitle.Text;
			}
			set
			{
				lblTitle.Text = value;
			}
		}

		public string Title
		{
			get
			{
				return htmlTitle.Text;
			}
			set
			{
				htmlTitle.Text = value;
			}
		}

		public string ButtonUser
		{
			get
			{
				return btnAdminAdmin.Text;
			}
			set
			{
				btnAdminAdmin.Text = value;
			}
		}



		protected void Page_Load(object sender, EventArgs e)
		{

		}

		protected void lbSetup_Click(object sender, EventArgs e)
		{
			CheckIfUserIsLoggedIn();
			Response.Redirect("Setup.aspx");
		}

		protected void lbAddPerson_Click(object sender, EventArgs e)
		{
			CheckIfUserIsLoggedIn();
			Response.Redirect("AddPerson.aspx");
		}


		protected void lbUpdatePeople_Click(object sender, EventArgs e)
		{

			CheckIfUserIsLoggedIn();
			Response.Redirect("UpdatePerson.aspx");
		}

		protected void lbShowPeople_Click(object sender, EventArgs e)
		{
			CheckIfUserIsLoggedIn();
			Response.Redirect("PersonList.aspx");
		}

		private void ChangeButtonOnClick(LinkButton button)
		{
			button.CssClass = "btn btn-primary";
		}

		protected void btnLogOut_Click(object sender, EventArgs e)
		{
			if (Request.Cookies["user"] != null)
			{
				HttpCookie myCookie = new HttpCookie("user");
				myCookie.Expires = DateTime.Now.AddDays(-1d);
				Response.Cookies.Add(myCookie);
				Response.Redirect("Login.aspx");
			}
		}

		private void CheckIfUserIsLoggedIn()
		{
			var user = Request.Cookies["user"];
			if (user == null)
			{
				Response.Redirect("Login.aspx");
			}
			else if (user["status"] != "Admin")
			{
				Response.Redirect("PersonList.aspx");
			}
		}

		protected override void OnInit(EventArgs e)
		{
			base.OnInit(e);
			SetRepository();
		}
		private void SetRepository()
		{

			if (Request.Cookies["repo"] != null)
			{
				var repository = Request.Cookies["repo"].Value;
				if (repository == "database")
				{

					lblRepo.Text = "Repository-Database";

				}
				else
				{
					lblRepo.Text = "Repository-TextFile";
				}
			}
			else
			{
				lblRepo.Text = "Repository-Database";
			}
		}

	}
}