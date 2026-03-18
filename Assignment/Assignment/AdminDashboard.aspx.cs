using System;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI.WebControls;

namespace Assignment
{
    public partial class AdminDashboard : System.Web.UI.Page
    {
        string connStr = System.Configuration.ConfigurationManager.ConnectionStrings["Edu2U"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Role"] == null || Session["Role"].ToString() != "Administrator")
            {
                if (!IsPostBack)
                {
                    string role = Session["Role"]?.ToString();
                    if (!string.IsNullOrEmpty(role))
                    {
                        // 用户已登录
                        hlRegister.Visible = false;
                        hlLogin.Visible = false;
                        hlLogout.Visible = true;

                        // 额外处理 Admin/Instructor 导航
                        if (role == "Admin")
                        {
                            // 可以显示 AdminDashboard 链接
                        }
                    }
                    else
                    {
                        hlRegister.Visible = true;
                        hlLogin.Visible = true;
                        hlLogout.Visible = false;
                    }
                }
            }
        }
        
    }
}
