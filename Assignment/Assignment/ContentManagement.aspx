<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ContentManagement.aspx.cs" Inherits="Assignment.ContentManagement" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Course Management</title>
    <style>
        /* ---------- Body Flex 布局 ---------- */
        html, body {
            height: 100%;
            margin: 0;
        }

        body {
            display: flex;
            flex-direction: column;
            font-family: Arial, Helvetica, sans-serif;
            background-color: #f4f6f9;
        }

        /* ---------- Navbar ---------- */
        .navbar {
            background-color: #1e1e2f;
            padding: 15px 40px;
            display: flex;
            align-items: center;
        }

        .site-title {
            font-size: 24px;
            font-weight: bold;
            color: white;
            margin-right: 40px;
        }

        .navbar a {
            color: white;
            margin-right: 20px;
            text-decoration: none;
        }

        /* ---------- 内容区域 ---------- */
        .content {
            max-width: 1000px;
            margin: 60px auto;
            text-align: center;
            flex: 1; /* 占据剩余空间 */
        }

        /* ---------- 按钮和输入框 ---------- */
        .btn {
            padding: 10px 20px;
            background-color: #1cc88a;
            color: white;
            border-radius: 5px;
            border: none;
            cursor: pointer;
        }

        .input {
            padding: 8px;
            margin: 5px;
            width: 200px;
        }

        /* ---------- GridView ---------- */
        .gridview {
            width: 100%;
            border-collapse: collapse;
            background: white;
            border-radius: 10px;
            overflow: hidden;
            box-shadow: 0 4px 8px rgba(0,0,0,0.1);
        }

        .gridview th {
            background-color: #4e73df;
            color: white;
            padding: 12px;
        }

        .gridview td {
            padding: 10px;
            text-align: center;
        }

        .gridview tr:nth-child(even) {
            background-color: #f2f2f2;
        }

        .gridview tr:hover {
            background-color: #d1e7ff;
        }

        /* ---------- Footer ---------- */
        footer {
            text-align: center;
            padding: 20px;
            background: #1e1e2f;
            color: white;
        }
    </style>
</head>
<body>
<form id="form1" runat="server">

    <!-- Navbar -->
    <div class="navbar">
        <span class="site-title">Edu2U</span>
        <a href="HomePage.aspx">Home</a>

        <asp:HyperLink ID="hlRegister" runat="server" NavigateUrl="Register.aspx">Register</asp:HyperLink>
        <asp:HyperLink ID="hlLogin" runat="server" NavigateUrl="LoginPage.aspx">Login</asp:HyperLink>
        <asp:HyperLink ID="hlLogout" runat="server" NavigateUrl="Logout.aspx" Visible="false">Logout</asp:HyperLink>
    </div>

    <!-- Main Content -->
    <div class="content">

        <h2>Course Management</h2>

        <asp:TextBox ID="txtName" runat="server" CssClass="input" Placeholder="Course Name"/>
        <asp:TextBox ID="txtCategory" runat="server" CssClass="input" Placeholder="Category"/>
        <asp:TextBox ID="txtDesc" runat="server" CssClass="input" Placeholder="Description"/>
        <asp:Button ID="btnAddCourse" runat="server" Text="Add Course" CssClass="btn" OnClick="btnAddCourse_Click"/>

        <br /><br />

        <asp:GridView ID="GridViewCourses" runat="server" AutoGenerateColumns="False"
            DataKeyNames="CourseId"
            CssClass="gridview"
            OnRowEditing="GridViewCourses_RowEditing"
            OnRowUpdating="GridViewCourses_RowUpdating"
            OnRowDeleting="GridViewCourses_RowDeleting"
            OnRowCancelingEdit="GridViewCourses_RowCancelingEdit">

            <Columns>

                <asp:BoundField DataField="CourseId" HeaderText="ID" ReadOnly="true" />

                <asp:TemplateField HeaderText="Course Name">
                    <ItemTemplate>
                        <%# Eval("CourseName") %>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:TextBox ID="txtEditCourseName" runat="server" Text='<%# Bind("CourseName") %>' CssClass="input" />
                    </EditItemTemplate>
                </asp:TemplateField>

                <asp:TemplateField HeaderText="Category">
                    <ItemTemplate>
                        <%# Eval("Category") %>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:TextBox ID="txtEditCategory" runat="server" Text='<%# Bind("Category") %>' CssClass="input" />
                    </EditItemTemplate>
                </asp:TemplateField>

                <asp:TemplateField HeaderText="Description">
                    <ItemTemplate>
                        <%# Eval("Description") %>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:TextBox ID="txtEditDesc" runat="server" Text='<%# Bind("Description") %>' CssClass="input" />
                    </EditItemTemplate>
                </asp:TemplateField>

                <asp:CommandField ShowEditButton="true" ShowDeleteButton="true" />

            </Columns>
        </asp:GridView>

    </div>

    <!-- Footer -->
    <footer>© 2026 Edu2U</footer>

</form>
</body>
</html>