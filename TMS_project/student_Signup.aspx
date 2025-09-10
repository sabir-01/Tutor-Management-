<%@ Page Title="" Language="C#" MasterPageFile="~/TMS_Site.Master" AutoEventWireup="true" CodeBehind="student_Signup.aspx.cs" Inherits="TMS_project.student_Signup" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <br />

    <div class="container py-4  mt-3">
        <div class="card shadow mb-3 my-3 p-3">
            <div class="bg-info mt-2 mb-2 p-3">
                <h2 class="text-center mb-4 mt-4 text-black">Student Signup</h2>

            </div>

            <div class="row g-3">
                <!-- Name -->
                <div class="col-md-4">
                    <asp:TextBox ID="txtName" runat="server" CssClass="form-control" placeholder="Enter Name"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvName" runat="server" ControlToValidate="txtName"
                        ErrorMessage="Name is required" CssClass="text-danger" Display="Dynamic" SetFocusOnError="true" />
                </div>

                <!-- City -->
                <div class="col-md-4">
                    <asp:TextBox ID="txtCity" runat="server" CssClass="form-control" placeholder="Enter City"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvCity" runat="server" ControlToValidate="txtCity"
                        ErrorMessage="City is required" CssClass="text-danger" Display="Dynamic" SetFocusOnError="true" />
                </div>

                <!-- Contact Number -->
                <div class="col-md-4">
                    <asp:TextBox ID="txtContact" runat="server" CssClass="form-control" placeholder="Enter Contact Number"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvContact" runat="server" ControlToValidate="txtContact"
                        ErrorMessage="Contact number is required" CssClass="text-danger" Display="Dynamic" SetFocusOnError="true" />
                </div>

                <!-- Father Name -->
                <div class="col-md-4">
                    <asp:TextBox ID="txtFatherName" runat="server" CssClass="form-control" placeholder="Enter Father Name"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvFather" runat="server" ControlToValidate="txtFatherName"
                        ErrorMessage="Father Name is required" CssClass="text-danger" Display="Dynamic" SetFocusOnError="true" />
                </div>

                <!-- Address -->
                <div class="col-md-4">
                    <asp:TextBox ID="txtAddress" runat="server" TextMode="MultiLine" CssClass="form-control" placeholder="Enter Address"></asp:TextBox>
                </div>

                <!-- Tuition Type Dropdown -->
                <div class="col-md-4">
                    <asp:DropDownList ID="ddlTuitionType" runat="server" CssClass="form-select">
                        <asp:ListItem Value="">Select Tuition Type</asp:ListItem>
                        <asp:ListItem>Physical</asp:ListItem>
                        <asp:ListItem>Online</asp:ListItem>
                    </asp:DropDownList>
                    <asp:RequiredFieldValidator ID="rfvTuition" runat="server" ControlToValidate="ddlTuitionType"
                        InitialValue="" ErrorMessage="Select Tuition Type" CssClass="text-danger" Display="Dynamic" SetFocusOnError="true" />
                </div>

                <!-- Surname -->
                <div class="col-md-4">
                    <asp:TextBox ID="txtSurname" runat="server" CssClass="form-control" placeholder="Enter Surname"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvsurname" runat="server" ControlToValidate="txtSurname"
                        InitialValue="" ErrorMessage="Enter surname" CssClass="text-danger" Display="Dynamic" SetFocusOnError="true" />

                </div>

                <!-- Gender Dropdown -->
                <div class="col-md-4">
                    <asp:DropDownList ID="ddlGender" runat="server" CssClass="form-select">
                        <asp:ListItem Value="">Select Gender</asp:ListItem>
                        <asp:ListItem>Male</asp:ListItem>
                        <asp:ListItem>Female</asp:ListItem>
                    </asp:DropDownList>
                    <asp:RequiredFieldValidator ID="rfvGender" runat="server" ControlToValidate="ddlGender"
                        InitialValue="" ErrorMessage="Select Gender" CssClass="text-danger" Display="Dynamic" SetFocusOnError="true" />
                </div>

                <!-- Class -->
                <div class="col-md-4">
                    <asp:TextBox ID="txtClass" runat="server" CssClass="form-control" placeholder="Enter Class"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvclass" runat="server" ControlToValidate="txtClass"
                        InitialValue="" ErrorMessage="Select Gender" CssClass="text-danger" Display="Dynamic" SetFocusOnError="true" />
                </div>

                <!-- Tutor Preferred Dropdown -->
                <div class="col-md-4">
                    <asp:DropDownList ID="ddlTutor" runat="server" CssClass="form-select">
                        <asp:ListItem Value="">Select Tutor Preferred</asp:ListItem>
                        <asp:ListItem>Graduate</asp:ListItem>
                        <asp:ListItem>Master</asp:ListItem>
                        <asp:ListItem>MPHILL</asp:ListItem>
                        <asp:ListItem>PHD</asp:ListItem>
                        <asp:ListItem>Other</asp:ListItem>

                    </asp:DropDownList>
                    <asp:RequiredFieldValidator ID="rfvTutor" runat="server" ControlToValidate="ddlTutor" SetFocusOnError="true"
                        InitialValue="" ErrorMessage="Select Tutor Preference" CssClass="text-danger" Display="Dynamic" />
                </div>

                <!-- Username -->
                <div class="col-md-4">
                    <asp:TextBox ID="txtUsername" runat="server" CssClass="form-control" placeholder="Enter Username"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvUsername" runat="server" ControlToValidate="txtUsername"
                        ErrorMessage="Username is required" CssClass="text-danger" Display="Dynamic" SetFocusOnError="true" />
                </div>

                <!-- Age -->
                <div class="col-md-4">
                    <asp:TextBox ID="txtAge" runat="server" CssClass="form-control" placeholder="Enter Age"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvage" runat="server" ControlToValidate="txtAge"
                        ErrorMessage="age is required" CssClass="text-danger" Display="Dynamic" SetFocusOnError="true" />
                    <asp:RangeValidator ID="RangeValidator1" runat="server" CssClass="text-danger" ErrorMessage="Age should be 5 to 90" ControlToValidate="txtAge" Display="Dynamic" MaximumValue="90" MinimumValue="5" SetFocusOnError="True" Type="Integer"></asp:RangeValidator>
                </div>
            </div>

            <div class="row g-3 mt-2">
                <!-- Going To Dropdown -->
                <div class="col-md-4">
                    <asp:DropDownList ID="ddlGoingTo" runat="server" CssClass="form-select">
                        <asp:ListItem Value="">Select Going To</asp:ListItem>
                        <asp:ListItem>School</asp:ListItem>
                        <asp:ListItem>College</asp:ListItem>
                        <asp:ListItem>University</asp:ListItem>
                        <asp:ListItem>Others</asp:ListItem>
                    </asp:DropDownList>
                    <asp:RequiredFieldValidator ID="rfvGoing" runat="server" ControlToValidate="ddlGoingTo"
                        InitialValue="" ErrorMessage="Select Going To" CssClass="text-danger" Display="Dynamic" SetFocusOnError="true" />
                </div>

                <!-- Password -->
                <div class="col-md-4">
                    <asp:TextBox ID="txtPassword" runat="server" TextMode="Password" CssClass="form-control" placeholder="Enter Password"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvPassword" runat="server" ControlToValidate="txtPassword"
                        ErrorMessage="Password is required" CssClass="text-danger" Display="Dynamic" SetFocusOnError="true" />
                </div>

                <!-- Re-Enter Password -->
                <div class="col-md-4">
                    <asp:TextBox ID="txtConfirmPassword" runat="server" TextMode="Password" CssClass="form-control" placeholder="Re-Enter Password"></asp:TextBox>
                    <asp:CompareValidator ID="cvPassword" runat="server" ControlToCompare="txtPassword" ControlToValidate="txtConfirmPassword"
                        ErrorMessage="Passwords do not match" SetFocusOnError="true" CssClass="text-danger" Display="Dynamic" />
                </div>

                <!-- Subject -->
                <div class="col-md-4">
                    <asp:TextBox ID="txtSubject" runat="server" CssClass="form-control" placeholder="Enter Subject"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvsubject" runat="server" ControlToValidate="txtSubject"
                        ErrorMessage="Enter subject" CssClass="text-danger" Display="Dynamic" SetFocusOnError="true" />
                </div>

                <!-- Country -->
                <div class="col-md-4">
                    <asp:TextBox ID="txtCountry" runat="server" CssClass="form-control" placeholder="Enter Country"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvcountry" runat="server" ControlToValidate="txtCountry"
                        ErrorMessage="Enter country" CssClass="text-danger" Display="Dynamic" SetFocusOnError="true" />

                </div>
            </div>

            <!-- Submit -->
            <div class="text-center mt-4 mb-3">
                <asp:Button ID="btnSignup" runat="server" Text="Sign Up" CssClass="btn btn-primary px-5 shadow" OnClick="btnSignup_Click" />
            </div>

            <div class="text-center mt-4 mb-3 col-md-12">
                <a href="student_Signup.aspx" class="btn btn-success">Stduent Signup</a>
                <a href="Tutor_Signup.aspx" class="btn   btn-success ">Tutor  Signup</a>

            </div>
        </div>
    </div>

    <br />
</asp:Content>
