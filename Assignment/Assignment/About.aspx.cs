using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Assignment
{
    public partial class About : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
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
                        hlAdminDashboard.Visible = true;
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
