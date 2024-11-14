<%-- 
    Document   : carts
    Created on : Jun 6, 2024, 8:16:53 PM
    Author     : Lenovo
--%>

<%@page import="ngocthb.model.UserDTO"%>
<%@page import="ngocthb.dao.OrderDAO"%>
<%@page import="ngocthb.model.Course"%>
<%@page import="ngocthb.model.Cart"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Carts Page</title>
        <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
        <link href="View/Img/logo.png" rel="shortcut icon" type="image/x-icon" />
        <link href="View/Img/logo.png" rel="apple-touch-icon" />
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
        <%
            UserDTO loginUser = (UserDTO) session.getAttribute("LOGIN_USER");
            if (loginUser == null) {
                loginUser = new UserDTO();
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

        <% if (session != null) {
                Cart cart = (Cart) session.getAttribute("CART");
                if (cart != null) {
                    if (cart.getCart() != null) {
        %>
        <link rel="stylesheet" href="View/Css/carts.css" />
        <section class="h-100 h-custom">
            <div class="container h-100 py-5">
                <div class="row d-flex justify-content-center align-items-center h-100">
                    <div class="col">
                        <div class="table-responsive">
                            <table class="table">
                                <thead>
                                    <tr>
                                        <th scope="col" class="h5">Shopping Bag</th>
                                        <th scope="col">Quantity</th>
                                        <th scope="col">Price</th>
                                        <th scope="col">Remove</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <%
                                        double totalPrice = 0;
                                        for (Course csr : cart.getCart().values()) {
                                            totalPrice += (csr.getPrice()) * (csr.getQuantity());
                                    %>
                                    <tr>
                                        <th scope="row">
                                            <div class="d-flex align-items-center">
                                                <img src="<%= csr.getImages()%>" class="img-fluid rounded-3" style="width: 120px;" alt="Course">
                                                <div class="flex-column ms-4">
                                                    <p class="mb-2"><%= csr.getCoursename()%></p>
                                                    <p class="mb-0"><%= csr.getDescription()%></p>
                                                </div>
                                            </div>
                                        </th>
                                        <td class="align-middle">
                                            <div class="d-flex flex-row">
                                                <form action="MainController" method="POST">
                                                    <input type="hidden" name="idcrs" value="<%= csr.getId()%>"/>
                                                    <input type="hidden" name="action" value="Update cart"/>
                                                    <input type="number" name="quantitysrc" min="1" value="<%= csr.getQuantity()%>" onchange="this.form.submit()"/>
                                                </form>
                                            </div>
                                        </td>
                                        <td class="align-middle">
                                            <p class="mb-0" style="font-weight: 500;">$<%= csr.getPrice()%></p>
                                        </td>
                                        <td class="align-middle">
                                            <p class="mb-0" style="font-weight: 500;">
                                                <a href="MainController?action=Remove from cart&idcrs=<%= csr.getId()%>">Remove</a>
                                            </p>
                                        </td>
                                    </tr>
                                    <%
                                        }
                                    %>
                                </tbody>
                            </table>
                        </div>

                        <div class="card shadow-2-strong mb-5 mb-lg-0" style="border-radius: 16px;">
                            <div class="card-body p-4">
                                <div class="row">
                                    <div class="col-md-6 col-lg-4 col-xl-3 mb-4 mb-md-0">

                                        <div class="d-flex flex-row pb-3">


                                        </div>
                                        <div class="d-flex flex-row pb-3">


                                        </div>
                                        <div class="d-flex flex-row">

                                            <div class="rounded border w-100 p-3">
                                                <p class="d-flex align-items-center mb-0">
                                                    <button type="button" class="btn butt btn-block btn-lg">
                                                        <div class="d-flex justify-content-between">
                                                            <a href="home.jsp">Add more item </a> 
                                                        </div>
                                                    </button>
                                                </p>
                                            </div>
                                        </div>


                                    </div>
                                    <div class="col-md-6 col-lg-4 col-xl-6">


                                    </div>
                                    <div class="col-lg-4 col-xl-3">
                                        <div class="d-flex justify-content-between mb-4" style="font-weight: 500;">
                                            <p class="mb-2">Total</p>
                                            <p class="mb-2">$<%= totalPrice%></p>
                                        </div>
                                        <button type="button" class="btn butt btn-block btn-lg">
                                            <div class="d-flex justify-content-between">
                                                <a href="order.jsp">Order</a>
                                            </div>
                                        </button>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>

        <%
                        return;
                    }
                }
            }

            request.setAttribute("MESSAGE", "Gio hang trong");
        %>
        <% String message = (String) request.getAttribute("MESSAGE");
            if (message == null) {
                message = "";
            }
        %>
        </br>
        <div class="card shadow-2-strong mb-5 mb-lg-0" style="border-radius: 16px;">
            <div class="card-body p-4">
                <div class="row">
                    <div class="col-md-6 col-lg-4 col-xl-3 mb-4 mb-md-0">
                        <div class="d-flex flex-row pb-3">
                        </div>
                        <div class="d-flex flex-row pb-3">
                        </div>
                    </div>
                    <div class="col-md-6 col-lg-4 col-xl-6">
                        <img src="https://taphoa.cz/static/media/cart-empty-img.8b677cb3.png" width="100%" alt="" />
                        <div class="d-flex flex-row">
                            <div class="rounded border w-100 p-3">
                                <p class="d-flex align-items-center mb-0">
                                    <button type="button" class="btn butt btn-block btn-lg">
                                        <div class="d-flex justify-content-between">
                                            <a href="home.jsp">Add more item to cart</a> 
                                        </div>
                                    </button>
                                </p>
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

    </body>
</html>
