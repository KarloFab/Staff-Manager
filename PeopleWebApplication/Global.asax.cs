using System;

namespace PeopleWebApplication
{
	public class Global : System.Web.HttpApplication
	{
		protected void Application_Start(object sender, EventArgs e)
		{
		}
		protected void Application_Error(object sender, EventArgs e)
		{
			var err = Server.GetLastError().GetBaseException().Message;
			var errorEncoded = Server.UrlEncode(err);
			Response.Redirect("Error.aspx?err=" + errorEncoded);
		}
	}
}