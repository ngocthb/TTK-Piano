
<%@page import="ngocthb.model.UserDTO"%>
<%-- 
    Document   : login
    Created on : May 19, 2024, 7:39:45 PM
    Author     : Lenovo
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login Page</title>

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
        <div class="banner">
            <div>
                <div class="notice-text">
                    TTK * Piano specializes in teaching piano, guitar and drawing.
                    <a href="search-csr-result.jsp" class="white-link">Booking Now</a>
                </div>
            </div>
        </div>
        </br>
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
                    <a href="login.jsp" class="nav-link w-nav-link">Login</a>

                </nav>

            </div>
        </div>
        <link rel="stylesheet" href="View/Css/login.css" />
        <div class="main">
            <!-- Sing in  Form -->
            <section class="sign-in">
                <div class="container">
                    <div class="signin-content">
                        <div class="signin-image">
                            <figure>
                                <img src="View/Img/signin-image.jpg" alt="singn up image" />
                            </figure>
                            <a href="create.jsp" class="signup-image-link"
                               >Dont't have acount yet?</a
                            >
                        </div>

                        <div class="signin-form">
                            <h2 class="form-title">Sign in</h2>
                            <form action="MainController" method="POST" class="register-form" id="login-form">
                                <div class="form-group">
                                    <label for="your_name"
                                           ><i class="zmdi zmdi-account material-icons-name"></i
                                        ></label>                                  
                                    <input type="text" name="userID" id="your_name" required="" placeholder="Your Name" />
                                </div>
                                <div class="form-group">
                                    <label for="your_pass"><i class="zmdi zmdi-lock"></i></label>
                                    <input type="password" id="your_pass" name="password" required="" placeholder="Password" />

                                </div>
                                <div class="form-group">
                                    <input
                                        type="checkbox"
                                        name="remember-me"
                                        id="remember-me"
                                        class="agree-term"
                                        />
                                    <label for="remember-me" class="label-agree-term"
                                           ><span><span></span></span>Remember me</label
                                    >
                                </div>
                                <div class="">
                                    <input
                                        type="submit"
                                        name="action"
                                        id="signin"
                                        class="form-submit"
                                        value="Login"
                                        />
                                </div>
                            </form>
                            <div class="social-login">
                                <span class="social-label">Or login with</span>
                                <ul class="socials">
                                    <li>

                                        <a href="#"
                                           ><i class="display-flex-center zmdi zmdi-google"></i
                                            ></a>
                                    </li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
            </section>
        </div>
        </br>
        <%
            String error = (String) request.getAttribute("MESSAGE");
            if (error == null) {
                error = "";
            }
        %>
        <%= error%>
    </body>
</html>
