/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ngocthb.controller.order;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import ngocthb.dao.CourseDAO;
import ngocthb.dao.OrderDAO;
import ngocthb.model.Cart;
import ngocthb.model.Course;
import ngocthb.model.Order;

/**
 *
 * @author Lenovo
 */
public class CreateOrderController extends HttpServlet {

    private static final String ERROR = "error.jsp";
    private static final String SUCCESS = "success.jsp";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = ERROR;
        try {
            Date orderdate = Date.valueOf(java.time.LocalDate.now());
            double totalprice = Double.parseDouble(request.getParameter("totalprice"));
            int paymentid = Integer.parseInt(request.getParameter("paymentid"));
            String firstname = request.getParameter("firstname");
            String lastname = request.getParameter("lastname");
            String email = request.getParameter("email");
            String address = request.getParameter("address");
            String username = request.getParameter("username");
            String phone = request.getParameter("phone");
            OrderDAO dao = new OrderDAO();
            CourseDAO crsdao = new CourseDAO();
            int id = Integer.parseInt(request.getParameter("order_id"));
            Order ors = new Order(id, orderdate, totalprice, paymentid, firstname, lastname, username, email, address, phone, true);
            request.setAttribute("MY_ORDER", ors);
            boolean checkCreate = dao.createOrd(ors);
            boolean checkCreateOrderItem = false;
            boolean checkdata = false;
            HttpSession session = request.getSession();
            if (session != null) {
                Cart cart = (Cart) session.getAttribute("CART");
                if (cart != null) {
                    if (cart.getCart() != null) {
                        for (Course csr : cart.getCart().values()) {
                            checkCreateOrderItem = dao.createOrdItem(id, csr.getId(), csr.getQuantity());
                            Course crs = crsdao.getCourseByID(csr.getId());
                            boolean status = true;
                            if(crs.getQuantity() - csr.getQuantity()==0){
                                status = false;
                            }
                            Course coursedata = new Course(crs.getId(), crs.getCoursename(), crs.getCategoryid(), crs.getDescription(), crs.getImages(), crs.getStartdate(), crs.getEnddate(), crs.getPrice(), status, crs.getQuantity() - csr.getQuantity());
                            checkdata = crsdao.updateCrs(coursedata);
                        }
                    }
                }
            }

            if (checkCreate && checkCreateOrderItem && checkdata) {
                request.setAttribute("CART", null);
                url = SUCCESS;
            }
        } catch (Exception e) {
            log("Error at CreateController: " + e.toString());
        } finally {
            request.getRequestDispatcher(url).forward(request, response);
        }
    }

// <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
