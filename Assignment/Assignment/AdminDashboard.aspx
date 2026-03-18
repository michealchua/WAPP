<%@ Page Title="Admin Dashboard" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="AdminDashboard.aspx.cs" Inherits="Assignment.AdminDashboard" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container mt-5">
        <h2 class="mb-4 text-danger">System Administrator Dashboard</h2>
        <hr />
        
        <div class="row">
            <div class="col-md-4 mb-4">
                <div class="card h-100 shadow-sm bg-light">
                    <div class="card-body text-center">
                        <h5 class="card-title text-dark">User Management</h5>
                        <p class="card-text">View, edit, or delete registered users in the system (students/teachers).</p>
                        <a href="UserManagement.aspx" class="btn btn-dark">Manage Users</a>
                    </div>
                </div>
            </div>

            <div class="col-md-4 mb-4">
                <div class="card h-100 shadow-sm bg-light">
                    <div class="card-body text-center">
                        <h5 class="card-title text-dark">Content Management</h5>
                        <p class="card-text">Review, update, or remove learning materials on the platform.</p>
                        <a href="ContentManagement.aspx" class="btn btn-dark">Manage Content</a>
                    </div>
                </div>
            </div>

            <div class="col-md-4 mb-4">
                <div class="card h-100 shadow-sm bg-light">
                    <div class="card-body text-center">
                        <h5 class="card-title text-dark">Generate Reports</h5>
                        <p class="card-text">View system usage statistics and data reports.</p>
                        <a href="Report.aspx" class="btn btn-dark">View Reports</a>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>