<%-- 
    Document   : home_ad
    Created on : Jun 26, 2024, 3:27:53 PM
    Author     : Lenovo
--%>

<%@page import="ngocthb.model.Course"%>
<%@page import="java.util.List"%>
<%@page import="ngocthb.dao.CourseDAO"%>
<%@page import="ngocthb.model.UserDTO"%>
<%@page import="ngocthb.model.UserDTO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Admin Home Page</title>
        <link rel="stylesheet" href="View/Css/home_ad.css" />
        <link href="View/Img/logo.png" rel="shortcut icon" type="image/x-icon" />
        <link href="View/Img/logo.png" rel="apple-touch-icon" />
        <style>
            body {
                -webkit-font-smoothing: antialiased;
                -moz-osx-font-smoothing: grayscale;
            }
        </style>
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
                        href="home_ad.jsp"
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

        <form action="MainController" method="POST">
            <input type="text" name="search" placeholder="What do you want to search?" value="<%= search%>"/>
            <input type="submit"  class="button w-button" name="adaction" value="Search"/></br> 
            <div class="radio-inputs">
                <label>
                    <input class="radio-input" type="radio" name="cata" value="Piano">
                    <span class="radio-tile">
                        <span class="radio-icon">
                            <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" width="200px" height="200px"><path d="M19 6h-2v10h1v2H6v-2h1V6H5c-1.103 0-2 .897-2 2v10h2v2h14v-2h2V8c0-1.103-.897-2-2-2zM8 6h1v10H8V6zm2 0h1v10h-1V6zm2 0h1v10h-1V6zm2 0h1v10h-1V6z"/></svg> </span>
                        <span class="radio-label">Piano</span>
                    </span>
                </label>
                <label>
                    <input class="radio-input" type="radio" name="cata" value="Guitar">
                    <span class="radio-tile">
                        <span class="radio-icon">
                            <svg fill="currentColor" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512" width="200px" height="200px"><path d="M426.666 0c-23.522 0-42.666 19.144-42.666 42.666 0 10.292 3.791 19.707 9.865 27.031l-93.86 93.859c-10.193 10.193-13.593 26.151-9.635 40.686l-64.843 64.843c-11.041-2.802-22.708-4.125-34.635-4.125-22.646 0-45.083 6.818-64.448 20.083L6.615 366.302C2.443 369.443 0 374.693 0 380.198V480c0 17.646 14.354 32 32 32h99.802c5.505 0 10.755-2.443 13.896-6.615l84.429-120.192c23.583-23.583 32.708-55.281 26.009-86.776l64.843-64.843c14.536 3.958 30.494.558 40.686-9.635l93.86-93.86c7.323 6.073 16.739 9.865 27.031 9.865 23.522 0 42.666-19.144 42.666-42.666S450.187 0 426.666 0zm-13.365 51.365c-3.849-3.849-3.849-10.108 0-13.957 3.849-3.849 10.108-3.849 13.957 0 3.849 3.849 3.849 10.108 0 13.957-3.85 3.849-10.108 3.849-13.957 0zM85.875 473.765H48.235v-37.64L171.615 312.75c9.729-9.729 22.26-16.487 35.776-19.448l11.089 40.167-16.823 16.823c-4.375 4.374-4.374 11.458 0 15.832s11.458 4.374 15.832 0l16.823-16.823 40.167 11.089c-2.961 13.516-9.718 26.047-19.448 35.776L85.875 473.765z"></path></svg>
                        </span>
                        <span class="radio-label">Guitar</span>
                    </span>
                </label>
                <label>
                    <input class="radio-input" type="radio" name="cata" value="Drawing">
                    <span class="radio-tile">
                        <span class="radio-icon">
                            <!-- Pen SVG Icon -->
                            <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" width="200px" height="200px"><path d="M19.41 2.59a2.002 2.002 0 0 0-2.828 0l-3 3L5 16.172V19h2.828l8.586-8.586 3-3a2.002 2.002 0 0 0 0-2.828l-2-2zM5 20v2h14v-2H5z"/></svg>
                        </span>
                        <span class="radio-label">Drawing</span>
                    </span>
                </label>
            </div>
        </form>    

        <div class="content-section-bg">
            <div class="container">
                <div class="title-wrap-centre">
                    <h2>Create course</h2>

                </div>
                <div
                    data-duration-in="300"
                    data-duration-out="100"
                    data-current="Burgers"
                    data-easing="ease"
                    class="w-tabs"
                    >
                    <form action="MainController">
                        <div
                            role="listitem"
                            class="menu-item w-dyn-item w-col "
                            >
                            <div class="food-card">
                                <div>
                                    <div class="file btn btn-lg btn-primary">
                                        Change Photo
                                        <input type="file" name="images" />
                                    </div>
                                </div>
                                <div class="food-card-content">
                                    <p class="food-title-wrap w-inline-block">
                                    <h6>Course name: <input type="text" name="coursename" required="" placeholder="Input course name"/></h6>
                                    <div
                                        data-wf-sku-bindings="%5B%7B%22from%22%3A%22f_price_%22%2C%22to%22%3A%22innerHTML%22%7D%5D"
                                        class="price"
                                        >
                                        Price:<input type="text" name="price" required=""/>
                                    </div></p
                                    >
                                    <p class="paragraph">

                                        Description: <input type="text" name="description" required="" placeholder="Input description"/>
                                    </p>
                                    <p class="paragraph">

                                        Start date:  <input type="date" name="startdate" required=""/>
                                    </p>
                                    <p class="paragraph">

                                        End date:   <input type="date" name="enddate" required=""/>
                                    </p>
                                    <p class="paragraph">
                                        Category id: <select name="categoryid" required=""></br>
                                            <option value="1">Piano</option>
                                            <option value="2">Guitar</option>
                                            <option value="3">Drawing</option>
                                        </select></br>
                                    </p>

                                    <div class="add-to-cart">
                                        <form
                                            data-node-type="commerce-add-to-cart-form"
                                            data-commerce-sku-id="5e865e09d8efa3905776b635"
                                            data-loading-text="Adding to cart..."
                                            data-commerce-product-id="5e865e09d8efa32ba376b634"
                                            class="w-commerce-commerceaddtocartform default-state"
                                            >
                                            Quantity: <input type="text" name="quantity" required=""/>
                                            </br>
                                            <input
                                                type="submit"
                                                class="w-commerce-commerceaddtocartbutton order-button"
                                                name="adaction" value="Create course"
                                                />
                                        </form>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
        <div class="content-section-bg">
            <div class="container">
                <div class="title-wrap-centre">
                    <h2>Our course</h2>

                </div>
                <div
                    data-duration-in="300"
                    data-duration-out="100"
                    data-current="Burgers"
                    data-easing="ease"
                    class="w-tabs"
                    >

                    <%
                        
                        CourseDAO dao = new CourseDAO();
                        List<Course> listCsr = dao.getFullCourseAd();
                        List<Course> list = (List<Course>) request.getAttribute("LIST_COURSE_AD");
                        if(list!= null){
                            listCsr = list;
                        }
                        if (listCsr != null) {
                            if (listCsr.size() > 0) {
                    %>

                    <%
                        for (Course csr : listCsr) {
                    %>
                    <form action="MainController">


                        <div
                            role="listitem"
                            class="menu-item w-dyn-item w-col "
                            >
                            <div class="food-card">
                                <div>
                                    <p class="food-image-square w-inline-block">
                                        <img alt=""
                                             data-wf-sku-bindings="%5B%7B%22from%22%3A%22f_main_image_4dr%22%2C%22to%22%3A%22src%22%7D%5D"
                                             src="<%= csr.getImages()%>"
                                             class="food-image"
                                             />


                                    </p>
                                    <div class="file btn btn-lg btn-primary">
                                        Change Photo
                                        <input type="file" name="images" value="<%= csr.getImages()%>"/>
                                    </div>
                                </div>
                                <div class="food-card-content">
                                    <p class="food-title-wrap w-inline-block">
                                    <h6>ID:<input type="text" class="input-id" name="id" value="<%= csr.getId()%>" /></h6>
                                    <h6>Course name: <input type="text" name="coursename" value="<%= csr.getCoursename()%>"/></h6>
                                    <div
                                        data-wf-sku-bindings="%5B%7B%22from%22%3A%22f_price_%22%2C%22to%22%3A%22innerHTML%22%7D%5D"
                                        class="price"
                                        >
                                        Price:<input type="text" name="price" value="<%= csr.getPrice()%>"/>
                                    </div></p
                                    >
                                    <p class="paragraph">

                                        Description: <input type="text" name="description" value="<%= csr.getDescription()%>"/>
                                    </p>
                                    <p class="paragraph">

                                        Start date:  <input type="date" name="startdate" required="" value="<%= csr.getStartdate()%>"/>
                                    </p>
                                    <p class="paragraph">

                                        End date:   <input type="date" name="enddate" required="" value="<%= csr.getEnddate()%>"/>
                                    </p>
                                    <p class="paragraph">

                                        Category id: <select name="categoryid" required=""></br>
                                            <%
                                                int idcata = csr.getCategoryid();
                                                if (idcata == 1) {
                                            %>
                                            <option value="1" >Piano</option>
                                            <option value="2">Guitar</option>
                                            <option value="3">Drawing</option>
                                            <%
                                            } else if (idcata == 2) {
                                            %>
                                            <option value="2">Guitar</option>
                                            <option value="1" >Piano</option>
                                            <option value="3">Drawing</option>
                                            <%
                                            } else if (idcata == 3) {
                                            %>
                                            <option value="3">Drawing</option>
                                            <option value="2">Guitar</option>
                                            <option value="1" >Piano</option>
                                            <%
                                                }
                                            %>
                                        </select></br>
                                    </p>
                                    <p class="paragraph">
                                        <%
                                            if (csr.isStatus()) {
                                        %>
                                    <td>
                                        Status: <input type="checkbox" name="status" checked="checked"/>
                                    </td>
                                    <% } else {
                                    %>
                                    <td>
                                        Status: <input type="checkbox" name="status" />
                                    </td>
                                    <%
                                        }
                                    %>
                                    </p>
                                    <div class="add-to-cart">
                                        <form
                                            data-node-type="commerce-add-to-cart-form"
                                            data-commerce-sku-id="5e865e09d8efa3905776b635"
                                            data-loading-text="Adding to cart..."
                                            data-commerce-product-id="5e865e09d8efa32ba376b634"
                                            class="w-commerce-commerceaddtocartform default-state"
                                            >
                                            Quantity: <input
                                                type="number"                                           
                                                min="1"
                                                name="quantity" value="<%= csr.getQuantity()%>"
                                                /><input
                                                type="submit"
                                                class="w-commerce-commerceaddtocartbutton order-button"
                                                name="adaction" value="Delete Course"
                                                />
                                            <input
                                                type="submit"
                                                class="w-commerce-commerceaddtocartbutton order-button"
                                                name="adaction" value="Course Update"
                                                />

                                        </form>
                                    </div>
                                </div>
                            </div>
                        </div>

                    </form>
                    <%
                            }
                        }
                    %>

                </div>

            </div>
        </div>
        <%
            }

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
                            href="home_ad.jsp"
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
        
        <%        String error = (String) request.getAttribute("MESSAGE");
            if (error == null) {
                error = "";
            }
        %>
        <%= error%>
    </body>
</html>
