using System;
using System.Configuration;
using System.Data.SqlClient;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Assignment
{
    public partial class ContentManagement : System.Web.UI.Page
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
                        // 可以显示 AdminDashboard 链接
                    }
                }
                else
                {
                    hlRegister.Visible = true;
                    hlLogin.Visible = true;
                    hlLogout.Visible = false;
                }
                // 这里可以绑定 GridView 数据
                BindCourses();
            }
        }

        // ---------------- 事件处理方法 ----------------
        protected void btnAddCourse_Click(object sender, EventArgs e)
        {
            string name = txtName.Text.Trim();
            string category = txtCategory.Text.Trim();
            string desc = txtDesc.Text.Trim();

            string query = "INSERT INTO Course (CourseName, Category, Description) VALUES (@name,@category,@desc)";
            using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["Edu2U"].ConnectionString))
            using (SqlCommand cmd = new SqlCommand(query, con))
            {
                cmd.Parameters.AddWithValue("@name", name);
                cmd.Parameters.AddWithValue("@category", category);
                cmd.Parameters.AddWithValue("@desc", desc);
                con.Open();
                cmd.ExecuteNonQuery();
            }

            // 清空输入框
            txtName.Text = "";
            txtCategory.Text = "";
            txtDesc.Text = "";

            BindCourses(); // 刷新 GridView
        }

        // ---------------- GridView 绑定示例 ----------------
        private void BindCourses()
        {
            // 示例：你可以从数据库读取课程表并绑定
            // GridViewCourses.DataSource = YourDataSource;
            // GridViewCourses.DataBind();
        }

        // 这里可以加 GridView 的编辑、更新、删除事件处理
        protected void GridViewCourses_RowEditing(object sender, GridViewEditEventArgs e)
        {
            GridViewCourses.EditIndex = e.NewEditIndex;
            BindCourses();
        }

        protected void GridViewCourses_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            GridViewCourses.EditIndex = -1;
            BindCourses();
        }

        protected void GridViewCourses_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            // 获取编辑行数据
            int courseId = Convert.ToInt32(GridViewCourses.DataKeys[e.RowIndex].Value);
            TextBox txtNameEdit = (TextBox)GridViewCourses.Rows[e.RowIndex].FindControl("txtEditCourseName");
            TextBox txtCategoryEdit = (TextBox)GridViewCourses.Rows[e.RowIndex].FindControl("txtEditCategory");
            TextBox txtDescEdit = (TextBox)GridViewCourses.Rows[e.RowIndex].FindControl("txtEditDesc");

            string name = txtNameEdit.Text.Trim();
            string category = txtCategoryEdit.Text.Trim();
            string desc = txtDescEdit.Text.Trim();

            // 更新数据库逻辑，例如 UpdateCourse(courseId, name, category, desc);

            GridViewCourses.EditIndex = -1;
            BindCourses();
        }

        protected void GridViewCourses_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            int courseId = Convert.ToInt32(GridViewCourses.DataKeys[e.RowIndex].Value);

            // 删除数据库逻辑，例如 DeleteCourse(courseId);

            BindCourses();
        }
    }
}