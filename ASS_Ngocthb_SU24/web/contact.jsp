<%-- 
    Document   : contact
    Created on : Jul 3, 2024, 8:25:41 PM
    Author     : Lenovo
--%>

<%@page import="ngocthb.model.UserDTO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Contact Page</title>
        <link href="View/Img/logo.png" rel="shortcut icon" type="image/x-icon" />
        <link href="View/Img/logo.png" rel="apple-touch-icon" />

        <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">

        <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
        <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

    </head>
    <body>
        <link rel="stylesheet" href="View/Css/home.css" />
    <body> <div class="banner">
            <div>
                <div class="notice-text">
                    TTK * Piano specializes in teaching piano, guitar and drawing.
                    <a href="search-csr-result.jsp" class="white-link">Booking Now</a>
                </div>
            </div>
        </div>
        </br>
        <%
            UserDTO loginUser = (UserDTO) session.getAttribute("LOGIN_USER");
            String search = request.getParameter("search");
            if (search == null) {
                search = "";
            }
            String cata = request.getParameter("cata");
            if (cata == null) {
                cata = "";
            }
        %>
        <div class="navigation-container">
            <div class="navigation-left">
                <img src="View/Img/logo.svg" width="80" alt="" />
            </div>
            <div class="navigation-right">
                <div class="menu-button w-nav-button">
                    <div class="icon w-icon-nav-menu"></div>
                </div>
                <nav role="navigation" class="nav-menu w-nav-menu">
                    <a
                        href="home.jsp"
                        aria-current="page"
                        class="nav-link w-nav-link w--current"
                        >Home</a
                    ><a href="carts.jsp" class="nav-link w-nav-link"
                        >Cart</a
                    >
                    <a href="contact.jsp" class="nav-link w-nav-link"
                       >Contact</a>

                    <%
                        if (loginUser != null) {
                    %>
                    <a href="account.jsp" class="avatar nav-link w-nav-link"><img src="View/Img/user-avatar.svg" alt="Avatar"></a>                             
                        <% } else {
                        %>
                    <a href="login.jsp" class="nav-link w-nav-link">Login</a>
                    <% }%>
                </nav>

            </div>
        </div>
        <link rel="stylesheet" href="View/Css/contatct.css" />
        <div class="content">
            <div class="container">
                <div class="row justify-content-center">
                    <div class="col-md-10">
                        <div class="row align-items-center">
                            <div class="col-lg-7 mb-5 mb-lg-0">
                                <h2 class="mb-5">
                                    Fill the form. <br />
                                    It's easy.
                                </h2>

                                <form
                                    class="border-right pr-5 mb-5" action="MainController"
                                    method="post"
                                    id="contactForm"
                                    name="contactForm"
                                    >
                                    <div class="row">
                                        <div class="col-md-6 form-group">
                                            <input
                                                type="text"
                                                class="form-control"
                                                name="fname"
                                                id="fname"
                                                placeholder="First name"
                                                />
                                        </div>
                                        <div class="col-md-6 form-group">
                                            <input
                                                type="text"
                                                class="form-control"
                                                name="lname"
                                                id="lname"
                                                placeholder="Last name"
                                                />
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-md-12 form-group">
                                            <input
                                                type="text"
                                                class="form-control"
                                                name="email"
                                                id="email"
                                                placeholder="Email"
                                                />
                                        </div>
                                    </div>

                                    <div class="row">
                                        <div class="col-md-12 form-group">
                                            <textarea
                                                class="form-control"
                                                name="message"
                                                id="message"
                                                cols="30"
                                                rows="7"
                                                placeholder="Write your message"
                                                ></textarea>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-md-12">
                                            <input
                                                type="submit"
                                                value="Send Message"
                                                class="btn rounded-0 py-2 px-4"
                                                />
                                            <span class="submitting"></span>
                                        </div>
                                    </div>
                                </form>

                                <div id="form-message-warning mt-4"></div>
                                
                            </div>
                            <div class="col-lg-4 ml-auto">
                                <h3 class="mb-4">Let's talk about everything.</h3>
                                <p>
                                    We value and appreciate all the feedback you provide. 
                                    Every suggestion and comment will be carefully considered as we strive to improve and enhance our services. 
                                    Your input is crucial in helping us meet your expectations and ensuring a better experience for everyone. 
                                    Thank you for taking the time to share your thoughts with us.
                                </p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="contact_map">
            <div class="row">
                <div class="col-1"></div>
                <div class="col-10">
                    <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3918.6100105370224!2d106.8073080748058!3d10.84112758931163!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x31752731176b07b1%3A0xb752b24b379bae5e!2zVHLGsOG7nW5nIMSQ4bqhaSBo4buNYyBGUFQgVFAuIEhDTQ!5e0!3m2!1svi!2s!4v1708621540719!5m2!1svi!2s" width="100%" height="450" style="border:0" allowfullscreen=""></iframe>
                </div>
            </div>
        </div>
         <div class="footer">
            <div class="container">
                <div class="w-layout-grid footer-grid">
                    <div
                        id="w-node-_67f7db32-28d2-9f37-8b84-a159dcc6da5a-dcc6da57"
                        class="footer-column"
                        >
                        <img src="View/Img/logo.svg" width="80" alt="" class="footer-logo" />
                        <p>
                            TTK * Piano music center, <br />Sound - Light and Music Education.
                        </p>
                    </div>
                    <div class="footer-column">
                        <a
                            href="home.jsp"
                            aria-current="page"
                            class="footer-link w--current"
                            >Home</a
                        >
                    </div>
                    <div class="footer-column">
                        <a
                            href="search-csr-result.jsp"
                            aria-current="page"
                            class="footer-link w--current"
                            >Order</a
                        >
                    </div>
                    <div class="footer-column">
                        <a href="contact.jsp" class="footer-link">Contact</a>
                    </div>
                </div>
            </div>
        </div>
        <script src="js/jquery-3.3.1.min.js"></script>
        <script src="js/popper.min.js"></script>
        <script src="js/bootstrap.min.js"></script>
        <script src="js/jquery.validate.min.js"></script>
        <script src="js/main.js"></script>
    </body>
</html>
