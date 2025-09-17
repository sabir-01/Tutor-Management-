<%@ Page Title="" Language="C#" MasterPageFile="~/TMS_Site.Master" AutoEventWireup="true" CodeBehind="Tutor_Signup.aspx.cs" Inherits="TMS_project.Tutor_Signup" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .signup-container {
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
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
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
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
            border-color: #667eea;
            box-shadow: 0 0 0 3px rgba(102, 126, 234, 0.1);
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
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            border: none;
            border-radius: 25px;
            padding: 15px 40px;
            font-size: 18px;
            font-weight: 600;
            color: white;
            box-shadow: 0 10px 20px rgba(102, 126, 234, 0.3);
            transition: all 0.3s ease;
            text-transform: uppercase;
            letter-spacing: 1px;
        }

        .btn-signup:hover {
            transform: translateY(-2px);
            box-shadow: 0 15px 30px rgba(102, 126, 234, 0.4);
            background: linear-gradient(135deg, #764ba2 0%, #667eea 100%);
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
                    <h2 class="text-center signup-title">✨ Tutor Registration ✨</h2>
                    <p class="text-center mb-0 mt-2" style="opacity: 0.9;">Join our community of excellent educators</p>
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
                                ErrorMessage="✗ Name is required" CssClass="text-danger" Display="Dynamic" />
                        </div>

                        <!-- Surname -->
                        <div class="col-lg-4 col-md-6">
                            <div class="input-group">
                                <i class="fas fa-user-tag input-icon"></i>
                                <asp:TextBox ID="txtSurname" runat="server" CssClass="form-control" placeholder="Enter your surname"></asp:TextBox>
                            </div>
                            <asp:RequiredFieldValidator ID="rfvSurname" runat="server" ControlToValidate="txtSurname"
                                ErrorMessage="✗ Surname is required" CssClass="text-danger" Display="Dynamic" />
                        </div>

                        <!-- Gender -->
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
                                InitialValue="" ErrorMessage="✗ Gender is required" CssClass="text-danger" Display="Dynamic" />
                        </div>

                        <!-- Age -->
                        <div class="col-lg-4 col-md-6">
                            <div class="input-group">
                                <i class="fas fa-calendar-alt input-icon"></i>
                                <asp:TextBox ID="txtAge" runat="server" CssClass="form-control" placeholder="Enter your age"></asp:TextBox>
                            </div>
                            <asp:RequiredFieldValidator ID="rfvAge" runat="server" ControlToValidate="txtAge"
                                ErrorMessage="✗ Age is required" CssClass="text-danger" Display="Dynamic" />
                            <asp:RangeValidator ID="rvAge" runat="server" ControlToValidate="txtAge"
                                MinimumValue="18" MaximumValue="90" Type="Integer"
                                ErrorMessage="✗ Age must be between 18 and 90" CssClass="text-danger" Display="Dynamic" />
                        </div>

                        <!-- Marital Status -->
                        <div class="col-lg-4 col-md-6">
                            <div class="input-group">
                                <i class="fas fa-heart input-icon"></i>
                                <asp:DropDownList ID="ddlMaritalStatus" runat="server" CssClass="form-select">
                                    <asp:ListItem Value="">Select Marital Status</asp:ListItem>
                                    <asp:ListItem>Single</asp:ListItem>
                                    <asp:ListItem>Married</asp:ListItem>
                                    <asp:ListItem>Other</asp:ListItem>
                                </asp:DropDownList>
                            </div>
                            <asp:RequiredFieldValidator ID="rfvMaritalStatus" runat="server" ControlToValidate="ddlMaritalStatus"
                                InitialValue="" ErrorMessage="✗ Marital status is required" CssClass="text-danger" Display="Dynamic" />
                        </div>

                        <!-- Country -->
                        <div class="col-lg-4 col-md-6">
                            <div class="input-group">
                                <i class="fas fa-globe input-icon"></i>
                                <asp:TextBox ID="txtCountry" runat="server" CssClass="form-control" placeholder="Enter your country"></asp:TextBox>
                            </div>
                            <asp:RequiredFieldValidator ID="rfvCountry" runat="server" ControlToValidate="txtCountry"
                                ErrorMessage="✗ Country is required" CssClass="text-danger" Display="Dynamic" />
                        </div>

                        <!-- City -->
                        <div class="col-lg-4 col-md-6">
                            <div class="input-group">
                                <i class="fas fa-city input-icon"></i>
                                <asp:TextBox ID="txtCity" runat="server" CssClass="form-control" placeholder="Enter your city"></asp:TextBox>
                            </div>
                            <asp:RequiredFieldValidator ID="rfvCity" runat="server" ControlToValidate="txtCity"
                                ErrorMessage="✗ City is required" CssClass="text-danger" Display="Dynamic" />
                        </div>

                        <!-- Address -->
                        <div class="col-lg-4 col-md-6">
                            <div class="input-group">
                                <i class="fas fa-map-marker-alt input-icon"></i>
                                <asp:TextBox ID="txtAddress" runat="server" CssClass="form-control" TextMode="MultiLine" placeholder="Enter your address"></asp:TextBox>
                            </div>
                            <asp:RequiredFieldValidator ID="rfvAddress" runat="server" ControlToValidate="txtAddress"
                                ErrorMessage="✗ Address is required" CssClass="text-danger" Display="Dynamic" />
                        </div>

                        <!-- Qualification -->
                        <div class="col-lg-4 col-md-6">
                            <div class="input-group">
                                <i class="fas fa-graduation-cap input-icon"></i>
                                <asp:DropDownList ID="ddlqulification" runat="server" CssClass="form-select">
                                    <asp:ListItem Value="">Select Qualification</asp:ListItem>
                                    <asp:ListItem>Graduate</asp:ListItem>
                                    <asp:ListItem>Master</asp:ListItem>
                                    <asp:ListItem>PHD</asp:ListItem>
                                    <asp:ListItem>MPHIL</asp:ListItem>
                                    <asp:ListItem>Other</asp:ListItem>
                                </asp:DropDownList>
                            </div>
                            <asp:RequiredFieldValidator ID="rfvQualification" runat="server" ControlToValidate="ddlqulification"
                                InitialValue="" ErrorMessage="✗ Qualification is required" CssClass="text-danger" Display="Dynamic" />
                        </div>

                        <!-- Degree -->
                        <div class="col-lg-4 col-md-6">
                            <div class="input-group">
                                <i class="fas fa-certificate input-icon"></i>
                                <asp:TextBox ID="txtDegree" runat="server" CssClass="form-control" placeholder="Enter your degree"></asp:TextBox>
                            </div>
                            <asp:RequiredFieldValidator ID="rfvDegree" runat="server" ControlToValidate="txtDegree"
                                ErrorMessage="✗ Degree is required" CssClass="text-danger" Display="Dynamic" />
                        </div>

                        <!-- Experience -->
                        <div class="col-lg-4 col-md-6">
                            <div class="input-group">
                                <i class="fas fa-briefcase input-icon"></i>
                                <asp:DropDownList ID="ddlExperience" runat="server" CssClass="form-select">
                                    <asp:ListItem Value="">Select Experience</asp:ListItem>
                                    <asp:ListItem>1 Year</asp:ListItem>
                                    <asp:ListItem>2 Year</asp:ListItem>
                                    <asp:ListItem>3 Year</asp:ListItem>
                                    <asp:ListItem>4 Year</asp:ListItem>
                                    <asp:ListItem>5 Year</asp:ListItem>
                                    <asp:ListItem>6 Year</asp:ListItem>
                                    <asp:ListItem>7 Year</asp:ListItem>
                                    <asp:ListItem>8 Year</asp:ListItem>
                                    <asp:ListItem>9 Year</asp:ListItem>
                                    <asp:ListItem>Other</asp:ListItem>
                                </asp:DropDownList>
                            </div>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="ddlExperience"
                                InitialValue="" ErrorMessage="✗ Experience is required" CssClass="text-danger" Display="Dynamic" />
                        </div>

                        <!-- Contact Number -->
                        <div class="col-lg-4 col-md-6">
                            <div class="input-group">
                                <i class="fas fa-phone input-icon"></i>
                                <asp:TextBox ID="txtContact" runat="server" CssClass="form-control" placeholder="Enter contact number"></asp:TextBox>
                            </div>
                            <asp:RequiredFieldValidator ID="rfvContact" runat="server" ControlToValidate="txtContact"
                                ErrorMessage="✗ Contact number is required" CssClass="text-danger" Display="Dynamic" />
                            <asp:RegularExpressionValidator ID="revContact" runat="server" ControlToValidate="txtContact"
                                ValidationExpression="^\d{1,11}$" ErrorMessage="✗ Enter valid contact number (1-11 digits)" CssClass="text-danger" Display="Dynamic" />
                        </div>

                        <!-- Username -->
                        <div class="col-lg-4 col-md-6">
                            <div class="input-group">
                                <i class="fas fa-user-circle input-icon"></i>
                                <asp:TextBox ID="txtUsername" runat="server" CssClass="form-control" placeholder="Choose a username"></asp:TextBox>
                            </div>
                            <asp:RequiredFieldValidator ID="rfvUsername" runat="server" ControlToValidate="txtUsername"
                                ErrorMessage="✗ Username is required" CssClass="text-danger" Display="Dynamic" />
                        </div>

                        <!-- Password -->
                        <div class="col-lg-4 col-md-6">
                            <div class="input-group">
                                <i class="fas fa-lock input-icon"></i>
                                <asp:TextBox ID="txtPassword" runat="server" CssClass="form-control" TextMode="Password" placeholder="Create password"></asp:TextBox>
                            </div>
                            <asp:RequiredFieldValidator ID="rfvPassword" runat="server" ControlToValidate="txtPassword"
                                ErrorMessage="✗ Password is required" CssClass="text-danger" Display="Dynamic" />
                        </div>

                        <!-- Confirm Password -->
                        <div class="col-lg-4 col-md-6">
                            <div class="input-group">
                                <i class="fas fa-lock input-icon"></i>
                                <asp:TextBox ID="txtConfirmPassword" runat="server" CssClass="form-control" TextMode="Password" placeholder="Confirm password"></asp:TextBox>
                            </div>
                            <asp:RequiredFieldValidator ID="rfvcpassword" runat="server" ControlToValidate="txtConfirmPassword"
                                ErrorMessage="✗ Confirm password is required" CssClass="text-danger" Display="Dynamic" />
                            <asp:CompareValidator ID="cvPassword" runat="server" ControlToCompare="txtPassword" ControlToValidate="txtConfirmPassword"
                                ErrorMessage="✗ Passwords do not match" CssClass="text-danger" Display="Dynamic" />
                        </div>

                        <!-- Email -->
                        <div class="col-lg-4 col-md-6">
                            <div class="input-group">
                                <i class="fas fa-envelope input-icon"></i>
                                <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control" placeholder="Enter email address"></asp:TextBox>
                            </div>
                            <asp:RequiredFieldValidator ID="rfvemail" runat="server" ControlToValidate="txtEmail"
                                ErrorMessage="✗ Email is required" CssClass="text-danger" Display="Dynamic" />
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="✗ Please enter a valid email address" ControlToValidate="txtEmail" Display="Dynamic" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" CssClass="text-danger"></asp:RegularExpressionValidator>
                        </div>
                    </div>

                    <!-- Submit Button -->
                    <div class="text-center mt-5">
                        <asp:Button ID="btnSignup" runat="server" Text="🚀 Create My Account" CssClass="btn btn-signup px-5 py-3 shadow-lg" OnClick="btnSignup_Click" />
                    </div>

                    <!-- Navigation Buttons -->
                    <div class="navigation-buttons text-center">
                        <h5 class="mb-3" style="color: #6c757d;">Choose Your Registration Type</h5>
                        <a href="student_Signup.aspx" class="btn btn-nav">📚 Student Registration</a>
                        <a href="admin/Login_form.aspx" class="btn btn-nav">👨‍🏫 Admin Registration</a>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>