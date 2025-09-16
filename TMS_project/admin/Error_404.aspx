<%@ Page Title="" Language="C#" MasterPageFile="~/admin/Admin_dashboard.Master" AutoEventWireup="true" CodeBehind="Error_404.aspx.cs" Inherits="TMS_project.admin.Error_404" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<div class="container text-center mt-5">
        <i class="fas fa-search fa-5x text-warning mb-3"></i>
        <h1 class="display-4">404 - Page Not Found</h1>
        <p class="lead">The page you are looking for does not exist.</p>
        <a href="Admin_index.aspx" class="btn btn-primary"><i class="fas fa-home"></i> Back to Home</a>
    </div>

</asp:Content>
