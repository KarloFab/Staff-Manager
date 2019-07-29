using System;

namespace PeopleWebApplication
{
	public partial class Error : CentralPage
	{
		protected void Page_Load(object sender, EventArgs e)
		{

		}

		protected void btnLoginPage_Click(object sender, EventArgs e)
		{
			Response.Redirect("Login.aspx");
		}
		protected override void OnPreInit(EventArgs e)
		{
			base.OnPreInit(e);

		}
	}
}