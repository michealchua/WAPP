<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="UserManagement.aspx.cs" Inherits="Assignment.UserManagement" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>User Management</title>
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
            flex: 1; /* 占据剩余空间，保证 footer 在底部 */
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
<form runat="server">

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

        <h2>User Management</h2>

        <asp:TextBox ID="txtUsername" runat="server" CssClass="input" Placeholder="Username"/>
        <asp:TextBox ID="txtPassword" runat="server" CssClass="input" 
            Placeholder="Password" TextMode="Password" />
        <asp:DropDownList ID="ddlRole" runat="server" CssClass="input">
            <asp:ListItem Text="Student" Value="Student"></asp:ListItem>
            <asp:ListItem Text="Admin" Value="Admin"></asp:ListItem>
            <asp:ListItem Text="Instructor" Value="Instructor"></asp:ListItem>
        </asp:DropDownList>
        <asp:Button ID="btnAdd" runat="server" Text="Add" CssClass="btn" OnClick="btnAdd_Click"/>

        <br /><br />

        <asp:GridView ID="GridViewUsers" runat="server" AutoGenerateColumns="False"
            DataKeyNames="UserId"
            CssClass="gridview"
            OnRowEditing="GridViewUsers_RowEditing"
            OnRowUpdating="GridViewUsers_RowUpdating"
            OnRowDeleting="GridViewUsers_RowDeleting"
            OnRowCancelingEdit="GridViewUsers_RowCancelingEdit">

            <Columns>

                <asp:BoundField DataField="UserId" HeaderText="ID" ReadOnly="true" />

                <asp:TemplateField HeaderText="Username">
                    <ItemTemplate>
                        <%# Eval("Username") %>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:TextBox ID="txtEditUsername" runat="server"
                            Text='<%# Bind("Username") %>' CssClass="input" />
                    </EditItemTemplate>
                </asp:TemplateField>

                <asp:TemplateField HeaderText="Password">
                    <ItemTemplate>
                        ****** <!-- 显示隐藏密码 -->
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:TextBox ID="txtEditPassword" runat="server"
                            Text='<%# Bind("Password") %>' CssClass="input" TextMode="Password" />
                    </EditItemTemplate>
                </asp:TemplateField>

                <asp:TemplateField HeaderText="Role">
                    <ItemTemplate>
                        <%# Eval("Role") %>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:DropDownList ID="ddlEditRole" runat="server" CssClass="input">
                            <asp:ListItem>Student</asp:ListItem>
                            <asp:ListItem>Admin</asp:ListItem>
                        </asp:DropDownList>
                    </EditItemTemplate>
                </asp:TemplateField>

                <asp:CommandField ShowEditButton="true" ShowDeleteButton="true" />

            </Columns>
        </asp:GridView>

    </div>

</form>
</body>
</html>