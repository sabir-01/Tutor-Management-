<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login_form.aspx.cs" Inherits="TMS_project.admin.Login_form" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Admin Login - TMS</title>
    <link href="../dist/sweetalert2.min.css" rel="stylesheet" />
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" crossorigin="anonymous">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" rel="stylesheet">
    <script src="../dist/sweetalert2.min.js"></script>
    
    <style>
        :root {
            --admin-primary: #4361ee;
            --admin-secondary: #3a0ca3;
        }

        body {
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

        .admin-login-card {
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

            .admin-login-card:hover {
                transform: translateY(-5px);
            }

        .admin-login-header {
            background: linear-gradient(135deg, var(--admin-primary) 0%, var(--admin-secondary) 100%);
            padding: 2rem;
            text-align: center;
            position: relative;
        }

            .admin-login-header::before {
                content: '';
                position: absolute;
                top: 0;
                left: 0;
                right: 0;
                bottom: 0;
                background: url('data:image/svg+xml,<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 100 100"><defs><pattern id="grid" width="10" height="10" patternUnits="userSpaceOnUse"><path d="M 10 0 L 0 0 0 10" fill="none" stroke="rgba(255,255,255,0.1)" stroke-width="1"/></pattern></defs><rect width="100" height="100" fill="url(%23grid)"/></svg>');
                opacity: 0.3;
            }

        .admin-icon {
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

            .admin-icon i {
                font-size: 2.5rem;
                color: white;
            }

        .admin-login-title {
            color: white;
            font-weight: 600;
            margin: 0;
            font-size: 1.8rem;
            position: relative;
            z-index: 1;
        }

        .admin-login-subtitle {
            color: rgba(255, 255, 255, 0.9);
            font-size: 0.9rem;
            margin-top: 0.5rem;
            position: relative;
            z-index: 1;
        }

        .admin-login-body {
            padding: 2.5rem;
        }

        .admin-form-group {
            position: relative;
            margin-bottom: 1.5rem;
        }

            .admin-form-group .form-control {
                height: calc(3.5rem + 2px);
                padding: 1rem 0.75rem;
                border: 2px solid #e9ecef;
                border-radius: 12px;
                transition: all 0.3s ease;
                background: rgba(248, 249, 250, 0.8);
            }

                .admin-form-group .form-control:focus {
                    border-color: var(--admin-primary);
                    box-shadow: 0 0 0 0.2rem rgba(67, 97, 238, 0.25);
                    background: white;
                }

        .admin-form-label {
            position: absolute;
            top: 1rem;
            left: 0.75rem;
            color: #6c757d;
            transition: all 0.3s ease;
            pointer-events: none;
        }

        .form-control:focus + .admin-form-label,
        .form-control:not(:placeholder-shown) + .admin-form-label {
            top: -0.5rem;
            left: 0.75rem;
            font-size: 0.8rem;
            background: white;
            padding: 0 0.5rem;
            color: var(--admin-primary);
        }

        .admin-input-icon {
            position: absolute;
            right: 15px;
            top: 50%;
            transform: translateY(-50%);
            color: #6c757d;
            z-index: 5;
            transition: color 0.3s ease;
        }

        .admin-form-group .form-control:focus ~ .admin-input-icon {
            color: var(--admin-primary);
        }

        .btn-admin-login {
            background: linear-gradient(135deg, var(--admin-primary) 0%, var(--admin-secondary) 100%);
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

            .btn-admin-login::before {
                content: '';
                position: absolute;
                top: 0;
                left: -100%;
                width: 100%;
                height: 100%;
                background: linear-gradient(90deg, transparent, rgba(255, 255, 255, 0.3), transparent);
                transition: left 0.5s ease;
            }

            .btn-admin-login:hover::before {
                left: 100%;
            }

            .btn-admin-login:hover {
                transform: translateY(-2px);
                box-shadow: 0 8px 25px rgba(67, 97, 238, 0.4);
                color: white;
            }

        .admin-validator-error {
            color: #dc3545;
            font-size: 0.875rem;
            margin-top: 0.5rem;
            display: flex;
            align-items: center;
        }

            .admin-validator-error::before {
                content: '\f06a';
                font-family: 'Font Awesome 6 Free';
                font-weight: 900;
                margin-right: 0.5rem;
            }

        .admin-floating-shapes {
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            overflow: hidden;
            z-index: -1;
        }

        .admin-shape {
            position: absolute;
            background: rgba(255, 255, 255, 0.1);
            border-radius: 50%;
            animation: admin-float 6s ease-in-out infinite;
        }

            .admin-shape:nth-child(1) {
                width: 80px;
                height: 80px;
                top: 20%;
                left: 10%;
                animation-delay: 0s;
            }

            .admin-shape:nth-child(2) {
                width: 120px;
                height: 120px;
                top: 60%;
                right: 15%;
                animation-delay: 2s;
            }

            .admin-shape:nth-child(3) {
                width: 60px;
                height: 60px;
                bottom: 20%;
                left: 20%;
                animation-delay: 4s;
            }

        @keyframes admin-float {
            0%, 100% {
                transform: translateY(0px);
            }

            50% {
                transform: translateY(-20px);
            }
        }

        .admin-login-footer {
            text-align: center;
            margin-top: 1.5rem;
        }

            .admin-login-footer a {
                color: #6c757d;
                text-decoration: none;
                transition: color 0.3s ease;
                display: inline-block;
                margin: 0 10px;
                color: blue;

            }

                .admin-login-footer a:hover {
                    color: var(--admin-primary);
                }

        @media (max-width: 768px) {
            .admin-login-body {
                padding: 2rem 1.5rem;
            }

            .admin-login-header {
                padding: 1.5rem;
            }

            .admin-icon {
                width: 60px;
                height: 60px;
            }

                .admin-icon i {
                    font-size: 2rem;
                }

            .admin-login-title {
                font-size: 1.5rem;
            }
        }
    </style>
</head>
<body>
    <!-- Floating Background Shapes -->
    <div class="admin-floating-shapes">
        <div class="admin-shape"></div>
        <div class="admin-shape"></div>
        <div class="admin-shape"></div>
    </div>

    <form id="form1" runat="server">
        <div class="admin-login-container">
            <div class="admin-login-card">
                <!-- Header Section -->
                <div class="admin-login-header">
                    <div class="admin-icon">
                        <i class="fas fa-user-shield"></i>
                    </div>
                    <h2 class="admin-login-title">Admin Portal</h2>
                    <p class="admin-login-subtitle">Tuition Management System</p>
                </div>

                <!-- Login Form -->
                <div class="admin-login-body">
                    <!-- Username Field -->
                    <div class="admin-form-group">
                        <asp:TextBox ID="txtUsername" runat="server" CssClass="form-control" placeholder=" "></asp:TextBox>
                        <label class="admin-form-label">Username</label>
                        <i class="fas fa-user admin-input-icon"></i>
                        <asp:RequiredFieldValidator ID="rfvUsername" runat="server" ControlToValidate="txtUsername"
                            ErrorMessage="Username is required" SetFocusOnError="true" CssClass="admin-validator-error" Display="Dynamic"></asp:RequiredFieldValidator>
                    </div>

                    <!-- Password Field -->
                    <div class="admin-form-group">
                        <asp:TextBox ID="txtPassword" runat="server" TextMode="Password" CssClass="form-control" placeholder=" "></asp:TextBox>
                        <label class="admin-form-label">Password</label>
                        <i class="fas fa-lock admin-input-icon"></i>
                        <asp:RequiredFieldValidator ID="rfvPassword" runat="server" ControlToValidate="txtPassword"
                            ErrorMessage="Password is required" CssClass="admin-validator-error" Display="Dynamic" SetFocusOnError="true"></asp:RequiredFieldValidator>
                    </div>

                    <!-- Login Button -->
                    <div class="d-grid">
                        <asp:Button ID="btnLogin" runat="server" Text="Sign In" CssClass="btn-admin-login" OnClick="btnLogin_Click" />
                    </div>

                    <!-- Additional Info -->
                    <div class="text-center mt-4">
                        <small class="text-muted">
                            <i class="fas fa-shield-alt me-1"></i>
                            Secure Admin Access Only
                        </small>
                    </div>

                    <!-- Alternative Login Options -->
                    <div class="admin-login-footer">
                        <a href="../Tutor_Login.aspx">Login as Tutor</a>
                        <a href="../Student_Login.aspx">Login as Student</a>
                    </div>
                </div>
            </div>
        </div>
    </form>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
    
    <script>
        // Add subtle animation on page load
        document.addEventListener('DOMContentLoaded', function () {
            const loginCard = document.querySelector('.admin-login-card');
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
</body>
</html>