<%-- 
    Document   : create
    Created on : Jun 3, 2024, 3:50:59 PM
    Author     : Lenovo
--%>

<%@page import="ngocthb.model.UserDTO"%>
<%@page import="ngocthb.model.UserError"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Create User</title>
        <link
            rel="stylesheet"
            href="fonts/material-icon/css/material-design-iconic-font.min.css"
            />
        <link href="View/Img/logo.png" rel="shortcut icon" type="image/x-icon" />
        <link href="View/Img/logo.png" rel="apple-touch-icon" />
        <!-- Main css -->


    </head>
    <body>
        <link rel="stylesheet" href="View/Css/home.css" />
        </br>
        <div class="banner">
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

        <%
            UserError userError = (UserError) request.getAttribute("USER_ERROR");
            if (userError == null) {
                userError = new UserError();
            }
        %>
        <link rel="stylesheet" href="View/Css/login.css" />
        <div class="main">
            <!-- Sign up form -->
            <section class="signup">
                <div class="container">
                    <div class="signup-content">
                        <div class="signup-form">
                            <h2 class="form-title">Sign up</h2>
                            <form action="MainController" method="POST" class="register-form" id="register-form">

                                <div class="form-group">
                                    <label for="name"
                                           ><i class="zmdi zmdi-account material-icons-name"></i
                                        ></label>
                                    <div class="FLname">

                                        <input
                                            type="text"
                                            name="firstname"
                                            id="firstname"
                                            required=""
                                            placeholder="First Name"
                                            />
                                        <%= userError.getFistname()%>
                                        <input
                                            type="text"
                                            name="lastname"
                                            required=""
                                            id="lastname"
                                            placeholder="Last Name"
                                            />
                                        <%= userError.getLastname()%>
                                    </div>

                                </div>

                                <div class="form-group">
                                    <label for="username"
                                           ><i class="zmdi zmdi-account material-icons-name"></i
                                        ></label>
                                    <input
                                        type="text"
                                        name="username"
                                        id="username"
                                        placeholder="User Name"
                                        />
                                    <%= userError.getUsername()%>
                                </div>
                                <div class="form-group">
                                    <label for="email"><i class="zmdi zmdi-email"></i></label>
                                    <input
                                        type="email"
                                        name="email"
                                        id="email"
                                        placeholder="Your Email"
                                        />
                                    <%= userError.getEmail()%>
                                </div>
                                <div class="form-group">
                                    <label for="address"><i class="zmdi zmdi-email"></i></label>
                                    <input
                                        type="text"
                                        name="address"
                                        id="address"
                                        placeholder="Your Address"
                                        />
                                    <%= userError.getAddress()%>
                                </div>
                                <div class="form-group">
                                    <label for="phone"><i class="zmdi zmdi-email"></i></label>
                                    <input
                                        type="text"
                                        name="phone"
                                        id="phone"
                                        placeholder="Your Phone"
                                        />
                                    <%= userError.getPhone()%>
                                </div>
                                <div class="form-group">
                                    <label for="pass"><i class="zmdi zmdi-lock"></i></label>
                                    <input
                                        type="password"
                                        name="password"
                                        id="pass"
                                        placeholder="Password"
                                        />
                                    <%= userError.getPassword()%>
                                </div>
                                <div class="form-group">
                                    <label for="re-pass"
                                           ><i class="zmdi zmdi-lock-outline"></i
                                        ></label>
                                    <input
                                        type="password"
                                        name="confirm"
                                        id="re_pass"

                                        placeholder="Repeat your password"
                                        />
                                    <%= userError.getConfirm()%>
                                </div>

                                <div class="form-group form-button">
                                    <input
                                        type="submit"
                                        name="action"
                                        id="signup"
                                        class="form-submit"
                                        value="Create"
                                        />
                                </div>
                            </form>
                        </div>
                        <div class="signup-image">
                            <figure>
                                <img src="View/Img/signup-image.jpg" alt="sing up image" />
                            </figure>
                            <a href="login.jsp" class="signup-image-link">I am already member</a>
                        </div>
                    </div>
                </div>

            </section>
        </div>

        <%
            String error = (String) request.getAttribute("MESSAGE");
            if (error == null) {
                error = "";
            }
        %>
        <%= error%>
    </body>
</html>
