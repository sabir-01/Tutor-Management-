<%@ Page Title="" Language="C#" MasterPageFile="~/TMS_Site.Master" AutoEventWireup="true" CodeBehind="Contact.aspx.cs" Inherits="TMS_project.Contact" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <script type="text/javascript">
        function successcontent() {
            Swal.fire({
                title: "Thank You!",
                text: "Your message has been successfully sent!",
                icon: "success"
            });
        }
        function Errorcontent() {
            Swal.fire({
                icon: "error",
                title: "We Apologize",
                text: "Message sending failed. Please try again."
            });
        }
    </script>
    
    <style>
        /* Pakistani Theme Colors */
        :root {
            --pak-green: #01411C;
            --pak-white: #FFFFFF;
            --pak-gold: #FFB300;
            --pak-light-green: #D5E8D4;
            --pak-dark-green: #003515;
        }
        
        /* Page Title Section */
        .dark-background {
            background: linear-gradient(rgba(0, 53, 21, 0.85), rgba(0, 53, 21, 0.85)), url('https://images.unsplash.com/photo-1558002037-2b56ed634d3a?ixlib=rb-1.2.1&auto=format&fit=crop&w=1350&q=80');
            background-size: cover;
            background-position: center;
            padding: 80px 0;
            color: white;
            text-align: center;
        }
        
        .breadcrumbs ol {
            justify-content: center;
        }
        
        .breadcrumbs a {
            color: var(--pak-gold);
        }
        
        .breadcrumbs a:hover {
            color: white;
        }
        
        /* Contact Section */
        .contact {
            background-color: #f8f9fa;
            padding: 60px 0;
        }
        
        .info-item {
            background: white;
            padding: 30px 20px;
            border-radius: 10px;
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.1);
            transition: transform 0.3s ease;
            height: 100%;
            text-align: center;
        }
        
        .info-item:hover {
            transform: translateY(-5px);
        }
        
        .info-item i {
            font-size: 2rem;
            color: var(--pak-green);
            margin-bottom: 15px;
        }
        
        .info-item h3 {
            color: var(--pak-dark-green);
            font-weight: 600;
        }
        
        /* Form Styling */
        .form-control {
            border-radius: 8px;
            padding: 12px 15px;
            border: 2px solid #e9ecef;
            transition: all 0.3s;
        }
        
        .form-control:focus {
            border-color: var(--pak-green);
            box-shadow: 0 0 0 0.2rem rgba(1, 65, 28, 0.25);
        }
        
        .btn-info {
            background-color: var(--pak-green);
            border-color: var(--pak-green);
            color: white;
            padding: 12px 30px;
            border-radius: 50px;
            font-weight: 600;
            transition: all 0.3s;
        }
        
        .btn-info:hover {
            background-color: var(--pak-dark-green);
            border-color: var(--pak-dark-green);
            transform: translateY(-2px);
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.15);
        }
        
        /* Map Styling */
        .map-container {
            border-radius: 10px;
            overflow: hidden;
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.1);
        }
        
        /* Validation Styling */
        .validator {
            color: #dc3545;
            font-size: 0.85rem;
            margin-top: 5px;
            display: block;
        }
        
        /* Pakistani Pattern Decoration */
        .section-title {
            position: relative;
            margin-bottom: 40px;
            text-align: center;
        }
        
        .section-title:after {
            content: "";
            display: block;
            width: 80px;
            height: 3px;
            background: var(--pak-green);
            margin: 15px auto;
        }
        
        /* Responsive Adjustments */
        @media (max-width: 768px) {
            .info-item {
                margin-bottom: 20px;
            }
        }
        
        /* Pakistani Cultural Elements */
        .cultural-pattern {
            background-color:deepskyblue;
            padding: 10px 0;
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <!-- Page Title -->
    <div class="page-title dark-background">
        <div class="container position-relative">
            <h1>Contact Us</h1>
            <p>We welcome you to get in touch with us. Your questions, suggestions and feedback are important to us.</p>
            <nav class="breadcrumbs">
                <ol>
                    <li><a href="index.html">Home</a></li>
                    <li class="current">Contact</li>
                </ol>
            </nav>
        </div>
    </div>
    <!-- End Page Title -->


    <!-- Contact Section -->
    <section id="contact" class="contact section cultural-pattern">

        <div class="container" data-aos="fade-up" data-aos-delay="100">

            <div class="section-title">
                <h2>Get In Touch</h2>
                <p>We will respond to your questions and suggestions in the future</p>
            </div>

            <div class="row gy-4">
                <div class="col-lg-6">
                    <div class="row gy-4">

                        <div class="col-lg-12">
                            <div class="info-item d-flex flex-column justify-content-center align-items-center" data-aos="fade-up" data-aos-delay="200">
                                <i class="bi bi-geo-alt"></i>
                                <h3>Address</h3>
                                <p>Blue Area, Islamabad, Pakistan</p>
                            </div>
                        </div>
                        <!-- End Info Item -->

                        <div class="col-md-6">
                            <div class="info-item d-flex flex-column justify-content-center align-items-center" data-aos="fade-up" data-aos-delay="300">
                                <i class="bi bi-telephone"></i>
                                <h3>Call Us</h3>
                                <p>+92 51 123 4567</p>
                            </div>
                        </div>
                        <!-- End Info Item -->

                        <div class="col-md-6">
                            <div class="info-item d-flex flex-column justify-content-center align-items-center" data-aos="fade-up" data-aos-delay="400">
                                <i class="bi bi-envelope"></i>
                                <h3>Email Us</h3>
                                <p>info@tms-pakistan.pk</p>
                            </div>
                        </div>
                        <!-- End Info Item -->

                    </div>
                </div>

                <div class="col-lg-6">
                    <form action="#" method="post" role="form" class="php-email-form" data-aos="fade-up" data-aos-delay="100">
                    <div class="row gy-4">

                        <div class="col-md-6">
                            <asp:TextBox ID="NameTextBox" class="form-control" runat="server" placeholder="Your Name"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" SetFocusOnError="true" Display="Dynamic" ControlToValidate="NameTextBox" CssClass="validator" runat="server" ErrorMessage="Name is required"></asp:RequiredFieldValidator>
                        </div>

                        <div class="col-md-6 ">
                            <asp:TextBox ID="EmailTextBox" class="form-control" runat="server" placeholder="Your Email"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" SetFocusOnError="true" Display="Dynamic" ControlToValidate="EmailTextBox" CssClass="validator" runat="server" ErrorMessage="Email is required"></asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" SetFocusOnError="true" CssClass="validator" Display="Dynamic" ControlToValidate="EmailTextBox" ErrorMessage="Please enter a valid email address" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                        </div>

                        <div class="col-md-12">
                            <asp:DropDownList ID="subjectDropDownList" class="form-control" runat="server">
                                <asp:ListItem>Select Subject</asp:ListItem>
                                <asp:ListItem>Suggestion</asp:ListItem>
                                <asp:ListItem>Feedback</asp:ListItem>
                                <asp:ListItem>Complaint</asp:ListItem>
                            </asp:DropDownList>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" InitialValue="Select Subject" SetFocusOnError="true" Display="Dynamic" ControlToValidate="subjectDropDownList" CssClass="validator" runat="server" ErrorMessage="Subject is required"></asp:RequiredFieldValidator>

                        </div>

                        <div class="col-md-12">
                            <asp:TextBox ID="messageTextArea" TextMode="MultiLine" class="form-control" runat="server" name="message" Columns="50" Rows="5" placeholder="Your Message"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator4" SetFocusOnError="true" Display="Dynamic" ControlToValidate="messageTextArea" CssClass="validator" runat="server" ErrorMessage="Message is required"></asp:RequiredFieldValidator>

                        </div>

                        <div class="col-md-12 text-center">

                            <asp:Button CssClass="btn btn-info" ID="submitButton" runat="server" Text="Send Message" OnClick="submitButton_Click" />

                        </div>

                    </div>
                    </form>
                </div>
                <!-- End Contact Form -->

            </div>

        </div>

        <div class="mt-5 map-container" data-aos="fade-up" data-aos-delay="200">
            <iframe style="border: 0; width: 100%; height: 370px;" src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d13297.072285536885!2d73.04755673476562!3d33.7291515!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x38dfbfd2ff3c771d%3A0x788ccedc7c5f8e4f!2sBlue%20Area%2C%20Islamabad%2C%20Islamabad%20Capital%20Territory%2C%20Pakistan!5e0!3m2!1sen!2s!4v1684323456789!5m2!1sen!2s" frameborder="0" allowfullscreen="" loading="lazy" referrerpolicy="no-referrer-when-downgrade"></iframe>
        </div>

    </section>

</asp:Content>