using PeopleWebApplication.Models;
using System;
using System.Globalization;
using System.Threading;
using System.Web.UI;

namespace PeopleWebApplication
{
	public class CentralPage : Page
	{
		protected static IRepo repo = FileRepository.GetRepo(0);

		public bool ValidDelete
		{

			get
			{
				if (Session["validDelete"] == null)
					Session["validDelete"] = false;
				return (bool)Session["validDelete"];
			}
			set { Session["validDelete"] = value; }
		}
		public bool ValidUpdate
		{

			get
			{
				if (Session["validUpdate"] == null)
					Session["validUpdate"] = false;
				return (bool)Session["validUpdate"];
			}
			set { Session["validUpdate"] = value; }
		}
		public bool EmailUpdate
		{

			get
			{
				if (Session["emailUpdate"] == null)
					Session["emailUpdate"] = false;
				return (bool)Session["emailUpdate"];
			}
			set { Session["emailUpdate"] = value; }
		}

		protected override void InitializeCulture()
		{
			base.InitializeCulture();
			if (Request.Cookies["language"] != null)
			{
				var kultura = Request.Cookies["language"].Value;
				if (kultura != "0")
				{
					Thread.CurrentThread.CurrentCulture = new CultureInfo(kultura);
					Thread.CurrentThread.CurrentUICulture = new CultureInfo(kultura);
				}
			}
		}
		protected override void OnPreInit(EventArgs e)
		{
			base.OnPreInit(e);
			if (Request.Cookies["theme"] != null)
			{
				var tema = Request.Cookies["theme"].Value;
				if (tema != "0")
				{
					Theme = tema;
				}
			}

			if (Request.Cookies["repo"] != null)
			{
				var repository = Request.Cookies["repo"].Value;
				if (repository == "database")
				{
					repo = FileRepository.GetRepo(0);

				}
				else
				{
					repo = FileRepository.GetRepo(1);
				}
			}

		}

		public void ToastrUpdateAndDelete()
		{

			if (ValidDelete)
			{
				ScriptManager.RegisterStartupScript(this, typeof(Page), "validDelete", "  $(function () { ShowToastrDelete(); });", true);
				ValidDelete = false;
			}
			if (ValidUpdate)
			{
				ScriptManager.RegisterStartupScript(this, typeof(Page), "validUpdate", "  $(function () { ShowToastrUpdate(); });", true);

				if (EmailUpdate)
				{
					ScriptManager.RegisterStartupScript(this, typeof(Page), "validEmailUpdate", "  $(function () { ShowToastrUpdateEmail(); });", true);
					EmailUpdate = false;
				}

				ValidUpdate = false;
			}
		}


	}
}