using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI.WebControls;

namespace Assignment
{
    public partial class UserManagement : System.Web.UI.Page
    {
        string connStr = ConfigurationManager.ConnectionStrings["Edu2U"].ConnectionString;

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
                        // 可以显示 AdminDashboard 链接
                    }
                }
                else
                {
                    hlRegister.Visible = true;
                    hlLogin.Visible = true;
                    hlLogout.Visible = false;
                }
                LoadUsers();
            }
        }

        void LoadUsers()
        {
            SqlConnection conn = new SqlConnection(connStr);
            string query = "SELECT * FROM Users";

            SqlDataAdapter da = new SqlDataAdapter(query, conn);
            DataTable dt = new DataTable();
            da.Fill(dt);

            GridViewUsers.DataSource = dt;
            GridViewUsers.DataBind();
        }

        // ➕ ADD USER
        protected void btnAdd_Click(object sender, EventArgs e)
        {
            SqlConnection conn = new SqlConnection(connStr);
            string query = "INSERT INTO Users (Username, Password, Role) VALUES (@Username, @Password, @Role)";

            SqlCommand cmd = new SqlCommand(query, conn);
            cmd.Parameters.AddWithValue("@Username", txtUsername.Text);
            cmd.Parameters.AddWithValue("@Password", txtUsername.Text);
            cmd.Parameters.AddWithValue("@Role", ddlRole.SelectedValue);

            conn.Open();
            cmd.ExecuteNonQuery();
            conn.Close();

            LoadUsers();
        }

        // ✏ EDIT
        protected void GridViewUsers_RowEditing(object sender, System.Web.UI.WebControls.GridViewEditEventArgs e)
        {
            GridViewUsers.EditIndex = e.NewEditIndex;
            LoadUsers();
        }

        // ❌ CANCEL EDIT
        protected void GridViewUsers_RowCancelingEdit(object sender, System.Web.UI.WebControls.GridViewCancelEditEventArgs e)
        {
            GridViewUsers.EditIndex = -1;
            LoadUsers();
        }

        // 💾 UPDATE
        protected void GridViewUsers_RowUpdating(object sender, System.Web.UI.WebControls.GridViewUpdateEventArgs e)
        {
            int id = Convert.ToInt32(GridViewUsers.DataKeys[e.RowIndex].Value);

            TextBox txtUsername = (TextBox)GridViewUsers.Rows[e.RowIndex].FindControl("txtEditUsername");
            TextBox txtPassword = (TextBox)GridViewUsers.Rows[e.RowIndex].FindControl("txtEditPassword");
            DropDownList ddlRole = (DropDownList)GridViewUsers.Rows[e.RowIndex].FindControl("ddlEditRole");

            string username = txtUsername.Text;
            string password = txtPassword.Text;
            string role = ddlRole.SelectedValue;

            SqlConnection conn = new SqlConnection(connStr);
            string query = "UPDATE Users SET Username=@Username, Password=@Password, Role=@Role WHERE UserId=@Id";

            SqlCommand cmd = new SqlCommand(query, conn);
            cmd.Parameters.AddWithValue("@Username", username);
            cmd.Parameters.AddWithValue("@Password", password);
            cmd.Parameters.AddWithValue("@Role", role);

            conn.Open();
            cmd.ExecuteNonQuery();
            conn.Close();

            GridViewUsers.EditIndex = -1;
            LoadUsers();
        }

        // 🗑 DELETE
        protected void GridViewUsers_RowDeleting(object sender, System.Web.UI.WebControls.GridViewDeleteEventArgs e)
        {
            int id = Convert.ToInt32(GridViewUsers.DataKeys[e.RowIndex].Value);

            SqlConnection conn = new SqlConnection(connStr);
            string query = "DELETE FROM Users WHERE UserId=@Id";

            SqlCommand cmd = new SqlCommand(query, conn);
            cmd.Parameters.AddWithValue("@Id", id);

            conn.Open();
            cmd.ExecuteNonQuery();
            conn.Close();

            LoadUsers();
        }
    }
}