<%@ Page Title="" Language="C#" MasterPageFile="~/Student/Student_dashboard.Master" AutoEventWireup="true" CodeBehind="Status_check.aspx.cs" Inherits="TMS_project.Student.Status_check" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" />
    <style>
        :root {
            --primary: #4361ee;
            --secondary: #3a0ca3;
            --accent: #4cc9f0;
            --light: #f8f9fa;
            --dark: #212529;
            --success: #4bb543;
        }

        .card {
            border: none;
            border-radius: 12px;
            box-shadow: 0 0.5rem 1.5rem rgba(0, 0, 0, 0.08);
            overflow: hidden;
        }

        .card-header {
            padding: 1.2rem 1.5rem;
        }

        .page-header {
            background: linear-gradient(135deg, var(--primary) 0%, var(--secondary) 100%);
            color: white;
            padding: 1.5rem;
            text-align: center;
            border-bottom: none;
        }

        .page-title {
            font-weight: 600;
            letter-spacing: 0.5px;
            margin: 0;
            background: linear-gradient(135deg, var(--primary) 0%, var(--secondary) 100%);
        }

        .custom-gridview {
            border-collapse: separate;
            border-spacing: 0;
            width: 100%;
            border-radius: 8px;
            overflow: hidden;
        }

            .custom-gridview th {
                background-color: #e9ecef;
                color: #212529;
                font-weight: 600;
                padding: 1rem 0.75rem;
                border-top: 1px solid #dee2e6;
            }

            .custom-gridview td {
                padding: 1rem 0.75rem;
                vertical-align: middle;
                border-top: 1px solid #dee2e6;
            }

            .custom-gridview tr:hover {
                background-color: rgba(25, 135, 84, 0.05);
            }

        .status-badge {
            padding: 0.35rem 0.65rem;
            border-radius: 50px;
            font-size: 0.75rem;
            font-weight: 600;
            display: inline-block;
        }

        .status-pending {
            background-color: #fff3cd;
            color: #856404;
        }

        .status-approved {
            background-color: #d4edda;
            color: #155724;
        }

        .status-rejected {
            background-color: #f8d7da;
            color: #721c24;
        }

        .status-processing {
            background-color: #cce5ff;
            color: #004085;
        }

        .request-id {
            font-weight: 600;
            color: #198754;
        }

        @media (max-width: 768px) {
            .card-header {
                padding: 1rem;
            }

            .custom-gridview {
                font-size: 0.875rem;
            }

                .custom-gridview th,
                .custom-gridview td {
                    padding: 0.75rem 0.5rem;
                }
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container mt-4">
        <div class="card shadow-lg">
            <div class="card-header ">
                <div class="page-header">
                    <h1 class="text-white text-center mb-0">
                        <i class="fas fa-list-check me-2"></i>My Requests
                    </h1>
                </div>
            </div>
            <div class="card-body">
                <asp:GridView ID="gvStudentRequests" runat="server"
                    AutoGenerateColumns="False" CssClass="table custom-gridview table-hover">
                    <Columns>
                        <asp:BoundField DataField="RequestID" HeaderText="Request ID" />
                        <asp:BoundField DataField="TutorName" HeaderText="Tutor Name" />
                        <asp:BoundField DataField="Status" HeaderText="Status" />
                        <asp:BoundField DataField="CreatedDate" HeaderText="Request Date" DataFormatString="{0:dd-MM-yyyy HH:mm}" />
                    </Columns>
                </asp:GridView>
            </div>
        </div>
    </div>

    <script>
        // This script will format the status text with appropriate badges
        document.addEventListener('DOMContentLoaded', function () {
            const statusCells = document.querySelectorAll('#gvStudentRequests td:nth-child(3)');

            statusCells.forEach(cell => {
                const status = cell.textContent.trim();
                cell.innerHTML = '';

                const badge = document.createElement('span');
                badge.className = 'status-badge';

                if (status.toLowerCase().includes('pending')) {
                    badge.className += ' status-pending';
                    badge.innerHTML = '<i class="fas fa-clock me-1"></i> ' + status;
                } else if (status.toLowerCase().includes('approve')) {
                    badge.className += ' status-approved';
                    badge.innerHTML = '<i class="fas fa-check-circle me-1"></i> ' + status;
                } else if (status.toLowerCase().includes('reject')) {
                    badge.className += ' status-rejected';
                    badge.innerHTML = '<i class="fas fa-times-circle me-1"></i> ' + status;
                } else if (status.toLowerCase().includes('process')) {
                    badge.className += ' status-processing';
                    badge.innerHTML = '<i class="fas fa-cog me-1"></i> ' + status;
                } else {
                    badge.textContent = status;
                }

                cell.appendChild(badge);
            });

            // Format Request ID cells
            const requestIdCells = document.querySelectorAll('#gvStudentRequests td:first-child');
            requestIdCells.forEach(cell => {
                cell.innerHTML = '<span class="request-id">' + cell.textContent + '</span>';
            });
        });
    </script>
</asp:Content>
