<%@ Page Title="" Language="C#" MasterPageFile="~/Student/Student_dashboard.Master" AutoEventWireup="true" CodeBehind="Status_check.aspx.cs" Inherits="TMS_project.Student.Status_check" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" />
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container mt-4">
        <div class="card shadow-lg">
            <div class="card-header bg-success text-white">
                <h4 class="mb-0">My Requests</h4>
            </div>
            <div class="card-body">
                <asp:GridView ID="gvStudentRequests" runat="server" 
                    AutoGenerateColumns="False" CssClass="table table-bordered table-hover">
                    <Columns>
                        <asp:BoundField DataField="RequestID" HeaderText="Request ID" />
                        <asp:BoundField DataField="TutorName" HeaderText="Tutor Name" />
                        <asp:BoundField DataField="Status" HeaderText="Status" />
                        <asp:BoundField DataField="CreatedDate" HeaderText="Request Date" DataFormatString="{0:dd-MM-yyyy HH:mm}" />
                    </Columns>
                </asp:GridView>
            </div>
        </div>
    </div>
</asp:Content>
