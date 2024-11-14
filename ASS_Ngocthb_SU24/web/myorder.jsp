<%-- 
    Document   : myorder
    Created on : Jun 29, 2024, 12:18:40 PM
    Author     : Lenovo
--%>

<%@page import="java.util.Map"%>
<%@page import="java.util.List"%>
<%@page import="ngocthb.model.Order"%>
<%@page import="ngocthb.model.Course"%>
<%@page import="ngocthb.model.Cart"%>
<%@page import="ngocthb.model.UserDTO"%>
<%@page import="ngocthb.dao.OrderDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>My Order Page</title>
        <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">

        <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
        <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
        <link href="View/Img/logo.png" rel="shortcut icon" type="image/x-icon" />
        <link href="View/Img/logo.png" rel="apple-touch-icon" />
    </head>
    <body>
        <div class="banner">
            <div>
                <div class="notice-text">
                    TTK * Piano specializes in teaching piano, guitar and drawing.
                    <a href="search-csr-result.jsp" class="white-link">Booking Now</a>
                </div>
            </div>
        </div>
        <%
            OrderDAO dao = new OrderDAO();
            UserDTO loginUser = (UserDTO) session.getAttribute("LOGIN_USER");
            if (loginUser == null) {
                loginUser = new UserDTO();
            }

            if (loginUser != null) {

        %>

        <link rel="stylesheet" href="View/Css/home.css" />
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

                    <%                        if (loginUser.getId() != 0) {
                    %>
                    <a href="account.jsp" class="avatar nav-link w-nav-link"><img src="View/Img/user-avatar.svg" alt="Avatar"></a>                             
                        <% } else {
                        %>
                    <a href="login.jsp" class="nav-link w-nav-link">Login</a>
                    <% }%>
                </nav>

            </div>
        </div>
        <form action="MainController" method="POST">
            <input type="text" name="searchord" required="" placeholder="Input ID Order" />
            <input type="submit"  class="button w-button" name="action" value="Search Order"/></br>
            <%
                String usname = loginUser.getUserName();
                if (loginUser.isIsadmin()) {
                    usname = "";
                }
            %>
            <input type="hidden" name="loginusername" value="<%=usname%>"/>
        </form>
        <div class="container-fluid background">
            <div class="row padding-top-20">
                <div class="col-12 col-sm-12 col-md-10 col-lg-10 col-xl-8 offset-md-1 offset-lg-1 offset-xl-2 padding-horizontal-40">
                    <div class="row">
                        <div class="col-12 main-wrapper">
                            <div class="row">
                                <div class="col-12 col-sm-12 col-md-6 col-lg-6 col-xl-6">
                                    <%            if (session != null) {
                                            Map<Order, List<Course>> ord = (Map<Order, List<Course>>) request.getAttribute("MY_ORDER");
                                            if (ord != null) {
                                                for (Map.Entry<Order, List<Course>> entry : ord.entrySet()) {
                                                    Order order = entry.getKey();
                                                    List<Course> courses = entry.getValue();
                                                    if (courses != null) {
                                                        if (courses.size() > 0) {
                                    %>
                                    <div id="template" class="row panel-wrapper">
                                        <div class="col-12 panel-header basket-header">
                                            <div class="row">
                                                <div class="col-6 basket-title">
                                                    <h4
                                                        style="
                                                        transform: translate3d(0px, 0px, 0px) scale3d(1, 1, 1)
                                                        rotateX(0deg) rotateY(0deg) rotateZ(0deg) skew(0deg, 0deg);
                                                        opacity: 1;
                                                        transform-style: preserve-3d;
                                                        "
                                                        class="hero-h4"
                                                        >
                                                        <span class="description">review your</span><br>  
                                                        <span class="brand-span"><span class="emphasized">Cart Summary</span></span>
                                                    </h4>

                                                </div>
                                                <div class="col-6 order-number align-right">
                                                    <h4
                                                        style="
                                                        transform: translate3d(0px, 0px, 0px) scale3d(1, 1, 1)
                                                        rotateX(0deg) rotateY(0deg) rotateZ(0deg) skew(0deg, 0deg);
                                                        opacity: 1;
                                                        transform-style: preserve-3d;
                                                        "
                                                        class="hero-h4"
                                                        >
                                                        <span class="description"><span class="description"></span><span class="emphasized"><%=order.getOrderdate()%></span></span><br>  
                                                        <span class="brand-span"><span class="emphasized"> <span class="description">order #</span><span class="emphasized"><%=order.getId()%></span></br></span></span>
                                                    </h4>

                                                </div>
                                            </div>
                                            <div class="row column-titles padding-top-10">
                                                <div class="col-2 align-center"><span>Photo</span></div>
                                                <div class="col-5 align-center"><span>Name</span></div>
                                                <div class="col-2 align-center"><span>Quantity</span></div>
                                                <div class="col-3 align-right"><span>Price</span></div>
                                            </div>                                    
                                        </div>
                                        <div class="col-12 panel-body basket-body">
                                            <%

                                                for (Course crs : courses) {

                                            %>
                                            <div class="row product">
                                                <div class="col-2 product-image"><img src="<%=crs.getImages()%>"></div>
                                                <div class="col-5"><%=crs.getCoursename()%><br><span class="additional"><%=crs.getDescription()%></span></div>
                                                <div class="col-2 align-right"><span class="sub">Quantity</span> <%=crs.getQuantity()%></div>
                                                <div class="col-3 align-right"><span class="sub">$</span> <%=crs.getPrice()%></div>
                                            </div>
                                            <%
                                                }
                                            %>
                                        </div>
                                        <div class="col-12 panel-footer basket-footer">

                                            <hr>
                                            <div class="row">
                                                <h4
                                                    style="
                                                    transform: translate3d(0px, 0px, 0px) scale3d(1, 1, 1)
                                                    rotateX(0deg) rotateY(0deg) rotateZ(0deg) skew(0deg, 0deg);
                                                    opacity: 1;
                                                    transform-style: preserve-3d;
                                                    "
                                                    class="hero-h4"
                                                    >
                                                    <span class="description"><span class="description"><div class="col-8 align-right description"><div class="dive">Total</div></div></span></span><br>  

                                                </h4>
                                                <h4
                                                    style="
                                                    transform: translate3d(0px, 0px, 0px) scale3d(1, 1, 1)
                                                    rotateX(0deg) rotateY(0deg) rotateZ(0deg) skew(0deg, 0deg);
                                                    opacity: 1;
                                                    transform-style: preserve-3d;
                                                    "
                                                    class="hero-h4"
                                                    >
                                                    <span class="description"><span class="description"><div class="col-4 align-right"><span class="very emphasized">$<%=order.getTotalprice()%></span></div></span></span><br>  

                                                </h4>

                                            </div>
                                        </div>
                                    </div>
                                    <%

                                            }
                                        }


                                    %>
                                </div>
                                <div class="col-12 col-sm-12 col-md-6 col-lg-6 col-xl-6">
                                    <form action="MainController">
                                        <div class="row panel-wrapper">
                                            <div class="col-12 panel-header creditcard-header">
                                                <div class="row">
                                                    <div class="col-12 creditcard-title">
                                                        <h4
                                                            style="
                                                            transform: translate3d(0px, 0px, 0px) scale3d(1, 1, 1)
                                                            rotateX(0deg) rotateY(0deg) rotateZ(0deg) skew(0deg, 0deg);
                                                            opacity: 1;
                                                            transform-style: preserve-3d;
                                                            "
                                                            class="hero-h4"
                                                            >
                                                            <span class="description"><span class="description">review your</span></span><br>  
                                                            <span class="brand-span"><span class="emphasized"><span class="emphasized">Information</span></span></span>
                                                        </h4>

                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-12 panel-body creditcard-body">

                                                <input type="hidden" id='card-name' name="totalprice" value="<%=order.getTotalprice()%>"/>
                                                <%
                                                    String payment = "Cash";
                                                    if (order.getPaymentid() == 2) {
                                                        payment = "Credit card";
                                                    }
                                                %>
                                                Payment: <%=payment%></br>    
                                                <div class="row first-last-name">
                                                    <div class="col-6">
                                                        First name: <%=order.getFirstname()%></br>
                                                    </div>
                                                    <div class="col-6">
                                                        Last name: <%=order.getLastname()%></br>
                                                    </div>
                                                </div>
                                                Email:<%=order.getEmail()%></br>
                                                Phone:<%=order.getPhone()%></br>
                                                Address: <%=order.getAddress()%></br>

                                            </div>
                                            <div class="col-12 panel-footer creditcard-footer">

                                            </div>
                                        </div>
                                    </form>
                                </div>
                                <%

                                        break;
                                    }
                                } else {
                                %>
                                <%
                                        }
                                    }
                                %>
                            </div>
                        </div>
                    </div>
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


        <%
            }

        %>


    </body>
</html>
