<%@ Page Title="" Language="C#" MasterPageFile="~/Tutor/Tutor_Dashboard.Master" AutoEventWireup="true" CodeBehind="View_student.aspx.cs" Inherits="TMS_project.Tutor.View_student" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    <style>
        /* Modern CSS Variables for Consistent Theming */
        :root {
            --primary-gradient: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            --secondary-gradient: linear-gradient(135deg, #f093fb 0%, #f5576c 100%);
            --accent-gradient: linear-gradient(135deg, #4facfe 0%, #00f2fe 100%);
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
        body {
            background: var(--dark-bg);
            font-family: 'Inter', -apple-system, BlinkMacSystemFont, sans-serif;
            color: var(--text-primary);
            overflow-x: hidden;
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
            width: 100px;
            height: 4px;
            background: var(--accent-gradient);
            border-radius: 2px;
            animation: slideIn 0.8s ease-out;
        }

        @keyframes slideIn {
            from { width: 0; }
            to { width: 100px; }
        }

        /* Search Section */
        .search-container {
            max-width: 500px;
            margin: 0 auto 3rem;
            position: relative;
        }

        .search-wrapper {
            position: relative;
            background: var(--glass-bg);
            backdrop-filter: blur(20px);
            border-radius: var(--border-radius);
            border: 1px solid rgba(255, 255, 255, 0.1);
            padding: 0.5rem;
            transition: var(--transition);
            box-shadow: var(--shadow-light);
        }

        .search-wrapper:hover, .search-wrapper:focus-within {
            transform: translateY(-2px);
            box-shadow: var(--shadow-heavy);
            border-color: rgba(79, 172, 254, 0.5);
        }

        .search-input {
            background: transparent !important;
            border: none !important;
            font-size: 1.1rem;
            padding: 1rem 1.5rem !important;
            width: 100% !important;
            border-radius: var(--border-radius) !important;
            outline: none !important;
            box-shadow: none !important;
        }

        .search-input::placeholder {
            color: var(--text-secondary);
            opacity: 0.8;
        }

        .search-btn {
            position: absolute;
            right: 0.5rem;
            top: 50%;
            transform: translateY(-50%);
            background: var(--accent-gradient) !important;
            border: none !important;
            color: white !important;
            width: 50px;
            height: 50px;
            border-radius: 12px !important;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 1.2rem;
            transition: var(--transition);
            box-shadow: 0 4px 15px rgba(79, 172, 254, 0.4);
        }

        .search-btn:hover {
            transform: translateY(-50%) scale(1.05);
            box-shadow: 0 6px 20px rgba(79, 172, 254, 0.6);
        }

        /* Student Cards Grid */
        .students-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(350px, 1fr));
            gap: 2rem;
            max-width: 1400px;
            margin: 0 auto;
        }

        /* Student Card Styles */
        .student-card {
            background: var(--glass-bg);
            backdrop-filter: blur(20px);
            border: 1px solid rgba(255, 255, 255, 0.1);
            border-radius: var(--border-radius);
            overflow: hidden;
            transition: var(--transition);
            position: relative;
            box-shadow: var(--shadow-light);
            animation: fadeInUp 0.6s ease-out;
        }

        .student-card::before {
            content: '';
            position: absolute;
            top: 0;
            left: 0;
            right: 0;
            height: 4px;
            background: var(--primary-gradient);
            transform: scaleX(0);
            transform-origin: left;
            transition: transform 0.3s ease;
        }

        .student-card:hover::before {
            transform: scaleX(1);
        }

        .student-card:hover {
            transform: translateY(-8px);
            box-shadow: var(--shadow-heavy);
            border-color: rgba(79, 172, 254, 0.3);
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
            padding: 2rem 1.5rem;
            text-align: center;
            position: relative;
        }

        .student-name {
            font-size: 1.5rem;
            font-weight: 700;
            margin: 0;
            color: white;
            text-shadow: 0 2px 4px rgba(0, 0, 0, 0.3);
        }

        .name-label {
            font-size: 0.875rem;
            opacity: 0.9;
            margin-bottom: 0.5rem;
            display: block;
            text-transform: uppercase;
            letter-spacing: 1px;
        }

        /* Card Body */
        .card-body-custom {
            padding: 2rem 1.5rem;
        }

        .info-item {
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 1rem 0;
            border-bottom: 1px solid rgba(255, 255, 255, 0.1);
            transition: var(--transition);
        }

        .info-item:last-child {
            border-bottom: none;
        }

        .info-item:hover {
            padding-left: 0.5rem;
            background: rgba(79, 172, 254, 0.05);
            border-radius: 8px;
            border-bottom-color: transparent;
        }

        .info-label {
            font-size: 0.875rem;
            color: var(--text-accent);
            font-weight: 600;
            text-transform: uppercase;
            letter-spacing: 0.5px;
            display: flex;
            align-items: center;
        }

        .info-label::before {
            content: '';
            width: 8px;
            height: 8px;
            background: var(--accent-gradient);
            border-radius: 50%;
            margin-right: 0.75rem;
            animation: pulse 2s infinite;
        }

        @keyframes pulse {
            0%, 100% { opacity: 0.6; transform: scale(1); }
            50% { opacity: 1; transform: scale(1.2); }
        }

        .info-value {
            font-size: 1rem;
            font-weight: 500;
            color: black;
            text-align: right;
        }

        /* Card Footer */
        .card-footer-custom {
            background: rgba(0, 0, 0, 0.2);
            padding: 1.5rem;
            text-align: center;
            border-top: 1px solid rgba(255, 255, 255, 0.1);
        }

        .standard-info {
            background: var(--secondary-gradient);
            color: white;
            padding: 1rem 1.5rem;
            border-radius: 12px;
            font-weight: 600;
            display: inline-block;
            min-width: 120px;
            box-shadow: 0 4px 15px rgba(240, 147, 251, 0.3);
            transition: var(--transition);
        }

        .standard-info:hover {
            transform: translateY(-2px);
            box-shadow: 0 6px 20px rgba(240, 147, 251, 0.5);
        }

        .standard-label {
            font-size: 0.75rem;
            opacity: 0.9;
            display: block;
            margin-bottom: 0.25rem;
            text-transform: uppercase;
            letter-spacing: 1px;
        }

        .standard-value {
            font-size: 1.25rem;
            font-weight: 700;
        }

        /* Responsive Design */
        @media (max-width: 768px) {
            .students-grid {
                grid-template-columns: 1fr;
                gap: 1.5rem;
                padding: 0 1rem;
            }
            
            .page-title {
                font-size: 2.5rem;
            }
            
            .student-card {
                margin-bottom: 1rem;
            }
            
            .info-item {
                flex-direction: column;
                align-items: flex-start;
                gap: 0.5rem;
            }
            
            .info-value {
                text-align: left;
            }
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

        /* Utility Classes */
        .text-gradient {
            background: var(--primary-gradient);
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
            background-clip: text;
        }

        .glass-effect {
            background: var(--glass-bg);
            backdrop-filter: blur(20px);
            border: 1px solid rgba(255, 255, 255, 0.1);
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="page-container">
        <!-- Page Header -->
        <div class="page-header">
            <h1 class="page-title">Student Details</h1>
        </div>

        <!-- Search Section -->
        <div class="search-container">
            <div class="search-wrapper">
                <asp:TextBox 
                    ID="SerachText" 
                    runat="server" 
                    CssClass="search-input" 
                    placeholder="Search students by name, subject, or location...">
                </asp:TextBox>
                <button 
                    id="searchbtn" 
                    runat="server" 
                    onserverclick="searchbtn_ServerClick" 
                    class="search-btn" 
                    type="button">
                    <i class="fa-solid fa-search"></i>
                </button>
            </div>
        </div>

        <!-- Students Grid -->
        <div class="students-grid">
            <asp:Repeater ID="Repeater1" runat="server">
                <ItemTemplate>
                    <div class="student-card">
                        <!-- Card Header -->
                        <div class="card-header-custom">
                            <span class="name-label">Student Name</span>
                            <h3 class="student-name">
                                <asp:Label ID="Label1" runat="server" Text='<%# Bind("Name") %>'></asp:Label>
                            </h3>
                        </div>

                        <!-- Card Body -->
                        <div class="card-body-custom">
                            <div class="info-item">
                                <span class="info-label">Gender</span>
                                <span class="info-value">
                                    <asp:Label ID="Label2" runat="server" Text='<%# Bind("Gender") %>'></asp:Label>
                                </span>
                            </div>

                            <div class="info-item">
                                <span class="info-label">Country</span>
                                <span class="info-value">
                                    <asp:Label ID="Label3" runat="server" Text='<%# Bind("Country") %>'></asp:Label>
                                </span>
                            </div>

                            <div class="info-item">
                                <span class="info-label">City</span>
                                <span class="info-value">
                                    <asp:Label ID="Label4" runat="server" Text='<%# Bind("City") %>'></asp:Label>
                                </span>
                            </div>

                            <div class="info-item">
                                <span class="info-label">Subject</span>
                                <span class="info-value">
                                    <asp:Label ID="Label6" runat="server" Text='<%# Bind("Subject") %>'></asp:Label>
                                </span>
                            </div>

                            <div class="info-item">
                                <span class="info-label">Contact</span>
                                <span class="info-value">
                                    <asp:Label ID="Label8" runat="server" Text='<%# Bind("ContactNumber") %>'></asp:Label>
                                </span>
                            </div>

                            <div class="info-item">
                                <span class="info-label">Tuition Type</span>
                                <span class="info-value">
                                    <asp:Label ID="Label9" runat="server" Text='<%# Bind("TuitionType") %>'></asp:Label>
                                </span>
                            </div>
                        </div>

                        <!-- Card Footer -->
                        <div class="card-footer-custom">
                            <div class="standard-info">
                                <span class="standard-label">Standard</span>
                                <div class="standard-value">
                                    <asp:Label ID="Label5" runat="server" Text='<%# Bind("Class") %>'></asp:Label>
                                </div>
                            </div>
                        </div>
                    </div>
                </ItemTemplate>
            </asp:Repeater>
        </div>
    </div>
</asp:Content>