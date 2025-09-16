<%@ Page Title="" Language="C#" MasterPageFile="~/TMS_Site.Master" AutoEventWireup="true" CodeBehind="Tutor_Signup.aspx.cs" Inherits="TMS_project.Tutor_Signup" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <br />
    <div class="container py-4 mt-3">
        <div class="card shadow mb-3 my-3 p-3">
            <div class="bg-info mt-2 mb-2 p-3">
                <h2 class="text-center mb-4 mt-4 text-black">Tutor Signup</h2>
            </div>

            <div class="row g-3">
                <!-- Name -->
                <div class="col-md-4">
                    <asp:TextBox ID="txtName" runat="server" CssClass="form-control" placeholder="Enter Name"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvName" runat="server" ControlToValidate="txtName"
                        ErrorMessage="Name is required" CssClass="text-danger" Display="Dynamic" />
                </div>

                <!-- Surname -->
                <div class="col-md-4">
                    <asp:TextBox ID="txtSurname" runat="server" CssClass="form-control" placeholder="Enter Surname"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvSurname" runat="server" ControlToValidate="txtSurname"
                        ErrorMessage="Surname is required" CssClass="text-danger" Display="Dynamic" />
                </div>

                <!-- Gender -->
                <div class="col-md-4">
                    <asp:DropDownList ID="ddlGender" runat="server" CssClass="form-select">
                        <asp:ListItem Value="">Select Gender</asp:ListItem>
                        <asp:ListItem>Male</asp:ListItem>
                        <asp:ListItem>Female</asp:ListItem>
                    </asp:DropDownList>
                    <asp:RequiredFieldValidator ID="rfvGender" runat="server" ControlToValidate="ddlGender"
                        InitialValue="" ErrorMessage="Gender is required" CssClass="text-danger" Display="Dynamic" />
                </div>

                <!-- Age -->
                <div class="col-md-4">
                    <asp:TextBox ID="txtAge" runat="server" CssClass="form-control" placeholder="Enter Age"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvAge" runat="server" ControlToValidate="txtAge"
                        ErrorMessage="Age is required" CssClass="text-danger" Display="Dynamic" />
                    <asp:RangeValidator ID="rvAge" runat="server" ControlToValidate="txtAge"
                        MinimumValue="18" MaximumValue="90" Type="Integer"
                        ErrorMessage="Age must be between 20 and 80" CssClass="text-danger" Display="Dynamic" />
                </div>

                <!-- Marital Status -->
                <div class="col-md-4">
                    <asp:DropDownList ID="ddlMaritalStatus" runat="server" CssClass="form-select">
                        <asp:ListItem Value="">Select Marital Status</asp:ListItem>
                        <asp:ListItem>Single</asp:ListItem>
                        <asp:ListItem>Married</asp:ListItem>
                        <asp:ListItem>Other</asp:ListItem>

                    </asp:DropDownList>
                    <asp:RequiredFieldValidator ID="rfvMaritalStatus" runat="server" ControlToValidate="ddlMaritalStatus"
                        InitialValue="" ErrorMessage="Marital status is required" CssClass="text-danger" Display="Dynamic" />
                </div>

                <!-- Country -->
                <div class="col-md-4">
                    <asp:TextBox ID="txtCountry" runat="server" CssClass="form-control" placeholder="Enter Country"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvCountry" runat="server" ControlToValidate="txtCountry"
                        ErrorMessage="Country is required" CssClass="text-danger" Display="Dynamic" />
                </div>

                <!-- City -->
                <div class="col-md-4">
                    <asp:TextBox ID="txtCity" runat="server" CssClass="form-control" placeholder="Enter City"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvCity" runat="server" ControlToValidate="txtCity"
                        ErrorMessage="City is required" CssClass="text-danger" Display="Dynamic" />
                </div>

                <!-- Address -->
                <div class="col-md-4">
                    <asp:TextBox ID="txtAddress" runat="server" CssClass="form-control" TextMode="MultiLine" placeholder="Enter Address"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvAddress" runat="server" ControlToValidate="txtAddress"
                        ErrorMessage="Address is required" CssClass="text-danger" Display="Dynamic" />
                </div>

                <!-- Qualification -->
                <div class="col-md-4">
                    <asp:DropDownList ID="ddlqulification" runat="server" CssClass="form-select">
                        <asp:ListItem Value="">Select Qualification</asp:ListItem>
                        <asp:ListItem>Graduate</asp:ListItem>
                        <asp:ListItem>Master</asp:ListItem>
                        <asp:ListItem>PHD</asp:ListItem>
                        <asp:ListItem>MPHIL</asp:ListItem>
                        <asp:ListItem>Other</asp:ListItem>

                    </asp:DropDownList>
                    <asp:RequiredFieldValidator ID="rfvQualification" runat="server" ControlToValidate="ddlqulification"
                        InitialValue="" ErrorMessage="Qualification is required" CssClass="text-danger" Display="Dynamic" />
                </div>


                <!-- Degree -->
                <div class="col-md-4">
                    <asp:TextBox ID="txtDegree" runat="server" CssClass="form-control" placeholder="Enter Degree"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvDegree" runat="server" ControlToValidate="txtDegree"
                        ErrorMessage="Degree is required" CssClass="text-danger" Display="Dynamic" />
                </div>

                <!-- Experience -->
                <div class="col-md-4">
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
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="ddlExperience"
                        InitialValue="" ErrorMessage="Experience is required" CssClass="text-danger" Display="Dynamic" />
                </div>

                <!-- Contact Number -->
                <div class="col-md-4">
                    <asp:TextBox ID="txtContact" runat="server" CssClass="form-control" placeholder="Enter Contact No"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvContact" runat="server" ControlToValidate="txtContact"
                        ErrorMessage="Contact number is required" CssClass="text-danger" Display="Dynamic" />
                    <asp:RegularExpressionValidator ID="revContact" runat="server" ControlToValidate="txtContact"
                        ValidationExpression="^\d{1,11}$" ErrorMessage="Enter valid contact number (1-11 digits)" CssClass="text-danger" Display="Dynamic" />
                </div>

                <!-- Username -->
                <div class="col-md-4">
                    <asp:TextBox ID="txtUsername" runat="server" CssClass="form-control" placeholder="Enter Username"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvUsername" runat="server" ControlToValidate="txtUsername"
                        ErrorMessage="Username is required" CssClass="text-danger" Display="Dynamic" />
                </div>

                <!-- Password -->
                <div class="col-md-4">
                    <asp:TextBox ID="txtPassword" runat="server" CssClass="form-control" TextMode="Password" placeholder="Enter Password"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvPassword" runat="server" ControlToValidate="txtPassword"
                        ErrorMessage="Password is required" CssClass="text-danger" Display="Dynamic" />
                </div>

                <!-- Confirm Password -->
                <div class="col-md-4">
                    <asp:TextBox ID="txtConfirmPassword" runat="server" CssClass="form-control" TextMode="Password" placeholder="Confirm Password"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvcpassword" runat="server" ControlToValidate="txtConfirmPassword"
                        ErrorMessage="Password is required" CssClass="text-danger" Display="Dynamic" />
                    <asp:CompareValidator ID="cvPassword" runat="server" ControlToCompare="txtPassword" ControlToValidate="txtConfirmPassword"
                        ErrorMessage="Passwords do not match" CssClass="text-danger" Display="Dynamic" />
                </div>

                <!-- Email -->
                <div class="col-md-4">
                    <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control" placeholder="Enter Email"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvemail" runat="server" ControlToValidate="txtEmail"
                        ErrorMessage="Email is required" CssClass="text-danger" Display="Dynamic" />
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="chose strong email" ControlToValidate="txtEmail" Display="Dynamic" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                </div>



            </div>

            <!-- Submit -->
            <div class="text-center mt-6 mb-3">
                <asp:Button ID="btnSignup" runat="server" Text="Sign Up" CssClass="btn btn-primary px-5 shadow" OnClick="btnSignup_Click" />
            </div>

            <div class="text-center mt-4 mb-3 col-md-12">
                <a href="student_Signup.aspx" class="btn btn-success" >Stduent Signup</a>
                <a href="Tutor_Signup.aspx"   class="btn btn-success" >Tutor  Signup</a>

            </div>
        </div>
    </div>


</asp:Content>
