<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AdminDashboard.aspx.cs" Inherits="Assignment.AdminDashboard" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title>Admin Dashboard</title>

    <style>
        body {
            margin: 0;
            font-family: Arial;
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
            max-width: 1000px;
            margin: 60px auto;
            text-align: center;
        }

        .card-container {
            display: flex;
            justify-content: center;
            gap: 20px;
            margin-top: 30px;
        }

        .card {
            width: 250px;
            background: white;
            border-radius: 10px;
            padding: 20px;
            box-shadow: 0 4px 8px rgba(0,0,0,0.1);
        }

        .btn {
            display: inline-block;
            padding: 10px 20px;
            background-color: #1cc88a;
            color: white;
            text-decoration: none;
            border-radius: 5px;
            margin-top: 10px;
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
<form runat="server">

    <!-- NAVBAR -->
    <div class="navbar">
        <span class="site-title">Edu2U</span>
        <a href="HomePage.aspx">Home</a>
        <a href="CourseDetails.aspx">Courses</a>
        <a href="About.aspx">About</a>

        <asp:HyperLink ID="hlRegister" runat="server" NavigateUrl="Register.aspx">Register</asp:HyperLink>
        <asp:HyperLink ID="hlLogin" runat="server" NavigateUrl="LoginPage.aspx">Login</asp:HyperLink>
        <asp:HyperLink ID="hlLogout" runat="server" NavigateUrl="Logout.aspx" Visible="false">Logout</asp:HyperLink>
    </div>

    <!-- CONTENT -->
    <div class="content">
        <h2>Admin Dashboard</h2>
        <p>Manage users, courses and reports</p>

        <div class="card-container">

            <div class="card">
                <h3>User Management</h3>
                <p>Manage users in system</p>
                <a href="<%= ResolveUrl("~/UserManagement.aspx") %>" class="btn">Manage</a>
            </div>

            <div class="card">
                <h3>Content Management</h3>
                <p>Manage courses and materials</p>
                <a href="ContentManagement.aspx" class="btn">Manage</a>
            </div>

        </div>
    </div>

    <!-- FOOTER -->
    <footer>
        © 2026 Edu2U
    </footer>

</form>
</body>
</html>
