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
        <h1>Welcome to Our Learning System </h1>
        <p>Explore digital learning resources anytime</p>
        <a href="Register.aspx" class="button">Register Now</a>
    </div>

    <!-- Content Section -->
    <div class="content">
        <div>
            <h2>Featured Courses</h2>
            <p>Cybersecurity, Finance, Physchology, and more.</p>
        </div>
    </div>

<div class="content">

    <h2>Featured Courses</h2>
    <p>Cybersecurity, Finance, Psychology, and more.</p>

    <div class="course-container">

        <asp:Repeater ID="RepeaterCourses" runat="server">

            <ItemTemplate>

                <div class="course-card">

                    <h3><%# Eval("CourseName") %></h3>

                    <p class="category">
                        Category: <%# Eval("Category") %>
                    </p>

                    <p>
                        <%# Eval("Description") %>
                    </p>

                    <a href='CourseDetails.aspx?id=<%# Eval("CourseId") %>' 
                       class="course-button">
                       View Course
                    </a>

                </div>

            </ItemTemplate>

        </asp:Repeater>

    </div>

</div>
    <!-- Footer -->
    <footer>
        © 2026 Edu2U
    </footer>

</form>
</body>
</html>
