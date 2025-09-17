<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Requests.aspx.cs" Inherits="TMS_project.Requests" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Requests Management - TMS</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" />
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css" rel="stylesheet" />
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700;800&display=swap" rel="stylesheet">
    
    <style>
        /* Modern CSS Variables for Consistent Theming */
        :root {
            --primary-gradient: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            --secondary-gradient: linear-gradient(135deg, #f093fb 0%, #f5576c 100%);
            --accent-gradient: linear-gradient(135deg, #4facfe 0%, #00f2fe 100%);
            --success-gradient: linear-gradient(135deg, #11998e 0%, #38ef7d 100%);
            --warning-gradient: linear-gradient(135deg, #fc4a1a 0%, #f7b733 100%);
            --danger-gradient: linear-gradient(135deg, #fc466b 0%, #3f5efb 100%);
            --dark-bg: linear-gradient(135deg, #1a1a2e 0%, #16213e 100%);
            --card-bg: rgba(255, 255, 255, 0.1);
            --glass-bg: rgba(255, 255, 255, 0.08);
            --text-primary: #ffffff;
            --text-secondary: #b3b8cd;
            --text-accent: #4facfe;
            --shadow-light: 0 8px 32px rgba(0, 0, 0, 0.1);
            --shadow-heavy: 0 20px 40px rgba(0, 0, 0, 0.3);
            --border-radius: 16px;
            --transition: all 0.3s cubic-bezier(0.4, 0, 0.2, 1);
        }

        /* Global Styles */
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        html, body {
            height: 100%;
            font-family: 'Inter', -apple-system, BlinkMacSystemFont, sans-serif;
        }

        body {
            background: var(--dark-bg);
            color: var(--text-primary);
            overflow-x: hidden;
            min-height: 100vh;
        }

        /* Animated Background */
        .page-container {
            position: relative;
            min-height: 100vh;
            padding: 2rem 1rem;
        }

        .page-container::before {
            content: '';
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background: 
                radial-gradient(circle at 20% 50%, rgba(120, 119, 198, 0.3) 0%, transparent 50%),
                radial-gradient(circle at 80% 20%, rgba(255, 119, 198, 0.3) 0%, transparent 50%),
                radial-gradient(circle at 40% 80%, rgba(120, 219, 255, 0.3) 0%, transparent 50%);
            animation: backgroundShift 20s ease-in-out infinite;
            z-index: -1;
        }

        @keyframes backgroundShift {
            0%, 100% { opacity: 0.5; transform: scale(1) rotate(0deg); }
            50% { opacity: 0.8; transform: scale(1.1) rotate(2deg); }
        }

        /* Header Styles */
        .page-header {
            text-align: center;
            margin-bottom: 3rem;
            position: relative;
        }

        .page-title {
            background: var(--primary-gradient);
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
            background-clip: text;
            font-size: clamp(2.5rem, 5vw, 4rem);
            font-weight: 800;
            margin: 0;
            letter-spacing: -2px;
            position: relative;
        }

        .page-title::after {
            content: '';
            position: absolute;
            bottom: -10px;
            left: 50%;
            transform: translateX(-50%);
            width: 150px;
            height: 4px;
            background: var(--accent-gradient);
            border-radius: 2px;
            animation: slideIn 0.8s ease-out;
        }

        @keyframes slideIn {
            from { width: 0; }
            to { width: 150px; }
        }

        /* Main Card Container */
        .main-card {
            background: var(--glass-bg);
            backdrop-filter: blur(20px);
            border: 1px solid rgba(255, 255, 255, 0.1);
            border-radius: var(--border-radius);
            box-shadow: var(--shadow-heavy);
            overflow: hidden;
            animation: fadeInUp 0.8s ease-out;
            max-width: 1400px;
            margin: 0 auto;
        }

        @keyframes fadeInUp {
            from {
                opacity: 0;
                transform: translateY(30px);
            }
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }

        /* Card Header */
        .card-header-custom {
            background: var(--primary-gradient);
            padding: 2rem;
            border: none;
            position: relative;
            overflow: hidden;
        }

        .card-header-custom::before {
            content: '';
            position: absolute;
            top: -50%;
            left: -50%;
            width: 200%;
            height: 200%;
            background: radial-gradient(circle, rgba(255,255,255,0.1) 0%, transparent 70%);
            animation: headerShine 3s ease-in-out infinite;
        }

        @keyframes headerShine {
            0%, 100% { transform: rotate(0deg); opacity: 0.5; }
            50% { transform: rotate(180deg); opacity: 0.8; }
        }

        .header-title {
            font-size: 2.5rem;
            font-weight: 700;
            color: white;
            text-shadow: 0 4px 8px rgba(0, 0, 0, 0.3);
            position: relative;
            z-index: 2;
        }

        /* Table Container */
        .table-container {
            padding: 2rem;
            position: relative;
        }

        .table-responsive {
            border-radius: 12px;
            overflow: hidden;
            background: var(--card-bg);
            backdrop-filter: blur(10px);
            border: 1px solid rgba(255, 255, 255, 0.1);
            box-shadow: var(--shadow-light);
        }

        /* GridView Styling */
        .table {
            background: transparent !important;
            color: var(--text-primary) !important;
            margin: 0 !important;
        }

        .table thead th {
            background: var(--accent-gradient) !important;
            color: white !important;
            font-weight: 600;
            text-transform: uppercase;
            font-size: 0.875rem;
            letter-spacing: 1px;
            padding: 1.25rem 1rem !important;
            border: none !important;
            position: relative;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
        }

        .table thead th::after {
            content: '';
            position: absolute;
            bottom: 0;
            left: 0;
            right: 0;
            height: 2px;
            background: rgba(255, 255, 255, 0.3);
        }

        .table tbody tr {
            background: rgba(255, 255, 255, 0.03) !important;
            border: none !important;
            transition: var(--transition);
        }

        .table tbody tr:nth-child(even) {
            background: rgba(255, 255, 255, 0.06) !important;
        }

        .table tbody tr:hover {
            background: rgba(79, 172, 254, 0.1) !important;
            transform: translateX(4px);
            box-shadow: 4px 0 8px rgba(79, 172, 254, 0.2);
        }

        .table tbody td {
            padding: 1.25rem 1rem !important;
            border: none !important;
            border-bottom: 1px solid rgba(255, 255, 255, 0.1) !important;
            vertical-align: middle !important;
            font-weight: 500;
        }

        /* Status Badges */
        .status-badge {
            display: inline-flex;
            align-items: center;
            justify-content: center;
            padding: 0.5rem 1rem;
            border-radius: 20px;
            font-size: 0.875rem;
            font-weight: 600;
            text-transform: uppercase;
            letter-spacing: 0.5px;
            min-width: 90px;
            box-shadow: 0 2px 8px rgba(0, 0, 0, 0.2);
            transition: var(--transition);
            position: relative;
            overflow: hidden;
        }

        .status-badge::before {
            content: '';
            position: absolute;
            top: 0;
            left: -100%;
            width: 100%;
            height: 100%;
            background: linear-gradient(90deg, transparent, rgba(255,255,255,0.2), transparent);
            transition: left 0.6s ease;
        }

        .status-badge:hover::before {
            left: 100%;
        }

        .badge-pending {
            background: var(--warning-gradient);
            color: white;
        }

        .badge-approved {
            background: var(--success-gradient);
            color: white;
        }

        .badge-rejected {
            background: var(--danger-gradient);
            color: white;
        }

        /* Form Controls */
        .form-select {
            background: var(--glass-bg) !important;
            backdrop-filter: blur(10px);
            border: 1px solid rgba(255, 255, 255, 0.2) !important;
            border-radius: 8px !important;
            color: var(--text-primary) !important;
            padding: 0.75rem 1rem !important;
            font-weight: 500;
            transition: var(--transition);
        }

        .form-select:focus {
            border-color: var(--text-accent) !important;
            box-shadow: 0 0 0 0.2rem rgba(79, 172, 254, 0.25) !important;
            background: var(--card-bg) !important;
        }

        .form-select option {
            background: #1a1a2e;
            color: var(--text-primary);
        }

        /* Action Buttons */
        .btn {
            padding: 0.75rem 1.25rem !important;
            border-radius: 8px !important;
            font-weight: 600 !important;
            text-transform: uppercase !important;
            letter-spacing: 0.5px !important;
            transition: var(--transition) !important;
            border: none !important;
            position: relative !important;
            overflow: hidden !important;
            min-width: 100px;
        }

        .btn::before {
            content: '';
            position: absolute;
            top: 0;
            left: -100%;
            width: 100%;
            height: 100%;
            background: linear-gradient(90deg, transparent, rgba(255,255,255,0.2), transparent);
            transition: left 0.6s ease;
        }

        .btn:hover::before {
            left: 100%;
        }

        .btn:hover {
            transform: translateY(-2px) !important;
            box-shadow: 0 8px 25px rgba(0, 0, 0, 0.3) !important;
        }

        /* Edit Button */
        .btn-edit {
            background: var(--accent-gradient) !important;
            color: white !important;
            box-shadow: 0 4px 15px rgba(79, 172, 254, 0.4);
        }

        .btn-edit:hover {
            box-shadow: 0 8px 25px rgba(79, 172, 254, 0.6) !important;
        }

        /* Save Button */
        .btn-save {
            background: var(--success-gradient) !important;
            color: white !important;
            box-shadow: 0 4px 15px rgba(17, 153, 142, 0.4);
        }

        .btn-save:hover {
            box-shadow: 0 8px 25px rgba(17, 153, 142, 0.6) !important;
        }

        /* Cancel Button */
        .btn-cancel {
            background: var(--danger-gradient) !important;
            color: white !important;
            box-shadow: 0 4px 15px rgba(252, 70, 107, 0.4);
        }

        .btn-cancel:hover {
            box-shadow: 0 8px 25px rgba(252, 70, 107, 0.6) !important;
        }

        /* Request ID Styling */
        .request-id {
            background: var(--primary-gradient);
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
            background-clip: text;
            font-weight: 700;
            font-size: 1.1rem;
        }

        /* Date Styling */
        .date-text {
            font-family: 'Monaco', 'Menlo', monospace;
            font-size: 0.9rem;
            color: var(--text-secondary);
            background: rgba(79, 172, 254, 0.1);
            padding: 0.25rem 0.75rem;
            border-radius: 6px;
            display: inline-block;
        }

        /* Username and Name Styling */
        .username-text, .tutor-name {
            font-weight: 600;
            color: var(--text-accent);
        }

        /* Loading Animation */
        .loading-shimmer {
            background: linear-gradient(90deg, 
                transparent 0%, 
                rgba(255, 255, 255, 0.1) 50%, 
                transparent 100%);
            animation: shimmer 2s infinite;
        }

        @keyframes shimmer {
            0% { transform: translateX(-100%); }
            100% { transform: translateX(100%); }
        }

        /* Responsive Design */
        @media (max-width: 768px) {
            .page-container {
                padding: 1rem 0.5rem;
            }
            
            .page-title {
                font-size: 2rem;
            }
            
            .header-title {
                font-size: 1.75rem;
            }
            
            .card-header-custom,
            .table-container {
                padding: 1.5rem 1rem;
            }
            
            .table tbody td,
            .table thead th {
                padding: 1rem 0.75rem !important;
                font-size: 0.875rem;
            }
            
            .btn {
                padding: 0.5rem 1rem !important;
                font-size: 0.875rem !important;
                min-width: 80px;
            }
            
            .status-badge {
                padding: 0.4rem 0.8rem;
                font-size: 0.75rem;
                min-width: 75px;
            }
        }

        /* Custom Scrollbar */
        .table-responsive::-webkit-scrollbar {
            height: 8px;
        }

        .table-responsive::-webkit-scrollbar-track {
            background: rgba(255, 255, 255, 0.1);
            border-radius: 4px;
        }

        .table-responsive::-webkit-scrollbar-thumb {
            background: var(--accent-gradient);
            border-radius: 4px;
        }

        .table-responsive::-webkit-scrollbar-thumb:hover {
            background: var(--primary-gradient);
        }

        /* Animation delays for staggered loading */
        .table tbody tr:nth-child(1) { animation-delay: 0.1s; }
        .table tbody tr:nth-child(2) { animation-delay: 0.2s; }
        .table tbody tr:nth-child(3) { animation-delay: 0.3s; }
        .table tbody tr:nth-child(4) { animation-delay: 0.4s; }
        .table tbody tr:nth-child(5) { animation-delay: 0.5s; }

        .table tbody tr {
            animation: fadeInRow 0.6s ease-out both;
        }

        @keyframes fadeInRow {
            from {
                opacity: 0;
                transform: translateY(20px);
            }
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="page-container">
            <!-- Page Header -->
            <div class="page-header">
                <h1 class="page-title">Requests Management</h1>
            </div>

            <!-- Main Content Card -->
            <div class="main-card">
                <div class="card-header-custom">
                    <h3 class="header-title">Tuition Requests Dashboard</h3>
                </div>
                
                <div class="table-container">
                    <div class="table-responsive">
                        <asp:GridView ID="gvRequests" runat="server" 
                            AutoGenerateColumns="False" 
                            CssClass="table table-hover"
                            DataKeyNames="RequestID"
                            OnRowEditing="gvRequests_RowEditing"
                            OnRowUpdating="gvRequests_RowUpdating"
                            OnRowCancelingEdit="gvRequests_RowCancelingEdit">
                            <Columns>
                                <asp:TemplateField HeaderText="Request ID">
                                    <ItemTemplate>
                                        <span class="request-id">
                                            <%# Eval("RequestID") %>
                                        </span>
                                    </ItemTemplate>
                                </asp:TemplateField>

                                <asp:TemplateField HeaderText="Student Username">
                                    <ItemTemplate>
                                        <span class="username-text">
                                            <%# Eval("StudentUsername") %>
                                        </span>
                                    </ItemTemplate>
                                </asp:TemplateField>

                                <asp:TemplateField HeaderText="Tutor Name">
                                    <ItemTemplate>
                                        <span class="tutor-name">
                                            <%# Eval("TutorName") %>
                                        </span>
                                    </ItemTemplate>
                                </asp:TemplateField>

                                <asp:TemplateField HeaderText="Status">
                                    <ItemTemplate>
                                        <span class="status-badge 
                                            <%# Eval("Status").ToString() == "Pending" ? "badge-pending" : 
                                                (Eval("Status").ToString() == "Approved" ? "badge-approved" : "badge-rejected") %>">
                                            <i class="bi <%# Eval("Status").ToString() == "Pending" ? "bi-clock" : 
                                                (Eval("Status").ToString() == "Approved" ? "bi-check-circle" : "bi-x-circle") %>"></i>
                                            <%# Eval("Status") %>
                                        </span>
                                    </ItemTemplate>
                                    <EditItemTemplate>
                                        <asp:DropDownList ID="ddlStatus" runat="server" CssClass="form-select">
                                            <asp:ListItem Text="⏳ Pending" Value="Pending"></asp:ListItem>
                                            <asp:ListItem Text="✅ Approved" Value="Approved"></asp:ListItem>
                                            <asp:ListItem Text="❌ Rejected" Value="Rejected"></asp:ListItem>
                                        </asp:DropDownList>
                                    </EditItemTemplate>
                                </asp:TemplateField>

                                <asp:TemplateField HeaderText="Request Date">
                                    <ItemTemplate>
                                        <span class="date-text">
                                            <%# Eval("CreatedDate", "{0:dd-MM-yyyy HH:mm}") %>
                                        </span>
                                    </ItemTemplate>
                                </asp:TemplateField>

                                <asp:TemplateField HeaderText="Actions">
                                    <ItemTemplate>
                                        <asp:LinkButton runat="server" 
                                            CommandName="Edit" 
                                            CssClass="btn btn-edit"
                                            ToolTip="Edit Request">
                                            <i class="bi bi-pencil-square"></i> Edit
                                        </asp:LinkButton>
                                    </ItemTemplate>
                                    <EditItemTemplate>
                                        <asp:LinkButton runat="server" 
                                            CommandName="Update" 
                                            CssClass="btn btn-save me-2"
                                            ToolTip="Save Changes">
                                            <i class="bi bi-check2-circle"></i> Save
                                        </asp:LinkButton>
                                        <asp:LinkButton runat="server" 
                                            CommandName="Cancel" 
                                            CssClass="btn btn-cancel"
                                            ToolTip="Cancel Edit">
                                            <i class="bi bi-x-circle"></i> Cancel
                                        </asp:LinkButton>
                                    </EditItemTemplate>
                                </asp:TemplateField>
                            </Columns>
                        </asp:GridView>
                    </div>
                </div>
            </div>
        </div>
    </form>
</body>
</html>