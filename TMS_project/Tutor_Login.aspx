<%@ Page Title="" Language="C#" MasterPageFile="~/TMS_Site.Master" AutoEventWireup="true" CodeBehind="Tutor_Login.aspx.cs" Inherits="TMS_project.Tutor_Login" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        :root {
            --primary: #4361ee;
            --secondary: #3a0ca3;
            --accent: #4cc9f0;
            --light: #f8f9fa;
            --dark: #212529;
            --success: #4bb543;
            --tutor-primary: #4361ee; /* Changed to match student blue */
            --tutor-secondary: #3a0ca3; /* Changed to match student blue */
        }

        .tutor-login-container {
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            min-height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
            padding: 20px;
            position: relative;
            overflow: hidden;
        }

        .tutor-login-card {
            background: rgba(255, 255, 255, 0.95);
            backdrop-filter: blur(10px);
            border: 1px solid rgba(255, 255, 255, 0.2);
            border-radius: 20px;
            box-shadow: 0 20px 40px rgba(0, 0, 0, 0.1);
            overflow: hidden;
            transition: transform 0.3s ease;
            max-width: 450px;
            width: 100%;
        }

            .tutor-login-card:hover {
                transform: translateY(-5px);
            }

        .tutor-login-header {
            background: linear-gradient(135deg, var(--tutor-primary) 0%, var(--tutor-secondary) 100%);
            padding: 2rem;
            text-align: center;
            position: relative;
        }

            .tutor-login-header::before {
                content: '';
                position: absolute;
                top: 0;
                left: 0;
                right: 0;
                bottom: 0;
                background: url('data:image/svg+xml,<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 100 100"><defs><pattern id="grid" width="10" height="10" patternUnits="userSpaceOnUse"><path d="M 10 0 L 0 0 0 10" fill="none" stroke="rgba(255,255,255,0.1)" stroke-width="1"/></pattern></defs><rect width="100" height="100" fill="url(%23grid)"/></svg>');
                opacity: 0.3;
            }

        .tutor-icon {
            background: rgba(255, 255, 255, 0.2);
            border-radius: 50%;
            width: 80px;
            height: 80px;
            display: flex;
            align-items: center;
            justify-content: center;
            margin: 0 auto 1rem;
            position: relative;
            z-index: 1;
        }

            .tutor-icon i {
                font-size: 2.5rem;
                color: white;
            }

        .tutor-login-title {
            color: white;
            font-weight: 600;
            margin: 0;
            font-size: 1.8rem;
            position: relative;
            z-index: 1;
        }

        .tutor-login-subtitle {
            color: rgba(255, 255, 255, 0.9);
            font-size: 0.9rem;
            margin-top: 0.5rem;
            position: relative;
            z-index: 1;
        }

        .tutor-login-body {
            padding: 2.5rem;
        }

        .tutor-form-group {
            position: relative;
            margin-bottom: 1.5rem;
        }

            .tutor-form-group .form-control {
                height: calc(3.5rem + 2px);
                padding: 1rem 0.75rem;
                border: 2px solid #e9ecef;
                border-radius: 12px;
                transition: all 0.3s ease;
                background: rgba(248, 249, 250, 0.8);
            }

                .tutor-form-group .form-control:focus {
                    border-color: var(--tutor-primary);
                    box-shadow: 0 0 0 0.2rem rgba(67, 97, 238, 0.25); /* Updated to blue shadow */
                    background: white;
                }

        .tutor-form-label {
            position: absolute;
            top: 1rem;
            left: 0.75rem;
            color: #6c757d;
            transition: all 0.3s ease;
            pointer-events: none;
        }

        .form-control:focus + .tutor-form-label,
        .form-control:not(:placeholder-shown) + .tutor-form-label {
            top: -0.5rem;
            left: 0.75rem;
            font-size: 0.8rem;
            background: white;
            padding: 0 0.5rem;
            color: var(--tutor-primary);
        }

        .tutor-input-icon {
            position: absolute;
            right: 15px;
            top: 50%;
            transform: translateY(-50%);
            color: #6c757d;
            z-index: 5;
            transition: color 0.3s ease;
        }

        .tutor-form-group .form-control:focus ~ .tutor-input-icon {
            color: var(--tutor-primary);
        }

        .btn-tutor-login {
            background: linear-gradient(135deg, var(--tutor-primary) 0%, var(--tutor-secondary) 100%);
            border: none;
            border-radius: 12px;
            padding: 0.8rem 2rem;
            font-weight: 600;
            text-transform: uppercase;
            letter-spacing: 0.5px;
            transition: all 0.3s ease;
            position: relative;
            overflow: hidden;
            color: white;
            width: 100%;
        }

            .btn-tutor-login::before {
                content: '';
                position: absolute;
                top: 0;
                left: -100%;
                width: 100%;
                height: 100%;
                background: linear-gradient(90deg, transparent, rgba(255, 255, 255, 0.3), transparent);
                transition: left 0.5s ease;
            }

            .btn-tutor-login:hover::before {
                left: 100%;
            }

            .btn-tutor-login:hover {
                transform: translateY(-2px);
                box-shadow: 0 8px 25px rgba(67, 97, 238, 0.4); /* Updated to blue shadow */
                color: white;
            }

        .tutor-validator-error {
            color: #dc3545;
            font-size: 0.875rem;
            margin-top: 0.5rem;
            display: flex;
            align-items: center;
        }

            .tutor-validator-error::before {
                content: '\f06a';
                font-family: 'Font Awesome 6 Free';
                font-weight: 900;
                margin-right: 0.5rem;
            }

        .tutor-floating-shapes {
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            overflow: hidden;
            z-index: 0;
        }

        .tutor-shape {
            position: absolute;
            background: rgba(255, 255, 255, 0.1);
            border-radius: 50%;
            animation: tutor-float 6s ease-in-out infinite;
        }

            .tutor-shape:nth-child(1) {
                width: 80px;
                height: 80px;
                top: 20%;
                left: 10%;
                animation-delay: 0s;
            }

            .tutor-shape:nth-child(2) {
                width: 120px;
                height: 120px;
                top: 60%;
                right: 15%;
                animation-delay: 2s;
            }

            .tutor-shape:nth-child(3) {
                width: 60px;
                height: 60px;
                bottom: 20%;
                left: 20%;
                animation-delay: 4s;
            }

        @keyframes tutor-float {
            0%, 100% {
                transform: translateY(0px);
            }

            50% {
                transform: translateY(-20px);
            }
        }

        .tutor-login-footer {
            text-align: center;
            margin-top: 1.5rem;
        }

            .tutor-login-footer a {
                color: #6c757d;
                text-decoration: none;
                transition: color 0.3s ease;
                display: inline-block;
                margin: 0 10px;
                color: blue;

            }

                .tutor-login-footer a:hover {
                    color: var(--tutor-primary);
                }

        @media (max-width: 768px) {
            .tutor-login-body {
                padding: 2rem 1.5rem;
            }

            .tutor-login-header {
                padding: 1.5rem;
            }

            .tutor-icon {
                width: 60px;
                height: 60px;
            }

                .tutor-icon i {
                    font-size: 2rem;
                }

            .tutor-login-title {
                font-size: 1.5rem;
            }
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <!-- Floating Background Shapes -->
    <div class="tutor-floating-shapes">
        <div class="tutor-shape"></div>
        <div class="tutor-shape"></div>
        <div class="tutor-shape"></div>
    </div>

    <div class="tutor-login-container">
        <div class="tutor-login-card">
            <!-- Header Section -->
            <div class="tutor-login-header">
                <div class="tutor-icon">
                    <i class="fas fa-chalkboard-teacher"></i>
                </div>
                <h2 class="tutor-login-title">Tutor Portal</h2>
                <p class="tutor-login-subtitle">Tuition Management System</p>
            </div>

            <!-- Login Form -->
            <div class="tutor-login-body">
                <!-- Username Field -->
                <div class="tutor-form-group">
                    <asp:TextBox ID="txtUsername" runat="server" CssClass="form-control" placeholder=" "></asp:TextBox>
                    <label class="tutor-form-label">Username</label>
                    <i class="fas fa-user tutor-input-icon"></i>
                    <asp:RequiredFieldValidator ID="rfvUsername" runat="server" ControlToValidate="txtUsername"
                        ErrorMessage="Username is required" SetFocusOnError="true" CssClass="tutor-validator-error" Display="Dynamic"></asp:RequiredFieldValidator>
                </div>

                <!-- Password Field -->
                <div class="tutor-form-group">
                    <asp:TextBox ID="txtPassword" runat="server" TextMode="Password" CssClass="form-control" placeholder=" "></asp:TextBox>
                    <label class="tutor-form-label">Password</label>
                    <i class="fas fa-lock tutor-input-icon"></i>
                    <asp:RequiredFieldValidator ID="rfvPassword" runat="server" ControlToValidate="txtPassword"
                        ErrorMessage="Password is required" CssClass="tutor-validator-error" Display="Dynamic" SetFocusOnError="true"></asp:RequiredFieldValidator>
                </div>

                <!-- Login Button -->
                <div class="d-grid">
                    <asp:Button ID="btnLogin" runat="server" Text="Sign In" CssClass="btn-tutor-login" OnClick="btnLogin_Click" />
                </div>

                <!-- Additional Info -->
                <div class="text-center mt-4">
                    <small class="text-muted">
                        <i class="fas fa-shield-alt me-1"></i>
                        Secure Tutor Access Only
                    </small>
                </div>

                <!-- Alternative Login Options -->
                <div class="tutor-login-footer">
                    <a href="Student_Login.aspx">Login as Student</a>
                    <a href="admin/Login_form.aspx">Login as Admin</a>
                </div>
            </div>
        </div>
    </div>

    <script>
        // Add subtle animation on page load
        document.addEventListener('DOMContentLoaded', function () {
            const loginCard = document.querySelector('.tutor-login-card');
            loginCard.style.opacity = '0';
            loginCard.style.transform = 'translateY(30px)';

            setTimeout(() => {
                loginCard.style.transition = 'all 0.6s ease';
                loginCard.style.opacity = '1';
                loginCard.style.transform = 'translateY(0)';
            }, 100);
        });

        // Add floating label functionality
        document.querySelectorAll('.form-control').forEach(input => {
            input.addEventListener('focus', function () {
                this.parentElement.classList.add('focused');
            });

            input.addEventListener('blur', function () {
                if (!this.value) {
                    this.parentElement.classList.remove('focused');
                }
            });
        });
    </script>
</asp:Content>