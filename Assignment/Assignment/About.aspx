<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="About.aspx.cs" Inherits="Assignment.About" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title>About Us</title>

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

        .hero h1 {
            font-size: 48px;
            margin-bottom: 10px;
        }

        .content {
            max-width: 900px;
            margin: 60px auto;
            padding: 20px;
            text-align: center;
        }

        .card {
            background: white;
            padding: 30px;
            margin-top: 30px;
            border-radius: 10px;
            box-shadow: 0 4px 10px rgba(0,0,0,0.1);
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
    <!-- Navbar -->
    <div class="navbar">
        <span class="site-title">Edu2U</span>
        <a href="HomePage.aspx">Home</a>
        <a href="About.aspx">About</a>
        <a href="CourseList.aspx">Courses</a>
        <a href="Register.aspx">Register</a>
        <a href="LoginPage.aspx">Login</a>
    </div>

    <form id="form1" runat="server">

        <div class="hero">
            <h1>About Our System</h1>
            <p>Simple. Clean. Professional.</p>
        </div>

        <div class="content">
            <div class="card">
                <h2>Who We Are</h2>
                <p>
                    This Website is built for people to learn more skills and knowledge on the online.
                    It includes various of courses inside.
                </p>
            </div>

            <div class="card">
                <h2>Our Mission</h2>
                <p>
                    To help all people to learn all of the knowledge that
                    they interested in.
                </p>
            </div>
        </div>

        <footer>
            © 2026 Edu2U
        </footer>

    </form>

</body>
</html>