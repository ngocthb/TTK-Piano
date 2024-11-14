/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ngocthb.controller.cart;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import ngocthb.dao.CourseDAO;
import ngocthb.model.Cart;
import ngocthb.model.Course;

/**
 *
 * @author Lenovo
 */
public class UpdateCartController extends HttpServlet {

    private static final String ERROR = "error.jsp";
    private static final String SUCCESS = "carts.jsp";
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
       String url = ERROR;
        try {
             int id = Integer.parseInt(request.getParameter("idcrs"));
             CourseDAO dao = new CourseDAO();
             Course crs = dao.getCourseByID(id);
            int quantity = Integer.parseInt(request.getParameter("quantitysrc"));
            HttpSession sesssion = request.getSession();
            Cart cart = (Cart) sesssion.getAttribute("CART");
            boolean check = cart.updateCourse(crs, quantity);
            if (check) {
                sesssion.setAttribute("CART", cart);
//                request.setAttribute("MESSAGE", "ADDED: " + crs.getCoursename() + " Successfully!");
                url = SUCCESS;
            } else {
//                request.setAttribute("MESSAGE", "Add fail");
            }
        } catch (Exception e) {
            log("Error at AddController " + e.toString());
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
