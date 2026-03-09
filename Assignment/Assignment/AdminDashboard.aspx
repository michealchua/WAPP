<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AdminDashboard.aspx.cs" Inherits="Assignment.AdminDashboard" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:Panel ID="Panel1" runat="server">
            </asp:Panel>
        </div>
        <asp:Panel ID="pnlAdminDashboard" runat="server" BackColor="Black">
            <asp:Label ID="lblAdminTitle" runat="server" Text="Admin Course Management" Font-Bold="True" Font-Size="XX-Large" ForeColor="White"></asp:Label>
        </asp:Panel>
        <p>
            &nbsp;</p>
        <p>
            &nbsp;</p>
        <p>
            &nbsp;</p>
        <asp:Panel ID="Panel3" runat="server">
            <asp:Label ID="lblCourseName" runat="server" Text="Course Name: " Font-Bold="True"></asp:Label>
            &nbsp;&nbsp;
            <asp:TextBox ID="txtCourseName" runat="server"></asp:TextBox>
            <br />
            <asp:Label ID="lblDescription" runat="server" Font-Bold="True" Text="Description: "></asp:Label>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:TextBox ID="txtDescription" runat="server"></asp:TextBox>
            <br />
            <asp:Label ID="lblCategory" runat="server" Font-Bold="True" Text="Category: "></asp:Label>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:DropDownList ID="ddlCategory" runat="server">
                <asp:ListItem>Programming</asp:ListItem>
                <asp:ListItem Value="Business">Bussiness</asp:ListItem>
                <asp:ListItem>Design</asp:ListItem>
                <asp:ListItem>Cybersecurity</asp:ListItem>
            </asp:DropDownList>
            <br />
            <br />
            <asp:Button ID="btnAdd" runat="server" Font-Bold="True" OnClick="btnAdd_Click" Text="ADD" />
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Button ID="btnUpdate" runat="server" Font-Bold="True" OnClick="btnUpdate_Click" Text="UPDATE" />
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Button ID="btnDelete" runat="server" Font-Bold="True" OnClick="btnDelete_Click" Text="DELETE" />
            <br />
            <br />
            <asp:GridView ID="GridView1" runat="server" AutoGenerateSelectButton="True" OnSelectedIndexChanged="GridView1_SelectedIndexChanged">
            </asp:GridView>
            <br />
        </asp:Panel>
    </form>
    <p>
        &nbsp;</p>
    <p>
        &nbsp;</p>
    <p>
        &nbsp;</p>
    <p>
        &nbsp;</p>
    <p>
        &nbsp;</p>
    <p>
        &nbsp;</p>
    <p>
        &nbsp;</p>
    <p>
        &nbsp;</p>
    <p>
        &nbsp;</p>
    <p>
        &nbsp;</p>
    <p>
        &nbsp;</p>
    <p>
        &nbsp;</p>
    <p>
        &nbsp;</p>
    <p>
        &nbsp;</p>
</body>
</html>
