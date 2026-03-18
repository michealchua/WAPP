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
        <a href="About.aspx">About</a>
        <a href="Register.aspx">Register</a>
        <a href="LoginPage.aspx">Login</a>
    </div>

    <!-- Content -->
    <div class="content">
        <div style="margin-top:20px; text-align:center;">

            <asp:Button ID="btnPDF1" runat="server" Text="Page 1" CssClass="button" OnClick="btnPDF1_Click" />
            <asp:Button ID="btnPDF2" runat="server" Text="Page 2" CssClass="button" OnClick="btnPDF2_Click" />
            <asp:Button ID="btnPDF3" runat="server" Text="Page 3" CssClass="button" OnClick="btnPDF3_Click" />

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