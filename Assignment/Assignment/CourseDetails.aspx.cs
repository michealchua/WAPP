using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Assignment
{
    public partial class CourseDetails : System.Web.UI.Page
    {
        string level;

        protected void Page_Load(object sender, EventArgs e)
        {
            ViewState["level"] = level;

            if (!IsPostBack)
            {
                level = Request.QueryString["level"];

                switch (level)
                {
                    case "1":
                        lblTitle.Text = "Mathematics Year 1";
                        lblContent.Text = "Numbers, Counting and Comparing Numbers.";
                        pdfViewer.Src = "Materials/y1_p1.pdf";
                        break;

                    case "2":
                        lblTitle.Text = "Mathematics Year 2";
                        lblContent.Text = "Numbers and Counting.";
                        pdfViewer.Src = "Materials/y2_p1.pdf";
                        break;

                    case "3":
                        lblTitle.Text = "Mathematics Year 3";
                        lblContent.Text = "Rounding and Place Value.";
                        pdfViewer.Src = "Materials/y3_p1.pdf";

                        break;

                    case "4":
                        lblTitle.Text = "Mathematics Year 4";
                        lblContent.Text = "Rounding and Place Value.";
                        pdfViewer.Src = "Materials/y4_p1.pdf";
                        break;

                    case "5":
                        lblTitle.Text = "Mathematics Year 5";
                        lblContent.Text = "Number Sense & Place Value.";
                        pdfViewer.Src = "Materials/y5_p1.pdf";
                        break;

                    case "6":
                        lblTitle.Text = "Mathematics Year 6";
                        lblContent.Text = "Operations with Integers.";
                        pdfViewer.Src = "Materials/y6_p1.pdf";
                        break;

                }
            }
        }

        protected void btnBack_Click(object sender, EventArgs e)
        {
            Response.Redirect("HomePage.aspx");
        }

        protected void btnPDF1_Click(object sender, EventArgs e)
        {
            string level = Request.QueryString["level"];
            pdfViewer.Src = "Materials/y" + level + "_p1.pdf";
        }

        protected void btnPDF2_Click(object sender, EventArgs e)
        {
            string level = Request.QueryString["level"];
            pdfViewer.Src = "Materials/y" + level + "_p2.pdf";
        }

        protected void btnPDF3_Click(object sender, EventArgs e)
        {
            string level = Request.QueryString["level"];
            pdfViewer.Src = "Materials/y" + level + "_p3.pdf";
        }
    }
}