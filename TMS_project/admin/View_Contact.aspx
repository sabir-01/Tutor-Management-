<%@ Page Title="" Language="C#" MasterPageFile="~/admin/Admin_dashboard.Master" AutoEventWireup="true" CodeBehind="View_Contact.aspx.cs" Inherits="TMS_project.admin.View_Contact" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <br />

    <div class="row">
        <div class="col-md-12">
            <h1 class="bg-dark text-white text-center p-3 rounded shadow">VIEW CONTACT DETAILS
            </h1>
        </div>
    </div>



    <asp:GridView ID="GridView1" runat="server"
        CssClass="table table-bordered table-striped table-hover table-sm"
        HeaderStyle-CssClass="table-dark"
        AlternatingRowStyle-CssClass="table-light"
        AutoGenerateColumns="False" OnRowDeleting="GridView1_RowDeleting">
        <AlternatingRowStyle CssClass="table-light"></AlternatingRowStyle>

        <Columns>
            <asp:TemplateField HeaderText="ID">
                <ItemTemplate>
                    <asp:Label ID="LabelId" runat="server" Text='<%# Bind("id") %>'></asp:Label>
                </ItemTemplate>

            </asp:TemplateField>
            <asp:TemplateField HeaderText="Name">

                <ItemTemplate>
                    <asp:Label ID="Labelname" runat="server" Text='<%# Bind("name") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Email">

                <ItemTemplate>
                    <asp:Label ID="Labelemail" runat="server" Text='<%# Bind("email") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Subject">
                <ItemTemplate>
                    <asp:Label ID="Labelsubject" runat="server" Text='<%# Bind("subject") %>'></asp:Label>
                </ItemTemplate>

            </asp:TemplateField>
            <asp:TemplateField HeaderText="Message">
                <ItemTemplate>
                    <asp:Label ID="Labelmessage" runat="server" Text='<%# Bind("message") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField ShowHeader="False">
                <ItemTemplate>
                    <asp:LinkButton ID="LinkButton1" runat="server" OnClientClick="return confirm('are you sure to delete Data ! ')" CausesValidation="False" CommandName="Delete" Text="Delete"></asp:LinkButton>
                </ItemTemplate>
                <ControlStyle CssClass="btn btn-danger text-white" />
            </asp:TemplateField>
        </Columns>

        <HeaderStyle CssClass="table-dark"></HeaderStyle>
    </asp:GridView>
</asp:Content>
