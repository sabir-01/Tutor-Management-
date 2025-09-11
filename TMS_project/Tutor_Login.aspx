<%@ Page Title="" Language="C#" MasterPageFile="~/TMS_Site.Master" AutoEventWireup="true" CodeBehind="Tutor_Login.aspx.cs" Inherits="TMS_project.Tutor_Login" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

     <div class="container">
     <div class="row justify-content-center">
         <div class="col-md-5 mt-4">
             <div class="card shadow-lg rounded-4 mt-5">
                 <div class="card-body p-5">
                     <div class="bg-info mt-2 mb-2 p-3">
                         <h2 class="text-center mb-4 mt-4 text-black">Tutor Login</h2>

                     </div>


                     <div class="mb-3">
                         <label for="txtUsername" class="form-label">Username</label>
                         <asp:TextBox ID="txtUsername" runat="server" CssClass="form-control" placeholder="Enter username"></asp:TextBox>
                         <asp:RequiredFieldValidator ID="rfvUsername" runat="server" ControlToValidate="txtUsername"
                             ErrorMessage="Username is required" SetFocusOnError="true" CssClass="text-danger" Display="Dynamic"></asp:RequiredFieldValidator>
                     </div>

                     <div class="mb-3">
                         <label for="txtPassword" class="form-label">Password</label>
                         <asp:TextBox ID="txtPassword" runat="server" TextMode="Password" CssClass="form-control" placeholder="Enter password"></asp:TextBox>
                         <asp:RequiredFieldValidator ID="rfvPassword" runat="server" ControlToValidate="txtPassword"
                             ErrorMessage="Password is required" CssClass="text-danger" Display="Dynamic" SetFocusOnError="true"></asp:RequiredFieldValidator>
                     </div>

                     <div class="d-grid">
                         <asp:Button ID="btnLogin" runat="server" Text="Login" CssClass="btn btn-primary btn-lg"  OnClick="btnLogin_Click" />

                         <br />
                         <div class="text-center">
                             <a href="Student_Login.aspx">Login as Student </a>

                         </div>
                     </div>

                 </div>
             </div>
         </div>
     </div>
 </div>
</asp:Content>
