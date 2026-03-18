using System;
using System.IO;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Assignment
{
    public partial class CourseDetails : System.Web.UI.Page
    {
        protected int CourseId = 0;
        protected int CurrentPage = 1;

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

                // 获取课程 ID
                if (int.TryParse(Request.QueryString["CourseId"], out int id))
                    CourseId = id;

                // 控制权限
                bool canUpload = (role == "Instructor" || role == "Admin");

                ddlYear.Visible = canUpload;
                ddlPage.Visible = canUpload;
                fuPdf.Visible = canUpload;
                btnUploadPdf.Visible = canUpload;

                // 默认显示 Year1 Page1
                ddlYear.SelectedValue = "Year1";
                ddlPage.SelectedValue = "1";
                ShowPdf(ddlYear.SelectedValue, CurrentPage);
            }
        }

        // 上传 PDF
        protected void btnUploadPdf_Click(object sender, EventArgs e)
        {
            string role = Session["Role"]?.ToString();
            if (role != "Instructor" && role != "Admin")
                return;

            if (fuPdf.HasFile && fuPdf.PostedFile.ContentType == "application/pdf")
            {
                string year = ddlYear.SelectedValue;
                int pageNumber = int.Parse(ddlPage.SelectedValue);

                // 创建目录
                string folderPath = Server.MapPath($"~/CourseFiles/{CourseId}/{year}/");
                if (!Directory.Exists(folderPath))
                    Directory.CreateDirectory(folderPath);

                string pdfFileName = $"Page{pageNumber}.pdf";
                string savePath = Path.Combine(folderPath, pdfFileName);

                // 保存文件
                fuPdf.SaveAs(savePath);

                // 上传完成后显示 PDF
                ShowPdf(year, pageNumber);
            }
        }

        // Page1/Page2/Page3 切换按钮
        protected void btnPage_Click(object sender, EventArgs e)
        {
            Button btn = (Button)sender;
            int pageNumber = int.Parse(btn.CommandArgument);
            CurrentPage = pageNumber;
            ShowPdf(ddlYear.SelectedValue, CurrentPage);
        }

        // Back 按钮
        protected void btnBack_Click(object sender, EventArgs e)
        {
            Response.Redirect("HomePage.aspx");
        }

        // 显示 PDF
        private void ShowPdf(string year, int pageNumber)
        {
            string filePath = Server.MapPath($"~/CourseFiles/{CourseId}/{year}/Page{pageNumber}.pdf");
            if (File.Exists(filePath))
            {
                pdfViewer.Attributes["src"] = ResolveUrl($"~/CourseFiles/{CourseId}/{year}/Page{pageNumber}.pdf");
            }
            else
            {
                pdfViewer.Attributes["src"] = ""; // 没有 PDF 就清空
            }
        }
    }
}
