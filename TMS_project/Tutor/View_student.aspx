<%@ Page Title="" Language="C#" MasterPageFile="~/Tutor/Tutor_Dashboard.Master" AutoEventWireup="true" CodeBehind="View_student.aspx.cs" Inherits="TMS_project.Tutor.View_student" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <br />  
    <div class="row bg-dark mb-3">
        <div class="col-md-12 ">
            <h1 class="bg-dark text-white text-center p-3 rounded shadow">STUDENT DETAILS
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
    <div class="row" >
        <asp:Repeater ID="Repeater1" runat="server">

            <ItemTemplate>
               <div class="col-md-4">
    <div class="card bg-dark text-center text-white">
        <div class="card-header">
            <h3>
                <small style="font-size:20px; color:steelblue">Name</small> <br />
                <asp:Label ID="Label1" runat="server" Text='<%# Bind("Name") %>'></asp:Label>
            </h3>
        </div>

        <div class="card-body">
            <small style="font-size:20px; color:steelblue">Gender</small> <br />
            <h5><asp:Label ID="Label2" runat="server" Text='<%# Bind("Gender") %>'></asp:Label></h5>
            <small style="font-size:20px; color:steelblue">Country</small> <br />
            <h5><asp:Label ID="Label3" runat="server" Text='<%# Bind("Country") %>'></asp:Label></h5>
            <small style="font-size:20px; color:steelblue">City</small> <br />
            <h5><asp:Label ID="Label4" runat="server" Text='<%# Bind("City") %>'></asp:Label></h5>
            <small style="font-size:20px; color:steelblue">Subject</small> <br />
            <h5><asp:Label ID="Label6" runat="server" Text='<%# Bind("Subject") %>'></asp:Label></h5>
             <small style="font-size:20px; color:steelblue">Contact</small> <br />
            <h5><asp:Label ID="Label8" runat="server" Text='<%# Bind("ContactNumber") %>'></asp:Label></h5>
             <small style="font-size:20px; color:steelblue">Tution Type</small> <br />
            <h5><asp:Label ID="Label9" runat="server" Text='<%# Bind("TuitionType") %>'></asp:Label></h5>  
        
        </div>

        <div class="card-footer mb-3">
            <h4>
               
            <small style="font-size:20px; color:steelblue">Standard</small> <br />
            <h5><asp:Label ID="Label5" runat="server" Text='<%# Bind("Class") %>'></asp:Label></h5>
            </h4>
        </div>
    </div>
                   <br />
</div>

            </ItemTemplate>

        </asp:Repeater>

    </div>

     

</asp:Content>
