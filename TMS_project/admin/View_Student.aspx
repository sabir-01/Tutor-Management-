<%@ Page Title="Student Management" Language="C#" MasterPageFile="~/admin/Admin_dashboard.Master" AutoEventWireup="true" CodeBehind="View_Student.aspx.cs" Inherits="TMS_project.admin.View_Student" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" rel="stylesheet">
    <style>
        .student-card {
            transition: transform 0.2s;
        }

            .student-card:hover {
                transform: translateY(-2px);
            }

        .table-responsive {
            border-radius: 8px;
            overflow: hidden;
        }

        .btn-group-sm .btn {
            margin: 1px;
        }
    </style>
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
                                <h2 class="card-title mb-1"><i class="fas fa-users text-primary"></i>Student Management</h2>
                                <p class="text-muted mb-0">Manage all student records and information</p>
                            </div>
                            <a href="../student_Signup.aspx" class="btn btn-primary">
                                <i class="fas fa-plus"></i>Add New Student
                            </a>

                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!-- Statistics Cards -->
        <div class="row mb-4">
            <div class="col-md-3">
                <div class="card text-center bg-primary text-white">
                    <div class="card-body">
                        <i class="fas fa-users fa-2x mb-2"></i>
                        <h5>Total Students</h5>
                        <h3>
                            <asp:Label ID="lblTotalStudents" runat="server" Text="0"></asp:Label></h3>
                    </div>
                </div>
            </div>
            <div class="col-md-3">
                <div class="card text-center bg-success text-white">
                    <div class="card-body">
                        <i class="fas fa-user-graduate fa-2x mb-2"></i>
                        <h5>Active Students</h5>
                        <h3>
                            <asp:Label ID="lblActiveStudents" runat="server" Text="0"></asp:Label></h3>
                    </div>
                </div>
            </div>
            <div class="col-md-3">
                <div class="card text-center bg-info text-white">
                    <div class="card-body">
                        <i class="fas fa-city fa-2x mb-2"></i>
                        <h5>Cities</h5>
                        <h3>
                            <asp:Label ID="lblCities" runat="server" Text="0"></asp:Label></h3>
                    </div>
                </div>
            </div>
            <div class="col-md-3">
                <div class="card text-center bg-warning text-white">
                    <div class="card-body">
                        <i class="fas fa-book fa-2x mb-2"></i>
                        <h5>Subjects</h5>
                        <h3>
                            <asp:Label ID="lblSubjects" runat="server" Text="0"></asp:Label></h3>
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
                                <label class="form-label">Search Student</label>
                                <asp:TextBox ID="txtSearch" runat="server" CssClass="form-control" placeholder="Search by name, username, or contact"></asp:TextBox>
                            </div>
                            <div class="col-md-3">
                                <label class="form-label">Filter by City</label>
                                <asp:DropDownList ID="ddlCityFilter" runat="server" CssClass="form-select">
                                    <asp:ListItem Value="">All Cities</asp:ListItem>
                                </asp:DropDownList>
                            </div>
                            <div class="col-md-3">
                                <label class="form-label">Filter by Class</label>
                                <asp:DropDownList ID="ddlClassFilter" runat="server" CssClass="form-select">
                                    <asp:ListItem Value="">All Classes</asp:ListItem>
                                </asp:DropDownList>
                            </div>
                            <div class="col-md-2 d-flex align-items-end">
                                <asp:Button ID="btnSearch" runat="server" Text="Search" CssClass="btn btn-primary me-2" OnClick="btnSearch_Click" />
                                <asp:Button ID="btnReset" runat="server" Text="Reset" CssClass="btn btn-outline-secondary" OnClick="btnReset_Click" />
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!-- Students Table -->
        <div class="row">
            <div class="col-12">
                <div class="card shadow-sm">
                    <div class="card-body">
                        <div class="table-responsive">
                            <asp:GridView ID="gvStudents" runat="server" CssClass="table table-hover"
                                AutoGenerateColumns="False" DataKeyNames="StudentID"
                                OnRowCommand="gvStudents_RowCommand"
                                OnRowEditing="gvStudents_RowEditing"
                                OnRowDeleting="gvStudents_RowDeleting"
                                OnRowDataBound="gvStudents_RowDataBound"
                                EmptyDataText="No students found">
                                <HeaderStyle CssClass="table-dark" />
                                <Columns>
                                    <asp:BoundField DataField="StudentID" HeaderText="ID" ItemStyle-Width="50px" />
                                    <asp:BoundField DataField="Name" HeaderText="Name" ItemStyle-Width="120px" />
                                    <asp:BoundField DataField="FatherName" HeaderText="Father Name" ItemStyle-Width="120px" />
                                    <asp:BoundField DataField="Username" HeaderText="Username" ItemStyle-Width="100px" />
                                    <asp:BoundField DataField="Age" HeaderText="Age" ItemStyle-Width="60px" ItemStyle-CssClass="text-center" />
                                    <asp:BoundField DataField="Gender" HeaderText="Gender" ItemStyle-Width="80px" ItemStyle-CssClass="text-center" />
                                    <asp:BoundField DataField="Class" HeaderText="Class" ItemStyle-Width="80px" ItemStyle-CssClass="text-center" />
                                    <asp:BoundField DataField="Subject" HeaderText="Subject" ItemStyle-Width="100px" />
                                    <asp:BoundField DataField="City" HeaderText="City" ItemStyle-Width="100px" />
                                    <asp:BoundField DataField="ContactNumber" HeaderText="Contact" ItemStyle-Width="120px" />
                                    <asp:TemplateField HeaderText="Actions" ItemStyle-Width="150px" ItemStyle-CssClass="text-center">
                                        <ItemTemplate>
                                            <div class="btn-group btn-group-sm" role="group">
                                                <asp:LinkButton ID="btnView" runat="server" CommandName="ViewStudent" CommandArgument='<%# Eval("StudentID") %>'
                                                    CssClass="btn btn-info btn-sm" data-bs-toggle="tooltip" title="View Details">
                                                    <i class="fas fa-eye"></i>
                                                </asp:LinkButton>
                                                <asp:LinkButton ID="btnEdit" runat="server" CommandName="EditStudent" CommandArgument='<%# Eval("StudentID") %>'
                                                    CssClass="btn btn-warning btn-sm" data-bs-toggle="tooltip" title="Edit">
                                                    <i class="fas fa-edit"></i>
                                                </asp:LinkButton>
                                                <asp:LinkButton ID="btnDelete" runat="server" CommandName="DeleteStudent" CommandArgument='<%# Eval("StudentID") %>'
                                                    CssClass="btn btn-danger btn-sm" data-bs-toggle="tooltip" title="Delete"
                                                    OnClientClick="return confirm('Are you sure you want to delete this student?');">
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

    <!-- Add Student Modal -->
    <%-- <div class="modal fade" id="addStudentModal" tabindex="-1" aria-labelledby="addStudentModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-lg">
            <div class="modal-content">
                <div class="modal-header bg-primary text-white">
                    <h5 class="modal-title" id="addStudentModalLabel">Add New Student</h5>
                    <button type="button" class="btn-close btn-close-white" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <div class="row g-3">
                        <div class="col-md-6">
                            <label class="form-label">Name <span class="text-danger">*</span></label>
                            <asp:TextBox ID="txtName" runat="server" CssClass="form-control" required></asp:TextBox>
                        </div>
                        <div class="col-md-6">
                            <label class="form-label">Father Name <span class="text-danger">*</span></label>
                            <asp:TextBox ID="txtFatherName" runat="server" CssClass="form-control" required></asp:TextBox>
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
                            <label class="form-label">Class</label>
                            <asp:TextBox ID="txtClass" runat="server" CssClass="form-control"></asp:TextBox>
                        </div>
                        <div class="col-md-6">
                            <label class="form-label">Subject</label>
                            <asp:TextBox ID="txtSubject" runat="server" CssClass="form-control"></asp:TextBox>
                        </div>
                        <div class="col-md-6">
                            <label class="form-label">Tuition Type</label>
                            <asp:DropDownList ID="ddlTuitionType" runat="server" CssClass="form-select">
                                <asp:ListItem Value="">Select Tuition Type</asp:ListItem>
                                <asp:ListItem Value="Home Tuition">Home Tuition</asp:ListItem>
                                <asp:ListItem Value="Online">Online</asp:ListItem>
                                <asp:ListItem Value="Group Study">Group Study</asp:ListItem>
                            </asp:DropDownList>
                        </div>
                        <div class="col-md-6">
                            <label class="form-label">Tutor Preferred</label>
                            <asp:DropDownList ID="ddlTutorPreferred" runat="server" CssClass="form-select">
                                <asp:ListItem Value="">Select Preference</asp:ListItem>
                                <asp:ListItem Value="Male">Male</asp:ListItem>
                                <asp:ListItem Value="Female">Female</asp:ListItem>
                                <asp:ListItem Value="No Preference">No Preference</asp:ListItem>
                            </asp:DropDownList>
                        </div>
                        <div class="col-md-6">
                            <label class="form-label">Going To</label>
                            <asp:TextBox ID="txtGoingTo" runat="server" CssClass="form-control"></asp:TextBox>
                        </div>
                        <div class="col-md-6">
                            <label class="form-label">City</label>
                            <asp:TextBox ID="txtCity" runat="server" CssClass="form-control"></asp:TextBox>
                        </div>
                        <div class="col-md-6">
                            <label class="form-label">Country</label>
                            <asp:TextBox ID="txtCountry" runat="server" CssClass="form-control"></asp:TextBox>
                        </div>
                        <div class="col-md-6">
                            <label class="form-label">Contact Number</label>
                            <asp:TextBox ID="txtContactNumber" runat="server" CssClass="form-control"></asp:TextBox>
                        </div>
                        <div class="col-12">
                            <label class="form-label">Address</label>
                            <asp:TextBox ID="txtAddress" runat="server" CssClass="form-control" TextMode="MultiLine" Rows="3"></asp:TextBox>
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancel</button>
                    <asp:Button ID="btnAddStudent" runat="server" Text="Add Student" CssClass="btn btn-primary" OnClick="btnAddStudent_Click" />
                </div>
            </div>
        </div>
    </div>--%>

    <!-- Edit Student Modal -->
    <div class="modal fade" id="editStudentModal" tabindex="-1" aria-labelledby="editStudentModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-lg">
            <div class="modal-content">
                <div class="modal-header bg-warning text-dark">
                    <h5 class="modal-title" id="editStudentModalLabel">Edit Student</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <asp:HiddenField ID="hfEditStudentID" runat="server" />
                    <div class="row g-3">
                        <div class="col-md-6">
                            <label class="form-label">Name <span class="text-danger">*</span></label>
                            <asp:TextBox ID="txtEditName" runat="server" CssClass="form-control" required></asp:TextBox>
                        </div>
                        <div class="col-md-6">
                            <label class="form-label">Father Name <span class="text-danger">*</span></label>
                            <asp:TextBox ID="txtEditFatherName" runat="server" CssClass="form-control" required></asp:TextBox>
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
                            <label class="form-label">Class</label>
                            <asp:TextBox ID="txtEditClass" runat="server" CssClass="form-control"></asp:TextBox>
                        </div>
                        <div class="col-md-6">
                            <label class="form-label">Subject</label>
                            <asp:TextBox ID="txtEditSubject" runat="server" CssClass="form-control"></asp:TextBox>
                        </div>
                        <div class="col-md-6">
                            <label class="form-label">Tuition Type</label>
                            <asp:DropDownList ID="ddlEditTuitionType" runat="server" CssClass="form-select">
                                <asp:ListItem Value="">Select Tuition Type</asp:ListItem>
                                <asp:ListItem Value="Home Tuition">Home Tuition</asp:ListItem>
                                <asp:ListItem Value="Online">Online</asp:ListItem>
                                <asp:ListItem Value="Group Study">Group Study</asp:ListItem>
                            </asp:DropDownList>
                        </div>
                        <div class="col-md-6">
                            <label class="form-label">Tutor Preferred</label>
                            <asp:DropDownList ID="ddlEditTutorPreferred" runat="server" CssClass="form-select">
                                <asp:ListItem Value="">Select Preference</asp:ListItem>
                                <asp:ListItem Value="Male">Male</asp:ListItem>
                                <asp:ListItem Value="Female">Female</asp:ListItem>
                                <asp:ListItem Value="No Preference">No Preference</asp:ListItem>
                            </asp:DropDownList>
                        </div>
                        <div class="col-md-6">
                            <label class="form-label">Going To</label>
                            <asp:TextBox ID="txtEditGoingTo" runat="server" CssClass="form-control"></asp:TextBox>
                        </div>
                        <div class="col-md-6">
                            <label class="form-label">City</label>
                            <asp:TextBox ID="txtEditCity" runat="server" CssClass="form-control"></asp:TextBox>
                        </div>
                        <div class="col-md-6">
                            <label class="form-label">Country</label>
                            <asp:TextBox ID="txtEditCountry" runat="server" CssClass="form-control"></asp:TextBox>
                        </div>
                        <div class="col-md-6">
                            <label class="form-label">Contact Number</label>
                            <asp:TextBox ID="txtEditContactNumber" runat="server" CssClass="form-control"></asp:TextBox>
                        </div>
                        <div class="col-12">
                            <label class="form-label">Address</label>
                            <asp:TextBox ID="txtEditAddress" runat="server" CssClass="form-control" TextMode="MultiLine" Rows="3"></asp:TextBox>
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancel</button>
                    <asp:Button ID="btnUpdateStudent" runat="server" Text="Update Student" CssClass="btn btn-warning" OnClick="btnUpdateStudent_Click" />
                </div>
            </div>
        </div>
    </div>

    <!-- View Student Modal -->
    <div class="modal fade" id="viewStudentModal" tabindex="-1" aria-labelledby="viewStudentModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-lg">
            <div class="modal-content">
                <div class="modal-header bg-info text-white">
                    <h5 class="modal-title" id="viewStudentModalLabel">Student Details</h5>
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
                                    <p>
                                        <strong>Name:</strong>
                                        <asp:Label ID="lblViewName" runat="server"></asp:Label>
                                    </p>
                                    <p>
                                        <strong>Father Name:</strong>
                                        <asp:Label ID="lblViewFatherName" runat="server"></asp:Label>
                                    </p>
                                    <p>
                                        <strong>Surname:</strong>
                                        <asp:Label ID="lblViewSurname" runat="server"></asp:Label>
                                    </p>
                                    <p>
                                        <strong>Age:</strong>
                                        <asp:Label ID="lblViewAge" runat="server"></asp:Label>
                                    </p>
                                    <p>
                                        <strong>Gender:</strong>
                                        <asp:Label ID="lblViewGender" runat="server"></asp:Label>
                                    </p>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="card h-100">
                                <div class="card-header bg-light">
                                    <h6 class="mb-0">Academic Information</h6>
                                </div>
                                <div class="card-body">
                                    <p>
                                        <strong>Class:</strong>
                                        <asp:Label ID="lblViewClass" runat="server"></asp:Label>
                                    </p>
                                    <p>
                                        <strong>Subject:</strong>
                                        <asp:Label ID="lblViewSubject" runat="server"></asp:Label>
                                    </p>
                                    <p>
                                        <strong>Tuition Type:</strong>
                                        <asp:Label ID="lblViewTuitionType" runat="server"></asp:Label>
                                    </p>
                                    <p>
                                        <strong>Tutor Preferred:</strong>
                                        <asp:Label ID="lblViewTutorPreferred" runat="server"></asp:Label>
                                    </p>
                                    <p>
                                        <strong>Going To:</strong>
                                        <asp:Label ID="lblViewGoingTo" runat="server"></asp:Label>
                                    </p>
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
                                            <p>
                                                <strong>Username:</strong>
                                                <asp:Label ID="lblViewUsername" runat="server"></asp:Label>
                                            </p>
                                            <p>
                                                <strong>Contact Number:</strong>
                                                <asp:Label ID="lblViewContactNumber" runat="server"></asp:Label>
                                            </p>
                                            <p>
                                                <strong>City:</strong>
                                                <asp:Label ID="lblViewCity" runat="server"></asp:Label>
                                            </p>
                                            <p>
                                                <strong>Country:</strong>
                                                <asp:Label ID="lblViewCountry" runat="server"></asp:Label>
                                            </p>
                                        </div>
                                        <div class="col-md-6">
                                            <p><strong>Address:</strong></p>
                                            <p>
                                                <asp:Label ID="lblViewAddress" runat="server"></asp:Label>
                                            </p>
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

    <!-- Scripts -->
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
