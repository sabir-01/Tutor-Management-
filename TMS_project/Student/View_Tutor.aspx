<%@ Page Title="" Language="C#" MasterPageFile="~/Student/Student_dashboard.Master" AutoEventWireup="true" CodeBehind="View_Tutor.aspx.cs" Inherits="TMS_project.Student.View_Tutor" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        :root {
            --primary: #4361ee;
            --secondary: #3a0ca3;
            --accent: #4cc9f0;
            --light: #f8f9fa;
            --dark: #212529;
            --success: #4bb543;
        }

        .page-header {
            background: linear-gradient(135deg, var(--primary) 0%, var(--secondary) 100%);
            border-radius: 12px;
            padding: 1.5rem;
            margin-bottom: 2rem;
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.1);
            border: none;
        }

        .search-container {
            position: relative;
            margin-bottom: 2rem;
        }

        .search-box {
            border: 2px solid #e9ecef;
            border-radius: 50px;
            padding: 0.8rem 1.5rem;
            padding-right: 50px;
            font-size: 1rem;
            transition: all 0.3s ease;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.05);
        }

            .search-box:focus {
                border-color: var(--primary);
                box-shadow: 0 4px 15px rgba(67, 97, 238, 0.2);
                outline: none;
            }

        .search-btn {
            position: absolute;
            right: 5px;
            top: 50%;
            transform: translateY(-50%);
            background: var(--primary);
            border: none;
            border-radius: 50%;
            width: 40px;
            height: 40px;
            color: white;
            display: flex;
            align-items: center;
            justify-content: center;
            transition: all 0.3s ease;
        }

            .search-btn:hover {
                background: var(--secondary);
                transform: translateY(-50%) scale(1.05);
            }

        .tutor-card {
            background: white;
            border-radius: 15px;
            overflow: hidden;
            transition: all 0.3s ease;
            box-shadow: 0 10px 20px rgba(0, 0, 0, 0.08);
            border: none;
            margin-bottom: 2rem;
            height: 100%;
        }

            .tutor-card:hover {
                transform: translateY(-5px);
                box-shadow: 0 15px 30px rgba(0, 0, 0, 0.12);
            }

        .card-header {
            background: linear-gradient(135deg, var(--primary) 0%, var(--secondary) 100%);
            color: white;
            padding: 1.5rem;
            text-align: center;
            border-bottom: none;
        }

            .card-header h3 {
                margin: 0;
                font-weight: 600;
                font-size: 1.5rem;
            }

        .card-body {
            padding: 1.5rem;
        }

        .detail-item {
            margin-bottom: 1rem;
            display: flex;
            flex-direction: column;
        }

        .detail-label {
            font-size: 0.85rem;
            color: #6c757d;
            font-weight: 500;
            margin-bottom: 0.25rem;
        }

        .detail-value {
            font-size: 1rem;
            color: var(--dark);
            font-weight: 500;
        }

        .card-footer {
            background: #f8f9fa;
            border-top: 1px solid #e9ecef;
            padding: 1.5rem;
            text-align: center;
        }

        .request-btn {
            background: linear-gradient(135deg, var(--primary) 0%, var(--secondary) 100%);
            border: none;
            border-radius: 50px;
            padding: 0.6rem 1.5rem;
            font-weight: 600;
            letter-spacing: 0.5px;
            transition: all 0.3s ease;
            box-shadow: 0 4px 15px rgba(67, 97, 238, 0.3);
            position: relative;
            overflow: hidden;
        }

            .request-btn:hover {
                transform: translateY(-2px);
                box-shadow: 0 8px 25px rgba(67, 97, 238, 0.4);
            }

            .request-btn::before {
                content: '';
                position: absolute;
                top: 0;
                left: -100%;
                width: 100%;
                height: 100%;
                background: linear-gradient(90deg, transparent, rgba(255, 255, 255, 0.3), transparent);
                transition: left 0.5s ease;
            }

            .request-btn:hover::before {
                left: 100%;
            }

        .no-tutors {
            text-align: center;
            padding: 3rem;
            color: #6c757d;
        }

            .no-tutors i {
                font-size: 3rem;
                margin-bottom: 1rem;
                color: #dee2e6;
            }

        @media (max-width: 768px) {
            .card-header h3 {
                font-size: 1.3rem;
            }

            .search-box {
                padding: 0.7rem 1.2rem;
                padding-right: 45px;
            }
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container-fluid">
        <!-- Page Header -->
        <div class="page-header">
            <h1 class="text-white text-center mb-0">
                <i class="fas fa-chalkboard-teacher me-2"></i>VIEW TUTOR DETAILS
            </h1>
        </div>

        <!-- Search Section -->
        <div class="row justify-content-center">
            <div class="col-md-6">
                <div class="search-container">
                    <asp:TextBox class="form-control search-box" placeholder="Search by name, subject, or expertise..." ID="SerachText" runat="server"></asp:TextBox>
                    <button id="searchbtn" runat="server" onserverclick="searchbtn_ServerClick" class="search-btn" type="button">
                        <i class="fa-solid fa-search"></i>
                    </button>
                </div>
            </div>
        </div>

        <!-- Tutors Grid -->
        <div class="row">
            <asp:Repeater ID="Repeater1" runat="server" OnItemCommand="Repeater1_ItemCommand">
                <ItemTemplate>
                    <div class="col-lg-4 col-md-6">
                        <div class="tutor-card">
                            <div class="card-header">
                                <h3>
                                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("name") %>'></asp:Label>
                                </h3>
                                <div class="mt-2">
                                    <span class="badge bg-light text-dark">
                                        <i class="fas fa-graduation-cap me-1"></i>
                                        <asp:Label ID="Label7" runat="server" Text='<%# Bind("degree") %>'></asp:Label>
                                    </span>
                                </div>
                            </div>

                            <div class="card-body">
                                <div class="detail-item">
                                    <span class="detail-label"><i class="fas fa-envelope me-1"></i>Email</span>
                                    <span class="detail-value">
                                        <asp:Label ID="Label2" runat="server" Text='<%# Bind("email") %>'></asp:Label>
                                    </span>
                                </div>

                                <div class="detail-item">
                                    <span class="detail-label"><i class="fas fa-globe me-1"></i>Location</span>
                                    <span class="detail-value">
                                        <asp:Label ID="Label3" runat="server" Text='<%# Bind("country") %>'></asp:Label>,
                                        <asp:Label ID="Label4" runat="server" Text='<%# Bind("city") %>'></asp:Label>
                                    </span>
                                </div>

                                <div class="detail-item">
                                    <span class="detail-label"><i class="fas fa-briefcase me-1"></i>Experience</span>
                                    <span class="detail-value">
                                        <asp:Label ID="Label5" runat="server" Text='<%# Bind("experience") %>'></asp:Label> years
                                    </span>
                                </div>

                                <div class="detail-item">
                                    <span class="detail-label"><i class="fas fa-phone me-1"></i>Contact</span>
                                    <span class="detail-value">
                                        <asp:Label ID="Label6" runat="server" Text='<%# Bind("contactno") %>'></asp:Label>
                                    </span>
                                </div>
                            </div>

                            <div class="card-footer">
                                <asp:Button ID="btnSendRequest" runat="server" Text="Send Request"
                                    CssClass="btn request-btn text-white"
                                    CommandName="SendRequest" CommandArgument='<%# Eval("Tutor_id") %>' />
                            </div>
                        </div>
                    </div>
                </ItemTemplate>
            </asp:Repeater>

            <!-- Empty State -->
            <asp:Panel ID="EmptyState" runat="server" Visible="false" CssClass="col-12">
                <div class="no-tutors">
                    <i class="fas fa-search"></i>
                    <h4>No tutors found</h4>
                    <p>Try adjusting your search criteria or check back later for new tutors.</p>
                </div>
            </asp:Panel>
        </div>
    </div>

    <script>
        document.addEventListener('DOMContentLoaded', function () {
            // Add animation to cards on page load
            const cards = document.querySelectorAll('.tutor-card');
            cards.forEach((card, index) => {
                card.style.opacity = '0';
                card.style.transform = 'translateY(20px)';
                
                setTimeout(() => {
                    card.style.transition = 'all 0.5s ease';
                    card.style.opacity = '1';
                    card.style.transform = 'translateY(0)';
                }, 100 + (index * 100));
            });
        });
    </script>
</asp:Content>