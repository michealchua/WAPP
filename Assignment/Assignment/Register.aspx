<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="Assignment.Register" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title>Register</title>

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

        .form-container {
            max-width: 400px;
            margin: 40px auto;
            padding: 30px;
            background-color: white;
            border-radius: 10px;
            box-shadow: 0 4px 10px rgba(0,0,0,0.1);
        }

        .form-container h2 {
            text-align: center;
            margin-bottom: 20px;
        }

        .form-container input[type=text],
        .form-container input[type=password],
        .form-container select {
            width: 100%;
            padding: 10px;
            margin: 8px 0 15px 0;
            border: 1px solid #ccc;
            border-radius: 5px;
        }

        .form-container input[type=submit] {
            width: 100%;
            padding: 10px;
            background-color: #1cc88a;
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            font-size: 16px;
        }

        .form-container input[type=submit]:hover {
            background-color: #17a673;
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
        <h1>Create Your Account</h1>
        <p>Join our learning platform now</p>
    </div>

    <!-- Registration Form -->
    <div class="form-container">
        <h2>Register</h2>
        <asp:Label ID="lblMessage" runat="server" ForeColor="Red"></asp:Label>

        <asp:TextBox ID="txtUsername" runat="server" placeholder="Username"></asp:TextBox>
        <asp:TextBox ID="txtPassword" runat="server" TextMode="Password" placeholder="Password"></asp:TextBox>

        <asp:DropDownList ID="ddlRole" runat="server">
            <asp:ListItem Text="Student" Value="Student" />
            <asp:ListItem Text="Instructor" Value="Instructor" />
        </asp:DropDownList>

        <asp:Button ID="btnRegister" runat="server" Text="Register" OnClick="btnRegister_Click" />
    </div>

    <!-- Footer -->
    <footer>
        © 2026 Edu2U
    </footer>

</form>
</body>
</html>