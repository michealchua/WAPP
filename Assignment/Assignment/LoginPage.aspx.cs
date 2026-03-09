using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Assignment
{
    public partial class LoginPage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            if (string.IsNullOrWhiteSpace(txtUsername.Text) || string.IsNullOrWhiteSpace(txtPassword.Text))
            {
                lblMessage.Text = "Please enter username and password!";
                return;
            }

            string cs = ConfigurationManager.ConnectionStrings["Edu2U"].ConnectionString;
            using (SqlConnection con = new SqlConnection(cs))
            {
                string query = "SELECT COUNT(*) FROM Users WHERE Username=@Username AND Password=@Password AND Role=@Role";
                SqlCommand cmd = new SqlCommand(query, con);
                cmd.Parameters.AddWithValue("@Username", txtUsername.Text);
                cmd.Parameters.AddWithValue("@Password", txtPassword.Text); // 真正项目请加密
                cmd.Parameters.AddWithValue("@Role", ddlRole.SelectedValue);

                con.Open();
                int count = (int)cmd.ExecuteScalar();
                con.Close();

                if (count > 0)
                {
                    // 登录成功，跳转到主页或管理员页面
                    if (ddlRole.SelectedValue == "Admin")
                        Response.Redirect("AdminDashboard.aspx");
                    else
                        Response.Redirect("HomePage.aspx");
                }
                else
                {
                    lblMessage.Text = "Invalid credentials!";
                }
            }
        }
    }
}