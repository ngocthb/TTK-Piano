<%-- 
    Document   : acount
    Created on : Jun 25, 2024, 11:38:24 PM
    Author     : Lenovo
--%>

<%@page import="ngocthb.model.UserDTO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Account Page</title>
        <link href="View/Img/logo.png" rel="shortcut icon" type="image/x-icon" />
        <link href="View/Img/logo.png" rel="apple-touch-icon" />
        
        <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">

        <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
        <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

    </head>
    <body>
        <%
            UserDTO loginUser = (UserDTO) session.getAttribute("LOGIN_USER");
            if (loginUser == null) {
                loginUser = new UserDTO();
            }
        %>
        <link rel="stylesheet" href="View/Css/home.css" />
        <div class="banner">
            <div>
                <div class="notice-text">
                    TTK * Piano specializes in teaching piano, guitar and drawing.
                    <a href="search-csr-result.jsp" class="white-link">Booking Now</a>
                </div>
            </div>
        </div>
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
                <link rel="stylesheet" href="View/Css/account.css" />
               <div class="container emp-profile">
                <form action="MainController" method="POST">
                    <div class="row">
                        <div class="col-md-4">
                            <div class="profile-img">
                                <img src="<%= loginUser.getAvatar()%>" alt=""/>
                                <div class="file btn btn-lg btn-primary">
                                    Change Photo
                                    <input type="file" name="avatar"/>
                                </div>
                            </div>
                           <div class="profile-work">
                                
                                <a href="myorder.jsp">My Order</a>
                                
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="profile-head">
                                <h5>
                                    <%= loginUser.getFirstName() + " " + loginUser.getLastName()%>
                                </h5>
                                <%
                                    String welcome = "Welcome User";
                                    if(loginUser.isIsadmin()){
                                        welcome = "Welcome Admin";
                                    }
                                %>
                                <h6>
                                    <%=welcome %>
                                </h6>
            
                                <ul class="nav nav-tabs" id="myTab" role="tablist">
                                    <li class="nav-item">
                                        <a class="nav-link active" id="home-tab" data-toggle="tab" role="tab" aria-controls="home" aria-selected="true">About</a>
                                    </li>

                                </ul>
                            </div>
                            <div class="tab-content profile-tab" id="myTabContent">
                                <div class="tab-pane fade show active" id="home" role="tabpanel" aria-labelledby="home-tab">
                                    <div class="row">
                                        <div class="col-md-4">
                                            <label>User Id</label>
                                        </div>
                                        <div class="col-md-8">
                                            <p> <%= loginUser.getId()%></p>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-md-4">
                                            <label>Username</label>
                                        </div>
                                        <div class="col-md-8">
                                            <input type="text" name="username" value="<%= loginUser.getUserName()%>"/>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-md-4">
                                            <label>Fist Name</label>
                                        </div>
                                        <div class="col-md-8">
                                            <input type="text" name="firstname" value="<%= loginUser.getFirstName()%>"/>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-md-4">
                                            <label>Last Name</label>
                                        </div>
                                        <div class="col-md-8">
                                            <input type="text" name="lastname" value="<%= loginUser.getLastName()%>"/>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-md-4">
                                            <label>Email</label>
                                        </div>
                                        <div class="col-md-8">
                                            <input type="text" name="email" value="<%= loginUser.getEmail()%>"/>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-md-4">
                                            <label>Address</label>
                                        </div>
                                        <div class="col-md-8">
                                            <input type="text" name="address" value="<%= loginUser.getAddress()%>"/>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-md-4">
                                            <label>Phone</label>
                                        </div>
                                        <div class="col-md-8">
                                            <input type="text" name="phone" value="<%= loginUser.getPhone()%>"/>

                                        </div>
                                    </div>
                                            <div class="row">
                                        <div class="col-md-4">
                                            <label>Password</label>
                                        </div>
                                        <div class="col-md-8">
                                           <input type="text" name="password" value="<%= loginUser.getPassword()%>"/>

                                        </div>
                                    </div>

                                </div>
                             
                            </div>
                        </div>
                        <div class="col-md-2">
                            <input type="submit" class="profile-edit-btn" name="action" value="Edit Profile"/>
                        </div >

                    </div>
                    <div class="row">
                        <div class="col-md-4"></div>
                        <div class="col-md-4">
                            <input type="submit" class="profile-edit-btn" name="action" value="Log out"/>
                        </div>
                    </div>

                </form>           
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
                                           
        <%
            String error = (String) request.getAttribute("MESSAGE");
            if (error == null) {
                error = "";
            }
        %>
        <%= error%>
    </body>
</html>
