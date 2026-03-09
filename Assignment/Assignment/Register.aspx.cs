using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Assignment
{
    public partial class Register : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnRegister_Click(object sender, EventArgs e)
        {
            if (string.IsNullOrWhiteSpace(txtUsername.Text) || string.IsNullOrWhiteSpace(txtPassword.Text))
            {
                lblMessage.Text = "Username and password are required!";
                return;
            }

            // 连接数据库插入用户
            string cs = ConfigurationManager.ConnectionStrings["Edu2U"].ConnectionString;
            using (SqlConnection con = new SqlConnection(cs))
            {
                string query = "INSERT INTO Users (Username, Password, Role) VALUES (@Username, @Password, @Role)";
                SqlCommand cmd = new SqlCommand(query, con);
                cmd.Parameters.AddWithValue("@Username", txtUsername.Text);
                cmd.Parameters.AddWithValue("@Password", txtPassword.Text); // 真实项目请加密
                cmd.Parameters.AddWithValue("@Role", ddlRole.SelectedValue);

                con.Open();
                cmd.ExecuteNonQuery();
                con.Close();
            }

            lblMessage.ForeColor = System.Drawing.Color.Green;
            lblMessage.Text = "Registration successful!";
        }
    }
}