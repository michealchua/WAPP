using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace Assignment
{
    public partial class AdminDashboard : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadCourses();
            }
        }

        private void LoadCourses()
        {
            string connStr = ConfigurationManager.ConnectionStrings["Edu2U"].ConnectionString;

            using (SqlConnection con = new SqlConnection(connStr))
            {
                SqlDataAdapter da = new SqlDataAdapter("SELECT * FROM Courses", con);
                DataTable dt = new DataTable();
                da.Fill(dt);

                GridView1.DataSource = dt;
                GridView1.DataBind();
            }
        }

        protected void btnAdd_Click(object sender, EventArgs e)
        {
            string connStr = ConfigurationManager.ConnectionStrings["CourtSite"].ConnectionString;

            using (SqlConnection con = new SqlConnection(connStr))
            {
                con.Open();

                string query = "INSERT INTO Courses (CourseName, Description, Category) VALUES (@Name, @Desc, @Category)";
                SqlCommand cmd = new SqlCommand(query, con);

                cmd.Parameters.AddWithValue("@Name", txtCourseName.Text);
                cmd.Parameters.AddWithValue("@Desc", txtDescription.Text);
                cmd.Parameters.AddWithValue("@Category", ddlCategory.SelectedValue);

                cmd.ExecuteNonQuery();
            }

            ClearFields();
            LoadCourses();
        }

        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            if (GridView1.SelectedRow == null)
                return;

            int id = Convert.ToInt32(GridView1.SelectedRow.Cells[1].Text);

            string connStr = ConfigurationManager.ConnectionStrings["CourtSite"].ConnectionString;

            using (SqlConnection con = new SqlConnection(connStr))
            {
                con.Open();

                string query = "UPDATE Courses SET CourseName=@Name, Description=@Desc, Category=@Category WHERE CourseId=@Id";
                SqlCommand cmd = new SqlCommand(query, con);

                cmd.Parameters.AddWithValue("@Name", txtCourseName.Text);
                cmd.Parameters.AddWithValue("@Desc", txtDescription.Text);
                cmd.Parameters.AddWithValue("@Category", ddlCategory.SelectedValue);
                cmd.Parameters.AddWithValue("@Id", id);

                cmd.ExecuteNonQuery();
            }

            ClearFields();
            LoadCourses();
        }

        protected void btnDelete_Click(object sender, EventArgs e)
        {
            if (GridView1.SelectedRow == null)
                return;

            int id = Convert.ToInt32(GridView1.SelectedRow.Cells[1].Text);

            string connStr = ConfigurationManager.ConnectionStrings["CourtSite"].ConnectionString;

            using (SqlConnection con = new SqlConnection(connStr))
            {
                con.Open();

                string query = "DELETE FROM Courses WHERE CourseId=@Id";
                SqlCommand cmd = new SqlCommand(query, con);

                cmd.Parameters.AddWithValue("@Id", id);

                cmd.ExecuteNonQuery();
            }

            ClearFields();
            LoadCourses();
        }

        private void ClearFields()
        {
            txtCourseName.Text = "";
            txtDescription.Text = "";
            ddlCategory.SelectedIndex = 0;
        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
            txtCourseName.Text = GridView1.SelectedRow.Cells[2].Text;
            txtDescription.Text = GridView1.SelectedRow.Cells[3].Text;
            ddlCategory.SelectedValue = GridView1.SelectedRow.Cells[4].Text;
        }
    }
}