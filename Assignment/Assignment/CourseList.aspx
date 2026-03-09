<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CourseList.aspx.cs" Inherits="Assignment.CourseList" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title>Course List</title>

    <style>
        body {
            margin: 0;
            font-family: Arial, Helvetica, sans-serif;
            background-color: #f4f6f9;
        }

        .site-title {
            font-size: 24px;
            font-weight: bold;
            color: white;
            margin-right: 40px;
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

        .hero {
            text-align: center;
            padding: 60px 20px;
            background: linear-gradient(135deg, #4e73df, #1cc88a);
            color: white;
        }

        .content {
            max-width: 900px;
            margin: 40px auto;
            padding: 20px;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            background-color: white;
        }

        table th, table td {
            padding: 12px;
            border: 1px solid #ddd;
            text-align: left;
        }

        table th {
            background-color: #1e1e2f;
            color: white;
        }

        .button {
            display: inline-block;
            padding: 6px 12px;
            background-color: #1cc88a;
            color: white;
            text-decoration: none;
            border-radius: 4px;
        }

        footer {
            text-align: center;
            padding: 20px;
            background: #1e1e2f;
            color: white;
            margin-top: 40px;
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
        <a href="CourseList.aspx">Courses</a>
        <a href="Register.aspx">Register</a>
        <a href="LoginPage.aspx">Login</a>
    </div>

    <!-- Hero Section -->
    <div class="hero">
        <h1>Available Courses</h1>
        <p>Browse our courses and enhance your learning</p>
    </div>

    <!-- Content Section -->
    <div class="content">
        <asp:GridView ID="gvCourses" runat="server" AutoGenerateColumns="False" CssClass="course-table" DataKeyNames="CourseId" DataSourceID="SqlDataSource1">
            <Columns>
                <asp:BoundField DataField="CourseId" HeaderText="CourseId" InsertVisible="False" ReadOnly="True" SortExpression="CourseId" />
                <asp:BoundField DataField="CourseName" HeaderText="CourseName" SortExpression="CourseName" />
                <asp:BoundField DataField="Description" HeaderText="Description" SortExpression="Description" />
                <asp:BoundField DataField="Category" HeaderText="Category" SortExpression="Category" />
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:Edu2U %>" SelectCommand="SELECT * FROM [Courses]"></asp:SqlDataSource>
    </div>

    <!-- Footer -->
    <footer>
        © 2026 Edu2U
    </footer>

</form>
</body>
</html>