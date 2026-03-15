using System;

namespace Assignment
{
    public partial class AdminDashboard : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // 权限验证：必须是 Administrator 才能访问
            if (Session["Role"] == null || Session["Role"].ToString() != "Administrator")
            {
                Response.Redirect("LoginPage.aspx");
            }
        }
    }
}