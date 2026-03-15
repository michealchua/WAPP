using System;

namespace Assignment
{
    public partial class AdminDashboard : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Role"] == null || Session["Role"].ToString() != "Administrator")
            {
                Response.Redirect("LoginPage.aspx");
            }
        }
    }
}
