using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI.WebControls;

namespace Assignment
{
    public partial class HomePage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                string role = Session["Role"]?.ToString();
                if (!string.IsNullOrEmpty(role))
                {
                    // ?????
                    hlRegister.Visible = false;
                    hlLogin.Visible = false;
                    hlLogout.Visible = true;

                    // ???? Admin/Instructor ??
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
                    hlAdminDashboard.Visible = false;
                }
                LoadCourses();
            }
        }

        private void LoadCourses()
        {
            DataTable dt = new DataTable();
            using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["Edu2U"].ConnectionString))
            using (SqlCommand cmd = new SqlCommand("SELECT * FROM Courses", con))
            using (SqlDataAdapter da = new SqlDataAdapter(cmd))
            {
                da.Fill(dt);
            }

            // 2?? ???????????
            CourseContainer.Controls.Clear();

            // 3?? ????????
            foreach (DataRow row in dt.Rows)
            {
                Panel card = new Panel();
                card.CssClass = "course-card";

                HyperLink hl = new HyperLink();
                hl.NavigateUrl = $"CourseDetails.aspx?CourseId={row["CourseId"]}";
                hl.Text = row["CourseName"].ToString();
                hl.CssClass = "course-name";

                Label lblDesc = new Label();
                lblDesc.Text = "<br/>" + row["Description"].ToString();
                lblDesc.CssClass = "course-desc";

                card.Controls.Add(hl);
                card.Controls.Add(lblDesc);

                CourseContainer.Controls.Add(card); // CourseContainer ???? Panel ??
            }
        }
    }
}
