<%@ Page Title="" Language="C#" MasterPageFile="~/admin/Admin_dashboard.Master" AutoEventWireup="true" CodeBehind="Error_401.aspx.cs" Inherits="TMS_project.admin.Error_401" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="container text-center mt-5">
        <i class="fas fa-ban fa-5x text-danger mb-3"></i>
        <h1 class="display-4">401 - Unauthorized</h1>
        <p class="lead">You are not authorized to view this page.</p>
        <a href="Admin_index.aspx" class="btn btn-primary"><i class="fas fa-home"></i> Back to Home</a>
    </div>

</asp:Content>
