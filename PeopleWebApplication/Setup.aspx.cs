using System;
using System.Threading;
using System.Web;
using System.Web.UI.WebControls;

namespace PeopleWebApplication
{
	public partial class Setup : CentralPage
	{

		protected void Page_Load(object sender, EventArgs e)
		{
			SetMasterPage();

		}

		private void SetMasterPage()
		{

			if (Thread.CurrentThread.CurrentCulture.Name == "hr")
			{
				Master.LabelTitle = "Postavke";
				Master.Title = "Postavke";
			}
			else
			{
				Master.LabelTitle = "Setup";
				Master.Title = "Setup";
			}
			Master.ButtonUser = Request.Cookies["user"]["username"];
			(Master.FindControl("lbSetup") as LinkButton).CssClass = "btn btn-primary";
		}

		protected void ddlTheme_SelectedIndexChanged(object sender, EventArgs e)
		{
			HttpCookie cookie = new HttpCookie("theme");
			cookie.Value = ddlTheme.SelectedValue;
			Response.Cookies.Add(cookie);

			Response.Redirect(Request.Url.AbsolutePath);

		}

		protected void ddlRepo_SelectedIndexChanged(object sender, EventArgs e)
		{
			HttpCookie cookie = new HttpCookie("repo");
			cookie.Value = ddlRepo.SelectedValue;
			Response.Cookies.Add(cookie);

			DeleteCookie();
			Response.Redirect("Login.aspx");

		}

		private void DeleteCookie()
		{
			HttpCookie myCookie = new HttpCookie("user");
			myCookie.Expires = DateTime.Now.AddDays(-1d);
			Response.Cookies.Add(myCookie);
		}

		protected void ddlLang_SelectedIndexChanged(object sender, EventArgs e)
		{
			HttpCookie cookie = new HttpCookie("language");
			cookie.Value = ddlLang.SelectedValue;
			Response.Cookies.Add(cookie);
			Response.Redirect(Request.Url.AbsolutePath);
		}
	}
}