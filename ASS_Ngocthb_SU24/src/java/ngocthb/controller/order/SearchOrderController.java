/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ngocthb.controller.order;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import java.util.Map;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import ngocthb.dao.OrderDAO;
import ngocthb.model.Course;
import ngocthb.model.Order;
import ngocthb.model.UserDTO;

/**
 *
 * @author Lenovo
 */
public class SearchOrderController extends HttpServlet {

    private static final String ERROR = "myorder.jsp";
    private static final String SUCCESS = "myorder.jsp";
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
         String url = ERROR;
        try {
            int search = Integer.parseInt(request.getParameter("searchord"));
            String username = request.getParameter("loginusername");
            OrderDAO dao = new OrderDAO();
            Map<Order, List<Course>> listOrd = dao.getOrd(search, username);
            if(listOrd.size()>0){
                request.setAttribute("MY_ORDER", listOrd);
                url = SUCCESS;
            }
            else {
                 request.setAttribute("MESSAGE", "Khong co ket qua can tim.");
            }
        } catch (Exception e) {
            log("Eror at SearchController: "+ e.toString());
        }finally{
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
