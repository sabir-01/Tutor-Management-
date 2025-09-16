<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Requests.aspx.cs" Inherits="TMS_project.Requests" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Requests Management</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
        <div class="container mt-4 text-white">
            <div class="card shadow-lg rounded-3">
                <div class="card-header bg-primary text-white">
                    <h3 class="mb-0">Requests Management</h3>
                </div>
                <div class="card-body">
                    <asp:GridView ID="gvRequests" runat="server" 
                        AutoGenerateColumns="False" 
                        CssClass="table table-hover table-bordered"
                        DataKeyNames="RequestID"
                        OnRowEditing="gvRequests_RowEditing"
                        OnRowUpdating="gvRequests_RowUpdating"
                        OnRowCancelingEdit="gvRequests_RowCancelingEdit">

                        <Columns>
                            <asp:BoundField DataField="RequestID" HeaderText="Request ID" ReadOnly="True" />

                            <asp:BoundField DataField="StudentUsername" HeaderText="Student Username" ReadOnly="True" />

                            <asp:BoundField DataField="TutorName" HeaderText="Tutor Name" ReadOnly="True" />

                            <asp:TemplateField HeaderText="Status">
                                <ItemTemplate>
                                    <span class="badge 
                                        <%# Eval("Status").ToString() == "Pending" ? "bg-warning text-dark" : 
                                            (Eval("Status").ToString() == "Approved" ? "bg-success" : "bg-danger") %>">
                                        <%# Eval("Status") %>
                                    </span>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:DropDownList ID="ddlStatus" runat="server" CssClass="form-select">
                                        <asp:ListItem Text="Pending" Value="Pending"></asp:ListItem>
                                        <asp:ListItem Text="Approved" Value="Approved"></asp:ListItem>
                                        <asp:ListItem Text="Rejected" Value="Rejected"></asp:ListItem>
                                    </asp:DropDownList>
                                </EditItemTemplate>
                            </asp:TemplateField>

                            <asp:BoundField DataField="CreatedDate" HeaderText="Request Date" 
                                DataFormatString="{0:dd-MM-yyyy HH:mm}" ReadOnly="True" />

                            <asp:CommandField ShowEditButton="True" 
                                EditText="<i class='bi bi-pencil-square'></i> Edit"
                                UpdateText="<i class='bi bi-check2-circle'></i> Save"
                                CancelText="<i class='bi bi-x-circle'></i> Cancel" />
                        </Columns>
                    </asp:GridView>
                </div>
            </div>
        </div>
    </form>

    <!-- Bootstrap Icons -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css" rel="stylesheet" />
</body>
</html>
