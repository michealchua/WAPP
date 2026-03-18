<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CourseDetails.aspx.cs" Inherits="Assignment.CourseDetails" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title>Course Details</title>

    <style>
        body {
            margin: 0;
            font-family: Arial, Helvetica, sans-serif;
            background-color: #f4f6f9;
        }

        .navbar {
            background-color: #1e1e2f;
            padding: 15px 40px;
        }

        .navbar a {
            color: white;
            margin-right: 20px;
            text-decoration: none;
        }

        .site-title {
            font-size: 24px;
            font-weight: bold;
            color: white;
            margin-right: 40px;
        }

        .content {
            max-width: 800px;
            margin: 60px auto;
            padding: 30px;
            background: white;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0,0,0,0.1);
        }

        .title {
            font-size: 28px;
            font-weight: bold;
            color: #4e73df;
        }

        .desc {
            margin-top: 20px;
            font-size: 16px;
        }

        .btn {
            margin-top: 30px;
            padding: 10px 20px;
            background-color: #1cc88a;
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }

        footer {
            text-align: center;
            padding: 20px;
            background: #1e1e2f;
            color: white;
            margin-top: 60px;
        }
    </style>
</head>

<body>
<form id="form1" runat="server">

    <!-- Navbar -->
    <div class="navbar">
        <span class="site-title">Edu2U</span>
        <a href="HomePage.aspx">Home</a>
        <a href="CourseDetails.aspx">Courses</a>
        <a href="About.aspx">About</a>
        <asp:HyperLink ID="hlRegister" runat="server" NavigateUrl="Register.aspx">Register</asp:HyperLink>
        <asp:HyperLink ID="hlLogin" runat="server" NavigateUrl="LoginPage.aspx">Login</asp:HyperLink>
        <asp:HyperLink ID="hlLogout" runat="server" NavigateUrl="Logout.aspx" Visible="false">Logout</asp:HyperLink>
        <asp:HyperLink ID="hlAdminDashboard" runat="server" NavigateUrl="AdminDashboard.aspx" Visible="false">Admin Dashboard</asp:HyperLink>
    </div>

    <!-- Content -->
    <div class="content">
        <div style="margin-top:20px; text-align:center;">
            <asp:DropDownList ID="ddlYear" runat="server" CssClass="input">
                <asp:ListItem Text="Year 1" Value="Year1"></asp:ListItem>
                <asp:ListItem Text="Year 2" Value="Year2"></asp:ListItem>
                <asp:ListItem Text="Year 3" Value="Year3"></asp:ListItem>
                <asp:ListItem Text="Year 4" Value="Year4"></asp:ListItem>
                <asp:ListItem Text="Year 5" Value="Year5"></asp:ListItem>
                <asp:ListItem Text="Year 6" Value="Year6"></asp:ListItem>
            </asp:DropDownList>
            <br /><br />

            <!-- 选择页码 -->
            <asp:DropDownList ID="ddlPage" runat="server" CssClass="input">
                <asp:ListItem Text="Page 1" Value="1"></asp:ListItem>
                <asp:ListItem Text="Page 2" Value="2"></asp:ListItem>
                <asp:ListItem Text="Page 3" Value="3"></asp:ListItem>
            </asp:DropDownList>

            <br /><br />

            <!-- 上传控件 -->
            <asp:FileUpload ID="fuPdf" runat="server" CssClass="input" />
            <asp:Button ID="btnUploadPdf" runat="server" Text="Upload PDF" CssClass="btn" OnClick="btnUploadPdf_Click" />

            <br /><br />

            <!-- 切换 PDF 页面 -->
            <asp:Button ID="btnPage1" runat="server" Text="Page 1" CssClass="btn" OnClick="btnPage_Click" CommandArgument="1" />
            <asp:Button ID="btnPage2" runat="server" Text="Page 2" CssClass="btn" OnClick="btnPage_Click" CommandArgument="2" />
            <asp:Button ID="btnPage3" runat="server" Text="Page 3" CssClass="btn" OnClick="btnPage_Click" CommandArgument="3" />

            <br /><br />

        </div>

        <iframe id="pdfViewer" runat="server" width="100%" height="600px" style="margin-top:20px;"></iframe>
        <asp:Label ID="lblTitle" runat="server" CssClass="title"></asp:Label>

        <asp:Label ID="lblContent" runat="server" CssClass="desc"></asp:Label>

        <br />

        <asp:Button ID="btnBack" runat="server" Text="Back" CssClass="btn" OnClick="btnBack_Click" />

    </div>

    <!-- Footer -->
    <footer>
        © 2026 Edu2U
    </footer>

</form>
</body>
</html>
