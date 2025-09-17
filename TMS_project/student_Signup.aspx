<%@ Page Title="" Language="C#" MasterPageFile="~/TMS_Site.Master" AutoEventWireup="true" CodeBehind="student_Signup.aspx.cs" Inherits="TMS_project.student_Signup" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .signup-container {
            background: linear-gradient(135deg, #4facfe 0%, #00f2fe 100%);
            min-height: 100vh;
            padding: 40px 0;
        }

        .signup-card {
            background: rgba(255, 255, 255, 0.95);
            border-radius: 20px;
            box-shadow: 0 20px 40px rgba(0, 0, 0, 0.1);
            border: none;
            backdrop-filter: blur(10px);
            overflow: hidden;
        }

        .signup-header {
            background: linear-gradient(135deg, #4facfe 0%, #00f2fe 100%);
            color: white;
            margin: 0;
            border-radius: 0;
            position: relative;
            overflow: hidden;
        }

        .signup-header::before {
            content: '';
            position: absolute;
            top: 0;
            left: 0;
            right: 0;
            bottom: 0;
            background: url('data:image/svg+xml,<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 100 20"><defs><radialGradient id="a" cx="50%" cy="0%" r="100%"><stop offset="0%" stop-color="rgba(255,255,255,0.1)"/><stop offset="100%" stop-color="rgba(255,255,255,0)"/></radialGradient></defs><rect width="100" height="20" fill="url(%23a)"/></svg>') repeat-x;
            opacity: 0.3;
        }

        .signup-title {
            font-size: 2.5rem;
            font-weight: 700;
            text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.1);
            margin: 0;
            position: relative;
            z-index: 1;
        }

        .form-floating {
            position: relative;
            margin-bottom: 1.5rem;
        }

        .form-control, .form-select {
            border: 2px solid #e1e5e9;
            border-radius: 12px;
            padding: 12px 16px;
            font-size: 16px;
            transition: all 0.3s ease;
            background: rgba(255, 255, 255, 0.9);
            height: auto;
            min-height: 50px;
        }

        .form-control:focus, .form-select:focus {
            border-color: #4facfe;
            box-shadow: 0 0 0 3px rgba(79, 172, 254, 0.1);
            background: white;
            transform: translateY(-1px);
        }

        .form-control::placeholder {
            color: #adb5bd;
            font-weight: 400;
        }

        .input-group {
            position: relative;
            margin-bottom: 1.5rem;
        }

        .input-icon {
            position: absolute;
            left: 15px;
            top: 50%;
            transform: translateY(-50%);
            color: #6c757d;
            z-index: 3;
            font-size: 18px;
        }

        .input-group .form-control,
        .input-group .form-select {
            padding-left: 50px;
        }

        .text-danger {
            font-size: 0.875rem;
            margin-top: 0.25rem;
            display: block;
            animation: fadeIn 0.3s ease;
        }

        @keyframes fadeIn {
            from { opacity: 0; transform: translateY(-5px); }
            to { opacity: 1; transform: translateY(0); }
        }

        .btn-signup {
            background: linear-gradient(135deg, #4facfe 0%, #00f2fe 100%);
            border: none;
            border-radius: 25px;
            padding: 15px 40px;
            font-size: 18px;
            font-weight: 600;
            color: white;
            box-shadow: 0 10px 20px rgba(79, 172, 254, 0.3);
            transition: all 0.3s ease;
            text-transform: uppercase;
            letter-spacing: 1px;
        }

        .btn-signup:hover {
            transform: translateY(-2px);
            box-shadow: 0 15px 30px rgba(79, 172, 254, 0.4);
            background: linear-gradient(135deg, #00f2fe 0%, #4facfe 100%);
        }

        .btn-signup:active {
            transform: translateY(0);
        }

        .navigation-buttons {
            background: rgba(248, 249, 250, 0.8);
            padding: 20px;
            border-radius: 15px;
            margin-top: 30px;
        }

        .btn-nav {
            background: linear-gradient(135deg, #28a745 0%, #20c997 100%);
            border: none;
            border-radius: 20px;
            padding: 10px 25px;
            margin: 0 10px;
            color: white;
            font-weight: 500;
            transition: all 0.3s ease;
            text-decoration: none;
            display: inline-block;
        }

        .btn-nav:hover {
            transform: translateY(-2px);
            box-shadow: 0 8px 15px rgba(40, 167, 69, 0.3);
            color: white;
            text-decoration: none;
        }

        .form-section {
            padding: 40px;
            position: relative;
        }

        .form-row {
            margin-bottom: 10px;
        }

        /* Responsive improvements */
        @media (max-width: 768px) {
            .signup-container {
                padding: 20px 0;
            }

            .signup-title {
                font-size: 2rem;
            }

            .form-section {
                padding: 30px 20px;
            }

            .btn-nav {
                margin: 5px;
                display: block;
                text-align: center;
            }
        }

        /* Animation for form appearance */
        .signup-card {
            animation: slideUp 0.6s ease-out;
        }

        @keyframes slideUp {
            from {
                opacity: 0;
                transform: translateY(30px);
            }
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }

        /* Icon styles */
        .fas {
            font-family: "Font Awesome 5 Free";
            font-weight: 900;
        }
    </style>
    <!-- Font Awesome for icons -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="signup-container">
        <div class="container py-4">
            <div class="card signup-card shadow-lg">
                <div class="signup-header p-4">
                    <h2 class="text-center signup-title">🎓 Student Registration 🎓</h2>
                    <p class="text-center mb-0 mt-2" style="opacity: 0.9;">Start your learning journey with us</p>
                </div>

                <div class="form-section">
                    <div class="row g-4">
                        <!-- Name -->
                        <div class="col-lg-4 col-md-6">
                            <div class="input-group">
                                <i class="fas fa-user input-icon"></i>
                                <asp:TextBox ID="txtName" runat="server" CssClass="form-control" placeholder="Enter your name"></asp:TextBox>
                            </div>
                            <asp:RequiredFieldValidator ID="rfvName" runat="server" ControlToValidate="txtName"
                                ErrorMessage="✗ Name is required" CssClass="text-danger" Display="Dynamic" SetFocusOnError="true" />
                        </div>

                        <!-- City -->
                        <div class="col-lg-4 col-md-6">
                            <div class="input-group">
                                <i class="fas fa-city input-icon"></i>
                                <asp:TextBox ID="txtCity" runat="server" CssClass="form-control" placeholder="Enter your city"></asp:TextBox>
                            </div>
                            <asp:RequiredFieldValidator ID="rfvCity" runat="server" ControlToValidate="txtCity"
                                ErrorMessage="✗ City is required" CssClass="text-danger" Display="Dynamic" SetFocusOnError="true" />
                        </div>

                        <!-- Contact Number -->
                        <div class="col-lg-4 col-md-6">
                            <div class="input-group">
                                <i class="fas fa-phone input-icon"></i>
                                <asp:TextBox ID="txtContact" runat="server" CssClass="form-control" placeholder="Enter contact number"></asp:TextBox>
                            </div>
                            <asp:RequiredFieldValidator ID="rfvContact" runat="server" ControlToValidate="txtContact"
                                ErrorMessage="✗ Contact number is required" CssClass="text-danger" Display="Dynamic" SetFocusOnError="true" />
                        </div>

                        <!-- Father Name -->
                        <div class="col-lg-4 col-md-6">
                            <div class="input-group">
                                <i class="fas fa-user-tie input-icon"></i>
                                <asp:TextBox ID="txtFatherName" runat="server" CssClass="form-control" placeholder="Enter father's name"></asp:TextBox>
                            </div>
                            <asp:RequiredFieldValidator ID="rfvFather" runat="server" ControlToValidate="txtFatherName"
                                ErrorMessage="✗ Father name is required" CssClass="text-danger" Display="Dynamic" SetFocusOnError="true" />
                        </div>

                        <!-- Address -->
                        <div class="col-lg-4 col-md-6">
                            <div class="input-group">
                                <i class="fas fa-map-marker-alt input-icon"></i>
                                <asp:TextBox ID="txtAddress" runat="server" TextMode="MultiLine" CssClass="form-control" placeholder="Enter your address"></asp:TextBox>
                            </div>
                        </div>

                        <!-- Tuition Type Dropdown -->
                        <div class="col-lg-4 col-md-6">
                            <div class="input-group">
                                <i class="fas fa-chalkboard-teacher input-icon"></i>
                                <asp:DropDownList ID="ddlTuitionType" runat="server" CssClass="form-select">
                                    <asp:ListItem Value="">Select Tuition Type</asp:ListItem>
                                    <asp:ListItem>Physical</asp:ListItem>
                                    <asp:ListItem>Online</asp:ListItem>
                                </asp:DropDownList>
                            </div>
                            <asp:RequiredFieldValidator ID="rfvTuition" runat="server" ControlToValidate="ddlTuitionType"
                                InitialValue="" ErrorMessage="✗ Select tuition type" CssClass="text-danger" Display="Dynamic" SetFocusOnError="true" />
                        </div>

                        <!-- Surname -->
                        <div class="col-lg-4 col-md-6">
                            <div class="input-group">
                                <i class="fas fa-user-tag input-icon"></i>
                                <asp:TextBox ID="txtSurname" runat="server" CssClass="form-control" placeholder="Enter your surname"></asp:TextBox>
                            </div>
                            <asp:RequiredFieldValidator ID="rfvsurname" runat="server" ControlToValidate="txtSurname"
                                InitialValue="" ErrorMessage="✗ Surname is required" CssClass="text-danger" Display="Dynamic" SetFocusOnError="true" />
                        </div>

                        <!-- Gender Dropdown -->
                        <div class="col-lg-4 col-md-6">
                            <div class="input-group">
                                <i class="fas fa-venus-mars input-icon"></i>
                                <asp:DropDownList ID="ddlGender" runat="server" CssClass="form-select">
                                    <asp:ListItem Value="">Select Gender</asp:ListItem>
                                    <asp:ListItem>Male</asp:ListItem>
                                    <asp:ListItem>Female</asp:ListItem>
                                </asp:DropDownList>
                            </div>
                            <asp:RequiredFieldValidator ID="rfvGender" runat="server" ControlToValidate="ddlGender"
                                InitialValue="" ErrorMessage="✗ Select gender" CssClass="text-danger" Display="Dynamic" SetFocusOnError="true" />
                        </div>

                        <!-- Class -->
                        <div class="col-lg-4 col-md-6">
                            <div class="input-group">
                                <i class="fas fa-school input-icon"></i>
                                <asp:TextBox ID="txtClass" runat="server" CssClass="form-control" placeholder="Enter your class"></asp:TextBox>
                            </div>
                            <asp:RequiredFieldValidator ID="rfvclass" runat="server" ControlToValidate="txtClass"
                                InitialValue="" ErrorMessage="✗ Class is required" CssClass="text-danger" Display="Dynamic" SetFocusOnError="true" />
                        </div>

                        <!-- Tutor Preferred Dropdown -->
                        <div class="col-lg-4 col-md-6">
                            <div class="input-group">
                                <i class="fas fa-user-graduate input-icon"></i>
                                <asp:DropDownList ID="ddlTutor" runat="server" CssClass="form-select">
                                    <asp:ListItem Value="">Select Tutor Preferred</asp:ListItem>
                                    <asp:ListItem>Graduate</asp:ListItem>
                                    <asp:ListItem>Master</asp:ListItem>
                                    <asp:ListItem>MPHILL</asp:ListItem>
                                    <asp:ListItem>PHD</asp:ListItem>
                                    <asp:ListItem>Other</asp:ListItem>
                                </asp:DropDownList>
                            </div>
                            <asp:RequiredFieldValidator ID="rfvTutor" runat="server" ControlToValidate="ddlTutor" SetFocusOnError="true"
                                InitialValue="" ErrorMessage="✗ Select tutor preference" CssClass="text-danger" Display="Dynamic" />
                        </div>

                        <!-- Username -->
                        <div class="col-lg-4 col-md-6">
                            <div class="input-group">
                                <i class="fas fa-user-circle input-icon"></i>
                                <asp:TextBox ID="txtUsername" runat="server" CssClass="form-control" placeholder="Choose a username"></asp:TextBox>
                            </div>
                            <asp:RequiredFieldValidator ID="rfvUsername" runat="server" ControlToValidate="txtUsername"
                                ErrorMessage="✗ Username is required" CssClass="text-danger" Display="Dynamic" SetFocusOnError="true" />
                        </div>

                        <!-- Age -->
                        <div class="col-lg-4 col-md-6">
                            <div class="input-group">
                                <i class="fas fa-calendar-alt input-icon"></i>
                                <asp:TextBox ID="txtAge" runat="server" CssClass="form-control" placeholder="Enter your age"></asp:TextBox>
                            </div>
                            <asp:RequiredFieldValidator ID="rfvage" runat="server" ControlToValidate="txtAge"
                                ErrorMessage="✗ Age is required" CssClass="text-danger" Display="Dynamic" SetFocusOnError="true" />
                            <asp:RangeValidator ID="RangeValidator1" runat="server" CssClass="text-danger" ErrorMessage="✗ Age should be between 5 and 90" ControlToValidate="txtAge" Display="Dynamic" MaximumValue="90" MinimumValue="5" SetFocusOnError="True" Type="Integer"></asp:RangeValidator>
                        </div>

                        <!-- Going To Dropdown -->
                        <div class="col-lg-4 col-md-6">
                            <div class="input-group">
                                <i class="fas fa-building input-icon"></i>
                                <asp:DropDownList ID="ddlGoingTo" runat="server" CssClass="form-select">
                                    <asp:ListItem Value="">Select Going To</asp:ListItem>
                                    <asp:ListItem>School</asp:ListItem>
                                    <asp:ListItem>College</asp:ListItem>
                                    <asp:ListItem>University</asp:ListItem>
                                    <asp:ListItem>Others</asp:ListItem>
                                </asp:DropDownList>
                            </div>
                            <asp:RequiredFieldValidator ID="rfvGoing" runat="server" ControlToValidate="ddlGoingTo"
                                InitialValue="" ErrorMessage="✗ Select where you're going" CssClass="text-danger" Display="Dynamic" SetFocusOnError="true" />
                        </div>

                        <!-- Password -->
                        <div class="col-lg-4 col-md-6">
                            <div class="input-group">
                                <i class="fas fa-lock input-icon"></i>
                                <asp:TextBox ID="txtPassword" runat="server" TextMode="Password" CssClass="form-control" placeholder="Create password"></asp:TextBox>
                            </div>
                            <asp:RequiredFieldValidator ID="rfvPassword" runat="server" ControlToValidate="txtPassword"
                                ErrorMessage="✗ Password is required" CssClass="text-danger" Display="Dynamic" SetFocusOnError="true" />
                        </div>

                        <!-- Re-Enter Password -->
                        <div class="col-lg-4 col-md-6">
                            <div class="input-group">
                                <i class="fas fa-lock input-icon"></i>
                                <asp:TextBox ID="txtConfirmPassword" runat="server" TextMode="Password" CssClass="form-control" placeholder="Confirm password"></asp:TextBox>
                            </div>
                            <asp:CompareValidator ID="cvPassword" runat="server" ControlToCompare="txtPassword" ControlToValidate="txtConfirmPassword"
                                ErrorMessage="✗ Passwords do not match" SetFocusOnError="true" CssClass="text-danger" Display="Dynamic" />
                        </div>

                        <!-- Subject -->
                        <div class="col-lg-4 col-md-6">
                            <div class="input-group">
                                <i class="fas fa-book input-icon"></i>
                                <asp:TextBox ID="txtSubject" runat="server" CssClass="form-control" placeholder="Enter subject"></asp:TextBox>
                            </div>
                            <asp:RequiredFieldValidator ID="rfvsubject" runat="server" ControlToValidate="txtSubject"
                                ErrorMessage="✗ Subject is required" CssClass="text-danger" Display="Dynamic" SetFocusOnError="true" />
                        </div>

                        <!-- Country -->
                        <div class="col-lg-4 col-md-6">
                            <div class="input-group">
                                <i class="fas fa-globe input-icon"></i>
                                <asp:TextBox ID="txtCountry" runat="server" CssClass="form-control" placeholder="Enter your country"></asp:TextBox>
                            </div>
                            <asp:RequiredFieldValidator ID="rfvcountry" runat="server" ControlToValidate="txtCountry"
                                ErrorMessage="✗ Country is required" CssClass="text-danger" Display="Dynamic" SetFocusOnError="true" />
                        </div>
                    </div>

                    <!-- Submit Button -->
                    <div class="text-center mt-5">
                        <asp:Button ID="btnSignup" runat="server" Text="🎉 Join Our Community" CssClass="btn btn-signup px-5 py-3 shadow-lg" OnClick="btnSignup_Click" />
                    </div>

                    <!-- Navigation Buttons -->
                    <div class="navigation-buttons text-center">
                        <h5 class="mb-3" style="color: #6c757d;">Choose Your Registration Type</h5>
                        <a href="admin/Login_form.aspx" class="btn btn-nav">📚 Admin Registration</a>
                        <a href="Tutor_Signup.aspx" class="btn btn-nav">👨‍🏫 Tutor Registration</a>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>