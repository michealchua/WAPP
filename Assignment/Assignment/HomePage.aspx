<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="HomePage.aspx.cs" Inherits="Assignment.HomePage" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title>Home</title>

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
            padding: 80px 20px;
            background: linear-gradient(135deg, #4e73df, #1cc88a);
            color: white;
        }

        .content {
            max-width: 900px;
            margin: 60px auto;
            padding: 20px;
            text-align: center;
        }

        .button {
            display: inline-block;
            padding: 10px 20px;
            background-color: #1cc88a;
            color: white;
            text-decoration: none;
            border-radius: 5px;
            margin-top: 20px;
        }
        .course-container{
            display:flex;
            flex-wrap:wrap;
            justify-content:center;
            gap:20px;
            margin-top:30px;
        }
        
        .course-card{
            width:260px;
            background:white;
            border-radius:10px;
            padding:20px;
            box-shadow:0 4px 8px rgba(0,0,0,0.1);
            text-align:left;
        }
        
        .course-card h3{
            margin-top:0;
        }
        
        .category{
            font-weight:bold;
            color:#4e73df;
        }
        
        .course-button{
            display:inline-block;
            margin-top:10px;
            padding:8px 15px;
            background:#1cc88a;
            color:white;
            text-decoration:none;
            border-radius:5px;
        }

        footer {
            text-align: center;
            padding: 20px;
            background: #1e1e2f;
            color: white;
            margin-top: 60px;
        }

        .course-card {
            display: inline-block;
            width: 200px;
            padding: 15px;
            margin: 10px;
            background-color: white;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0,0,0,0.1);
            text-align: center;
        }

        .course-name {
            font-weight: bold;
            color: #4e73df;
        }

        .course-desc {
            color: #555;
            font-size: 14px;
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

    <!-- Hero Section -->
    <div class="hero">
        <h1>Welcome to Our Learning System </h1>
        <p>Explore digital learning resources anytime</p>
        <a href="Register.aspx" class="button">Register Now</a>
    </div>

    <!-- Content Section -->
    <div class="content">

        <h2>Featured Courses</h2>
        <p>Mathematics Year 1-6.</p>

        <div class="course-container">
            <asp:Panel ID="CourseContainer" runat="server"></asp:Panel>

            <div class="course-card">
                <h3>Mathematics Year 1</h3>
                <p class="category">Category: Primary School</p>
                <p>Basic counting, Numbers, Counting and Comparing Numbers.</p>
                <a href='CourseDetails.aspx?level=1' class="course-button">View Course</a>
            </div>

            <div class="course-card">
                <h3>Mathematics Year 2</h3>
                <p class="category">Category: Primary School</p>
                <p>Simple Multiplication, Numbers and Counting.</p>
                <a href='CourseDetails.aspx?level=2' class="course-button">View Course</a>
            </div>

            <div class="course-card">
                <h3>Mathematics Year 3</h3>
                <p class="category">Category: Primary School</p>
                <p>Rounding and Place Value.</p>
                <a href='CourseDetails.aspx?level=3' class="course-button">View Course</a>
            </div>

            <div class="course-card">
                <h3>Mathematics Year 4</h3>
                <p class="category">Category: Primary School</p>
                <p>Decimals, Rounding and Place Value.</p>
                <a href='CourseDetails.aspx?level=4' class="course-button">View Course</a>
            </div>

            <div class="course-card">
                <h3>Mathematics Year 5</h3>
                <p class="category">Category: Primary School</p>
                <p>Number Sense & Place Value.</p>
                <a href='CourseDetails.aspx?level=5' class="course-button">View Course</a>
            </div>

            <div class="course-card">
                <h3>Mathematics Year 6</h3>
                <p class="category">Category: Primary School</p>
                <p>Operations with Integers.</p>
                <a href='CourseDetails.aspx?level=6' class="course-button">View Course</a>
            </div>

        </div>

    </div>
    <!-- Footer -->
    <footer>
        © 2026 Edu2U
    </footer>

</form>
</body>
</html>
