<%-- 
    Document   : order
    Created on : Jun 28, 2024, 6:13:42 PM
    Author     : Lenovo
--%>

<%@page import="java.util.Map"%>
<%@page import="ngocthb.model.Order"%>
<%@page import="java.util.List"%>
<%@page import="ngocthb.dao.CourseDAO"%>
<%@page import="ngocthb.dao.OrderDAO"%>
<%@page import="ngocthb.model.UserDTO"%>
<%@page import="ngocthb.model.Course"%>
<%@page import="ngocthb.model.Cart"%>
<%@page import="java.sql.Date"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Order Page</title>

        <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">

        <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
        <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

        <link href="View/Img/logo.png" rel="shortcut icon" type="image/x-icon" />
        <link href="View/Img/logo.png" rel="apple-touch-icon" />
        <link rel="stylesheet" href="View/Css/order.css" />
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
            if (!loginUser.isIsadmin()) {
                double totalPrice = 0;
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
                        if (loginUser.getId() != 0) {
                    %>
                    <a href="account.jsp" class="avatar nav-link w-nav-link"><img src="View/Img/user-avatar.svg" alt="Avatar"></a>                             
                        <% } else {
                        %>
                    <a href="login.jsp" class="nav-link w-nav-link">Login</a>
                    <% }%>
                </nav>

            </div>
        </div>


        <div class="container-fluid background">
            <div class="row padding-top-20">
                <div class="col-12 col-sm-12 col-md-10 col-lg-10 col-xl-8 offset-md-1 offset-lg-1 offset-xl-2 padding-horizontal-40">
                    <div class="row">
                        <div class="col-12 main-wrapper">
                            <div class="row">
                                <div class="col-12 col-sm-12 col-md-6 col-lg-6 col-xl-6">
                                    <%
                                        if (session != null) {
                                            Cart cart = (Cart) session.getAttribute("CART");
                                            if (cart != null) {
                                                if (cart.getCart() != null) {
                                                    int count = 1;

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
                                                        <span class="description"><span class="description"></span><span class="emphasized"><%=Date.valueOf(java.time.LocalDate.now())%></span></span><br>  
                                                        <span class="brand-span"><span class="emphasized"> <span class="description">order #</span><span class="emphasized"><%= dao.getMaxID()%></span></br></span></span>
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
                                                for (Course crs : cart.getCart().values()) {
                                                    totalPrice += (crs.getPrice()) * (crs.getQuantity());
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
                                                    <span class="description"><div class="col-8 align-right description"><div class="dive">Total</div></div></span><br>  

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
                                                    <span class="description"><div class="col-4 align-right"><span class="very emphasized">$<%=totalPrice%></span></div></span><br>  

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
                                                            <span class="description"><span class="description">please enter your</span></span><br>  
                                                            <span class="brand-span"><span class="emphasized"><span class="emphasized">Information</span></span></span>
                                                        </h4>

                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-12 panel-body creditcard-body">
                                                <input type="hidden" id='card-name' name="order_id" value="<%= dao.getMaxID()%>"/>
                                                <input type="hidden" id='card-name' name="totalprice" value="<%=totalPrice%>"/>
                                                Payment: <select name="paymentid" >
                                                    <option value="1" selected="">Cash</option>
                                                    <option value="2">Credit Card</option>
                                                </select></br>
                                                <div class="row first-last-name">
                                                    <div class="col-6">
                                                        First name: <input type="text" id='card-name' name="firstname" value="<%= loginUser.getFirstName()%>" required=""/></br>
                                                    </div>
                                                    <div class="col-6">
                                                        Last name: <input type="text" id='card-name' name="lastname" value="<%= loginUser.getLastName()%>" required=""/></br>
                                                    </div>
                                                </div>
                                                Username: <input type="text" id='card-name' name="username" value="<%= loginUser.getUserName()%>" required=""/></br>
                                                Email: <input type="text" id='card-name' name="email" value="<%= loginUser.getEmail()%>" required=""/></br>
                                                Address: <input type="text" id='card-name' name="address" value="<%= loginUser.getAddress()%>" required=""/></br>
                                                Phone: <input type="text" id='card-name' name="phone" value="<%= loginUser.getPhone()%>" required=""/></br>


                                            </div>
                                            <div class="col-12 panel-footer creditcard-footer">
                                                <div class="row">
                                                    <div class="add-to-cart">
                                                        <form
                                                            data-node-type="commerce-add-to-cart-form"
                                                            data-commerce-sku-id="5e865e09d8efa3905776b635"
                                                            data-loading-text="Adding to cart..."
                                                            data-commerce-product-id="5e865e09d8efa32ba376b634"
                                                            class="w-commerce-commerceaddtocartform default-state"
                                                            >
                                                            <div class="button-order">
                                                                <input
                                                                    type="submit"
                                                                    data-node-type="commerce-add-to-cart-button"
                                                                    data-loading-text="Adding to cart..."
                                                                    aria-busy="false"
                                                                    aria-haspopup="dialog"
                                                                    class="w-commerce-commerceaddtocartbutton order-button"
                                                                    name="action"
                                                                    value="Order"
                                                                    />
                                                            </div>
                                                        </form>
                                                    </div>
                                                </div>

                                            </div>
                                        </div>
                                </div>
                                </form>
                            </div>
                            <%
                                }
                            %>
                        </div>
                    </div>
                </div>
            </div>
        </div>
  



    <%            }
    %>
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
</body>
</html>
