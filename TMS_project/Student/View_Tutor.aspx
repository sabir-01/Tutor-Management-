<%@ Page Title="" Language="C#" MasterPageFile="~/Student/Student_dashboard.Master" AutoEventWireup="true" CodeBehind="View_Tutor.aspx.cs" Inherits="TMS_project.Student.View_Tutor" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <br />
    <div class="row bg-dark mb-3">
        <div class="col-md-12 ">
            <h1 class="bg-dark text-white text-center p-3 rounded shadow">VIEW TUTOR DETAILS
            </h1>
        </div>
    </div>

    <div class="row">
        <div class="col-md-4">
            <div class="input-group">
                <asp:TextBox class="form-control" placeholder="Search Tutor" ID="SerachText" runat="server"></asp:TextBox>
                <button id="searchbtn" runat="server" onserverclick="searchbtn_ServerClick" class="btn btn-secondary" type="button">
                    <i class="fa-solid fa-search"></i>
                </button>
            </div>
        </div>

    </div>
    <br />
    <div class="row">
        <asp:Repeater ID="Repeater1" runat="server" OnItemCommand="Repeater1_ItemCommand">

            <ItemTemplate>
                <div class="col-md-4">
                    <div class="card bg-dark text-center text-white">
                        <div class="card-header">
                            <h3>
                                <small style="font-size: 20px; color: steelblue">Name</small>
                                <br />
                                <asp:Label ID="Label1" runat="server" Text='<%# Bind("name") %>'></asp:Label>
                            </h3>
                        </div>

                        <div class="card-body">
                            <small style="font-size: 20px; color: steelblue">Email</small>
                            <br />
                            <h5>
                                <asp:Label ID="Label2" runat="server" Text='<%# Bind("email") %>'></asp:Label></h5>
                            <small style="font-size: 20px; color: steelblue">Country</small>
                            <br />
                            <h5>
                                <asp:Label ID="Label3" runat="server" Text='<%# Bind("country") %>'></asp:Label></h5>
                            <small style="font-size: 20px; color: steelblue">City</small>
                            <br />
                            <h5>
                                <asp:Label ID="Label4" runat="server" Text='<%# Bind("city") %>'></asp:Label></h5>
                            <small style="font-size: 20px; color: steelblue">Experience</small>
                            <br />
                            <h5>
                                <asp:Label ID="Label5" runat="server" Text='<%# Bind("experience") %>'></asp:Label></h5>
                            <small style="font-size: 20px; color: steelblue">Contact Number</small>
                            <br />
                            <h5>
                                <asp:Label ID="Label6" runat="server" Text='<%# Bind("contactno") %>'></asp:Label></h5>
                        </div>

                        <div class="card-footer mb-3">
                            <h4>
                                <small style="font-size: 20px; color: steelblue">Degree</small>
                                <br />
                                <asp:Label ID="Label7" runat="server" Text='<%# Bind("degree") %>'></asp:Label>
                            </h4>
                            <asp:Button ID="btnSendRequest" runat="server" Text="Send Request"
                                CssClass="btn btn-primary btn-sm mt-2"
                                CommandName="SendRequest" CommandArgument='<%# Eval("Tutor_id") %>' />


                        </div>
                    </div>
                    <br />
                </div>

            </ItemTemplate>

        </asp:Repeater>

    </div>


</asp:Content>
