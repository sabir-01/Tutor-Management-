<%@ Page Title="" Language="C#" MasterPageFile="~/TMS_Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="TMS_project.Default" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        :root {
            --primary-color: #4f46e5;
            --primary-dark: #3730a3;
            --secondary-color: #6366f1;
            --accent-color: #06b6d4;
            --success-color: #10b981;
            --warning-color: #f59e0b;
            --danger-color: #ef4444;
            --dark-bg: #1e293b;
            --darker-bg: #0f172a;
            --light-text: #f8fafc;
            --border-radius: 12px;
            --shadow-soft: 0 4px 6px -1px rgba(0, 0, 0, 0.1), 0 2px 4px -1px rgba(0, 0, 0, 0.06);
            --shadow-medium: 0 10px 15px -3px rgba(0, 0, 0, 0.1), 0 4px 6px -2px rgba(0, 0, 0, 0.05);
            --transition: all 0.3s cubic-bezier(0.4, 0, 0.2, 1);
        }
        body {
            font-family: 'Inter', -apple-system, BlinkMacSystemFont, sans-serif;
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            min-height: 100vh;
        }

        /* Hero Section */
        .hero-section {
            background: linear-gradient(135deg, var(--dark-bg) 0%, var(--darker-bg) 100%);
            color: var(--light-text);
            padding: 100px 0;
            position: relative;
            overflow: hidden;
        }

        .hero-section::before {
            content: '';
            position: absolute;
            top: 0;
            left: 0;
            right: 0;
            bottom: 0;
            background: url('data:image/svg+xml,<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 100 100"><circle cx="50" cy="50" r="2" fill="rgba(255,255,255,0.1)"/></svg>') repeat;
            opacity: 0.1;
        }

        .hero-content {
            position: relative;
            z-index: 2;
        }

        .hero-title {
            font-size: 3.5rem;
            font-weight: 700;
            margin-bottom: 1.5rem;
            background: linear-gradient(45deg, var(--accent-color), var(--primary-color));
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
            background-clip: text;
        }

        .hero-subtitle {
            font-size: 1.25rem;
            margin-bottom: 2rem;
            color: #cbd5e1;
            line-height: 1.6;
        }

        .btn-hero {
            background: linear-gradient(135deg, var(--primary-color), var(--secondary-color));
            border: none;
            padding: 15px 30px;
            font-weight: 600;
            border-radius: var(--border-radius);
            color: white;
            text-decoration: none;
            display: inline-block;
            transition: var(--transition);
            box-shadow: var(--shadow-medium);
        }

        .btn-hero:hover {
            transform: translateY(-3px);
            box-shadow: 0 20px 25px -5px rgba(0, 0, 0, 0.1), 0 10px 10px -5px rgba(0, 0, 0, 0.04);
            color: white;
        }

        /* Services Section */
        .services-section {
            padding: 80px 0;
            background: rgba(255, 255, 255, 0.95);
            backdrop-filter: blur(10px);
        }

        .section-title {
            text-align: center;
            margin-bottom: 4rem;
        }

        .section-title h2 {
            font-size: 2.5rem;
            font-weight: 700;
            color: var(--dark-bg);
            margin-bottom: 1rem;
        }

        .section-title p {
            font-size: 1.125rem;
            color: #64748b;
            max-width: 600px;
            margin: 0 auto;
        }

        .service-card {
            background: white;
            border-radius: var(--border-radius);
            padding: 2rem;
            height: 100%;
            box-shadow: var(--shadow-soft);
            transition: var(--transition);
            border: 2px solid transparent;
        }

        .service-card:hover {
            transform: translateY(-8px);
            box-shadow: var(--shadow-medium);
            border-color: var(--primary-color);
        }

        .service-icon {
            width: 80px;
            height: 80px;
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            margin-bottom: 1.5rem;
            font-size: 2rem;
            color: white;
        }

        .service-icon.tutor-management {
            background: linear-gradient(135deg, var(--primary-color), var(--secondary-color));
        }

        .service-icon.student-progress {
            background: linear-gradient(135deg, var(--success-color), #34d399);
        }

        .service-icon.scheduling {
            background: linear-gradient(135deg, var(--warning-color), #fbbf24);
        }

        .service-icon.analytics {
            background: linear-gradient(135deg, var(--accent-color), #0891b2);
        }

        .service-card h3 {
            font-size: 1.5rem;
            font-weight: 600;
            color: var(--dark-bg);
            margin-bottom: 1rem;
        }

        .service-card p {
            color: #64748b;
            line-height: 1.6;
        }

        /* Features Section */
        .features-section {
            padding: 80px 0;
            background: linear-gradient(135deg, rgba(79, 70, 229, 0.1), rgba(99, 102, 241, 0.1));
        }

        .feature-item {
            margin-bottom: 4rem;
        }

        .feature-content h3 {
            font-size: 2rem;
            font-weight: 600;
            color: var(--dark-bg);
            margin-bottom: 1rem;
        }

        .feature-content .lead {
            font-size: 1.125rem;
            color: var(--primary-color);
            font-style: italic;
            margin-bottom: 1.5rem;
        }

        .feature-list {
            list-style: none;
            padding: 0;
        }

        .feature-list li {
            display: flex;
            align-items: center;
            margin-bottom: 1rem;
            font-weight: 500;
            color: #475569;
        }

        .feature-list li i {
            color: var(--success-color);
            margin-right: 1rem;
            font-size: 1.25rem;
        }

        .feature-image {
            border-radius: var(--border-radius);
            box-shadow: var(--shadow-medium);
            overflow: hidden;
        }

        .feature-image img {
            transition: var(--transition);
        }

        .feature-image:hover img {
            transform: scale(1.05);
        }

        /* Stats Section */
        .stats-section {
            background: linear-gradient(135deg, var(--dark-bg), var(--darker-bg));
            color: var(--light-text);
            padding: 60px 0;
        }

        .stat-item {
            text-align: center;
            padding: 2rem;
        }

        .stat-number {
            font-size: 3rem;
            font-weight: 700;
            color: var(--accent-color);
            display: block;
        }

        .stat-label {
            font-size: 1.125rem;
            color: #cbd5e1;
            margin-top: 0.5rem;
        }

        /* CTA Section */
        .cta-section {
            background: linear-gradient(135deg, var(--primary-color), var(--secondary-color));
            color: white;
            padding: 80px 0;
            text-align: center;
        }

        .cta-section h2 {
            font-size: 2.5rem;
            font-weight: 700;
            margin-bottom: 1rem;
        }

        .cta-section p {
            font-size: 1.25rem;
            margin-bottom: 2rem;
            opacity: 0.9;
        }

        .btn-cta {
            background: white;
            color: var(--primary-color);
            border: none;
            padding: 15px 30px;
            font-weight: 600;
            border-radius: var(--border-radius);
            text-decoration: none;
            display: inline-block;
            transition: var(--transition);
            box-shadow: var(--shadow-soft);
        }

        .btn-cta:hover {
            transform: translateY(-3px);
            box-shadow: var(--shadow-medium);
            color: var(--primary-dark);
        }

        /* Responsive Design */
        @media (max-width: 768px) {
            .hero-title {
                font-size: 2.5rem;
            }
            
            .hero-subtitle {
                font-size: 1.125rem;
            }
            
            .section-title h2 {
                font-size: 2rem;
            }
            
            .feature-content h3 {
                font-size: 1.5rem;
            }
        }

        /* Animation Classes */
        .fade-in {
            opacity: 0;
            transform: translateY(20px);
            transition: var(--transition);
        }

        .fade-in.visible {
            opacity: 1;
            transform: translateY(0);
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <!-- Hero Section -->
    <section class="hero-section">
        <div class="container">
            <div class="row align-items-center">
                <div class="col-lg-8 hero-content">
                    <h1 class="hero-title">Transform Your Teaching with Our Tutor Management System</h1>
                    <p class="hero-subtitle">
                        Empower educators with cutting-edge tools for student management, progress tracking, 
                        and seamless communication. Join thousands of tutors who trust our platform.
                    </p>
                    <a href="tutor/Tutor_Registration.aspx" class="btn-hero">
                        <i class="fas fa-graduation-cap me-2"></i>Start Your Journey
                    </a>
                    <a href="" class="btn-hero ms-3" style="background: transparent; border: 2px solid var(--accent-color);">
                        <i class="fas fa-play me-2"></i>Learn More
                    </a>
                </div>
                <div class="col-lg-4 text-center">
                    <div class="hero-image">
                        <i class="fas fa-chalkboard-teacher" style="font-size: 15rem; color: var(--accent-color); opacity: 0.3;"></i>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <!-- Services Section -->
    <section class="services-section">
        <div class="container">
            <div class="section-title">
                <h2>Our Tutor Services</h2>
                <p>Comprehensive tools designed to enhance your teaching experience and student outcomes</p>
            </div>

            <div class="row g-4">
                <div class="col-lg-3 col-md-6">
                    <div class="service-card">
                        <div class="service-icon tutor-management">
                            <i class="fas fa-users-cog"></i>
                        </div>
                        <h3>Tutor Management</h3>
                        <p>Comprehensive profile management system for tutors to showcase their expertise, qualifications, and teaching specializations.</p>
                    </div>
                </div>

                <div class="col-lg-3 col-md-6">
                    <div class="service-card">
                        <div class="service-icon student-progress">
                            <i class="fas fa-chart-line"></i>
                        </div>
                        <h3>Student Progress Tracking</h3>
                        <p>Advanced analytics and reporting tools to monitor student performance, identify learning gaps, and track academic improvement.</p>
                    </div>
                </div>

                <div class="col-lg-3 col-md-6">
                    <div class="service-card">
                        <div class="service-icon scheduling">
                            <i class="fas fa-calendar-alt"></i>
                        </div>
                        <h3>Smart Scheduling</h3>
                        <p>Intelligent scheduling system that optimizes tutoring sessions, manages availability, and prevents scheduling conflicts.</p>
                    </div>
                </div>

                <div class="col-lg-3 col-md-6">
                    <div class="service-card">
                        <div class="service-icon analytics">
                            <i class="fas fa-analytics"></i>
                        </div>
                        <h3>Performance Analytics</h3>
                        <p>Deep insights into teaching effectiveness, student engagement metrics, and data-driven recommendations for improvement.</p>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <!-- Stats Section -->
    <section class="stats-section">
        <div class="container">
            <div class="row">
                <div class="col-lg-3 col-md-6">
                    <div class="stat-item">
                        <span class="stat-number counter">500+</span>
                        <div class="stat-label">Active Tutors</div>
                    </div>
                </div>
                <div class="col-lg-3 col-md-6">
                    <div class="stat-item">
                        <span class="stat-number counter">2500+</span>
                        <div class="stat-label">Students Enrolled</div>
                    </div>
                </div>
                <div class="col-lg-3 col-md-6">
                    <div class="stat-item">
                        <span class="stat-number counter">98%</span>
                        <div class="stat-label">Success Rate</div>
                    </div>
                </div>
                <div class="col-lg-3 col-md-6">
                    <div class="stat-item">
                        <span class="stat-number counter">50+</span>
                        <div class="stat-label">Subjects Covered</div>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <!-- Features Section -->
    <section id="features" class="features-section">
        <div class="container">
            <div class="section-title">
                <h2>Why Choose Our Platform</h2>
                <p>Discover the features that make our tutor management system the preferred choice for educators</p>
            </div>

            <!-- Feature 1 -->
            <div class="row feature-item align-items-center">
                <div class="col-md-6 feature-content">
                    <h3>Intuitive Dashboard & Management</h3>
                    <p class="lead">Streamlined interface designed specifically for educators</p>
                    <ul class="feature-list">
                        <li><i class="fas fa-check-circle"></i> Easy-to-use tutor dashboard with all essential tools</li>
                        <li><i class="fas fa-check-circle"></i> Real-time student progress monitoring and reporting</li>
                        <li><i class="fas fa-check-circle"></i> Automated administrative task management</li>
                        <li><i class="fas fa-check-circle"></i> Comprehensive communication tools for parent-tutor interaction</li>
                    </ul>
                </div>
                <div class="col-md-6">
                    <div class="feature-image">
                        <img src="https://images.unsplash.com/photo-1522202176988-66273c2fd55f?ixlib=rb-4.0.3&auto=format&fit=crop&w=1000&q=80" class="img-fluid" alt="Tutor Dashboard">
                    </div>
                </div>
            </div>

            <!-- Feature 2 -->
            <div class="row feature-item align-items-center">
                <div class="col-md-6 order-md-2 feature-content">
                    <h3>Advanced Learning Analytics</h3>
                    <p class="lead">Data-driven insights to enhance teaching effectiveness</p>
                    <p>Our advanced analytics engine provides comprehensive insights into student learning patterns, 
                    helping tutors identify areas for improvement and optimize their teaching strategies for better outcomes.</p>
                    <ul class="feature-list">
                        <li><i class="fas fa-check-circle"></i> Detailed performance analytics and trend analysis</li>
                        <li><i class="fas fa-check-circle"></i> Personalized learning path recommendations</li>
                        <li><i class="fas fa-check-circle"></i> Predictive modeling for student success</li>
                    </ul>
                </div>
                <div class="col-md-6 order-md-1">
                    <div class="feature-image">
                        <img src="https://images.unsplash.com/photo-1551288049-bebda4e38f71?ixlib=rb-4.0.3&auto=format&fit=crop&w=1000&q=80" class="img-fluid" alt="Analytics Dashboard">
                    </div>
                </div>
            </div>

            <!-- Feature 3 -->
            <div class="row feature-item align-items-center">
                <div class="col-md-6 feature-content">
                    <h3>Seamless Communication Hub</h3>
                    <p class="lead">Connect effortlessly with students and parents</p>
                    <ul class="feature-list">
                        <li><i class="fas fa-check-circle"></i> Integrated messaging system with real-time notifications</li>
                        <li><i class="fas fa-check-circle"></i> Video conferencing capabilities for remote tutoring</li>
                        <li><i class="fas fa-check-circle"></i> Parent portal for progress updates and communication</li>
                        <li><i class="fas fa-check-circle"></i> Automated reminder system for sessions and assignments</li>
                    </ul>
                </div>
                <div class="col-md-6">
                    <div class="feature-image">
                        <img src="https://images.unsplash.com/photo-1516321318423-f06f85e504b3?ixlib=rb-4.0.3&auto=format&fit=crop&w=1000&q=80" class="img-fluid" alt="Communication Tools">
                    </div>
                </div>
            </div>
        </div>
    </section>

    <!-- CTA Section -->
    <section class="cta-section">
        <div class="container">
            <h2>Ready to Transform Your Teaching Experience?</h2>
            <p>Join thousands of tutors who are already using our platform to deliver exceptional education</p>
            <a href="Tutor_Signup.aspx" class="btn-cta me-3">
                <i class="fas fa-user-plus me-2"></i>Register as Tutor
            </a>
            <a href="student_Signup.aspx" class="btn-cta" style="background: transparent; color: white; border: 2px solid white;">
                <i class="fas fa-graduation-cap me-2"></i>Register  As Student
            </a>
        </div>
    </section>

    <script>
        // Counter animation
        document.addEventListener('DOMContentLoaded', function() {
            const counters = document.querySelectorAll('.counter');
            
            function animateCounters() {
                counters.forEach(counter => {
                    const target = parseInt(counter.textContent.replace(/[^\d]/g, ''));
                    const increment = target / 100;
                    let current = 0;
                    
                    const updateCounter = () => {
                        if (current < target) {
                            current += increment;
                            if (counter.textContent.includes('%')) {
                                counter.textContent = Math.floor(current) + '%';
                            } else if (counter.textContent.includes('+')) {
                                counter.textContent = Math.floor(current) + '+';
                            } else {
                                counter.textContent = Math.floor(current);
                            }
                            setTimeout(updateCounter, 50);
                        } else {
                            counter.textContent = counter.textContent;
                        }
                    };                    
                    updateCounter();
                });
            }
            const observerOptions = {
                threshold: 0.3,
                rootMargin: '0px 0px -100px 0px'
            };

            const observer = new IntersectionObserver((entries) => {
                entries.forEach(entry => {
                    if (entry.isIntersecting) {
                        if (entry.target.classList.contains('stats-section')) {
                            animateCounters();
                        }
                        entry.target.classList.add('visible');
                    }
                });
            }, observerOptions);

            // Observe elements
            document.querySelectorAll('.fade-in, .stats-section').forEach(el => {
                observer.observe(el);
            });

            // Smooth scrolling for anchor links
            document.querySelectorAll('a[href^="#"]').forEach(anchor => {
                anchor.addEventListener('click', function (e) {
                    e.preventDefault();
                    const target = document.querySelector(this.getAttribute('href'));
                    if (target) {
                        target.scrollIntoView({
                            behavior: 'smooth',
                            block: 'start'
                        });
                    }
                });
            });
        });
    </script>
</asp:Content>