<%@ Page Title="" Language="C#" MasterPageFile="~/admin/Admin_dashboard.Master" AutoEventWireup="true" CodeBehind="View_Teacher.aspx.cs" Inherits="TMS_project.admin.View_Teacher" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container-fluid py-4">
        <!-- Header Section -->
        <div class="row mb-4">
            <div class="col-12">
                <div class="card shadow-sm">
                    <div class="card-body">
                        <div class="d-flex justify-content-between align-items-center">
                            <div>
                                <h2 class="card-title mb-1"><i class="fas fa-chalkboard-teacher text-success"></i>Teacher Management</h2>
                                <p class="text-muted mb-0">Manage all teacher/tutor records and information</p>
                            </div>
                            <a href="../Tutor_Signup.aspx" class="btn btn-primary">
                                <i class="fas fa-plus"></i>Add New Tutor
                            </a>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!-- Statistics Cards -->
        <div class="row mb-4">
            <div class="col-md-3">
                <div class="card text-center bg-success text-white">
                    <div class="card-body">
                        <i class="fas fa-chalkboard-teacher fa-2x mb-2"></i>
                        <h5>Total Teachers</h5>
                        <h3>
                            <asp:Label ID="lblTotalTeachers" runat="server" Text="0"></asp:Label></h3>
                    </div>
                </div>
            </div>
            <div class="col-md-3">
                <div class="card text-center bg-info text-white">
                    <div class="card-body">
                        <i class="fas fa-graduation-cap fa-2x mb-2"></i>
                        <h5>Qualified Teachers</h5>
                        <h3>
                            <asp:Label ID="lblQualifiedTeachers" runat="server" Text="0"></asp:Label></h3>
                    </div>
                </div>
            </div>
            <div class="col-md-3">
                <div class="card text-center bg-warning text-white">
                    <div class="card-body">
                        <i class="fas fa-city fa-2x mb-2"></i>
                        <h5>Cities</h5>
                        <h3>
                            <asp:Label ID="lblCities" runat="server" Text="0"></asp:Label></h3>
                    </div>
                </div>
            </div>
            <div class="col-md-3">
                <div class="card text-center bg-danger text-white">
                    <div class="card-body">
                        <i class="fas fa-clock fa-2x mb-2"></i>
                        <h5>Experienced (5+ Years)</h5>
                        <h3>
                            <asp:Label ID="lblExperienced" runat="server" Text=""></asp:Label></h3>
                    </div>
                </div>
            </div>
        </div>

        <!-- Search and Filter Section -->
        <div class="row mb-3">
            <div class="col-12">
                <div class="card">
                    <div class="card-body">
                        <div class="row g-3">
                            <div class="col-md-4">
                                <label class="form-label">Search Teacher</label>
                                <asp:TextBox ID="txtSearch" runat="server" CssClass="form-control" placeholder="Search by name, username, or contact"></asp:TextBox>
                            </div>
                            <div class="col-md-3">
                                <label class="form-label">Filter by City</label>
                                <asp:DropDownList ID="ddlCityFilter" runat="server" CssClass="form-select">
                                    <asp:ListItem Value="">All Cities</asp:ListItem>
                                </asp:DropDownList>
                            </div>
                            <div class="col-md-3">
                                <label class="form-label">Filter by Qualification</label>
                                <asp:DropDownList ID="ddlQualificationFilter" runat="server" CssClass="form-select">
                                    <asp:ListItem Value="">All Qualifications</asp:ListItem>
                                </asp:DropDownList>
                            </div>
                            <div class="col-md-2 d-flex align-items-end">
                                <asp:Button ID="btnSearch" runat="server" Text="Search" CssClass="btn btn-success me-2" OnClick="btnSearch_Click" />
                                <asp:Button ID="btnReset" runat="server" Text="Reset" CssClass="btn btn-outline-secondary" OnClick="btnReset_Click" />
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!-- Teachers Table -->
        <div class="row">
            <div class="col-12">
                <div class="card shadow-sm">
                    <div class="card-body">
                        <div class="table-responsive">
                            <asp:GridView ID="gvTeachers" runat="server" CssClass="table table-hover"
                                AutoGenerateColumns="False" DataKeyNames="Tutor_id"
                                OnRowCommand="gvTeachers_RowCommand"
                                OnRowEditing="gvTeachers_RowEditing"
                                OnRowDeleting="gvTeachers_RowDeleting"
                                OnRowDataBound="gvTeachers_RowDataBound"
                                EmptyDataText="No teachers found">
                                <HeaderStyle CssClass="table-dark" />
                                <Columns>
                                    <asp:BoundField DataField="Tutor_id" HeaderText="ID" ItemStyle-Width="50px" />
                                    <asp:BoundField DataField="name" HeaderText="Name" ItemStyle-Width="120px" />
                                    <asp:BoundField DataField="surname" HeaderText="Surname" ItemStyle-Width="120px" />
                                    <asp:BoundField DataField="username" HeaderText="Username" ItemStyle-Width="100px" />
                                    <asp:BoundField DataField="age" HeaderText="Age" ItemStyle-Width="60px" ItemStyle-CssClass="text-center" />
                                    <asp:BoundField DataField="gender" HeaderText="Gender" ItemStyle-Width="80px" ItemStyle-CssClass="text-center" />
                                    <asp:BoundField DataField="qulification" HeaderText="Qualification" ItemStyle-Width="120px" />
                                    <asp:BoundField DataField="experience" HeaderText="Experience" ItemStyle-Width="100px" ItemStyle-CssClass="text-center" />
                                    <asp:BoundField DataField="city" HeaderText="City" ItemStyle-Width="100px" />
                                    <asp:BoundField DataField="contactno" HeaderText="Contact" ItemStyle-Width="120px" />
                                    <asp:TemplateField HeaderText="Actions" ItemStyle-Width="150px" ItemStyle-CssClass="text-center">
                                        <ItemTemplate>
                                            <div class="btn-group btn-group-sm" role="group">
                                                <asp:LinkButton ID="btnView" runat="server" CommandName="ViewTeacher" CommandArgument='<%# Eval("Tutor_id") %>'
                                                    CssClass="btn btn-info btn-sm" data-bs-toggle="tooltip" title="View Details">
                                                    <i class="fas fa-eye"></i>
                                                </asp:LinkButton>
                                                <asp:LinkButton ID="btnEdit" runat="server" CommandName="EditTeacher" CommandArgument='<%# Eval("Tutor_id") %>'
                                                    CssClass="btn btn-warning btn-sm" data-bs-toggle="tooltip" title="Edit">
                                                    <i class="fas fa-edit"></i>
                                                </asp:LinkButton>
                                                <asp:LinkButton ID="btnDelete" runat="server" CommandName="DeleteTeacher" CommandArgument='<%# Eval("Tutor_id") %>'
                                                    CssClass="btn btn-danger btn-sm" data-bs-toggle="tooltip" title="Delete"
                                                    OnClientClick="return confirm('Are you sure you want to delete this teacher?');">
                                                    <i class="fas fa-trash"></i>
                                                </asp:LinkButton>
                                            </div>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                </Columns>
                            </asp:GridView>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- Add Teacher Modal -->
    <div class="modal fade" id="addTeacherModal" tabindex="-1" aria-labelledby="addTeacherModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-lg">
            <div class="modal-content">
                <div class="modal-header bg-success text-white">
                    <h5 class="modal-title" id="addTeacherModalLabel">Add New Teacher</h5>
                    <button type="button" class="btn-close btn-close-white" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <div class="row g-3">
                        <div class="col-md-6">
                            <label class="form-label">Name <span class="text-danger">*</span></label>
                            <asp:TextBox ID="txtName" runat="server" CssClass="form-control" required></asp:TextBox>
                        </div>
                        <div class="col-md-6">
                            <label class="form-label">Surname</label>
                            <asp:TextBox ID="txtSurname" runat="server" CssClass="form-control"></asp:TextBox>
                        </div>
                        <div class="col-md-6">
                            <label class="form-label">Username <span class="text-danger">*</span></label>
                            <asp:TextBox ID="txtUsername" runat="server" CssClass="form-control" required></asp:TextBox>
                        </div>
                        <div class="col-md-6">
                            <label class="form-label">Password <span class="text-danger">*</span></label>
                            <asp:TextBox ID="txtPassword" runat="server" CssClass="form-control" TextMode="Password" required></asp:TextBox>
                        </div>
                        <div class="col-md-6">
                            <label class="form-label">Email <span class="text-danger">*</span></label>
                            <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control" TextMode="Email" required></asp:TextBox>
                        </div>
                        <div class="col-md-6">
                            <label class="form-label">Age</label>
                            <asp:TextBox ID="txtAge" runat="server" CssClass="form-control" TextMode="Number"></asp:TextBox>
                        </div>
                        <div class="col-md-6">
                            <label class="form-label">Gender</label>
                            <asp:DropDownList ID="ddlGender" runat="server" CssClass="form-select">
                                <asp:ListItem Value="">Select Gender</asp:ListItem>
                                <asp:ListItem Value="Male">Male</asp:ListItem>
                                <asp:ListItem Value="Female">Female</asp:ListItem>
                            </asp:DropDownList>
                        </div>
                        <div class="col-md-6">
                            <label class="form-label">Marital Status</label>
                            <asp:DropDownList ID="ddlMaritalStatus" runat="server" CssClass="form-select">
                                <asp:ListItem Value="">Select Status</asp:ListItem>
                                <asp:ListItem Value="Single">Single</asp:ListItem>
                                <asp:ListItem Value="Married">Married</asp:ListItem>
                                <asp:ListItem Value="Divorced">Divorced</asp:ListItem>
                                <asp:ListItem Value="Widowed">Widowed</asp:ListItem>
                            </asp:DropDownList>
                        </div>
                        <div class="col-md-6">
                            <label class="form-label">Qualification</label>
                            <asp:TextBox ID="txtQualification" runat="server" CssClass="form-control"></asp:TextBox>
                        </div>
                        <div class="col-md-6">
                            <label class="form-label">Degree</label>
                            <asp:TextBox ID="txtDegree" runat="server" CssClass="form-control"></asp:TextBox>
                        </div>
                        <div class="col-md-6">
                            <label class="form-label">Experience (Years)</label>
                            <asp:TextBox ID="txtExperience" runat="server" CssClass="form-control" TextMode="Number"></asp:TextBox>
                        </div>
                        <div class="col-md-6">
                            <label class="form-label">Contact Number <span class="text-danger">*</span></label>
                            <asp:TextBox ID="txtContactNo" runat="server" CssClass="form-control" required></asp:TextBox>
                        </div>
                        <div class="col-md-6">
                            <label class="form-label">City</label>
                            <asp:TextBox ID="txtCity" runat="server" CssClass="form-control"></asp:TextBox>
                        </div>
                        <div class="col-md-6">
                            <label class="form-label">Country</label>
                            <asp:TextBox ID="txtCountry" runat="server" CssClass="form-control"></asp:TextBox>
                        </div>
                        <div class="col-12">
                            <label class="form-label">Address</label>
                            <asp:TextBox ID="txtAddress" runat="server" CssClass="form-control" TextMode="MultiLine" Rows="3"></asp:TextBox>
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancel</button>
                </div>
            </div>
        </div>
    </div>

    <!-- Edit Teacher Modal -->
    <div class="modal fade" id="editTeacherModal" tabindex="-1" aria-labelledby="editTeacherModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-lg">
            <div class="modal-content">
                <div class="modal-header bg-warning text-dark">
                    <h5 class="modal-title" id="editTeacherModalLabel">Edit Teacher</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <asp:HiddenField ID="hfEditTeacherID" runat="server" />
                    <div class="row g-3">
                        <div class="col-md-6">
                            <label class="form-label">Name <span class="text-danger">*</span></label>
                            <asp:TextBox ID="txtEditName" runat="server" CssClass="form-control" required></asp:TextBox>
                        </div>
                        <div class="col-md-6">
                            <label class="form-label">Surname</label>
                            <asp:TextBox ID="txtEditSurname" runat="server" CssClass="form-control"></asp:TextBox>
                        </div>
                        <div class="col-md-6">
                            <label class="form-label">Username <span class="text-danger">*</span></label>
                            <asp:TextBox ID="txtEditUsername" runat="server" CssClass="form-control" required></asp:TextBox>
                        </div>
                        <div class="col-md-6">
                            <label class="form-label">Password <span class="text-danger">*</span></label>
                            <asp:TextBox ID="txtEditPassword" runat="server" CssClass="form-control" TextMode="Password" required></asp:TextBox>
                        </div>
                        <div class="col-md-6">
                            <label class="form-label">Email <span class="text-danger">*</span></label>
                            <asp:TextBox ID="txtEditEmail" runat="server" CssClass="form-control" TextMode="Email" required></asp:TextBox>
                        </div>
                        <div class="col-md-6">
                            <label class="form-label">Age</label>
                            <asp:TextBox ID="txtEditAge" runat="server" CssClass="form-control" TextMode="Number"></asp:TextBox>
                        </div>
                        <div class="col-md-6">
                            <label class="form-label">Gender</label>
                            <asp:DropDownList ID="ddlEditGender" runat="server" CssClass="form-select">
                                <asp:ListItem Value="">Select Gender</asp:ListItem>
                                <asp:ListItem Value="Male">Male</asp:ListItem>
                                <asp:ListItem Value="Female">Female</asp:ListItem>
                            </asp:DropDownList>
                        </div>
                        <div class="col-md-6">
                            <label class="form-label">Marital Status</label>
                            <asp:DropDownList ID="ddlEditMaritalStatus" runat="server" CssClass="form-select">
                                <asp:ListItem Value="">Select Status</asp:ListItem>
                                <asp:ListItem Value="Single">Single</asp:ListItem>
                                <asp:ListItem Value="Married">Married</asp:ListItem>
                                <asp:ListItem Value="Divorced">Divorced</asp:ListItem>
                                <asp:ListItem Value="Widowed">Widowed</asp:ListItem>
                            </asp:DropDownList>
                        </div>
                        <div class="col-md-6">
                            <label class="form-label">Qualification</label>
                            <asp:TextBox ID="txtEditQualification" runat="server" CssClass="form-control"></asp:TextBox>
                        </div>
                        <div class="col-md-6">
                            <label class="form-label">Degree</label>
                            <asp:TextBox ID="txtEditDegree" runat="server" CssClass="form-control"></asp:TextBox>
                        </div>
                        <div class="col-md-6">
                            <label class="form-label">Experience (Years)</label>
                            <asp:TextBox ID="txtEditExperience" runat="server" CssClass="form-control" TextMode="Number"></asp:TextBox>
                        </div>
                        <div class="col-md-6">
                            <label class="form-label">Contact Number <span class="text-danger">*</span></label>
                            <asp:TextBox ID="txtEditContactNo" runat="server" CssClass="form-control" required></asp:TextBox>
                        </div>
                        <div class="col-md-6">
                            <label class="form-label">City</label>
                            <asp:TextBox ID="txtEditCity" runat="server" CssClass="form-control"></asp:TextBox>
                        </div>
                        <div class="col-md-6">
                            <label class="form-label">Country</label>
                            <asp:TextBox ID="txtEditCountry" runat="server" CssClass="form-control"></asp:TextBox>
                        </div>
                        <div class="col-12">
                            <label class="form-label">Address</label>
                            <asp:TextBox ID="txtEditAddress" runat="server" CssClass="form-control" TextMode="MultiLine" Rows="3"></asp:TextBox>
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancel</button>
                    <asp:Button ID="btnUpdateTeacher" runat="server" Text="Update Teacher" CssClass="btn btn-warning" OnClick="btnUpdateTeacher_Click" />
                </div>
            </div>
        </div>
    </div>

    <!-- View Teacher Modal -->
    <div class="modal fade" id="viewTeacherModal" tabindex="-1" aria-labelledby="viewTeacherModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-lg">
            <div class="modal-content">
                <div class="modal-header bg-info text-white">
                    <h5 class="modal-title" id="viewTeacherModalLabel">Teacher Details</h5>
                    <button type="button" class="btn-close btn-close-white" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <div class="row">
                        <div class="col-md-6">
                            <div class="card h-100">
                                <div class="card-header bg-light">
                                    <h6 class="mb-0">Personal Information</h6>
                                </div>
                                <div class="card-body">
                                    <p><strong>Name:</strong>
                                        <asp:Label ID="lblViewName" runat="server"></asp:Label></p>
                                    <p><strong>Surname:</strong>
                                        <asp:Label ID="lblViewSurname" runat="server"></asp:Label></p>
                                    <p><strong>Age:</strong>
                                        <asp:Label ID="lblViewAge" runat="server"></asp:Label></p>
                                    <p><strong>Gender:</strong>
                                        <asp:Label ID="lblViewGender" runat="server"></asp:Label></p>
                                    <p><strong>Marital Status:</strong>
                                        <asp:Label ID="lblViewMaritalStatus" runat="server"></asp:Label></p>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="card h-100">
                                <div class="card-header bg-light">
                                    <h6 class="mb-0">Professional Information</h6>
                                </div>
                                <div class="card-body">
                                    <p><strong>Qualification:</strong>
                                        <asp:Label ID="lblViewQualification" runat="server"></asp:Label></p>
                                    <p><strong>Degree:</strong>
                                        <asp:Label ID="lblViewDegree" runat="server"></asp:Label></p>
                                    <p><strong>Experience:</strong>
                                        <asp:Label ID="lblViewExperience" runat="server"></asp:Label>
                                        years</p>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="row mt-3">
                        <div class="col-12">
                            <div class="card">
                                <div class="card-header bg-light">
                                    <h6 class="mb-0">Contact Information</h6>
                                </div>
                                <div class="card-body">
                                    <div class="row">
                                        <div class="col-md-6">
                                            <p><strong>Username:</strong>
                                                <asp:Label ID="lblViewUsername" runat="server"></asp:Label></p>
                                            <p><strong>Email:</strong>
                                                <asp:Label ID="lblViewEmail" runat="server"></asp:Label></p>
                                            <p><strong>Contact Number:</strong>
                                                <asp:Label ID="lblViewContactNo" runat="server"></asp:Label></p>
                                            <p><strong>City:</strong>
                                                <asp:Label ID="lblViewCity" runat="server"></asp:Label></p>
                                            <p><strong>Country:</strong>
                                                <asp:Label ID="lblViewCountry" runat="server"></asp:Label></p>
                                        </div>
                                        <div class="col-md-6">
                                            <p><strong>Address:</strong></p>
                                            <p>
                                                <asp:Label ID="lblViewAddress" runat="server"></asp:Label></p>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                </div>
            </div>
        </div>
    </div>


    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    <script>
        // Initialize tooltips
        var tooltipTriggerList = [].slice.call(document.querySelectorAll('[data-bs-toggle="tooltip"]'))
        var tooltipList = tooltipTriggerList.map(function (tooltipTriggerEl) {
            return new bootstrap.Tooltip(tooltipTriggerEl)
        });

        // Show modals from server-side
        function showModal(modalId) {
            var modal = new bootstrap.Modal(document.getElementById(modalId));
            modal.show();
        }
    </script>
</asp:Content>
